pragma solidity ^0.4.17;

interface IContract {
    function contractVersion() public view returns (bytes32);
}