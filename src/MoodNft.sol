// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    uint256 private s_tokenCounter;
    string private s_sadSvgImageUri;
    string private s_happySvgImageUri;

    enum Mood {
        HAPPY,
        SAD
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(
        string memory sadSvgImageUri,
        string memory happySvgImageUri
    ) ERC721("MoodNft", "MOOD") {
        s_tokenCounter = 0;
        s_sadSvgImageUri = sadSvgImageUri;
        s_happySvgImageUri = happySvgImageUri;
    }

    // Função para mintar um novo NFT
    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);

        // s_tokenIdToMood = o mapping
        // [s_tokenCounter] = a chave (key) do mapping (tipo uint256)
        // Mood.HAPPY = o valor (value) do mapping (tipo Mood)
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    // GET - Retorna o URI do token pegando pelo tokenId
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory imageURI;
        // Se o token Id estiver com humor HAPPY
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            imageURI = s_happySvgImageUri;
        } else {
            imageURI = s_sadSvgImageUri; // Se não, o humor é SAD
        }

        return
            string( // Transformamos o objeto em string
                abi.encodePacked(
                    _baseURI(),
                    // Retorna o JSON completo do tokenURI codificado em base64
                    Base64.encode(
                        // Retorna o JSON codificado em bytes
                        bytes(
                            abi.encodePacked( // transformamos em um objeto bytes
                                '{"name": "',
                                name(),
                                '", description: "An NFT that reflects your mood!", "attributes": [{"trait_type": "Mood", "value": 100}], "image": ',
                                imageURI,
                                '"}'
                                // {"name": "Mood NFT"}
                            )
                        )
                    )
                )
            );
    }
}
