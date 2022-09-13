// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    function approve(address spender, uint amount) external returns (bool);

    function transfer(address to, uint256 amount) external returns (bool);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract LetsConnect is Ownable {
    constructor() {}

    function getBalanceThere(address _contractAddress, address _accountAddress)
        external
        view
        returns (uint256)
    {
        return IERC20(_contractAddress).balanceOf(_accountAddress);
    }
}
