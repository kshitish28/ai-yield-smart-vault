
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIVault {
    address public owner;
    mapping(address => uint256) public balances;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount, uint256 fee);

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        uint256 fee = amount / 100;
        uint256 toSend = amount - fee;
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(toSend);
        emit Withdrawn(msg.sender, toSend, fee);
    }

    receive() external payable {}
}
