// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    uint256 constant initialSupply = 1000000000;
    uint256 constant maxSupply = 1000000000000;

    constructor() ERC20("GasToken", "GSTKN") {
        _mint(msg.sender, initialSupply * 10**decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(
            totalSupply() <= maxSupply,
            "You cannot mint more than max supply!"
        );
        _mint(to, amount);
    }

    function buyGas() public {}

    function exchangeTokens() public {}
}
