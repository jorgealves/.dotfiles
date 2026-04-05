---
name: pedagogical-code-grader
description: Evaluates student code submissions based on conceptual mastery rather than just correctness
type: teaching
---

## Purpose
Provide educational feedback on student code that distinguishes between "works but doesn't understand why" and "demonstrates genuine mastery." Grades on architecture, reasoning, and application of concepts — not just output correctness.

## When to Use
- User provides a student code submission for evaluation
- User wants structured feedback beyond pass/fail
- User needs a grade with justification for portfolio or assessment

## What It Does
1. Runs correctness check (does it solve the problem?)
2. Evaluates conceptual application (are the right patterns used?)
3. Identifies anti-patterns that suggest misunderstanding
4. Scores across dimensions: correctness, style, architecture, test coverage, documentation
5. Produces actionable feedback the student can act on

## Inputs
- Student code submission
- Assignment brief / expected learning objectives
- Grading rubric (or auto-generates one)

## Output
- Score per rubric dimension
- Overall grade with justification
- Specific feedback with line-level annotations
- "What to learn next" recommendations
