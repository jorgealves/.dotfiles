---
name: refactoring-suggester
description: Identifies code smells and provides step-by-step refactoring recipes applying Clean Code and SOLID principles
type: engineering
---

## Purpose
Transform legacy or degraded code into maintainable, testable, extensible implementations without introducing regressions.

## When to Use
- Code review reveals deep structural issues
- Feature addition is blocked by tangled code
- Tech debt sprint targeting specific modules
- Preparing code for a major feature expansion

## What It Does
1. Identifies code smells: long methods, god classes, feature envy, primitive obsession
2. Maps smells to SOLID violations
3. Proposes refactoring recipe with named patterns (Extract Method, Replace Conditional with Polymorphism, etc.)
4. Produces step-by-step transformation with intermediate states
5. Verifies behavior preservation at each step

## Inputs
- Code file(s) to refactor
- Context: what the code does, known pain points

## Output
- Code smell inventory with severity
- Prioritized refactoring plan
- Step-by-step recipe with before/after for each step
- Risk assessment: what could break and how to protect it
