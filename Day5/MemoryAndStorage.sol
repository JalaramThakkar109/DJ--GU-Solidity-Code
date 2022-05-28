
pragma solidity ^0.4.17;
 
// Creating a contract
contract helloGeeks
{ 
  // Initialising array numbers
  int[] public numbers;
  
   
  // Function to insert
  // values in the array
  // numbers
  function Numbers() public returns(int[], int[]){
    numbers.push(1);
    numbers.push(2);
     
    //creating a new instance
    int[] memory myArray = numbers;
     
    // Adding value to the first
    // index of the array myArray
    myArray[0] = 0;

    return (numbers,myArray);
  } 
}