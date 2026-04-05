---
name: python-logging-strategist
description: Design structured logging systems with context propagation for observable Python applications
type: engineering
---

## Purpose
Ensure Python services emit machine-readable, context-rich logs that support effective debugging and monitoring.

## When to Use
- New service needs a logging strategy
- Existing logs are unstructured or missing context
- Debugging distributed systems where trace correlation is needed
- Setting up observability stack (structured logs → ELK/Loki/Datadog)

## What It Does
1. Designs structured logging schema (JSON, key-value pairs)
2. Implements request context propagation (`contextvars`)
3. Defines log levels and what belongs at each level
4. Integrates with correlation IDs for distributed tracing
5. Adds performance logging (request duration, DB query time)
6. Configures log sampling for high-throughput paths

## Inputs
- Service codebase or architecture description
- Current logging setup (if any)
- Target observability stack

## Output
- Logging configuration module
- Context propagation implementation
- Log schema documentation
- Example log entries at each level
- Integration guide for target stack
