pragma solidity ^0.8.0;
contract OnlyOwner{
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    modifier OnlyOwner(){
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    function printHelloWorld() public view OnlyOwner returns (string memory){
        return "Hello World!";
    }
}