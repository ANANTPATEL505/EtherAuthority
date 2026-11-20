// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract AccountOwnership{

    address public owner;

    constructor(address _owner){
        require(_owner!=address(0));
        owner=_owner;
    }

    modifier onlyOwner(){
        require(owner==msg.sender);
        _;
    }

    function getMyAddress() public view returns(address){
        return msg.sender;
    }

    function CheckOwnerShip() public view returns(bool){
        return owner==msg.sender;
    }
    
    function TransferOwnership(address _newOwner)public onlyOwner{
        require(_newOwner!=owner && _newOwner!=address(0));
        owner=_newOwner;
    }

    function GetContractBalance()public view returns(uint){
        return address(this).balance;
    }

    function Withdraw(uint _amount)public onlyOwner{
        require(_amount>0 && _amount<=address(this).balance);
        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Transfer failed");
    }
    function Deposit()public payable {

    }
    receive() external  payable { }
}