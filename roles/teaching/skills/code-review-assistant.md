---
name: code-review-assistant
description: Provides automated, context-aware code reviews with educational framing for student submissions
type: teaching
---

## Purpose
Deliver thorough code reviews on student submissions that teach best practices rather than just listing errors. Frames every finding as a learning opportunity.

## When to Use
- User needs a fast review of student code with educational context
- User wants to identify patterns across multiple submissions
- User wants a review that students can self-study from

## What It Does
1. Scans for logic errors, style violations, and anti-patterns
2. Explains each finding in plain language with the underlying principle
3. Suggests corrections with before/after examples
4. Categorizes findings: critical, improvement, style
5. Links findings to the concepts they violate (e.g., "this violates DRY because...")

## Inputs
- Code file(s) or snippet
- Language and framework
- Learning objectives or module context

## Output
- Categorized findings list
- Per-finding: issue description, why it matters, suggested fix
- Summary of patterns to focus on in teaching
- Positive reinforcement: what the student did well
