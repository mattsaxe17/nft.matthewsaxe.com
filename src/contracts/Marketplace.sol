// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';
import '@openzeppelin/contracts/utils/Counters.sol';

contract Marketplace is ReentrancyGuard {
  using Counters for Counters.Counter;

  Counters.Counter private _tokenIds;
  Counters.Counter private _itemsSold;

  address payable private _owner;
  uint256 private _listingPrice = 1.7 ether;

  mapping(uint256 => MarketItem) private tokenIdToMarketItem;

  constructor() {
    _owner = payable(msg.sender);
  }

  struct MarketItem {
    uint256 itemId;
    address contractAddress;
    uint256 tokenId;
    address payable seller;
    address payable owner;
    uint256 price;
    bool sold;
  }

  event MarketItemCreated (
    uint256 indexed itemId,
    address indexed contractAddress,
    uint256 indexed tokenId,
    address seller,
    address owner,
    uint256 price,
    bool sold
  )
}
