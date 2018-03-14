pragma solidity ^0.4.17;

import "./ProjectDate.sol";
import "../ContractBase.sol";
import "./ProjectData.sol";

contract Project is ContractBase {
    address pdataAddr;

    function Project(bytes32 _version, address _pdataAddr) public ContractBase(_version) {
        pdataAddr = _pdataAddr;
    }

    function joinTeam(address teamMember) public {
        ProjectData pdata = ProjectData(pdataAddr);
        pdata.joinTeam(teamMember);
    }

    function inTeam(address teamMember) public view returns (bool) {
        ProjectData pdata = ProjectData(pdataAddr);
        return pdata.inTeam(teamMember);
    }

    function leaveTeam(address teamMember) public {
        ProjectData pdata = ProjectData(pdataAddr);
        pdata.leaveTeam(teamMember);
    }

    
}