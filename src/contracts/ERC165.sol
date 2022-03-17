pragma solidity >=0.4.22 <0.9.0;

import './interfaces/IERC165.sol';

contract ERC165 is IERC165 {
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor() {
        registerInterface(calcFingerprint());
    }

    function supportsInterface(bytes4 interfaceID) external view override returns (bool) {
        return _supportedInterfaces[interfaceID];
    }

    function calcFingerprint() public pure returns (bytes4) {
        return bytes4(keccak256('supportsInterface(bytes4)'));
    }

    function registerInterface(bytes4 interfaceId) public {
        require(interfaceId != 0xffffffff, 'ERC165: Invalid interface');
        _supportedInterfaces[interfaceId] = true;
    }
}
