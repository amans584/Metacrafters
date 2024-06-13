// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract TokenContract {

    // Public variables here
    string public tokenName = "TokenName";
    string public tokenSymbol = "TKN";
    uint256 public supply = 0;

    // Mapping variable here
    mapping(address => uint256) public accountBalances;

    // Mint function
    function createTokens(address recipient, uint256 quantity) public {
        supply += quantity;
        accountBalances[recipient] += quantity;
    }

    // Burn function
    function destroyTokens(address holder, uint256 quantity) public {
        if (accountBalances[holder] >= quantity) {
            supply -= quantity;
            accountBalances[holder] -= quantity;
        } else {
            revert("Insufficient balance to burn");
        }
    }
}
