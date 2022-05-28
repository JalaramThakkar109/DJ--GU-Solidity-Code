pragma solidity ^0.6.0;
 
// Creating a contract
contract helloGeeks
{ 
    string morningQuotes;
    address owner;

    event NewQuote(string);

    constructor() public{
        morningQuotes = "Nothing is Easy; Nothing is Imposible";
        owner = msg.sender;
    }

    modifier OnlyOwner(){
        require(msg.sender == owner, "You can't execute the function");
        _;
    }

    function addQuote(string memory _quote) OnlyOwner public {
        morningQuotes = _quote;
        emit NewQuote(_quote);
    }

    function getQuote() public view returns (string memory) {
        return morningQuotes;
    }
}