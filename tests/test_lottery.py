# 0.019
from brownie import Lottery, accounts, network, 



def test_get_entrance_fee():
    account = accounts[0]
    lottery = Lottery.deploy(config["networks"][network.show_active()]["eth_usd_price_feed"],
     {"from": account})
    entrancefee = lottery.getEntranceFee() 
    print("getEntranceFee:\t" + str(entrancefee))
    assert entrancefee > 0.039 * 10**10
    assert entrancefee < 0.040 * 10**10