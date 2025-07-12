# Banking Stage Ingress Types

## Overview

The `banking-stage-ingress-types` crate defines the data types and structures used for communication between the banking stage and its ingress components. This crate provides the type definitions that ensure type safety and consistency across the banking pipeline.

## Purpose

- **Type Definitions**: Shared types for banking stage ingress operations
- **Inter-Component Communication**: Type-safe communication between banking components
- **Data Structures**: Common data structures used in transaction processing
- **API Contracts**: Defines the contract between banking stage and ingress components

## Structure

```
src/
└── lib.rs                           # Type definitions and shared structures
```

## Key Components

### Core Types
- **Transaction Ingress**: Types for incoming transaction data
- **Banking Stage Communication**: Types for inter-stage communication
- **Error Handling**: Common error types for banking operations
- **Configuration**: Configuration types for banking stage

## Dependencies

### Internal Dependencies
- `solana-transaction`: Transaction data structures
- `solana-pubkey`: Public key handling
- `solana-signature`: Signature verification

### External Dependencies
- `serde`: Serialization/deserialization
- `thiserror`: Error handling

## Usage

This crate is primarily used by:
- **banking-stage**: Main banking stage implementation
- **tpu-client**: Transaction processing unit client
- **validator**: Main validator implementation

## Integration Points

- **Banking Stage**: Main consumer of these types
- **TPU**: Transaction processing unit
- **Validator**: Validator main loop
- **RPC**: Remote procedure calls

## Related Components

- **banks-client**: Banking client implementation
- **banks-interface**: Banking interface definitions
- **banks-server**: Banking server implementation
- **core**: Core banking logic 