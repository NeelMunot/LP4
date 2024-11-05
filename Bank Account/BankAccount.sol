// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankAccount {

    // Mapping to store each customer's balance (identified by their address)
    mapping(address => uint256) private balances;

    // Event to log deposit transactions
    event Deposit(address indexed accountHolder, uint256 amount);

    // Event to log withdrawal transactions
    event Withdrawal(address indexed accountHolder, uint256 amount);

    // Function to deposit money into the account
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0.");
        
        // Increase the balance of the sender's account by the deposited amount
        balances[msg.sender] += msg.value;
        
        // Emit the Deposit event
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw money from the account
    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance.");

        // Decrease the balance of the sender's account
        balances[msg.sender] -= _amount;

        // Transfer the specified amount back to the sender
        payable(msg.sender).transfer(_amount);
        
        // Emit the Withdrawal event
        emit Withdrawal(msg.sender, _amount);
    }

    // Function to check the balance of the sender's account
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
