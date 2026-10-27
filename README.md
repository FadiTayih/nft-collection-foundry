# NFT Collection — Foundry

Dual ERC-721 project built with Foundry and OpenZeppelin v5.

- **BasicNFT** — standard ERC-721 with per-token URI supplied at mint time.
- **MoodNFT** — dynamic ERC-721 with fully on-chain base64 SVG artwork.
  Token owners can flip between HAPPY and SAD moods; `tokenURI` returns a
  `data:application/json;base64,…` URI embedding the correct SVG.

## Stack

Solidity `^0.8.18` · Foundry · OpenZeppelin v5 · forge-std · foundry-devops

## Structure

src/ BasicNFT.sol, MoodNft.sol
script/ DeployBasicNft.s.sol, DeployMoodNft.s.sol, MintBasicNft.s.sol
test/ Integration/, Unit/
img/ sad.svg, happy.svg

## Setup

```bash
forge install
forge build
forge test

```
