# 🏦 Time-Locked Piggy Bank

A smart contract that allows users to deposit ETH into a virtual piggy bank and lock it for a specified period. Withdrawals are only allowed after the time lock expires. If a user attempts to withdraw early, a penalty is applied.

---

## 📌 What is this project?

The **Time-Locked Piggy Bank** is a Solidity smart contract that emulates a personal savings mechanism:

- Users **deposit ETH** into the contract and choose a **lock duration** (in seconds).
- Funds are **locked until the specified time** has passed.
- If withdrawn **after the unlock time**, users get back **100% of their funds**.
- If withdrawn **before the unlock time**, a **20% penalty** is applied.

---

## 💡 Why this project?

This project demonstrates:

- The concept of **time-based locking** using `block.timestamp`.
- Implementing **financial discipline mechanics** via smart contracts.
- Solidity skills like:
  - Structs
  - Mappings
  - Payable functions
  - Timestamp-based logic
- Using **Foundry** for:
  - Local blockchain testing
  - Scripting and deployment
  - Unit testing with `forge-std`

---

## 🛠 Tech Stack

- **Solidity** `^0.8.24`
- **Foundry** (`forge`, `cast`, `anvil`)
- **EVM local testing** with Anvil

---

## 🚀 Getting Started

### 1️⃣ Install Foundry

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

---

### 2️⃣ Clone the Repo & Install

```bash
git clone <repo_url>
cd TimeLockedPiggyBank
forge install
```

---

### 3️⃣ Build the Contracts

```bash
forge build
```

---

### 4️⃣ Run Tests

```bash
forge test -vv
```

---

### 5️⃣ Deploy Locally (with Anvil)

#### Start local blockchain:

```bash
anvil
```

#### In a new terminal, deploy:

```bash
forge script script/PiggyBankDeploy.s.sol   --rpc-url http://127.0.0.1:8545   --broadcast   --private-key <your_private_key>
```

Replace `<your_private_key>` with one of the keys from the `anvil` terminal output.

---

## 📂 Project Structure

```
TimeLockedPiggyBank/
├── src/
│   └── PiggyBank.sol              # Smart contract
├── test/
│   └── PiggyBank.t.sol            # Foundry test suite
├── script/
│   └── PiggyBankDeploy.s.sol      # Deployment script
├── foundry.toml                   # Foundry config
└── README.md                      # Project documentation
```

---

## 🧪 Key Contract Functions

| Function                        | Description                                             |
| ------------------------------- | ------------------------------------------------------- |
| `deposit(uint)`                 | Deposit ETH and lock it for `n` seconds.                |
| `withdraw()`                    | Withdraw full amount (if unlocked) or with 20% penalty. |
| `getRemainingLockTime(address)` | View time left until funds are unlocked.                |

---

## ✅ Example Use Case

Imagine a user who wants to save money for a future goal and avoid early spending. They deposit 1 ETH into the contract for 30 days. If they try to withdraw it early, they lose 20% — providing a financial incentive to wait.

---

## 🔒 License

MIT

---

## 👨‍💻 Author

Mrinal Singh | Built during #200DaysOfCode | Day 126
