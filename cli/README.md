# CLI (Command Line Interface)

## Overview

The `cli` crate provides the main command-line interface for interacting with the Solana blockchain. It includes commands for wallet management, transaction submission, account queries, program deployment, and various administrative tasks.

## Purpose

- **Wallet Management**: Create, manage, and interact with wallets
- **Transaction Submission**: Send transactions to the blockchain
- **Account Management**: Query and manage accounts
- **Program Deployment**: Deploy and manage programs
- **Stake Management**: Manage staking operations
- **Vote Management**: Manage voting operations
- **Cluster Operations**: Query cluster information
- **Administrative Tasks**: Various administrative operations

## Structure

```
src/
├── main.rs                          # Main CLI entry point
├── lib.rs                           # Library interface
├── cli.rs                           # Main CLI implementation
├── clap_app.rs                      # CLI argument parsing
├── wallet.rs                        # Wallet management commands
├── stake.rs                         # Stake management commands
├── vote.rs                          # Vote management commands
├── program.rs                       # Program deployment commands
├── program_v4.rs                    # Program v4 deployment commands
├── cluster_query.rs                 # Cluster query commands
├── validator_info.rs                # Validator information commands
├── nonce.rs                         # Nonce management commands
├── feature.rs                       # Feature management commands
├── address_lookup_table.rs          # Address lookup table commands
├── compute_budget.rs                # Compute budget commands
├── inflation.rs                     # Inflation commands
├── checks.rs                        # Validation checks
├── spend_utils.rs                   # Spending utilities
├── test_utils.rs                    # Testing utilities
└── memo.rs                          # Memo commands
```

## Key Components

### Main CLI (`cli.rs`)
- **Command Processing**: Process all CLI commands
- **Argument Parsing**: Parse command line arguments
- **Command Routing**: Route commands to appropriate handlers
- **Error Handling**: Handle CLI errors and display messages

### Wallet Management (`wallet.rs`)
- **Wallet Creation**: Create new wallets
- **Key Management**: Manage public/private keys
- **Balance Queries**: Query account balances
- **Transaction Signing**: Sign transactions
- **Address Generation**: Generate addresses

### Stake Management (`stake.rs`)
- **Stake Creation**: Create stake accounts
- **Stake Delegation**: Delegate stake to validators
- **Stake Withdrawal**: Withdraw stake
- **Stake Activation**: Activate stake
- **Stake Deactivation**: Deactivate stake

### Vote Management (`vote.rs`)
- **Vote Account Creation**: Create vote accounts
- **Vote Delegation**: Delegate votes
- **Vote Withdrawal**: Withdraw votes
- **Vote Account Management**: Manage vote accounts

### Program Management (`program.rs`, `program_v4.rs`)
- **Program Deployment**: Deploy programs to the blockchain
- **Program Upgrade**: Upgrade existing programs
- **Program Query**: Query program information
- **Program Authority**: Manage program authorities

### Cluster Operations (`cluster_query.rs`)
- **Cluster Information**: Query cluster information
- **Validator Information**: Query validator information
- **Slot Information**: Query slot information
- **Block Information**: Query block information

## Features

### Wallet Features
- **Multiple Key Types**: Support for various key types
- **Key Derivation**: BIP32/BIP44 key derivation
- **Hardware Wallet Support**: Support for hardware wallets
- **Multi-signature**: Multi-signature wallet support
- **Backup and Recovery**: Wallet backup and recovery

### Transaction Features
- **Transaction Creation**: Create various transaction types
- **Transaction Signing**: Sign transactions
- **Transaction Submission**: Submit transactions
- **Transaction Confirmation**: Confirm transactions
- **Transaction History**: View transaction history

### Account Features
- **Account Creation**: Create new accounts
- **Account Queries**: Query account information
- **Account Updates**: Update account information
- **Account Monitoring**: Monitor account changes

### Program Features
- **Program Deployment**: Deploy programs
- **Program Upgrade**: Upgrade programs
- **Program Query**: Query program information
- **Program Authority**: Manage program authorities

### Administrative Features
- **Feature Management**: Enable/disable features
- **Cluster Management**: Manage cluster operations
- **Validator Management**: Manage validator operations
- **System Administration**: System administrative tasks

