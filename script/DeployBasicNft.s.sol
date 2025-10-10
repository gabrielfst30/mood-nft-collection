// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract DeployBasicNft is Script {
    function run() external returns (BasicNft) {
        vm.startBroadcast();
        // Deploy do contrato BasicNft
        BasicNft basicNft = new BasicNft();
        vm.stopBroadcast();
        // Retorna a instância do contrato implantado
        return basicNft;
    }
}
