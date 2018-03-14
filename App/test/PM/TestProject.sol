pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../contracts/PM/Project.sol";

contract TestProject {
  Project p = Project(DeployedAddresses.Project());
 
  function testCanJoinTeam() public {
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
}