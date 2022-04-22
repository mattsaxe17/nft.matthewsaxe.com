// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import '@openzeppelin/contracts/utils/Counters.sol';

contract MattSaxeGenesisCollection is ERC721URIStorage {
  using Counters for Counters.Counter;

  Counters.Counter private _tokenIds;
  address private _contractAddress;

  constructor(address _marketplaceAddress) ERC721('Matt Saxe Genesis Collection', 'MATT') {
    _contractAddress = _marketplaceAddress;
  }

  function mint(string memory _tokenUri) public returns (uint256) {
    _tokenIds.increment();
    uint256 newTokenId = _tokenIds.current();

    _mint(msg.sender, newTokenId);
    _setTokenURI(newTokenId, _tokenUri);
    setApprovalForAll(_contractAddress, true);
    return newTokenId;
  }
}
