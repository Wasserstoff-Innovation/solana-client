# Banks Interface

## Overview

The `banks-interface` crate defines the shared interface and trait definitions for Solana banks. It provides the common abstractions that both banks-client and banks-server use to ensure type safety and consistency in bank operations.

## Purpose

- **Interface Definitions**: Shared traits and types for bank operations
- **Type Safety**: Ensures consistency between client and server implementations
- **Abstraction Layer**: Provides abstraction over bank implementations
- **API Contracts**: Defines the contract between bank clients and servers

## Structure

```
src/
└── lib.rs                           # Interface definitions and traits
```

## Key Components

### Core Traits
- **Banks**: Main trait defining bank operations
- **BanksClient**: Client-side bank interface
- **BanksServer**: Server-side bank interface

### Bank Operations
- **Transaction Processing**: Submit and process transactions
- **Account Management**: Query and modify account state
- **Slot Management**: Get current slot and block information
- **Error Handling**: Common error types for bank operations

## Features

### Transaction Operations
- Submit transactions to banks
- Get transaction status and confirmations
- Handle transaction errors and retries
- Support for different transaction types

### Account Operations
- Query account balances and state
- Get account data and metadata
- Monitor account changes
- Support for different account types

### Bank Information
- Get current slot information
- Query bank state and configuration
- Monitor bank performance metrics
- Get network information

## Dependencies

### Internal Dependencies
- `solana-transaction`: Transaction data structures
- `solana-pubkey`: Public key handling
- `solana-signature`: Signature verification
- `solana-account`: Account data structures

### External Dependencies
- `serde`: Serialization/deserialization
- `thiserror`: Error handling
- `async-trait`: Asynchronous trait support

## Usage

```rust
use solana_banks_interface::{Banks, BanksClient};

// Use the interface trait
async fn process_transaction<B: Banks>(bank: &B, transaction: Transaction) -> Result<()> {
    let signature = bank.send_transaction(transaction).await?;
    bank.confirm_transaction(&signature).await?;
    Ok(())
}
```

## Integration Points

- **banks-client**: Client implementation using this interface
- **banks-server**: Server implementation using this interface
- **test-validator**: Testing validator implementation
- **program-test**: Program testing framework

## Related Components

- **banks-client**: Client implementation
- **banks-server**: Server implementation
- **test-validator**: Testing validator
- **program-test**: Program testing 