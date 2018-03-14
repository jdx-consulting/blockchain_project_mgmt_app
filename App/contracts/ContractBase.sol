pragma solidity ^0.4.17;

import "./IContract.sol";
import "./ContractManager.sol";

contract ContractBase is IContract {
    bytes32 internal VERSION = "1.0.0";
    ContractManager internal contractManager;
    
    function ContractBase(bytes32 _version, address _contractManagerAddr) public {
        VERSION = _version;
        contractManager = ContractManager(_contractManagerAddr);
    }

    function contractVersion() public view returns (bytes32) {
        return VERSION;
    }

    


}