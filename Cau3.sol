// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/utils/Strings.sol";

contract StudentDB {
    struct Student {
        string name;
        uint256 age;
        string ID;
        uint8 gpa; // max 100
    }

    Student[] public studentsList;

    // 1. Thêm sinh viên vào mảng
    function addStudent(
        string memory _name,
        uint256 _age,
        string memory _ID,
        uint8 _gpa
    ) external {
        studentsList.push(Student(_name, _age, _ID, _gpa));
    }

    // 2. Xóa sinh viên
    function removeStudent(uint256 index) external {
        require(index < studentsList.length, "Invalid index");
        studentsList[index] = studentsList[studentsList.length - 1];
        studentsList.pop();
    }

    // 3. Xem thông tin sinh viên
    function getStudent(uint256 index) external view returns (Student memory) {
        require(index < studentsList.length, "Invalid index");
        return studentsList[index];
    }

    // 4. Sửa thông tin sinh viên
    function editStudent(
        uint256 index,
        string memory _name,
        uint256 _age,
        string memory _ID,
        uint8 _gpa
    ) external {
        require(index < studentsList.length, "Invalid index");
        studentsList[index] = Student(_name, _age, _ID, _gpa);
    }

    // 5. Tìm GPA cao nhất
    function getStudentWithHighestGPA()
        external
        view
        returns (uint8, string memory)
    {
        require(studentsList.length > 0, "No students in the list");
        uint8 highestGPA = studentsList[0].gpa;
        uint256 count = 0;

        for (uint256 i = 0; i < studentsList.length; ++i) {
            if (studentsList[i].gpa > highestGPA) {
                highestGPA = studentsList[i].gpa;
                count = 1;
            } else if (studentsList[i].gpa == highestGPA) {
                count++;
            }
        }

        string memory res = Strings.toString(count);
        string memory s1 = " student(s)";
        res =  string.concat(res, s1); 

        return (highestGPA, res);
    }
}
