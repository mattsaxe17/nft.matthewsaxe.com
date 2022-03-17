pragma solidity >=0.4.22 <0.9.0;

interface IERC165 {
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}