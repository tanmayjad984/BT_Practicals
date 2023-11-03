// SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.4.16 < 0.9.0; 
contract BankAccount { 
address public owner; 
uint256 public balance; 
constructor(address _owner) { 
owner = _owner; 
balance = 0; 
} 
modifier onlyOwner { 
require(msg.sender == owner, "Only the owner can call this function."); 
_; 
} 
function deposit(uint256 amount) public onlyOwner { 
balance += amount; 
} 
function withdraw(uint256 amount) public onlyOwner { 
require(balance >= amount, "Insufficient balance."); 
balance -= amount; 
} 
function showBalance() public view returns (uint256) { 
return balance; 
} 
}
