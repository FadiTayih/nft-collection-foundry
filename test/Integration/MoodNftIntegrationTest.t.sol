// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "../../lib/forge-std/src/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract MoodNftTest is Test {
    MoodNft moodNft;
    string public constant HAPPY_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMiAzMiI+PHBhdGggZD0iTTI4IDE2YzAgNi42MjUtNS4zNzUgMTItMTIgMTJzLTEyLTUuMzc1LTEyLTEyIDUuMzc1LTEyIDEyLTEyIDEyIDUuMzc1IDEyIDEyeiBtLTguNjI1IDYuNjI1YzAgMS4xNTYtLjk0NCAyLjEyNS0yLjEyNSAyczIuMTI1LS45NDQgMi4xMjUtMi4xMjVzLS45NDQtMi4xMjUtMi4xMjUtMi4xMjV6IG0tNy41LTIuNTc1YzEuMTU2IDAgMi4xMjUtLjk0NCAyLjEyNS0yLjEyNXMtLjk0NC0yLjEyNS0yLjEyNS0yLjEyNXMtMi4xMjUgLjk0NC0yLjEyNSAyLjEyNXMuOTQ0IDIuMTI1IDIuMTI1IDIuMTI1eiBtLTcuODc1IDYuMDc1YzEuMzA2IDAgMi40NzUtMS4wNzUgMi40NzUtMi40NzVzLTEuMDc1LTIuNDc1LTIuNDc1LTIuNDc1cy0yLjQ3NSAxLjA3NS0yLjQ3NSAyLjQ3NSAxLjA3NSAyLjQ3NSAyLjQ3NSAyLjQ3NXoiIGZpbGw9IiMwMDAiLz48L3N2Zz4=";

    string public constant SAD_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMiAzMiI+PHBhdGggZD0iTTI4IDE2YzAgNi42MjUtNS4zNzUgMTItMTIgMTJzLTEyLTUuMzc1LTEyLTEyIDUuMzc1LTEyIDEyLTEyIDEyIDUuMzc1IDEyIDEyeiBtLTguNjI1IDYuNjI1YzAgMS4xNTYtLjk0NCAyLjEyNS0yLjEyNSAyczIuMTI1LS45NDQgMi4xMjUtMi4xMjVzLS45NDQtMi4xMjUtMi4xMjUtMi4xMjV6IG0tNy41LTIuNTc1YzEuMTU2IDAgMi4xMjUtLjk0NCAyLjEyNS0yLjEyNXMtLjk0NC0yLjEyNS0yLjEyNS0yLjEyNXMtMi4xMjUgLjk0NC0yLjEyNSAyLjEyNXMuOTQ0IDIuMTI1IDIuMTI1IDIuMTI1eiBtLTcuODc1IDYuMDc1YzEuMzA2IDAgMi40NzUtMS4wNzUgMi40NzUtMi40NzVzLTEuMDc1LTIuNDc1LTIuNDc1LTIuNDc1cy0yLjQ3NSAxLjA3NS0yLjQ3NSAyLjQ3NSAxLjA3NSAyLjQ3NSAyLjQ3NSAyLjQ3NXoiIGZpbGw9IiMwMDAiLz48L3N2Zz4=";

    address public user = makeAddr("user");
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testViewTokenURIIntegration() public {
        vm.prank(user);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

    function testFlipTokenToSad() public {
        vm.prank(user);
        moodNft.mintNft();
        assertEq(moodNft.getMood(0), true);
        vm.prank(user);
        moodNft.flipMood(0);
        assertEq(moodNft.getMood(0), false);
    }
}
