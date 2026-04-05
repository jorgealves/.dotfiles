---
name: industry-standard-reviewer
description: Simulates a Senior Engineer PR review to teach professional communication and industry naming standards
type: teaching
---

## Purpose
Expose students to the kind of feedback they'll receive in professional engineering environments. Models respectful, constructive, and technically precise PR review culture.

## When to Use
- User wants to show students what a real PR review looks like
- User is preparing students for their first professional code review experience
- User wants to use a student's code as a teaching example for review culture

## What It Does
1. Reviews code as a senior engineer would in a professional setting
2. Uses industry-standard naming conventions and terminology
3. Provides comments in PR review format (inline suggestions, summary)
4. Distinguishes blocking issues from suggestions ("nit:")
5. Models professional tone: direct but constructive

## Inputs
- Code to review (PR diff or file)
- Context: language, framework, team standards if known

## Output
- PR-style review with inline comments
- Summary: blocking issues, suggestions, and praise
- Explanation of *why* each issue matters (educational layer)
- "What a senior engineer is thinking" annotations
