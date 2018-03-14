pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../contracts/PM/ProjectDate.sol";
import "../../contracts/PM/IProjectDate.sol";
import "../../contracts/PM/ProjectDateProxy.sol";

contract TestProjectDate {

    function testVersionInPlace() public {
        ProjectDate pd = ProjectDate(DeployedAddresses.ProjectDate());
        Assert.equal(pd.contractVersion(), "1.0.1", "Version not set correctly.");
    }
    
    function testSetYear() public {
        ProjectDateProxy pdx = ProjectDateProxy(DeployedAddresses.ProjectDateProxy());
        pdx.setDate(2018,3,10);
        Assert.equal(pdx.Year(), 2018, "Year set correctly.");
    }


    function testSetMonth() public {
        ProjectDate pd1 = ProjectDate(DeployedAddresses.ProjectDate());
        pd1.setDate(2018,3,10);
        Assert.equal(pd1.Month(), 3, "Year set correctly.");
    }

    
    function testSetDay() public {
        ProjectDate pd1 = ProjectDate(DeployedAddresses.ProjectDate());
        pd1.setDate(2018,3,10);
        Assert.equal(pd1.Day(), 10, "Year set correctly.");
    }

}