// SPDX-License-Identifier: MIT
pragma solidity 0.5.1;
contract mintYourcoins{
    address public minter;
    mapping (address => uint) public balance;
    event send(address from, address to, uint);

    constructor() public {
        minter = msg.sender;  // only the creater mint new coin
    }

    function mint(address receiver, uint amount) public view  {
        require(msg.sender == minter);
        require(amount <1e60);
        balance[receiver]+ amount;
    }

    function sent(address receiver, uint amount) public{
        require(amount <= balance[msg.sender], "Insuficiant Balance");
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
        emit send(msg.sender, receiver, amount);
    }

    function balances (address _account) external view returns (uint) {
        return balance[_account];
    }
}