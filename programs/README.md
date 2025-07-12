# Native Programs

## Overview

The `programs` folder contains all the native programs that are built into the Solana blockchain. These programs provide the fundamental functionality for account management, staking, voting, and other core blockchain operations.

## Purpose

- **System Operations**: Core system operations like account creation and transfers
- **Stake Management**: Stake account creation, delegation, and management
- **Vote Management**: Vote account creation and management
- **Program Loading**: BPF program loading and management
- **Compute Budget**: Compute budget management
- **Zero-Knowledge**: Zero-knowledge proof programs

## Structure

```
programs/
├── system/                          # System program
├── stake/                           # Stake program
├── vote/                            # Vote program
├── bpf_loader/                      # BPF loader program
├── loader-v4/                       # Loader v4 program
├── compute-budget/                  # Compute budget program
├── zk-token-proof/                  # ZK token proof program
├── zk-elgamal-proof/                # ZK ElGamal proof program
├── bpf-loader-tests/                # BPF loader tests
├── stake-tests/                     # Stake program tests
├── zk-elgamal-proof-tests/          # ZK ElGamal proof tests
├── ed25519-tests/                   # Ed25519 tests
└── compute-budget-bench/            # Compute budget benchmarks
```

## Native Programs

### System Program (`system/`)

The System Program is the most fundamental program in Solana, responsible for basic account operations.

#### Purpose
- **Account Creation**: Create new accounts
- **Account Transfers**: Transfer SOL between accounts
- **Account Assignment**: Assign accounts to programs
- **Account Space Allocation**: Allocate space for accounts

#### Key Instructions
- `CreateAccount`: Create a new account
- `Assign`: Assign an account to a program
- `Transfer`: Transfer SOL between accounts
- `CreateAccountWithSeed`: Create account with seed
- `AdvanceNonceAccount`: Advance nonce account
- `WithdrawNonceAccount`: Withdraw from nonce account
- `InitializeNonceAccount`: Initialize nonce account
- `AuthorizeNonceAccount`: Authorize nonce account
- `Allocate`: Allocate space in an account
- `AllocateWithSeed`: Allocate space with seed

#### Structure
```
src/
├── lib.rs                           # Program entry point
├── system_instruction.rs            # Instruction definitions
└── system_processor.rs              # Instruction processing
```

### Stake Program (`stake/`)

The Stake Program manages staking operations, including stake account creation, delegation, and withdrawal.

#### Purpose
- **Stake Account Creation**: Create stake accounts
- **Stake Delegation**: Delegate stake to validators
- **Stake Withdrawal**: Withdraw stake from accounts
- **Stake Activation**: Activate stake
- **Stake Deactivation**: Deactivate stake

#### Key Instructions
- `Initialize`: Initialize a stake account
- `Authorize`: Authorize stake operations
- `DelegateStake`: Delegate stake to a validator
- `Split`: Split stake account
- `Withdraw`: Withdraw stake
- `Deactivate`: Deactivate stake
- `SetLockup`: Set lockup conditions
- `Merge`: Merge stake accounts

#### Structure
```
src/
├── lib.rs                           # Program entry point
├── stake_instruction.rs             # Instruction definitions
└── stake_processor.rs               # Instruction processing
```

### Vote Program (`vote/`)

The Vote Program manages vote accounts for validators.

#### Purpose
- **Vote Account Creation**: Create vote accounts
- **Vote Submission**: Submit votes for blocks
- **Vote Account Management**: Manage vote account authorities
- **Vote Withdrawal**: Withdraw from vote accounts

#### Key Instructions
- `InitializeAccount`: Initialize vote account
- `Authorize`: Authorize vote operations
- `Vote`: Submit a vote
- `Withdraw`: Withdraw from vote account
- `UpdateValidatorIdentity`: Update validator identity
- `UpdateCommission`: Update commission
- `VoteSwitch`: Switch vote
- `AuthorizeChecked`: Authorize with checks

#### Structure
```
src/
├── lib.rs                           # Program entry point
├── vote_instruction.rs              # Instruction definitions
└── vote_processor.rs                # Instruction processing
```

### BPF Loader Program (`bpf_loader/`)

The BPF Loader Program is responsible for loading and managing BPF programs.

#### Purpose
- **Program Deployment**: Deploy BPF programs
- **Program Upgrade**: Upgrade existing programs
- **Program Authority**: Manage program authorities
- **Program Loading**: Load programs into memory

#### Key Instructions
- `Write`: Write program data
- `Finalize`: Finalize program deployment
- `DeployWithMaxDataLen`: Deploy with max data length
- `Upgrade`: Upgrade program
- `SetAuthority`: Set program authority
- `Close`: Close program account

#### Structure
```
src/
├── lib.rs                           # Program entry point
├── loader_instruction.rs            # Instruction definitions
└── loader_processor.rs              # Instruction processing
```

### Loader v4 Program (`loader-v4/`)

The Loader v4 Program is the next-generation program loader with enhanced features.

#### Purpose
- **Enhanced Loading**: Enhanced program loading capabilities
- **Program Management**: Advanced program management
- **Security Features**: Enhanced security features
- **Performance**: Improved performance

#### Key Instructions
- `Write`: Write program data
- `Finalize`: Finalize program deployment
- `DeployWithMaxDataLen`: Deploy with max data length
- `Upgrade`: Upgrade program
- `SetAuthority`: Set program authority
- `Close`: Close program account

