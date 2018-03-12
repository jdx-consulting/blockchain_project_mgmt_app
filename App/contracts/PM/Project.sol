pragma solidity ^0.4.17;

import "./ProjectDate.sol";

contract Project {
    mapping (address => bool) public projectTeam;

    function joinTeam(address teamMember) public {
        
        projectTeam[teamMember] = true;
    }

    function inTeam(address teamMember) public view returns (bool) {
        return projectTeam[teamMember];
    }

    function leaveTeam(address teamMember) public {
        projectTeam[teamMember] = false;
    }

    
    string public projectName;
    uint public projectId;
    

    ProjectDate public projectStart;
    ProjectDate public projectEnd;

    

}