//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleWrapAround{
    uint256 public myUint; //0 - (2^256) - 1

    // Pilih size dari Uint nya
    // Untuk mengurangi cost
    uint8 public myUint8 = 250; 

    function decrementMyUint() public{
        unchecked{
         myUint--;

        }
    }

    function incrementUint8() public{
        myUint8++;
    }
}
