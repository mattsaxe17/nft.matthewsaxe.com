// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './ERC721Connector.sol';
import './ERC721.sol';

contract CryptoBirdz is ERC721Connector {
    string[] public tokens;
    mapping(string => bool) _CryptoBirdExists;

    string private name;
    string private symbol;

    constructor() ERC721Connector('CryptoBirdz', 'CBIRDZ') {}

    function mint(string memory _token) public {
        // Ensures token doesn't already exist
        require(!_CryptoBirdExists[_token], 'Token already exists');

        // Adds token to storage array
        uint256 _id = tokens.length;
        tokens.push(_token);

        // Mints the token
        _mint(msg.sender, _id);
        _CryptoBirdExists[_token] = true;
    }
}
