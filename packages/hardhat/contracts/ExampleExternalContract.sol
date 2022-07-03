// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ExampleExternalContract {
    bool public completed;
    address public owner;

    constructor() {
        owner = 0xa423A05Eb84EAB65E9137dEabfBD127dc253C052;
    }

    modifier OnlyOwner() {
        require(owner == msg.sender, "You are not owner");
        _;
    }

    function complete() public payable {
        completed = true;
    }

    function sendTrx(address payable _contractAddress) public OnlyOwner {
        require(completed, "not completed");
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "Insufficient Balance in Contract");
        address payable contractAddress = _contractAddress;
        payable(contractAddress).transfer(contractBalance);
    }

    function changeCompleted() public {
        completed = false;
    }
}
