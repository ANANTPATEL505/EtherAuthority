// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract Storage {
    struct Student{
        string name;
        uint RollNo;
        uint marks;
        bool result;
    }
    
    mapping(uint=>Student) public students;

    function AddStudent(string memory _name, uint _RollNo, uint _marks)public {
        require(_RollNo>0,"Invalid RollNo");
        require(students[_RollNo].RollNo==0,"Student already exists");
        require(_marks<=100,"Invalid Marks");

        students[_RollNo]=Student(_name,_RollNo,_marks,_marks>=33);
    }
    
    function UpdateMarks(uint _RollNo, uint _marks)public {
        require(_RollNo>0,"Invalid RollNo");
        require(students[_RollNo].RollNo!=0,"Student already exists");
        require(_marks<=100,"Invalid Marks");

        students[_RollNo].marks=_marks;
        students[_RollNo].result=_marks>=33;
    }

    function DeleteStudent(uint _rollNo)public {
        require(_rollNo>0,"Invalid RollNo");
        require(students[_rollNo].RollNo!=0,"Student Doesn't Exists");
        delete students[_rollNo];
    }
}