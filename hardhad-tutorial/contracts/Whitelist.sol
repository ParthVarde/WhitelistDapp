//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    modifier addressAlreadyPresent() {
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted!"
        );
        _;
    }

    function addAddressToWhitelist() public addressAlreadyPresent {
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More address can't be added, limit reached"
        );
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
