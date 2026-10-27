// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "../../lib/forge-std/src/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNFT} from "../../src/BasicNFT.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNFT public basicNft;
    address public user = makeAddr("user");
    string public constant PUG =
        "ipfs://QmYtXg6r1Z7x5Z1x1Z1x1Z1x1Z1x1Z1x1Z1x1Z1x1Z1x1Z1x1Z1x";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.deployBasicNft();
    }
    function testNameIsCorrect() public view {
        string memory expectedName = "BasicNFT";
        string memory actualName = basicNft.name();

        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(user);
        basicNft.mintNft(PUG);
        assertEq(basicNft.balanceOf(user), 1);
        assertEq(
            keccak256(abi.encodePacked(basicNft.tokenURI(0))),
            keccak256(abi.encodePacked(PUG))
        );
    }
}
