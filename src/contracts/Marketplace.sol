// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';
import '@openzeppelin/contracts/utils/Counters.sol';
import './interfaces/IMattSaxeMarketplaceCollection.sol';

contract Marketplace is ReentrancyGuard {
  using Counters for Counters.Counter;

  Counters.Counter private _itemIds;
  Counters.Counter private _itemCount;
  address payable private _contractOwner;

  mapping(uint256 => MarketItem) private _marketItems;
  mapping(address => bool) private _allowedContractAddresses;
  mapping(address => bool) private _adminAddresses;

  event MarketItemCreated(uint256 itemId, address contractAddress, uint256 tokenId, address seller, address owner, uint256 price);

  constructor() {
    // Sets contract owner to whoever deployed it, and makes them an admin
    _contractOwner = payable(msg.sender);
    _adminAddresses[msg.sender] = true;
  }

  struct MarketItem {
    uint256 itemId;
    uint256 tokenId;
    address contractAddress;
    address seller;
    address owner;
    uint256 price;
    bool isListed;
    bool exists;
  }

  // Gets the listing price based on the contract address
  function getListingPrice(address _contractAddress) public view returns (uint256) {
    return IMattSaxeMarketplaceCollection(_contractAddress).getListingPrice();
  }

  // Allows tokens from a given address to be sold on the marketplace
  function addAllowedContractAddress(address addressToAdd) public {
    require(_isAdminAddress(msg.sender), 'Error: Action not allowed, you must be an admin to add an allowed contract address.');

    _allowedContractAddresses[addressToAdd] = true;
  }

  // Allows tokens from a given address to be sold on the marketplace
  function addAdminAddress(address addressToAdd) public {
    require(_isAdminAddress(msg.sender), 'Error: Action not allowed, you must be an admin to add another admin.');

    _adminAddresses[addressToAdd] = true;
  }

  // Creates a new market item from an
  function createMarketItem(uint256 tokenId, address contractAddress) public {
    require(_isAdminAddress(msg.sender), 'Error: Action not allowed, you must be an admin to create a new market item.');
    require(_isAllowedContractAddress(contractAddress), 'Error: Action not allowed, new tokens can only be listed from allowed contracts.');

    _itemCount.increment();
    uint256 newItemId = _itemIds.current();
    uint256 price = getListingPrice(contractAddress);

    // Transfer ownership to the marketplace contract
    IERC721(contractAddress).transferFrom(msg.sender, address(this), tokenId);
    _marketItems[newItemId] = MarketItem(newItemId, tokenId, contractAddress, _contractOwner, address(this), price, true, true);
    _marketItems[newItemId].exists = true;

    emit MarketItemCreated(newItemId, contractAddress, tokenId, _contractOwner, address(this), price);

    _itemIds.increment();
  }

  // Allows anyone to re-list a token from a valid address (first listing is always by contract owner)
  function listMarketItem(address contractAddress, uint256 itemId, uint256 price) public payable nonReentrant {
    require(_isAllowedContractAddress(contractAddress), 'Error: Action not allowed, listed tokens must be from an allowed contract.');

    uint256 tokenId = _marketItems[itemId].tokenId;

    // Transfer ownership to the marketplace contract
    IERC721(contractAddress).transferFrom(msg.sender, address(this), tokenId);

    // Mark msg.sender as item seller so they can recieive payment
    _marketItems[itemId].price = price;
    _marketItems[itemId].seller = payable(msg.sender);
    _marketItems[itemId].isListed = true;
  }

  // Transfers the token and handles payment
  function sellMarketItem(address contractAddress, address payable to, uint256 itemId) public payable {
    require(msg.value == _marketItems[itemId].price, 'Error: The msg.value must match the sale price.');
    require(_marketItems[itemId].isListed == true, 'Error: The token must be listed for a sale to take place');

    // Transfer payment to seller
    to.transfer(msg.value);

    // Transfers token to buyer
    IERC721(contractAddress).safeTransferFrom(address(this), to, _marketItems[itemId].tokenId);

    // Update market item
    _marketItems[itemId].isListed = false;
    _marketItems[itemId].seller = address(0);
    _marketItems[itemId].owner = to;
  }

  // Removes market item from marketplace
  function deleteMarketItem(uint256 itemId) public {
    require(_isAdminAddress(msg.sender), 'Error: Action not allowed, you must be an admin to delete a market item.');
    require(_marketItems[itemId].exists, 'Error: This item does not exist.');

    _marketItems[itemId].exists = false;
  }

  function getItems() public view returns (MarketItem[] memory) {
    MarketItem[] memory items = new MarketItem[](_itemCount.current());
    uint256 currentItemIndex;

    for (uint256 i; i < _itemIds.current(); i++) {
      if (_marketItems[i].exists) {
        items[currentItemIndex] = _marketItems[i];
        currentItemIndex++;
      }
    }

    return items;
  }

  // Returns true if an address is an admin
  function _isAdminAddress(address _addressToCheck) private view returns (bool) {
    return _adminAddresses[_addressToCheck];
  }

  // Returns true if the address of a token contract is allowed to be listed on the marketplace
  function _isAllowedContractAddress(address _contractAddress) private view returns (bool) {
    return _allowedContractAddresses[_contractAddress];
  }
}
