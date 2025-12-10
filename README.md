```markdown
# 🎭 Mood NFT Collection

Mood NFT Collection é um projeto de smart contract desenvolvido como uma coleção simples de NFTs que representam diferentes “moods” (estados de humor).  
O objetivo é demonstrar, de forma direta, o fluxo completo de criação, mintagem e estruturação de uma coleção NFT utilizando Solidity e Foundry.

---

## 🚀 Tecnologias Utilizadas
- **Solidity** – Desenvolvimento do smart contract ERC-721  
- **Foundry (Forge/Anvil)** – Testes, simulação e ambiente de desenvolvimento  
- **Scripts de Deploy** – Automação de implantação e interação  
- **Assets Locais** – Imagens armazenadas no diretório `/images`  

---

## 🔧 Funcionalidades Principais
- **Mintagem de NFTs** baseada em moods pré-definidos  
- **Estrutura simples para criação de coleções temáticas**  
- **Testes automatizados com Foundry** garantindo comportamento previsível  
- **Scripts de deploy e interação prontos para uso**  
- **Organização clara para expansão futura (metadata, IPFS, traits, etc.)**

---

## 📂 Estrutura do Projeto
mood-nft-collection/
├── images/        # Assets da coleção
├── src/           # Smart contract principal
├── script/        # Scripts de deploy e execução
├── test/          # Testes automatizados (Foundry)
├── lib/           # Dependências externas
└── README.md

---

## 🧪 Como Executar Localmente

### 1. Instale o Foundry
Siga as instruções oficiais:
https://book.getfoundry.sh/getting-started/installation

### 2. Clone o repositório
```bash
git clone https://github.com/gabrielfst30/mood-nft-collection
cd mood-nft-collection
````

### 3. Compile os contratos

```bash
forge build
```

### 4. Execute os testes

```bash
forge test
```

### 5. Faça o deploy (opcional)

Ajuste o script em `script/` e execute:

```bash
forge script script/MoodNft.s.sol --rpc-url <RPC_URL> --private-key <KEY> --broadcast
```

---

## 🧑‍💻 Sobre o Projeto

Este projeto foi criado como estudo prático para desenvolvimento de coleções NFT utilizando Foundry, servindo como base para coleções maiores, proof-of-concepts e integrações com dApps Web3.
