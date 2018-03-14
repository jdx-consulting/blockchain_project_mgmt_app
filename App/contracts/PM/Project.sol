pragma solidity ^0.4.17;

import "./ProjectDate.sol";
import "../ContractBase.sol";
import "./ProjectData.sol";

contract Project is ContractBase {
    
    function Project(bytes32 _version, address _contractManagerAddress) public ContractBase(_version, _contractManagerAddress) { }

    function joinTeam(address teamMember) public {
        ProjectData pdata = ProjectData(contractManager.findDeployedContract("ProjectData"));
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

    
}