// SPDX-License-Identifier: MIT

pragma solidity 0.8.19; 

//you should be able to send funds to the smart contract
//send to another address
//withdraw funds from the smart contract
//withdraw all funds from the smart contract

contract walletSystem {
    address public contractOwner;
    // uint public amountInContract;
    constructor(){
        contractOwner = msg.sender;
    }

    //fund a smart contract
    function fundSmartContract() public payable {}

    //send funds to the smart contract
    // function receiveEthIntoContract() public payable {
    //     amountInContract += msg.value; 
    // }

    //get balance from acccount
    function getAddressbalance() public view returns(uint) {
        return address(msg.sender).balance;
    }

    //get smart contract balance
     function getSmartContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    //send eth to another address
    function sendEthToAddress(address payable _address) public payable {
        uint balanceOnAccount = address(contractOwner).balance;
        if(msg.sender == contractOwner){
            if(balanceOnAccount >= msg.value){
                payable(_address).transfer(msg.value);
            }
        }
    }

    function getWei(uint _amount) public pure returns(uint){
        return _amount*10**18;
    }

    //send eth to another account from the smart contract
    function sendEthFomContract(address payable _to, uint _amount) public payable {
        //convert ether to wei
        uint weiAMount = _amount*10**18;
        uint amountInContract = address(msg.sender).balance;
        if(msg.sender == contractOwner && amountInContract >= _amount){
           //_to.transfer(msg.value); // this would default to sending frunds from the address calling the function not the contract
           _to.transfer(weiAMount);
        }
    }

}