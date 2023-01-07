//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleConstructor{
    address public myAddress;

    constructor(address _someAddress){
        myAddress = _someAddress;
    }

    function setMyAddres(address _myAddress) public{
        myAddress = _myAddress;
    }

    function setMyAddresToMsgSender() public{
        myAddress = msg.sender;
    }
}
