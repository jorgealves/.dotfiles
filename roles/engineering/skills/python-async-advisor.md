---
name: python-async-advisor
description: Review asynchronous Python code to identify race conditions, deadlocks, and inefficient patterns
type: engineering
---

## Purpose
Ensure async Python code (asyncio, aiohttp, FastAPI) is correct, performant, and free of concurrency bugs.

## When to Use
- Reviewing async/await code in FastAPI, aiohttp, or raw asyncio
- Investigating intermittent bugs that may be race conditions
- Designing concurrent workflows
- Migrating sync code to async

## What It Does
1. Detects blocking calls inside async functions (sync I/O, `time.sleep`)
2. Identifies missing `await` expressions
3. Flags potential race conditions on shared state
4. Reviews task cancellation and timeout handling
5. Checks proper use of `asyncio.gather`, `asyncio.create_task`, semaphores
6. Validates context propagation (e.g., `contextvars`)

## Inputs
- Python file(s) with async code

## Output
- Race condition risks with severity
- Blocking call violations
- Performance anti-patterns
- Corrected code snippets for each finding
