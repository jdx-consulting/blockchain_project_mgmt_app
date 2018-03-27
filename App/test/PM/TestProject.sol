pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../contracts/PM/Project.sol";

contract TestProject {
  Project p = Project(DeployedAddresses.Project());
 
  function testCanJoinTeam() public {
    p.assignPM(address(this)); // Need a PM to build a team.....
    p.joinTeam(address(this));
    Assert.equal(p.inTeam(address(this)), true, "Added to Team.");
  }

  function testCanLeaveTeam() public {
    p.leaveTeam(address(this));
    Assert.equal(p.inTeam(address(this)), false, "Removed from Team.");
  }

  function testNotInTeam() public {
    Assert.equal(p.inTeam(address(this)), false, "Removed from Team.");
  }

  function testAssignPM() public {
    p.assignPM(address(this));
    Assert.equal(p.whoIsPM(), address(this), "PM Assigned.");
  }

  function testUnassignPM() public {
    p.unassignPM();
    Assert.equal(p.whoIsPM(), address(0), "PM Un-Assigned.");
  }
}