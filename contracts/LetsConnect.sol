// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

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
}

contract LetsConnect {
    constructor() {}

    function letsBalanceOf(address _contractAddress, address _accountAddress)
        external
        view
        returns (uint256)
    {
        return IERC20(_contractAddress).balanceOf(_accountAddress);
    }

    //it transfers from this contract perspective, so the msg.sender is this contract
    //if you want to transfer from user perspective, you should use transferFrom()
    //or call transfer directly from the ERC20 contract
    function letsTransfer(
        address _contractAddress,
        address _to,
        uint256 _amount
    ) external returns (bool) {
        return IERC20(_contractAddress).transfer(_to, _amount);
    }

    //here you can set what address you want to transfer from
    function letsTranferFrom(
        address _from,
        address _to,
        uint256 _amount,
        address _contractAddress
    ) external returns (bool) {
        return IERC20(_contractAddress).transferFrom(_from, _to, _amount);
    }

    //it approves from this contract perspective, so the msg.sender is this contract
    //if you want to approve something from the user perspective, you should ask the user to call the approve function directly from the ERC20 contract
    function letsApprove(
        address _contractAddress,
        address _spender,
        uint _amount
    ) external returns (bool) {
        return IERC20(_contractAddress).approve(_spender, _amount);
    }

    function letsAllowance(
        address _contractAddress,
        address _owner,
        address _spender
    ) external view returns (uint256) {
        return IERC20(_contractAddress).allowance(_owner, _spender);
    }
}
