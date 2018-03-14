pragma solidity ^0.4.17;

import "../ContractBase.sol";

contract ProjectData is ContractBase {
    mapping (address => bool) private projectTeam;

    function ProjectData(bytes32 _version) public ContractBase(_version) {}

    function joinTeam(address teamMember) public {
        projectTeam[teamMember] = true;
    }

    function inTeam(address teamMember) public view returns (bool) {
        return projectTeam[teamMember];
    }

    function leaveTeam(address teamMember) public {
        projectTeam[teamMember] = false;
    }
}