// SPDX-License-Identifier: MIT

// Smart contract that lets anyone deposit ETH into the contract
// Only the owner of the contract can withdraw the ETH
pragma solidity ^0.6.6;

// Get the latest ETH/USD price from chainlink price feed

// IMPORTANT: This contract has been updated to use the Goerli testnet
// Please see: https://docs.chain.link/docs/get-the-latest-price/
// For more information

import "smartcontractkit/chainlink-brownie-contracts@1.1.1/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "smartcontractkit/chainlink-brownie-contracts@1.1.1/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract Lottery{
    using SafeMathChainlink for uint256;
    address payable[] public players;
    uint256 public usdEntryFee;
    AggregatorV3Interface internal ethUsdPriceFeed; 


    constructor(address _priceFeedAddress)public{
        // 0xA39434A63A52E749F02807ae27335515BA4b07F7
        usdEntryFee = 50 * (10**18);
        ethUsdPriceFeed = AggregatorV3Interface(_priceFeedAddress);

    }

    function enter() public {
        players.push(msg.sender);
    }
    function getEntranceFee() public view returns(uint256) {
        (, int256 price, , , ) = ethUsdPriceFeed.latestRoundData();
        uint256 adjustedPrice = uint256(price) * 10**18; // 18 decimal

        uint256 costToEnter = (usdEntryFee * 10**18)/price;
        return costToEnter;
        
        // ETH/USD rate in 18 digit
        return uint256(answer * 10000000000);
    }
    function startLottery() public {}
    function endLottery() public {}
}