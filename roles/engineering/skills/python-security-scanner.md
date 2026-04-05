---
name: python-security-scanner
description: Detect common Python vulnerabilities including SQL injection, unsafe deserialization, and hardcoded secrets
type: engineering
---

## Purpose
Automated security scanning for Python codebases as part of a secure SDLC.

## When to Use
- Any Python code that touches user input, database queries, or external APIs
- Pre-commit or CI pipeline security gate
- Audit of existing codebase

## What It Does
1. Detects SQL injection patterns (string interpolation in queries)
2. Flags unsafe deserialization (`pickle`, `yaml.load`, `eval`)
3. Identifies hardcoded secrets and credentials
4. Checks for insecure random number usage
5. Validates subprocess/shell injection risks
6. Reports findings with severity (critical/high/medium/low)

## Inputs
- Python file(s) or directory path

## Output
- Findings list with severity, file:line, and description
- Remediation guidance per finding
- Summary: critical count, high count
