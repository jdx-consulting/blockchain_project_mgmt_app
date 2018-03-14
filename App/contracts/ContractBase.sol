pragma solidity ^0.4.17;

import "./IContract.sol";

contract ContractBase is IContract {
    bytes32 internal VERSION = "1.0.0";

    function ContractBase(bytes32 _version) public {
        VERSION = _version;
    }

    function contractVersion() public view returns (bytes32) {
        return VERSION;
    }
}