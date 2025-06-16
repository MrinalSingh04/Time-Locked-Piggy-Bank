// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TimeLockedPiggyBank {
    struct DepositInfo {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => DepositInfo) public deposits;

    event Deposited(address indexed user, uint256 amount, uint256 unlockTime);
    event Withdrawn(address indexed user, uint256 amount);
    event PenaltyApplied(address indexed user, uint256 penaltyAmount);

    function deposit(uint256 _lockDurationInSeconds) external payable {
        require(msg.value > 0, "Deposit must be greater than 0");

        deposits[msg.sender] = DepositInfo({
            amount: msg.value,
            unlockTime: block.timestamp + _lockDurationInSeconds
        });

        emit Deposited(msg.sender, msg.value, block.timestamp + _lockDurationInSeconds);
    }

    function withdraw() external {
        DepositInfo memory info = deposits[msg.sender];
        require(info.amount > 0, "No deposit found");

        if (block.timestamp >= info.unlockTime) {
            deposits[msg.sender].amount = 0;
            payable(msg.sender).transfer(info.amount);
            emit Withdrawn(msg.sender, info.amount);
        } else {
            // Apply a 20% penalty if withdrawn early
            uint256 penalty = (info.amount * 20) / 100;
            uint256 payout = info.amount - penalty;

            deposits[msg.sender].amount = 0;
            payable(msg.sender).transfer(payout);
            emit PenaltyApplied(msg.sender, penalty);
        }
    }

    function getRemainingLockTime(address user) external view returns (uint256) {
        if (block.timestamp >= deposits[user].unlockTime) return 0;
        return deposits[user].unlockTime - block.timestamp;
    }
}
