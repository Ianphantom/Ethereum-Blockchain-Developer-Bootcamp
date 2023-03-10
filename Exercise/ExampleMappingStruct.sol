//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;


contract ExampleMappingStruct{
    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numDeposit;
        mapping(uint =>Transaction) deposit;
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }

    mapping(address => Balance) public balances;

    function getDeposit( address _from ,uint _numDeposit) public view returns(Transaction memory){
        return balances[_from].deposit[_numDeposit];
    }

    function depositMoney() public payable{
        balances[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposit[balances[msg.sender].numDeposit] = deposit;
        balances[msg.sender].numDeposit++;
    }

    function withdrawMoney(address payable _to, uint _amount) public{
        balances[msg.sender].totalBalance -= _amount;

        Transaction memory withdrawal = Transaction(_amount, block.timestamp);

        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = withdrawal;
        balances[msg.sender].numWithdrawals;
        _to.transfer(_amount);
    }
}
