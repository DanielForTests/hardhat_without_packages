// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Inherited {
    uint256 public number;
    // an array
    uint256[] public numbers;

    function setNumber(uint256 newNumber) public {
        number = newNumber + 1;
        numbers.push(newNumber);
    }

    function unsafeFunction() public pure {
        uint256 x = 10;
        uint256 y = 0;
        uint256 z = x / y; // Division by zero
        require(z > 5, "z must be greater than 5");
    }

    function unsafeLoop() public view returns (uint256) {
        uint sum;
        for (uint256 i = 0; i < numbers.length; i++) {
            uint256 element = numbers[i];
            sum += element;
        }
        return sum;
    }
}
