// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import '@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol';
import './ERC721.sol';

// contract ERC721Enumerable is ERC721, IERC721Enumerable {
//     mapping(uint256 => uint256) _tokens;

//     function totalSupply() external view returns (uint256) {
//     }

//     /// @notice Enumerate valid NFTs
//     /// @dev Throws if `_index` >= `totalSupply()`.
//     /// @param _index A counter less than `totalSupply()`
//     /// @return The token identifier for the `_index`th NFT,
//     ///  (sort order not specified)
//     function tokenByIndex(uint256 _index) external view returns (uint256) {

//     }

//     /// @notice Enumerate NFTs assigned to an owner
//     /// @dev Throws if `_index` >= `balanceOf(_owner)` or if
//     ///  `_owner` is the zero address, representing invalid NFTs.
//     /// @param _owner An address where we are interested in NFTs owned by them
//     /// @param _index A counter less than `balanceOf(_owner)`
//     /// @return The token identifier for the `_index`th NFT assigned to `_owner`,
//     ///   (sort order not specified)
//     function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256) {

//     }
// }
