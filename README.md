


## Deploying locally
1. Install Ganache desktop & run
2. Select quickstart Ethereum
3. Add Ganache local to Brownie networks
> brownie networks add Ethereum ganache-local host=http://127.0.0.1:7545 chainid=5777
4. Check network correctly added
> brownie networks list
5. Run using deploy script with local network
> brownie run scripts/deploy.py --network ganache-local

### Interacting with local contract
> brownie console --network ganache-local
