---
name: poetry-uv-advisor
description: Optimize pyproject.toml and resolve complex Python dependency trees using Poetry or uv
type: engineering
---

## Purpose
Modernize Python project management and resolve dependency conflicts using the fastest available tooling.

## When to Use
- `uv sync` or `poetry install` fails with version conflicts
- Migrating from `requirements.txt` or `setup.py` to `pyproject.toml`
- Upgrading major dependencies (Django, FastAPI, SQLAlchemy)
- Auditing transitive dependencies for security or bloat

## What It Does
1. Analyzes `pyproject.toml` and lock file for conflicts
2. Identifies pinned versions that block upgrades
3. Suggests version constraint strategy (compatible release `~=`, floor bounds)
4. Generates migration plan from legacy formats
5. Validates optional dependency groups (dev, test, docs)

## Inputs
- `pyproject.toml` and `uv.lock` or `poetry.lock`
- Target Python version(s)

## Output
- Conflict resolution plan
- Updated `pyproject.toml` with optimized constraints
- Migration steps from legacy format
- List of outdated dependencies with upgrade paths
