//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;


contract ExampleSelfDestruct{
    receive() external payable{}

    function destroySmartContract() public{
        selfdestruct(payable(msg.sender));
    }
} 
