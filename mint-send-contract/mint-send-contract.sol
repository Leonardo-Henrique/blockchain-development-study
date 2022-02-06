pragma solidity ^0.8.4;

contract Token {

    // minter is the contract owner
    address public minter;

    // balances maps addresses to its balances
    mapping(address => uint) public balances;

    // sent is the event that handle with 
    // amount transfers
    event Sent(address from, address to, uint amount);

    // mint allows to the contract owner to mint tokens
    function mint(address receiver, uint amount) public {

        require(msg.sender == minter);
        
        balances[receiver] += amount;
        
    }

    // send allows to send tokens to another account
    function send(address receiver, uint amount) public {

        require(balances[msg.sender] >= amount);

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);

    }

    constructor(){

        minter = msg.sender;    

    }



}