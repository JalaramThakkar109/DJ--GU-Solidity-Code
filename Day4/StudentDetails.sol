pragma solidity 0.8.0;

contract StudentDetails{
    struct studentDetails{
        string name;
        uint age;
        uint standerd;
    }

    mapping(uint => studentDetails) _student;

    function setStudentDetails(string memory _name, uint _age, uint _standerd, uint _rollno) public {
        _student[_rollno] = studentDetails(_name,_age,_standerd);
    }

    function getStudentDetails(uint _rollno) public view returns(string memory _rname, uint _rage, uint _rstanderd){
        return (_student[_rollno].name, _student[_rollno].age,_student[_rollno].standerd);
    } 
}