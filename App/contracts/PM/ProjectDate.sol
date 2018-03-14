pragma solidity ^0.4.17;

import "../ContractBase.sol";
import "./IProjectDate.sol";

contract ProjectDate is ContractBase, IProjectDate {
    uint public Day;
    uint public Month;
    uint public Year;

    function ProjectDate() public {
        VERSION = "1.0.1";
    }

    function contractVersion() public view returns (bytes32) {
        return VERSION;
    }
   
    function setDate(uint year, uint month, uint day) public {
        Day = day;
        Month = month;
        Year = year;
    }
    
    
}