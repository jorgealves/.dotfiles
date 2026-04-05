---
name: license-compliance-auditor
description: Scans project dependencies and verifies licenses against a whitelist of approved open-source licenses
type: engineering
---

## Purpose
Prevent the introduction of restricted or incompatible licenses into production software.

## When to Use
- Adding new open-source dependencies
- Pre-release compliance check
- Periodic dependency audit
- When a dependency is flagged by legal/security teams

## What It Does
1. Scans all direct and transitive dependencies
2. Identifies license type per package
3. Flags incompatible licenses: GPL-2.0, AGPL, SSPL, proprietary
4. Validates against configurable approved-license whitelist
5. Generates compliance report for legal review

## Inputs
- `pyproject.toml`, `requirements.txt`, or `package.json`
- Optional: approved license whitelist

## Output
- License inventory: package → license mapping
- Compliance status: approved / flagged / unknown
- Risk summary: copyleft, proprietary, permissive counts
- Recommended actions for flagged dependencies
