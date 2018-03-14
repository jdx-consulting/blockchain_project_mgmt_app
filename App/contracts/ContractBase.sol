pragma solidity ^0.4.17;

import "./IContract.sol";

contract ContractBase is IContract {
    bytes32 internal VERSION = "1.0.0";

    function contractVersion() public view returns (bytes32);
}