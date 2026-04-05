---
name: technical-debt-visualizer
description: Generates a heat-map and metrics report of a repository based on complexity, test coverage, and TODO density
type: engineering
---

## Purpose
Identify high-risk areas for refactoring and provide data-driven prioritization for technical debt reduction sprints.

## When to Use
- Sprint planning with a tech debt focus
- Scoping a refactoring initiative
- Onboarding new engineers to understand problem areas
- Quarterly engineering health reviews

## What It Does
1. Measures cyclomatic complexity per file/function
2. Calculates TODO/FIXME/HACK comment density
3. Identifies files with no test coverage
4. Detects long files and long functions
5. Produces a ranked list of highest-debt files

## Inputs
- Repository path or directory

## Output
- Heat-map ranked by debt score
- Per-file metrics: complexity, coverage, comment density, age
- Top 10 highest-debt files with action recommendations
- Aggregate debt score trend (if historical data available)
