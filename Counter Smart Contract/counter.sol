// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract Counter {
    
    uint public count;

    function Increment()public {
        count++;
    }
    function Decrement()public {
        count--;
    }
    function Reset()public {
        count=0;
    }
    function Custom(uint _num)public {
        count=_num;
    }
}