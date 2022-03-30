// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './ERC721.sol';
import './interfaces/IERC721Enumerable.sol';

contract ERC721Enumerable is IERC721Enumerable, ERC721 {
    uint256[] private _allTokens;

    // Mapping from tokenId to position in _allTokens
    mapping(uint256 => uint256) _tokenPositions;

    // Mapping of owner to list of all token Ids
    mapping(address => uint256[]) _ownerTokens;

    // Mapping from token Id to index in ownerTokens
    mapping(uint256 => uint256) private _ownedTokensList;

    function totalSupply() public view returns (uint256) {
        return _allTokens.length;
    }

    function tokenByIndex(uint256 _index) external view returns (uint256) {
        require(_index < _allTokens.length, 'Token at index does not exist');
        return _allTokens[_index];
    }

    /// @notice Enumerate NFTs assigned to an owner
    /// @dev Throws if `_index` >= `balanceOf(_owner)` or if
    ///  `_owner` is the zero address, representing invalid NFTs.
    /// @param _owner An address where we are interested in NFTs owned by them
    /// @param _index A counter less than `balanceOf(_owner)`
    /// @return The token identifier for the `_index`th NFT assigned to `_owner`,
    ///   (sort order not specified)
    function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256) {
        return _ownerTokens[_owner][_index];
    }

    function _mint(address to, uint256 tokenId) internal override(ERC721) {
        _addTokensToAllTokensEnum(tokenId);
        _addTokensToOwnerEnum(to, tokenId);

        super._mint(to, tokenId);
    }

    function _addTokensToOwnerEnum(address to, uint256 tokenId) private {
        _ownedTokensList[tokenId] = _ownerTokens[to].length;
        _ownerTokens[to].push(tokenId);
    }

    function _addTokensToAllTokensEnum(uint256 tokenId) private {
        _tokenPositions[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    function getTokenByIndex(uint256 index) public view returns (uint256) {
        require(index >= 0 && index < totalSupply(), 'Global index is out of bounds');
        return _allTokens[index];
    }

    function getTokenOfOwnerByIndex(address owner, uint256 index) public view returns (uint256) {
        require(index >= 0 && index < _ownerTokens[owner].length, 'Owner index is out of bounds');
        return _ownerTokens[owner][index];
    }
}
