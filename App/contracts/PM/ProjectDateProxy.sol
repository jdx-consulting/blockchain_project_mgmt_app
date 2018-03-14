pragma solidity ^0.4.17;

import "./IProjectDate.sol";
import "./ProjectDate.sol";

contract ProjectDateProxy is IProjectDate {
    address pdAddr;

    function ProjectDateProxy(address _pdAddress) public {
        pdAddr = _pdAddress;
    }

    function Year() public view returns(uint) {
        ProjectDate pd = ProjectDate(pdAddr);
        return pd.Year();
    }

    function setDate(uint year, uint month, uint day) public {
        ProjectDate pd = ProjectDate(pdAddr);
        pd.setDate(year, month, day);
    }
}