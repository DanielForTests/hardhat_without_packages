// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../Lock.sol";

contract FancyContract is Lock {
    uint256 public counter;

    event CounterIncremented(uint256 newCounter);
    event RandomNumberGenerated(uint256 randomNumber);
    event OwnerChanged(address indexed oldOwner, address indexed newOwner);

    constructor(uint _unlockTime) payable Lock(_unlockTime) {}

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function incrementCounter() public {
        counter++;
        emit CounterIncremented(counter);
    }

    function generateRandomNumber() public returns (uint256) {
        uint256 randomNumber = uint256(
            keccak256(
                abi.encodePacked(block.timestamp, block.difficulty, msg.sender)
            )
        ) % 100;
        emit RandomNumberGenerated(randomNumber);
        return randomNumber;
    }

    function changeOwner(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnerChanged(owner, newOwner);
        owner = payable(newOwner);
    }

    function weirdFunction() public pure returns (string memory) {
        return "This is a weird function!";
    }
}
