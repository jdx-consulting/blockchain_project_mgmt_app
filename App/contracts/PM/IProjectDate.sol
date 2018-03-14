pragma solidity ^0.4.17;

interface IProjectDate {
    // Explicit Getters
    function year() public view returns(uint);
    function month() public view returns(uint);
    function day() public view returns(uint);

    function setDate(uint _year, uint _month, uint _day) public;
    
}