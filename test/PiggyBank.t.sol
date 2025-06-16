// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/PiggyBank.sol";

contract PiggyBankTest is Test {
    TimeLockedPiggyBank piggyBank;
    address user = address(0xABCD);

    function setUp() public {
        piggyBank = new TimeLockedPiggyBank();
        vm.deal(user, 10 ether); // Fund user with ETH
    }

    function testDepositAndWithdrawAfterLock() public {
        vm.prank(user);
        piggyBank.deposit{value: 1 ether}(1 hours);

        vm.warp(block.timestamp + 1 hours);
        vm.prank(user);
        piggyBank.withdraw();

        assertEq(user.balance, 10 ether); // Full refund
    }

    function testEarlyWithdrawWithPenalty() public {
        vm.prank(user);
        piggyBank.deposit{value: 1 ether}(1 hours);

        vm.warp(block.timestamp + 10 minutes);
        vm.prank(user);
        piggyBank.withdraw();

        assertEq(user.balance, 9.8 ether); // 20% penalty
    }
}
