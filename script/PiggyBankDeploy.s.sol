// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/PiggyBank.sol";

contract PiggyBankDeployScript is Script {
    function run() external {
        vm.startBroadcast();
        new TimeLockedPiggyBank();
        vm.stopBroadcast();
    }
}
