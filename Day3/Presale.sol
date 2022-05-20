pragma solidity ^0.6.0;
import './ERC20.sol';

contract Crowdfunding{
    //Token Information
    string public name;
    string public symbol;
    uint public decimals;
    uint public totalSupply;
    address public tokenAddress;
    uint public numOfTokenForSale;
    ERC20 erc20;

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
    uint totalRaised;

    mapping(address => uint) public numberOfUsersToken;
    mapping(address => uint) public bonusForUser;
    mapping(address => uint) public totalClaimedTokensByUser;

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
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        erc20 = ERC20(_tokenAddress);
        numOfTokenForSale = _numOfTokenForSale;
        ideaDiscription = _ideaDiscription;
        softCaps = _softCaps;
        hardCaps = _hardCaps;
        pricePerWei = _pricePerWei;
        perUserLimit = _perUserLimit;
        startTime = _startTime;
        endTime = _endTime;
        bonus = _bonus;
        claimLimit = _claimLimit;
        perClaimTime = _perClaimTime;
    }

    function buyTokens() payable public {
        require(erc20.balanceOf(address(this)) > numOfTokenForSale, "Tokens are not supplied to contract!");
        require(startTime < now, "Presale is not started");
        require(endTime > now, "Presale is ended");
        require(numberOfUsersToken[msg.sender] <= perUserLimit, "You have reached your limit");
        require(msg.value > 0, "Please send some ETH");
        require(totalRaised < hardCaps, "Presale is completed");

        numberOfUsersToken[msg.sender] = msg.value*pricePerWei;
        totalRaised = convertWeiToETH(msg.value);
    }

    function claimToken() public {
        require(endTime < now, "Presale is not ended");
        require(numberOfUsersToken[msg.sender] > 0, "You have not tokens to claim");
        require(totalRaised > softCaps, "Presale is not successful");
        require(totalClaimedTokensByUser[msg.sender] <= numberOfUsersToken[msg.sender], "Your all the tokens are claimed");
        uint amountToClaim = numberOfUsersToken[msg.sender] * (claimLimit/100);
        erc20.transfer(msg.sender,amountToClaim);
        totalClaimedTokensByUser[msg.sender] = numberOfUsersToken[msg.sender] * (claimLimit/100);
    }

    function convertWeiToETH(uint number) internal pure returns(uint) {
        return number / 1 ether;
    }

    

}