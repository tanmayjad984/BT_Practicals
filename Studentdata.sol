// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint256 studentID;
        string name;
        uint256 age;
    }

    Student[] public students;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    function addStudent(uint256 _studentID, string memory _name, uint256 _age) public onlyOwner {
        Student memory newStudent = Student(_studentID, _name, _age);
        students.push(newStudent);
    }

    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    function getStudent(uint256 index) public view returns (uint256, string memory, uint256) {
        require(index < students.length, "Student not found");
        Student storage student = students[index];
        return (student.studentID, student.name, student.age);
    }

    // Fallback function to receive Ether
    receive() external payable {
        // This function allows the contract to accept Ether without any specific logic.
    }
}
