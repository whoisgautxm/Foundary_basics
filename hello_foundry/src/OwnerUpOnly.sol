// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.10;

error Unauthorized();

contract OwnerUpOnly{
    address public immutable owner;
    uint public count;

    constructor() {
        owner = msg.sender;
    }

    function increment() public {
        if (msg.sender != owner) {
            revert Unauthorized();
        }
        count++;
    }
}