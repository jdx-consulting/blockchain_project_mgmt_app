pragma solidity ^0.4.17;

import "./IProjectDate.sol";
import "./ProjectDate.sol";

contract ProjectDateProxy is ContractBase, IProjectDate {

    function ProjectDateProxy(bytes32 _version, address _contractManagerAddress) public ContractBase(_version, "ProjectDateProxy", _contractManagerAddress) { }

    function year() public view returns(uint) {
        ProjectDate pd = ProjectDate(contractManager.findDeployedContract("ProjectDate"));
        return pd.year();
    }

     function month() public view returns(uint) {
        ProjectDate pd = ProjectDate(contractManager.findDeployedContract("ProjectDate"));
        return pd.month();
    }

     function day() public view returns(uint) {
        ProjectDate pd = ProjectDate(contractManager.findDeployedContract("ProjectDate"));
        return pd.day();
    }

    function setDate(uint _year, uint _month, uint _day) public {
        ProjectDate pd = ProjectDate(contractManager.findDeployedContract("ProjectDate"));
        pd.setDate(_year, _month, _day);
    }
}