### Compute Budget Program (`compute-budget/`)

The Compute Budget Program manages compute budget allocation for transactions.

#### Purpose
- **Compute Budget**: Set compute budget for transactions
- **Priority Fees**: Set priority fees
- `SetComputeUnitLimit`: Set compute unit limit
- `SetComputeUnitPrice`: Set compute unit price
- `SetLoadedAccountsDataSizeLimit`: Set loaded accounts data size limit

#### Key Instructions
- `SetComputeUnitLimit`: Set compute unit limit
- `SetComputeUnitPrice`: Set compute unit price
- `SetLoadedAccountsDataSizeLimit`: Set loaded accounts data size limit

### Zero-Knowledge Programs

#### ZK Token Proof Program (`zk-token-proof/`)

The ZK Token Proof Program provides zero-knowledge proof functionality for confidential tokens.

#### Purpose
- **Confidential Transfers**: Enable confidential token transfers
- **Zero-Knowledge Proofs**: Generate and verify zero-knowledge proofs
- **Privacy**: Provide privacy for token operations

#### Key Instructions
- `VerifyConfidentialCredits`: Verify confidential credits
- `VerifyConfidentialDebits`: Verify confidential debits
- `VerifyTransfer`: Verify transfer proofs

#### ZK ElGamal Proof Program (`zk-elgamal-proof/`)

The ZK ElGamal Proof Program provides zero-knowledge proof functionality for ElGamal encryption.

#### Purpose
- **ElGamal Encryption**: Support ElGamal encryption operations
- **Zero-Knowledge Proofs**: Generate and verify ElGamal proofs
- **Cryptographic Operations**: Advanced cryptographic operations

## Program Architecture

### Common Structure

All native programs follow a similar structure:

```
src/
├── lib.rs                           # Program entry point
├── *_instruction.rs                 # Instruction definitions
└── *_processor.rs                   # Instruction processing
```

### Entry Point (`lib.rs`)

```rust
use solana_program::{
    account_info::AccountInfo,
    entrypoint,
    entrypoint::ProgramResult,
    pubkey::Pubkey,
};

entrypoint!(process_instruction);

fn process_instruction(
    program_id: &Pubkey,
    accounts: &[AccountInfo],
    instruction_data: &[u8],
) -> ProgramResult {
    // Process instruction
}
```

### Instruction Definitions (`*_instruction.rs`)

```rust
use solana_program::instruction::Instruction;

pub enum SystemInstruction {
    CreateAccount { lamports: u64, space: u64, owner: Pubkey },
    Assign { owner: Pubkey },
    Transfer { lamports: u64 },
    // ... other instructions
}
```

### Instruction Processing (`*_processor.rs`)

```rust
pub fn process_instruction(
    program_id: &Pubkey,
    accounts: &[AccountInfo],
    instruction: SystemInstruction,
) -> ProgramResult {
    match instruction {
        SystemInstruction::CreateAccount { lamports, space, owner } => {
            process_create_account(program_id, accounts, lamports, space, owner)
        }
        SystemInstruction::Assign { owner } => {
            process_assign(program_id, accounts, owner)
        }
        // ... other instruction processing
    }
}
```

## Security Considerations

### Program Security
- **Input Validation**: Validate all inputs
- **Access Control**: Control access to program functions
- **Resource Limits**: Enforce resource limits
- **Error Handling**: Proper error handling

### Account Security
- **Account Validation**: Validate account state
- **Authority Checks**: Check account authorities
- **State Consistency**: Maintain state consistency
- **Atomic Operations**: Ensure atomic operations

### Cryptographic Security
- **Signature Verification**: Verify all signatures
- **Key Management**: Secure key management
- **Random Number Generation**: Secure random number generation
- **Encryption**: Proper encryption usage

## Testing

### Test Programs
- **bpf-loader-tests**: BPF loader tests
- **stake-tests**: Stake program tests
- **zk-elgamal-proof-tests**: ZK ElGamal proof tests
- **ed25519-tests**: Ed25519 tests

### Test Coverage
- **Unit Tests**: Individual function tests
- **Integration Tests**: Program integration tests
- **Performance Tests**: Performance benchmarks
- **Security Tests**: Security validation tests

## Performance Considerations

### Optimization
- **Efficient Algorithms**: Use efficient algorithms
- **Memory Management**: Efficient memory usage
- **CPU Optimization**: Optimize CPU usage
- **I/O Optimization**: Optimize I/O operations

### Caching
- **Account Caching**: Cache account data
- **Instruction Caching**: Cache instruction data
- **Result Caching**: Cache computation results
- **State Caching**: Cache program state

## Integration Points

### Runtime Integration
- **Program Execution**: Execute programs in runtime
- **Account Access**: Access accounts through runtime
- **Instruction Processing**: Process instructions
- **State Management**: Manage program state

### Validator Integration
- **Transaction Processing**: Process transactions
- **Account Updates**: Update account state
- **Fee Collection**: Collect transaction fees
- **State Verification**: Verify state consistency

## Related Components

- **runtime**: Transaction execution engine
- **accounts-db**: Account storage
- **validator**: Main validator implementation
- **cli**: Command-line interface
- **rpc**: Remote procedure calls 