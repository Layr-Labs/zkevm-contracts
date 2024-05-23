// SPDX-License-Identifier: AGPL-3.0

import "../../interfaces/IDataAvailabilityProtocol.sol";

pragma solidity 0.8.20;

contract EigenDA is IDataAvailabilityProtocol {

    // Protocol identifier; read via sequencer to determine which DA to use
    string internal constant _PROTOCOL_NAME = "EigenDA";


    function getProcotolName() external view returns (string memory) {
        return _PROTOCOL_NAME;
    }

    function verifyMessage(
        bytes32 hash,
        bytes calldata dataAvailabilityMessage
    ) external view {
        // As of now we do nothing when this function is called by the ValidiumEtrog consensus contract
        // when canonicalizing a batch commitment from the sequencesender. For M1 integration, we will need to add logic to
        // verify the commitment and revert if it is invalid when verified against the EigenDA blob verification contract.
        // This would also mean that da Messages could only be canonicalized when the merkle batch commitment associated with the respective
        // blob is submitted to the L1 network.
        return;
    }
}