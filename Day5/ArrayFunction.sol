pragma solidity ^0.6.0;
 
// Creating a contract
contract helloGeeks
{ 
    uint[] public numbers;

    function addInArray(uint _num) public {
        numbers.push(_num);
    }

    function getFullArray() public view returns (uint[] memory) {
        return numbers;
    }

    function searchAndDelete(uint _num) public {
        uint index;
        uint length = numbers.length - 1;
        for(uint i = 0; i<numbers.length;i++){
            if(numbers[i] == _num){
                index = i;
            }
        }

        numbers[index] = numbers[length];
        numbers.pop();
    }
}