// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {MoodNft} from "../src/MoodNft.sol";
import {Script, console} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("./images/sad.svg");
        string memory happySvg = vm.readFile("./images/happy.svg");

        // Deploy the MoodNft contract
        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(
            svgToImageUri(sadSvg),
            svgToImageUri(happySvg)
        );
        vm.stopBroadcast();

        return moodNft;
    }

    function svgToImageUri(
        string memory svg
    ) public pure returns (string memory) {
        // Prefix for data URI
        string memory baseURL = "data:image/svg+xml;base64,";
        // Encode SVG to Base64
        // string --> bytes --> base64 string
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );

        // Concatenate baseURL and encoded SVG
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}
