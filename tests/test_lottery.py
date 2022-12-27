# 0.019
from brownie import Lottery, accounts, network, config
from web3 import web3


def test_get_entrance_fee():
    account = accounts[0]
    lottery = Lottery.deploy(config["networks"][network.show_active()]["eth_usd_price_feed"], {"from": account})

    assert lottery.getEntranceFee() > web3.toWei(0.018,"ether")