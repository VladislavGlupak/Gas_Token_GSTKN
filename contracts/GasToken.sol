// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    uint256 constant initialSupply = 1000000000;
    uint256 constant maxSupply = 1000000000000;
    bool public promoStopped = false;

    mapping(address => uint256) public accounts;

    constructor() ERC20("GasToken", "GSTKN") {
        _mint(msg.sender, initialSupply * 10**decimals());
    }

    modifier notStopped() {
        require(promoStopped == false, "Promotion is stopped!");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(
            totalSupply() <= maxSupply,
            "You cannot mint more than max supply!"
        );
        _mint(to, amount);
    }

    function buyGas() public notStopped {}

    function exchangeTokens() public notStopped {}

    function stopPromotion() public {
        promoStopped = true;
    }

    receive() external payable {}

    fallback() external payable {}
}
