// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../Broker.sol";

import {console} from "forge-std/console.sol";

interface IPool {
    function depositLender(address lender) external payable;

    function depositStorageProvider() external payable;

    function requestLoan(address storageProviderOwner, address storageProviderMiner, uint256 amount)
        external
        returns (address);

    function updatePool(address _storageProvider, uint256 amount) external;

    function withdraw(address manager, uint256 amount) external;
}
