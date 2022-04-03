// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/utils/Strings.sol";
import '@openzeppelin/contracts/interfaces/IERC721.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol';
import '@openzeppelin/contracts/utils/Context.sol';
import '@openzeppelin/contracts/utils/Address.sol';
import './ERC721TokenReciever.sol';
import './ERC165.sol';

contract ERC721 is ERC165, ERC721TokenReciever, Context, IERC721, IERC721Metadata {
    using Address for address;

    string private _name;
    string private _symbol;

    mapping(uint256 => address) private _tokenOwners;
    mapping(address => uint256) private _ownerBalances;
    mapping(uint256 => address) private _tokenApprovedAddresses;
    mapping(address => mapping(address => bool)) _ownerOperatorApprovals;

    constructor(string memory name, string memory symbol) {
      _name = name;
      _symbol = symbol;
    }

    function name() public view virtual override returns (string memory) {
        return _name;
    }

    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    function tokenURI(uint256 _tokenId) public pure returns(string memory) {
      string memory baseURI = _baseURI();
      return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, Strings.toString(_tokenId))) : "";
    }

    // Gets the count of tokens owned by _owner
    function balanceOf(address _owner) external view returns (uint256) {
        require(_owner != address(0), 'ERC721: Cannot get balance of the zero address');
        return _ownerBalances[_owner];
    }

    // Gets the owner of token with ID _tokenId
    function ownerOf(uint256 _tokenId) external view returns (address) {
        address owner = _tokenOwners[_tokenId];
        require(owner != address(0), 'ERC721: Token does not exist');
        return _tokenOwners[_tokenId];
    }

    // Safe transfers a token
    function safeTransferFrom(
        address _from,
        address _to,
        uint256 _tokenId,
        bytes memory data
    ) public virtual override {
        _transfer(_from, _to, _tokenId);

        require(_checkOnERC721Received(_from, _to, _tokenId, data), 'ERC721: Cannot transfer to a contract that does not implement safe transfer');
    }

    // Safe transfers a token with no extra data
    function safeTransferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) public virtual override {
        safeTransferFrom(_from, _to, _tokenId, '');
    }

    // Transfers token ownership
    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) public virtual override {
        _transfer(_from, _to, _tokenId);
    }

    // Sets approval for a token
    function approve(address _approved, uint256 _tokenId) public virtual override {
        require(_isOwnerOrApproved(msg.sender, _tokenId), 'ERC721: Only an authorized address can approve another address');
        _tokenApprovedAddresses[_tokenId] = _approved;
    }

    // Approves an operator for an address's tokens
    function setApprovalForAll(address _operator, bool _approved) external {
        _ownerOperatorApprovals[msg.sender][_operator] = _approved;

        emit ApprovalForAll(msg.sender, _operator, _approved);
    }

    // Gets the approved address for a token
    function getApproved(uint256 _tokenId) external view returns (address) {
        require(_tokenOwners[_tokenId] != address(0), 'ERC721: Must get approved for a valid address');
        return _tokenApprovedAddresses[_tokenId];
    }

    // Returns if a sender is approved for transfers on a tokenID
    function isApproved(address _sender, uint256 _tokenId) public returns (bool) {}

    // Returns if an operator is approved for transfers on all of an address's tokens
    function isApprovedForAll(address _owner, address _operator) public view returns (bool) {
        return _ownerOperatorApprovals[_owner][_operator];
    }


    // Helper function to easily get base URI for tokens
    function _baseURI() private pure returns(string memory) {
      return '';
    }

    // Helper function that finds if a sender is approved to transfer
    function _isOwnerOrApproved(address _sender, uint256 _tokenId) private returns (bool) {
        address owner = _tokenOwners[_tokenId];

        return _sender == owner || isApproved(_sender, _tokenId) || isApprovedForAll(owner, _sender);
    }

    // Helper function to transfer token ownership without conditional checks
    function _transfer(
        address _from,
        address _to,
        uint256 _tokenId
    ) private {
        require(_isOwnerOrApproved(msg.sender, _tokenId), 'ERC721: msg.sender must be the owner of the token or an approved address');
        require(_tokenOwners[_tokenId] == _from, 'ERC721: Must transfer from token owner');
        require(_to != address(0), 'ERC721: Cannot transfer to zero address');
        require(_tokenOwners[_tokenId] != address(0), 'ERC721: Must tranfer a valid token');

        _tokenOwners[_tokenId] = _to;
        _ownerBalances[_from]--;
        _ownerBalances[_to]++;

        emit Transfer(_from, _to, _tokenId);
    }

    // Helper function for safe transfers (from Open Zeppelin)
    function _checkOnERC721Received(
        address _from,
        address _to,
        uint256 _tokenId,
        bytes memory _data
    ) private returns (bool) {
        if (_to.isContract()) {
            try IERC721Receiver(_to).onERC721Received(_msgSender(), _from, _tokenId, _data) returns (bytes4 retval) {
                return retval == IERC721Receiver.onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert('ERC721: transfer to non ERC721Receiver implementer');
                } else {
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }
}
