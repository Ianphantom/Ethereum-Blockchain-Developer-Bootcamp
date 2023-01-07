//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleUint{
    uint256 public myUint; //0 - (2^256) - 1

    // Pilih size dari Uint nya
    // Untuk mengurangi cost
    uint8 public myUint8 = 250; 

    int public myInt = -10; //-2^128 to + 2^128-1

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function decrementMyUint() public{
        myUint--;
    }

    function incrementUint8() public{
        myUint8++;
    }

    function incrementInt() public{
        myInt++;
    }
}
