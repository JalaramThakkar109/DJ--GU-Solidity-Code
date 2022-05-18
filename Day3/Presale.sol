pragma solidity ^0.6.0;

contract Crowdfunding{
    //Token Information
    string public name;
    string public symbol;
    uint public decimals;
    uint public totalSupply;
    address public tokenAddress;
    uint public numOfTokenForSale;

    //Crowdfunding Information
    uint softCaps;
    uint hardCaps;
    uint pricePerWei;
    uint perUserLimit;
    uint startTime;
    uint endTime;
    uint bonus;
    uint claimLimit;
    uint perClaimTime;
    string ideaDiscription;

    mapping(address => uint) public numberOfUsersToken;
    mapping(address => uint) public bonusForUser;

    constructor(string memory _name,
    string memory _symbol,
    uint _decimals,
    uint _totalSupply,
    address _tokenAddress,
    uint _numOfTokenForSale,
    uint _softCaps,
    uint _hardCaps,
    uint _pricePerWei,
    uint _perUserLimit,
    uint _startTime,
    uint _endTime,
    uint _bonus,
    uint _claimLimit,
    uint _perClaimTime,
    string memory _ideaDiscription) public{

    }

    

}