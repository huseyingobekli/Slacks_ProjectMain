Project Name: SLACKS_PROJECT1 – Online Course Marketplace
Project Description: A decentralized application where users can purchase educational courses using STX tokens on the Stacks blockchain.


Technologies Used:

Stacks Blockchain

Clarity Smart Contracts

Next.js/React

Tailwind CSS

Stacks.js

Hiro/Xverse Wallet Integration

Key Features:

Course Creation: Admins can add new online courses with pricing and details

STX Payments: Users can purchase courses using STX

Course Access Control: Tracks which users own which courses

Secure Ownership: Immutable record of course purchases

Wallet Authentication: Login and interact via Stacks wallets

Smart Contracts:

marketplace.clar: Handles course creation, purchase, and ownership verification

Frontend: (Next.js)

Wallet Connect: Connect Hiro or Xverse wallet to authenticate users

Course Listing: Display available courses from the smart contract

Purchase Flow: Simple STX transaction flow to buy access

Dashboard: View purchased courses and course details

How to Run:

Clone the repo: git clone https://github.com/myusername/slacks-project1

Install dependencies: npm install

Start Clarinet devnet: clarinet devnet start

Run tests: clarinet test

Start frontend: cd frontend && npm install && npm run dev

Deployment:

Deploy to Testnet using: clarinet publish marketplace --network testnet

After deploy, update contract address in frontend config.

Testnet Contract Address: To be added after deployment

License: MIT

