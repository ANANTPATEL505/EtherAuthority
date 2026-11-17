// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract EtherTransfer{

    mapping (address=>uint) public balances;

    function Deposit()public payable {
        require(msg.value>0,"Amount must be greater than zero");
        balances[msg.sender]+=msg.value;
    }

    function Withdraw(uint amount)public {
        require(amount>0,"Amount must be greater than zero");
        require(balances[msg.sender] >= amount);

        balances[msg.sender]-=amount;
        (bool sucess,)=payable(msg.sender).call{value:amount}("");
        require(sucess,"Withdraw failed");
    }

    function TransferEtherContract(address payable _to, uint amount)public{
        require(_to!=address(0),"invalid address");
        require(_to!=address(this),"cannot transfer to contract");
        require(amount!=0,"amount must be greater than zero");
        require(balances[msg.sender] >= amount);

        balances[msg.sender]-=amount;
        balances[_to]+=amount;
    }
    function TransferEther(address payable _to)public payable{
        require(_to != address(0), "Invalid address");
        require(msg.value > 0, "Send some ETH");
        require(_to != address(this), "Cannot transfer to this contract");
        (bool sucess,)=_to.call{value:msg.value}("");
        require(sucess,"Withdraw failed");
    }

    function ContractBalance()public view returns(uint){
        return address(this).balance;
    }

    receive() external payable {
        balances[msg.sender]+=msg.value;
    }

}