pragma solidity ^0.4.17;

import "./ProjectDate.sol";
import "../ContractBase.sol";
import "./ProjectData.sol";

contract Project is ContractBase {
    
    function Project(bytes32 _version, address _contractManagerAddress) public ContractBase(_version, "Project", _contractManagerAddress) { }

    function joinTeam(address teamMember) public {
        ProjectData pdata = ProjectData(contractManager.findDeployedContract("ProjectData"));
        require(pdata.whoIsPM() != address(0)); // Can't assign team members to project with no PM.
        pdata.joinTeam(teamMember);
    }

    function inTeam(address teamMember) public view returns (bool) {
        ProjectData pdata = ProjectData(contractManager.findDeployedContract("ProjectData"));
        return pdata.inTeam(teamMember);
    }

    function leaveTeam(address teamMember) public {
        ProjectData pdata = ProjectData(contractManager.findDeployedContract("ProjectData"));
        pdata.leaveTeam(teamMember);
    }

    function assignPM(address pm) public {
        require(pm != address(0));
        ProjectData pdata = ProjectData(contractManager.findDeployedContract("ProjectData"));
        pdata.assignPM(pm);
        assert(pdata.whoIsPM() == pm);
    }

    function unassignPM() public {
        ProjectData pdata = ProjectData(contractManager.findDeployedContract("ProjectData"));
        require(pdata.whoIsPM() != address(0));
        pdata.unassignPM();
    }

    function whoIsPM() public view returns (address) {
        ProjectData pdata = ProjectData(contractManager.findDeployedContract("ProjectData"));
        return pdata.whoIsPM();
    }
}