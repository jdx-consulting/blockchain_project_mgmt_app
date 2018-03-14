pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../contracts/PM/ProjectDate.sol";

contract TestProjectDate {

    function testVersionInPlace() public {
        ProjectDate pd1 = ProjectDate(DeployedAddresses.ProjectDate());
         
        Assert.equal(pd1.contractVersion(), "1.0.1", "Version not set correctly.");
    }
    
    function testSetYear() public {
        ProjectDate pd1 = ProjectDate(DeployedAddresses.ProjectDate());
        pd1.setDate(2018,3,10);
        Assert.equal(pd1.Year(), 2018, "Year set correctly.");
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