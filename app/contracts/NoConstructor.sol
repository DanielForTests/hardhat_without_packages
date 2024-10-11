// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./Inherited.sol";

contract Father is Inherited {
    // Add your contract logic here
    uint256 public fatherNumber;

    constructor() {
        fatherNumber = block.timestamp;
    }
}
