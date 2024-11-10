// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FirstContract {
    uint age;

    function setAge(uint x) public {
        age = x;
    }

    function getAge() public view returns (uint) {
        return age;
    }
}
