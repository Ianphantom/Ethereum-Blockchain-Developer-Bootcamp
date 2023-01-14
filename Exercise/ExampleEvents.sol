//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleEvents{
    mapping(address => uint) public tokenBalance;

    event tokenSent(address _from, address _to, uint _amount);

    constructor(){
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns(bool){
        require(tokenBalance[msg.sender] >= _amount, "Not Enough Tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit tokenSent(msg.sender, _to, _amount);

        return true;
    }
}
