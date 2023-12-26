// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.10;

import {Test, console2} from "forge-std/Test.sol";
import {OwnerUpOnly} from "../src/OwnerUpOnly.sol";

contract OwnerUpOnlyTest is Test{
    OwnerUpOnly upOnly;

    function setUp() public {
        upOnly = new OwnerUpOnly();

    }

    function test_IncrementAsOwner() public{
        assertEq(upOnly.count(),0);
        upOnly.increment();
        assertEq(upOnly.count(),1);
    }

    function testFail_IncrementAsNotOwner() public {
        vm.prank(address(0));
        upOnly.increment();
    }

}