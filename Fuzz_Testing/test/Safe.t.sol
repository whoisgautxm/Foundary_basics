// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "../lib/forge-std/src/Test.sol";
import {Safe} from "../src/Safe.sol";

contract SafeTest is Test {
    Safe safe;
    // Needed so the test contract itself can receive ether
    // when withdrawing
    receive() external payable {}

    function setUp() public {
        safe = new Safe();
    }

    function test_Withdraw() public {
        payable(address(safe)).transfer(1 ether);
        uint256 preBalance = address(this).balance;
        safe.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(preBalance + 1 ether, postBalance);
    }

    // function testFuzz_Withdraw(uint256 amount) public {
    //     payable(address(safe)).transfer(amount);
    //     uint256 preBalance = address(this).balance;
    //     safe.withdraw();
    //     uint256 postBalance = address(this).balance;
    //     assertEq(preBalance + amount, postBalance);
    // }
    function testFuzz_Withdraw(uint96 amount) public {
        payable(address(safe)).transfer(amount);
        uint256 preBalance = address(this).balance;
        safe.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(preBalance + amount, postBalance);
    }

}
