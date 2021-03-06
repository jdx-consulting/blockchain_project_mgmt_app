pragma solidity ^0.4.17;

import "../ContractBase.sol";
import "./IProjectDate.sol";

contract ProjectDate is ContractBase, IProjectDate {
    uint setDay;
    uint setMonth;
    uint setYear;

    function ProjectDate(bytes32 _version, address _contractManagerAddress) public ContractBase(_version, "ProjectDate", _contractManagerAddress) {}
   
    function year() public view returns(uint) {
        return setYear;
    }

     function month() public view returns(uint) {
        return setMonth;
    }

     function day() public view returns(uint) {
        return setDay;
    }
   
    function setDate(uint _year, uint _month, uint _day) public {
        setDay = _day;
        setMonth = _month;
        setYear = _year;
    }
    
    
}