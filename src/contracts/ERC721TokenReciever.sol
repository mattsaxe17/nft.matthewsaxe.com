// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import '@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol';

contract ERC721TokenReciever is IERC721Receiver {
    function onERC721Received(
        address _operator,
        address _from,
        uint256 _tokenId,
        bytes memory _data
    ) external pure returns (bytes4) {
        return bytes4(keccak256('onERC721Received(address,address,uint256,bytes)'));
    }
}
