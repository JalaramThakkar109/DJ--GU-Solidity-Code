pragma solidity 0.8.0;

contract Result{
    mapping(string => uint) studentDetails;

    function setStudentDetails(string memory _name, uint _marks) public{
        studentDetails[_name] = _marks;
    }

    function getStudentDetails(string memory _name) public view returns(uint){
        return studentDetails[_name];
    }
}