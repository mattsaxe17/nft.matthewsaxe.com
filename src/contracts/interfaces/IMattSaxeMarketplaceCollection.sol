// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

// All non-fungible-token contracts that are intended to be sold on the marketplace must implement this interface
interface IMattSaxeMarketplaceCollection {
  function getListingPrice() external view returns(uint256);
}
