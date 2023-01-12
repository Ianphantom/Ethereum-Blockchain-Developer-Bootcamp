//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract Consumer{
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function deposit() public payable{}
}

contract ProjectSmartWallet {
    address payable public owner;

    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;
    mapping(address => mapping(address => bool)) nextOwnerGuardianVoteBool;
    mapping(address => bool) public guardians;
    address payable nextOwner;
    uint guardianResetCount;
    uint public constant confirmationsFromGuardiansForReset = 3;

    constructor() {
        owner = payable(msg.sender);
    }

    function setGuardian(address _guardian, bool _isGuardian) public {
        require(msg.sender == owner, "You are not the Owner!, aborting!");
        guardians[_guardian] = _isGuardian;

    }

    function proposeNewOwner(address payable _newOwner) public {
        require(guardians[msg.sender], "You are not guardian of this waller, aborting");
        require(nextOwnerGuardianVoteBool[_newOwner][msg.sender] == false, "You already voted. Aborting");
        if(_newOwner != nextOwner){
            nextOwner = _newOwner;
            guardianResetCount = 0;
        }

        guardianResetCount++;
        if(guardianResetCount >= confirmationsFromGuardiansForReset){
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _for, uint _amount) public {
        require(msg.sender == owner, "You are not the Owner!");

        allowance[_for] = _amount;

        if(_amount > 0){
            isAllowedToSend[_for] = true;
        }else{
            isAllowedToSend[_for] = false;
        }
    }

    function transfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory ){
        // require(msg.sender == owner, "You are not the owner, aborting!");
        if(msg.sender != owner){
            require(isAllowedToSend[msg.sender], "Aborting!");
            require(allowance[msg.sender] >= _amount, "You are trying to send more than you are allowed to, aborting!");

            allowance[msg.sender] -= _amount;
        }

        (bool success, bytes memory returnData) = _to.call{value: _amount}(_payload);
        require(success, "Aborting, call was not successfull"); 
        return returnData;
    }

    receive() external payable{}
}
