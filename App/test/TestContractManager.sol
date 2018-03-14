pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ContractManager.sol";

contract TestContractManager {
    function testRegisterContract() public {
        ContractManager cm = ContractManager(DeployedAddresses.ContractManager());
        cm.registerDeployedContract("TestContractManager", address(this));
        Assert.equal(cm.findDeployedContract("TestContractManager"), address(this), "Version not set correctly.");
    }
}