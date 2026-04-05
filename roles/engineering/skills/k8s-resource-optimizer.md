---
name: k8s-resource-optimizer
description: Analyzes Kubernetes resource usage metrics and suggests optimal CPU and Memory requests/limits
type: engineering
---

## Purpose
Right-size K8s deployments to reduce cloud costs, prevent OOMKills, and improve cluster reliability.

## When to Use
- Deploying or modifying K8s workloads
- Investigating OOMKill events or CPU throttling
- Cost optimization sprints
- Cluster capacity planning

## What It Does
1. Reads current resource requests/limits from manifests
2. Analyzes usage patterns (if metrics available)
3. Identifies over-provisioned and under-provisioned containers
4. Suggests VPA-aligned recommendations
5. Flags missing requests/limits and missing probes

## Inputs
- K8s deployment/statefulset manifests
- Optional: Prometheus/metrics-server data

## Output
- Per-container recommendations: requests and limits
- Estimated cost savings
- Flagged risks: OOMKill probability, CPU throttling ratio
- Updated manifest snippets
