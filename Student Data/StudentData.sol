// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    
    // Struct to represent a student
    struct Student {
        uint256 id;
        string name;
        uint256 age;
    }

    // Array to hold all student records
    Student[] public students;

    // Event to be emitted when a new student is added
    event StudentAdded(uint256 id, string name, uint256 age);

    // Function to add a new student to the array
    function addStudent(uint256 _id, string memory _name, uint256 _age) public {
        // Create a new student and add it to the students array
        students.push(Student(_id, _name, _age));

        // Emit an event for logging purposes
        emit StudentAdded(_id, _name, _age);
    }

    // Function to get the total number of students
    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    // Function to retrieve a student by their index
    function getStudent(uint256 index) public view returns (uint256, string memory, uint256) {
        require(index < students.length, "Invalid student index");
        Student memory student = students[index];
        return (student.id, student.name, student.age);
    }

    // Function to retrieve all students in the array
    function getAllStudents() public view returns (uint256[] memory, string[] memory, uint256[] memory) {
        uint256[] memory ids = new uint256[](students.length);
        string[] memory names = new string[](students.length);
        uint256[] memory ages = new uint256[](students.length);

        for (uint256 i = 0; i < students.length; i++) {
            Student storage student = students[i];
            ids[i] = student.id;
            names[i] = student.name;
            ages[i] = student.age;
        }

        return (ids, names, ages);
    }

    // Fallback function to handle unexpected calls with data
    fallback() external payable {
        // Fallback function to accept Ether with data
    }

    // Receive function to accept Ether without any data
    receive() external payable {}

    // Function to check the contract's Ether balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
