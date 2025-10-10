// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter; // Contador de tokens emitidos
    mapping(uint256 => string) private s_tokenIdToUri; // Mapeamento do ID do token para seu URI

    // Construtor do contrato, define o nome e símbolo do token
    constructor() ERC721("BasicNft", "BNFT") {
        s_tokenCounter = 0; // Inicializa o contador de tokens com zero
    }

    // Função para mintar um novo NFT
    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri; // Associa o tokenUri ao s_tokenIdToUri e s_tokenCounter
        _safeMint(msg.sender, s_tokenCounter); // Mint o token para o remetente
        s_tokenCounter++; // Incrementa o contador de tokens
    }

    // GET - Retorna o URI do token pegando pelo tokenId
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId]; // Retorna o URI associado ao tokenId
    }
}
