// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    // Instância do contrato BasicNft com tipo BasicNft
    BasicNft public basicNft;
    // Instância do contrato DeployBasicNft com tipo DeployBasicNft
    DeployBasicNft public deployer;
    // Criando um user
    address public USER = makeAddr("user");
    // PUG URI
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    // Função de configuração executada antes dos testes
    function setUp() public {
        deployer = new DeployBasicNft(); // Cria uma nova instância do contrato DeployBasicNft
        basicNft = deployer.run(); // Implanta o contrato BasicNft e obtém sua instância basicNft
    }

    // Teste para verificar se o nome do token está correto
    function testTheTokenNameIsCorrect() public view {
        /// @dev Para testar se uma string é igual a outra string precisamos convertê-las para bytes e depois para bytes32 e depois para hash
        string memory expectedName = "BasicNft";
        string memory actualName = basicNft.name();

        // Compara os hashes das strings para verificar se são iguais
        assertEq(
            keccak256(abi.encodePacked(expectedName)),
            keccak256(abi.encodePacked(actualName))
        );
    }

    // Teste se pode mintar um NFT e verificar a contagem de saldo
    function testCanMintAndHaveABalance() public {
        vm.prank(USER); // Simula a chamada da função como se fosse o USER

        basicNft.mintNft(PUG_URI); // Mint um novo NFT passando URI

        assertEq(basicNft.balanceOf(USER), 1); // Verifica se o saldo do remetente (msg.sender) é 1 após o mint

        // Verifica se o tokenURI do token ID 0 é igual ao PUG_URI
        assertEq(
            keccak256(abi.encodePacked(basicNft.tokenURI(0))),
            keccak256(abi.encodePacked(PUG_URI))
        );
    }
}
