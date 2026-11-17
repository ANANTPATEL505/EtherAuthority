// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract Owner{
    address public owner;

    constructor(address _owner){
        require(_owner != address(0), "Invalid owner address");
        owner=_owner;
    }
    event OwnershipTransferred(address indexed previousOwner,address indexed newOwner);

    modifier OnlyOwner(){
        require(msg.sender==owner);
        _;
    }

    function TransferOwnerShip(address _newOwner) public OnlyOwner{
        require(_newOwner!=address(0));
        address previousOwner=owner;
        owner=_newOwner;
        emit OwnershipTransferred(previousOwner,_newOwner);
    }

    function renounceOwnership()public OnlyOwner{
        address previousOwner=owner;
        owner=address(0);
        emit OwnershipTransferred(previousOwner,address(0));
    }
}