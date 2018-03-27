pragma solidity ^0.4.17;

import "../ContractBase.sol";

contract ProjectData is ContractBase {
    mapping (address => bool) private projectTeam;
    address private projectManager;

    function ProjectData(bytes32 _version, address _contractManagerAddress) public ContractBase(_version, "ProjectData", _contractManagerAddress) {}

    function joinTeam(address teamMember) public {
        projectTeam[teamMember] = true;
    }

    function inTeam(address teamMember) public view returns (bool) {
        return projectTeam[teamMember];
    }

    function leaveTeam(address teamMember) public {
        projectTeam[teamMember] = false;
    }

    function assignPM(address pm) public {
        projectManager = pm;
    }

    function unassignPM() public {
        projectManager = address(0);
    }

    function whoIsPM() public view returns (address) {
        return projectManager;
    }
}