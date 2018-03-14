pragma solidity ^0.4.17;

/*
    Every deployed contract is passed the address of the ContractManager on construction.
    The contract then registers itself for discovery.

*/

contract ContractManager {
    mapping (bytes32 => address) private contractMapping;

    function registerDeployedContract(bytes32 _contractName, address _deployedAddress) public {
        contractMapping[_contractName] = _deployedAddress;
    }

    function findDeployedContract(bytes32 _contractName) public view returns(address) {
        return contractMapping[_contractName];
    }
}

