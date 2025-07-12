# Solana Codebase Architecture Documentation

This documentation provides a comprehensive overview of the Solana blockchain codebase architecture, including detailed explanations of each component, their interactions, and the overall system design.

## Table of Contents

1. [Overview](#overview)
2. [System Architecture](#system-architecture)
3. [Component Documentation](#component-documentation)
4. [Development Workflows](#development-workflows)
5. [Build and Deployment](#build-and-deployment)

## Overview

Solana is a high-performance blockchain platform designed for decentralized applications and marketplaces. The codebase is organized as a Rust workspace with multiple crates that handle different aspects of the blockchain system.

### Key Characteristics

- **High Performance**: Designed for 65,000+ transactions per second
- **Low Cost**: Sub-cent transaction fees
- **Scalable**: Horizontal scaling through validator networks
- **Developer Friendly**: Comprehensive tooling and SDKs

## System Architecture

The Solana codebase is organized into several major subsystems:

### Core Components

1. **Validator** - The main blockchain node implementation
2. **Core** - Core blockchain logic and data structures
3. **Runtime** - Transaction execution engine
4. **RPC** - Remote Procedure Call interface
5. **CLI** - Command-line interface tools
6. **Programs** - Native programs (System, Stake, Vote, etc.)

### Supporting Components

1. **Accounts DB** - Account storage and management
2. **Banking** - Transaction processing pipeline
3. **Gossip** - Network communication protocol
4. **POH** - Proof of History consensus mechanism
5. **SVM** - Solana Virtual Machine
6. **Storage** - Data persistence layer

## Component Documentation

Each component has its own detailed documentation:

### Core Components
- [Validator Architecture](./validator/README.md)
- [Core System](./core/README.md)
- [Runtime Engine](./runtime/README.md)
- [Accounts Database](./accounts-db/README.md)

### Interface Components
- [CLI Tools](./cli/README.md)
- [RPC Interface](./rpc/README.md)

### Banking Components
- [Banking Stage Ingress Types](./banking-stage-ingress-types/README.md)
- [Banks Client](./banks-client/README.md)
- [Banks Interface](./banks-interface/README.md)
- [Banks Server](./banks-server/README.md)

### Native Programs
- [Native Programs](./programs/README.md)

### Utility Components
- [Account Decoder](./account-decoder/README.md)

### Architecture and Workflows
- [Complete Architecture](./ARCHITECTURE.md)
- [Dependency Map](./DEPENDENCY_MAP.md)
- [Workflows](./WORKFLOWS.md)

## Development Workflows

### Running a Validator

The validator is the main blockchain node that processes transactions and maintains the ledger. See [Validator Documentation](./validator/README.md) for detailed instructions.

### Creating Genesis

Genesis is the initial state of the blockchain. See [Genesis Documentation](./genesis/README.md) for configuration options.

### Building Programs

Native programs can be built and deployed to the blockchain. See [Programs Documentation](./programs/README.md) for development guidelines.

## Build and Deployment

### Prerequisites

- Rust 1.70+
- Cargo
- Platform-specific dependencies (see individual component docs)

### Building

```bash
# Build all components
cargo build --release

# Build specific component
cargo build --release -p solana-validator
```

### Testing

```bash
# Run all tests
cargo test

# Run specific component tests
cargo test -p solana-validator
```

## Contributing

When contributing to the Solana codebase:

1. Follow the Rust coding standards
2. Add tests for new functionality
3. Update relevant documentation
4. Ensure all tests pass before submitting

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](../LICENSE) file for details.
