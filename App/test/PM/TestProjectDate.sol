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
        Assert.equal(pdx.year(), 2018, "Year set correctly.");
    }


    function testSetMonth() public {
        ProjectDateProxy pdx = ProjectDateProxy(DeployedAddresses.ProjectDateProxy());
        pdx.setDate(2018,3,10);
        Assert.equal(pdx.month(), 3, "Month set correctly.");
    }

    
    function testSetDay() public {
        ProjectDateProxy pdx = ProjectDateProxy(DeployedAddresses.ProjectDateProxy());
        pdx.setDate(2018,3,10);
        Assert.equal(pdx.day(), 10, "Day set correctly.");
    }

    function testAutoBuild() public {
        int dummyVal = 1;
        Assert.equal(1, dummyVal, "Dummy Test.");
    }

}