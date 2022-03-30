// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './ERC165.sol';
import './interfaces/IERC721.sol';
import './interfaces/IERC721Metadata.sol';

contract ERC721 is IERC721, ERC165 {
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _approvedAddress;
    mapping(address => mapping(address => bool)) _approvedOperators;

    constructor() {
        registerInterface(
          bytes4(keccak256('balanceOf(bytes4)'))^
          bytes4(keccak256('ownerOf(bytes4)'))^
          bytes4(keccak256('transferFrom(bytes4)'))
        );
    }

    function balanceOf(address _owner) external view returns (uint256) {
        require(_owner != address(0), 'Cannot find balance of the zero address');
        return _balances[_owner];
    }

    function ownerOf(uint256 _tokenId) external view returns (address) {
        address owner = _owners[_tokenId];
        require(owner != address(0), 'Token does not have a valid owner address');
        return owner;
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes memory data) external payable {
        _transfer(_from, _to, _tokenId);

        // More stuff
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable {
        _transfer(_from, _to, _tokenId);

        // More stuff
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
        _transfer(_from, _to, _tokenId);
    }

    function approve(address _approved, uint256 _tokenId) external payable {
        require(msg.sender == _owners[_tokenId] || _approvedAddress[_tokenId] == msg.sender, 'Approval is only allowed by authorized addresses');
        require(
            _approved != address(0),
            'Can'
            't approve zero address'
        );

        _approvedAddress[_tokenId] = _approved;

        emit Approval(_owners[_tokenId], _approved, _tokenId);
    }

    function setApprovalForAll(address _operator, bool _approved) external {
        _approvedOperators[msg.sender][_operator] = _approved;

        emit ApprovalForAll(msg.sender, _operator, _approved);
    }

    function getApproved(uint256 _tokenId) external view returns (address) {
        return _approvedAddress[_tokenId];
    }

    function isApprovedForAll(address _owner, address _operator) external view returns (bool) {
        return _approvedOperators[_owner][_operator];
    }

    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), 'Not a valid address');

        _owners[tokenId] = to;
        _balances[to]++;

        emit Transfer(address(0), to, tokenId);
    }

    function _transfer(address _from, address _to, uint256 _tokenId) private {
        require(msg.sender == _owners[_tokenId] || _approvedAddress[_tokenId] == msg.sender, 'Transfer can only be initiated by approved addresses');
        require(_from == _owners[_tokenId], 'Transfer must be from the current owner');
        require(_to != address(0), 'Transfer cannot be to the zero address');

        _owners[_tokenId] = _to;
        _balances[_from]--;
        _balances[_to]++;

        emit Transfer(_from, _to, _tokenId);
    }
}