## Dependencies

### Internal Dependencies
- `solana-client`: Client library
- `solana-rpc-client`: RPC client
- `solana-transaction`: Transaction processing
- `solana-account`: Account management
- `solana-pubkey`: Public key handling
- `solana-signature`: Signature verification
- `solana-program`: Program interface

### External Dependencies
- `clap`: Command line argument parsing
- `tokio`: Asynchronous runtime
- `serde`: Serialization/deserialization
- `thiserror`: Error handling
- `anyhow`: Error handling

## Usage

### Basic Commands

```bash
# Create a new wallet
solana-keygen new

# Check balance
solana balance

# Send SOL
solana transfer <RECIPIENT> <AMOUNT>

# Deploy a program
solana program deploy <PROGRAM_FILE>

# Create a stake account
solana create-stake-account <STAKE_ACCOUNT> <AMOUNT>

# Delegate stake
solana delegate-stake <STAKE_ACCOUNT> <VOTE_ACCOUNT>

# Query cluster information
solana cluster-version
```

### Advanced Commands

```bash
# Create a vote account
solana create-vote-account <VOTE_ACCOUNT> <IDENTITY_ACCOUNT>

# Withdraw stake
solana withdraw-stake <STAKE_ACCOUNT> <RECIPIENT> <AMOUNT>

# Upgrade a program
solana program upgrade <PROGRAM_ID> <PROGRAM_FILE>

# Enable a feature
solana feature enable <FEATURE_ID>

# Query validator information
solana validators
```

## Command Categories

### Wallet Commands
- `solana-keygen`: Key generation and management
- `solana balance`: Check account balance
- `solana transfer`: Send SOL
- `solana airdrop`: Request airdrop

### Stake Commands
- `solana create-stake-account`: Create stake account
- `solana delegate-stake`: Delegate stake
- `solana withdraw-stake`: Withdraw stake
- `solana stake-account`: Query stake account

### Vote Commands
- `solana create-vote-account`: Create vote account
- `solana withdraw-from-vote-account`: Withdraw from vote account
- `solana vote-account`: Query vote account

### Program Commands
- `solana program deploy`: Deploy program
- `solana program upgrade`: Upgrade program
- `solana program show`: Show program information
- `solana program set-upgrade-authority`: Set upgrade authority

### Cluster Commands
- `solana cluster-version`: Show cluster version
- `solana validators`: Show validators
- `solana slot`: Show current slot
- `solana block`: Show block information

### Administrative Commands
- `solana feature`: Feature management
- `solana inflation`: Inflation information
- `solana nonce`: Nonce management
- `solana address-lookup-table`: Address lookup table management

## Error Handling

### Common Errors
- **Insufficient Funds**: Not enough SOL for transaction
- **Invalid Signature**: Transaction signature verification failed
- **Account Not Found**: Account does not exist
- **Program Error**: Program execution failed
- **Network Error**: Network connectivity issues

### Error Recovery
- **Retry Logic**: Automatic retry for transient errors
- **Error Messages**: Clear error messages with suggestions
- **Debug Information**: Detailed debug information
- **Help Commands**: Help commands for troubleshooting

## Security Considerations

### Key Management
- **Secure Storage**: Secure storage of private keys
- **Key Derivation**: Secure key derivation
- **Hardware Support**: Hardware wallet support
- **Multi-signature**: Multi-signature support

### Transaction Security
- **Signature Verification**: Verify all signatures
- **Transaction Validation**: Validate transactions
- **Fee Calculation**: Proper fee calculation
- **Resource Limits**: Enforce resource limits

### Network Security
- **Secure Connections**: Secure network connections
- **Message Validation**: Validate network messages
- **Rate Limiting**: Rate limiting for requests
- **Error Handling**: Secure error handling

## Testing

The crate includes comprehensive tests for:
- Command parsing and execution
- Wallet operations
- Transaction processing
- Program deployment
- Error handling
- Integration testing

## Related Components

- **client**: Client library
- **rpc-client**: RPC client
- **validator**: Validator implementation
- **test-validator**: Testing validator
- **program-test**: Program testing 