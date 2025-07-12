# Banks Client

## Overview

The `banks-client` crate provides a client implementation for interacting with Solana banks. It enables external applications to send transactions and query account state through a client-server architecture, typically used for testing and development purposes.

## Purpose

- **Bank Interaction**: Client-side interface for bank operations
- **Transaction Submission**: Send transactions to banks
- **Account Queries**: Query account state and information
- **Testing Support**: Provides testing utilities for bank operations
- **Development Tools**: Enables development and debugging tools

## Structure

```
src/
├── lib.rs                           # Main library interface
└── banks_client.rs                  # Banks client implementation
```

## Key Components

### Core Client (`banks_client.rs`)
- **Transaction Submission**: Send transactions to banks
- **Account Queries**: Query account state and balances
- **Slot Information**: Get current slot and block information
- **Error Handling**: Comprehensive error handling for client operations

### Client Interface (`lib.rs`)
- **Public API**: Main public interface for the client
- **Type Definitions**: Client-specific type definitions
- **Configuration**: Client configuration options

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
- `solana-banks-interface`: Interface definitions for banks
- `solana-transaction`: Transaction data structures
- `solana-pubkey`: Public key handling
- `solana-signature`: Signature verification
- `solana-account`: Account data structures

### External Dependencies
- `tokio`: Asynchronous runtime
- `serde`: Serialization/deserialization
- `thiserror`: Error handling
- `jsonrpc-core`: JSON-RPC client

## Usage

```rust
use solana_banks_client::BanksClient;

// Create a banks client
let client = BanksClient::new(server_addr);

// Submit a transaction
let signature = client.send_transaction(&transaction).await?;

// Query account
let account = client.get_account(&pubkey).await?;

// Get slot
let slot = client.get_slot().await?;
```

## Integration Points

- **banks-server**: Server-side counterpart
- **banks-interface**: Shared interface definitions
- **test-validator**: Testing validator implementation
- **program-test**: Program testing framework
- **cli**: Command-line interface tools

## Testing

The crate includes tests for:
- Transaction submission and confirmation
- Account query operations
- Error handling scenarios
- Client-server communication
- Performance benchmarks

## Related Components

- **banks-interface**: Interface definitions
- **banks-server**: Server implementation
- **test-validator**: Testing validator
- **program-test**: Program testing
- **cli**: Command-line tools 