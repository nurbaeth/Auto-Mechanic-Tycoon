// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AutoMechanicTycoon {
    struct Mechanic {
        uint256 reputation;
        uint256 repairsToday;
        uint256 lastRepairDay;
        bool registered;
    }

    mapping(address => Mechanic) public mechanics;

    event Registered(address mechanic);
    event Repaired(address mechanic, uint256 newReputation);

    modifier onlyRegistered() {
        require(mechanics[msg.sender].registered, "Not registered");
        _;
    }

    function register() external {
        require(!mechanics[msg.sender].registered, "Already registered");
        mechanics[msg.sender] = Mechanic(0, 0, getDay(), true);
        emit Registered(msg.sender);
    }

    function repairCar() external onlyRegistered {
        Mechanic storage m = mechanics[msg.sender];

        // Reset daily limit if new day
        if (m.lastRepairDay < getDay()) {
            m.repairsToday = 0;
            m.lastRepairDay = getDay();
        }

        require(m.repairsToday < 3, "Daily repair limit reached");

        m.repairsToday += 1;
        m.reputation += 10;

        emit Repaired(msg.sender, m.reputation);
    }

    function getMyStats() external view onlyRegistered returns (
        uint256 reputation,
        uint256 repairsLeftToday
    ) {
        Mechanic memory m = mechanics[msg.sender];
        uint256 currentDay = getDay();
        uint256 repairsDone = (m.lastRepairDay == currentDay) ? m.repairsToday : 0;
        return (m.reputation, 3 - repairsDone);
    }

    function getDay() internal view returns (uint256) {
        return block.timestamp / 1 days;
    }
}
