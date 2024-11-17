// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    // Variables
    address public owner;
    mapping(address => uint256) public balances;

    // Events
    event Transfer(address indexed from, address indexed to, uint256 amount);

    // Constructor
    constructor() {
        owner = msg.sender; // Set the deployer as the owner
    }

    // Modifier to restrict access to owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Function to transfer tokens (restricted to owner)
    function transfer(address _to, uint256 _amount) public onlyOwner {
        require(balances[owner] >= _amount, "Insufficient balance");

        balances[owner] -= _amount;
        balances[_to] += _amount;

        emit Transfer(owner, _to, _amount); // Log the transfer event
    }

    // Function to mint tokens (optional for testing)
    function mint(address _to, uint256 _amount) public onlyOwner {
        balances[_to] += _amount;
    }
}
