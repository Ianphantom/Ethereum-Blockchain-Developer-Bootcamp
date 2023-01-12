//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleTryCatch{
    error NotAllowedError(string);
    function aFunction() public pure{
        // require(false, "Error Message");
        revert NotAllowedError("You Will Not Allowed");
    }
}

contract ErrorHandling{
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowLevelData);
    function catchTheError() public{
        ExampleTryCatch will = new ExampleTryCatch();
        try will.aFunction() {

        } catch Error(string memory reason){
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode){
            emit ErrorLogCode(errorCode);
        } catch(bytes memory lowLevelData){
            emit ErrorLogBytes(lowLevelData);
        }
    } 
}
