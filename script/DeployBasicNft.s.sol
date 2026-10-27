// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract DeployBasicNft is Script {
    string public constant PUG =
        "ipfs://QmYtXg6r1Z7x5Z1x1Z1x1Z1x1Z1x1Z1x1Z1x1Z1x1Z1x1Z1x1Z1x";
    function run() external {
        deployBasicNft();
    }

    function deployBasicNft() public returns (BasicNFT) {
        vm.startBroadcast();
        BasicNFT nft = new BasicNFT();
        vm.stopBroadcast();
        return nft;
    }
}
