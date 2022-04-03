// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

//  Note:
//  I wrote all of the contracts in this directory myself, inheriting from
//  OpenZeppelin's EIP interfaces, (@openzeppelin/contracts/interfaces) but
//  it is common (and likely safer) to inherit directly from their contract
//  implementations.

import './ERC721.sol';

contract MattSaxeCollection is ERC721 {
  constructor() ERC721('Matt Saxe Genesis Collection', 'MSGENESIS') {}
}