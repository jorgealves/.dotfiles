---
name: concept-mastery-validator
description: Verifies alignment between curriculum modules and generated projects to ensure no knowledge gaps
type: teaching
---

## Purpose
Audit a curriculum or teaching program to confirm that every project and assessment only requires knowledge that has already been taught. Prevents students from being asked to apply concepts they haven't learned.

## When to Use
- User finishes designing a curriculum and wants a quality check
- User notices students struggling — may indicate a knowledge gap in sequencing
- User is adding a new module and needs to verify prerequisite coverage

## What It Does
1. Reads the full curriculum sequence
2. Maps each project/assessment to the concepts it requires
3. Checks that all required concepts appear in prior modules
4. Flags any forward dependencies (asks concepts not yet taught)
5. Suggests reordering or bridging content where gaps exist

## Inputs
- Curriculum outline (modules + topics in order)
- Project/assessment list with associated requirements

## Output
- Gap analysis report
- List of flagged forward dependencies with severity
- Suggested fixes: reorder modules, add bridging content, or simplify project scope
