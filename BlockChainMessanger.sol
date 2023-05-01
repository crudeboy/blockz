// SPDX-License-Identifier: MIT

//to do
//- store a string on the block cain
//- readable for everyone
//- writeable for only the smark contract creator
//- how many time the messge was updated

pragma solidity 0.8.19; 

contract BlockChainMessanger {
   address public ownerAddress;

   string public stringValue;
   uint public updateCount;

   constructor(){
       ownerAddress = msg.sender;
   }

   function updateString(string memory _newString) public {
       if(msg.sender == ownerAddress) {
           stringValue = _newString;
           updateCount++;
       }
   }
} 