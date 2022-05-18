pragma solidity ^0.8.0;
contract OnlyOwner{
    
    function printHelloWorld() public view OnlyOnTransactioAtATime returns (string memory){
        return "Hello World!";
    }
}