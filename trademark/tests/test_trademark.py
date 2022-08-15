from brownie import accounts, trademark
import pytest


@pytest.fixture
def contract():
    acc = accounts[0]
    contract = trademark.deploy({"from": acc})
    return contract


def test_deploy():
    acc = accounts[0]
    contract = trademark.deploy({"from": acc})
    assert contract.abi


def test_register_trademark(contract):
    acc = accounts[0]
    assert contract.register_trademark("that's all folks!", "Sir Farquad", {"from": acc})


def test_check_trademark(contract):
    acc = accounts[0]
    assert contract.check_trademark("I'm loving it!") == False

    contract.register_trademark("I'm loving it!", "Ronald", {"from": acc})
    assert contract.check_trademark("I'm loving it!") == True
