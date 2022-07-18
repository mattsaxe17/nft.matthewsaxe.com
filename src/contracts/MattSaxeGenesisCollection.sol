// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol';
import '@openzeppelin/contracts/utils/Counters.sol';
import './interfaces/IMattSaxeMarketplaceCollection.sol';

contract MattSaxeGenesisCollection is ERC721URIStorage, IERC721Enumerable, IMattSaxeMarketplaceCollection {
  using Counters for Counters.Counter;

  mapping(address => mapping(uint256 => uint256)) private _ownedTokens;
  mapping(uint256 => uint256) private _ownedTokensIndex;
  uint256[] private _allTokens;
  mapping(uint256 => uint256) private _allTokensIndex;

  Counters.Counter private _tokenIds;
  address private _contractAddress;
  uint256 private _listingPrice = 1.7 ether;

  constructor(address _marketplaceAddress) ERC721('Matt Saxe Genesis Collection', 'MATT') {
    _contractAddress = _marketplaceAddress;
  }

  function getListingPrice() public view returns (uint256) {
    return _listingPrice;
  }

  function mint(string memory _tokenUri) public returns (uint256) {
    _tokenIds.increment();
    uint256 newTokenId = _tokenIds.current();

    _addTokenToOwnerEnumeration(msg.sender, newTokenId);
    _mint(msg.sender, newTokenId);
    _setTokenURI(newTokenId, _tokenUri);
    setApprovalForAll(_contractAddress, true);
    return newTokenId;
  }

  function totalSupply() external view returns (uint256) {
    return _tokenIds.current();
  }

  function tokenByIndex(uint256 index) public view virtual override returns (uint256) {
    require(index < _tokenIds.current(), 'ERC721Enumerable: global index out of bounds');
    return _allTokens[index];
  }

  function tokenOfOwnerByIndex(address owner, uint256 index) public view virtual override returns (uint256) {
    require(index < ERC721.balanceOf(owner), 'ERC721Enumerable: owner index out of bounds');
    return _ownedTokens[owner][index];
  }

  function _addTokenToOwnerEnumeration(address to, uint256 tokenId) private {
    uint256 length = ERC721.balanceOf(to);
    _ownedTokens[to][length] = tokenId;
    _ownedTokensIndex[tokenId] = length;
  }
}
