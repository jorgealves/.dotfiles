---
name: code-review-assistant
description: Automated, context-aware code reviews focusing on logic errors, security, and style violations
type: engineering
---

## Purpose
Deliver fast, thorough PR reviews that catch bugs, security issues, and style violations before they reach production.

## When to Use
- Any PR or code change ready for review
- Pre-merge quality gate
- Legacy code audit

## What It Does
1. Scans for logic errors, null dereferences, off-by-one errors
2. Checks OWASP top 10 vulnerabilities
3. Validates naming conventions and code style
4. Flags missing error handling at system boundaries
5. Identifies test coverage gaps

## Inputs
- Code diff or file(s)
- Language, framework, and team conventions

## Output
- Blocking issues (must fix before merge)
- Suggestions (improve but not blocking)
- Style nits
- Security findings with OWASP reference
