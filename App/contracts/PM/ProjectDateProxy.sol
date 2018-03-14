pragma solidity ^0.4.17;

import "./IProjectDate.sol";
import "./ProjectDate.sol";

contract ProjectDateProxy is IProjectDate {
    IProjectDate pd;

    function setTargetAddress(address targetContract) public {
        pd = ProjectDate(targetContract);
    }

    function setDate(uint year, uint month, uint day) public {
        pd.setDate(year, month, day);
    }
}