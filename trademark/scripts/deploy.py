from brownie import accounts, trademark


def main():
    deployer = accounts[0]
    trademark.deploy({"from": deployer})
