//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleMsgObject {
    address public someAddress;

    function updateSomeAdress() public {
        someAddress = msg.sender;
    }
}
