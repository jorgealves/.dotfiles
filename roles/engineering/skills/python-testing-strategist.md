---
name: python-testing-strategist
description: Design comprehensive Python test suites including unit, integration, and E2E tests
type: engineering
---

## Purpose
Establish testing patterns for Python services that provide real coverage without over-mocking.

## When to Use
- New service or module needs a test strategy
- Existing tests are fragile, slow, or incomplete
- Coverage gaps are blocking confidence in a refactor

## What It Does
1. Analyzes the codebase to identify test layers needed
2. Designs unit test scope: pure functions, business logic
3. Designs integration test scope: DB, external services (real connections, not mocks)
4. Designs E2E test scope: API contracts, workflows
5. Recommends fixtures, factories, and test data strategies
6. Identifies what NOT to test (framework internals)

## Inputs
- Source code path or module
- Existing test files (if any)
- Service architecture description

## Output
- Testing strategy document
- Test file templates with example tests
- pytest configuration recommendations
- CI integration guidance
