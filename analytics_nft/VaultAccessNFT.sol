
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract VaultAccessNFT is ERC721 {
    uint256 public tokenCount;

    constructor() ERC721("VaultAccessNFT", "VANFT") {}

    function mintAccessNFT() external {
        _mint(msg.sender, tokenCount);
        tokenCount++;
    }
}
