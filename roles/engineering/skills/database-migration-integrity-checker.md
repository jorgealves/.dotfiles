---
name: database-migration-integrity-checker
description: Audits SQL migration files for destructive actions, potential table locks, and compatibility issues
type: engineering
---

## Purpose
Prevent downtime and data loss by catching dangerous migration patterns before they hit production.

## When to Use
- Before applying any migration to staging or production
- During PR review of migration files
- When migrating between database versions

## What It Does
1. Detects destructive operations: `DROP TABLE`, `DROP COLUMN`, `TRUNCATE`
2. Identifies long-lock operations: `ALTER TABLE` on large tables
3. Checks for missing rollback/down migrations
4. Validates index creation strategy (concurrent vs blocking)
5. Flags data-type changes that require backfill

## Inputs
- SQL migration file(s) or migration directory

## Output
- Risk assessment per migration: high/medium/low
- Blocking issues: operations that will cause downtime
- Warnings: operations with moderate risk
- Safe to apply: confirmed low-risk operations
- Suggested safer alternatives where applicable
