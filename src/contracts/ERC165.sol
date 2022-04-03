// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import '@openzeppelin/contracts/interfaces/IERC165.sol';

contract ERC165 is IERC165 {
  // Holds interfaces supported by a contract
  mapping(bytes4 => bool) private _supportedInterfaces;

  // Adds IERC165 to supported interfaces
  constructor() {
    _registerInterface(type(IERC165).interfaceId);
  }

  // Returns whether or not a contract supports an interface
  function supportsInterface(bytes4 interfaceId) external view returns (bool) {
    return _supportedInterfaces[interfaceId];
  }

  // Registers an interface
  function _registerInterface(bytes4 interfaceId) internal {
    require(interfaceId != 0xffffffff, 'Invalid interface ("0xffffffff")');
    _supportedInterfaces[interfaceId] = true;
  }
}