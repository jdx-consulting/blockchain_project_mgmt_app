pragma solidity ^0.4.17;

import "./IProjectDate.sol";
import "./ProjectDate.sol";

contract ProjectDateProxy is IProjectDate {
    address pdAddr;

    function ProjectDateProxy(address _pdAddress) public {
        pdAddr = _pdAddress;
    }

    function year() public view returns(uint) {
        ProjectDate pd = ProjectDate(pdAddr);
        return pd.year();
    }

     function month() public view returns(uint) {
        ProjectDate pd = ProjectDate(pdAddr);
        return pd.month();
    }

     function day() public view returns(uint) {
        ProjectDate pd = ProjectDate(pdAddr);
        return pd.day();
    }

    function setDate(uint _year, uint _month, uint _day) public {
        ProjectDate pd = ProjectDate(pdAddr);
        pd.setDate(_year, _month, _day);
    }
}