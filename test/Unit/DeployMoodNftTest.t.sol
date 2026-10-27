// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "../../lib/forge-std/src/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;
    MoodNft public moodNft;

    function setUp() public {
        deployer = new DeployMoodNft();
        moodNft = deployer.deployMoodNft();
    }

    function testCanDeployMoodNft() public view {
        assert(address(moodNft) != address(0));
    }

    function testConvertSvgToImageURI() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMiAzMiI+PHBhdGggZD0iTTI4IDE2YzAgNi42MjUtNS4zNzUgMTItMTIgMTJzLTEyLTUuMzc1LTEyLTEyIDUuMzc1LTEyIDEyLTEyIDEyIDUuMzc1IDEyIDEyeiBtLTguNjI1IDYuNjI1YzAgMS4xNTYtLjk0NCAyLjEyNS0yLjEyNSAyLjEyNXMtMi4xMjUtLjk0NC0yLjEyNS0yLjEyNS45NDQtMi4xMjUgMi4xMjUtMi4xMjUgMi4xMjUuOTQ0IDIuMTI1IDIuMTI1eiBtLTcuNS0yLjU3NWMxLjE1NiAwIDIuMTI1LS45NDQgMi4xMjUtMi4xMjVzLS45NDQtMi4xMjUtMi4xMjUtMi4xMjUtMi4xMjUuOTQ0LTIuMTI1IDIuMTI1Ljk0NCAyLjEyNSAyLjEyNSAyLjEyNXogbS03Ljg3NSA2LjA3NWMxLjMwNiAwIDIuNDc1LTEuMDc1IDIuNDc1LTIuNDc1cy0xLjA3NS0yLjQ3NS0yLjQ3NS0yLjQ3NWMtLjI3NS4yNzUtLjI3NS43MjUtLjI3NS43MjVzLS4yNzUuNzI1LjI3NS43MjVjMSAuMjc1LjcyNS43MjUuNzI1LjcyNXMtLjI3NS43MjUtLjcyNS43MjVjLS4yNzUuMjc1LS4yNzUuNzI1LS4yNzUuNzI1cy0uMjc1LjcyNS4yNzUuNzI1YzEgLjI3NS43MjUuNzI1LjcyNS43MjVzLS4yNzUuNzI1LS43MjUuNzI1Yy0uMjc1LjI3NS0uMjc1LjcyNS0uMjc1LjcyNXMtLjI3NS43MjUuMjc1LjcyNWMxIC4yNzUuNzI1LjcyNS43MjUuNzI1cy0uMjc1LjcyNS0uNzI1LjcyNWMtLjI3NSIgZmlsbD0iIzAwMCIvPjwvc3ZnPg==";
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path d="M28 16c0 6.625-5.375 12-12 12s-12-5.375-12-12 5.375-12 12-12 12 5.375 12 12z m-8.625 6.625c0 1.156-.944 2.125-2.125 2.125s-2.125-.944-2.125-2.125.944-2.125 2.125-2.125 2.125.944 2.125 2.125z m-7.5-2.575c1.156 0 2.125-.944 2.125-2.125s-.944-2.125-2.125-2.125-2.125.944-2.125 2.125.944 2.125 2.125 2.125z m-7.875 6.075c1.306 0 2.475-1.075 2.475-2.475s-1.075-2.475-2.475-2.475c-.275.275-.275.725-.275.725s-.275.725.275.725c1 .275.725.725.725.725s-.275.725-.725.725c-.275.275-.275.725-.275.725s-.275.725.275.725c1 .275.725.725.725.725s-.275.725-.725.725c-.275.275-.275.725-.275.725s-.275.725.275.725c1 .275.725.725.725.725s-.275.725-.725.725c-.275" fill="#000"/></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(expectedUri)) ==
                keccak256(abi.encodePacked(actualUri))
        );
    }
}
