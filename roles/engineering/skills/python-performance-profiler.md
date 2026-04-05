---
name: python-performance-profiler
description: Identify CPU and memory bottlenecks in Python code using cProfile or memory_profiler
type: engineering
---

## Purpose
Optimize mission-critical Python services by finding and fixing actual bottlenecks, not guessing.

## When to Use
- Latency SLA is being violated
- Service memory is growing unexpectedly (potential leak)
- A specific function is slow under load
- Pre-production performance validation

## What It Does
1. Instruments code with cProfile or memory_profiler
2. Identifies hot paths: functions consuming most CPU time
3. Detects memory leaks and large allocations
4. Finds N+1 query patterns and unnecessary I/O
5. Suggests optimizations: caching, batching, algorithm improvements

## Inputs
- Python file or module to profile
- Workload description or sample input

## Output
- Flamegraph or call tree summary
- Top 10 bottlenecks ranked by impact
- Memory allocation report
- Concrete optimization recommendations with expected improvement
