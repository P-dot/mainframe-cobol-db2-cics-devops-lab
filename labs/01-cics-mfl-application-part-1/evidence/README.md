# Guided Evidence — Lab 01 — Part 1: MFL CICS Application Foundation and BMS Diagnostics

[← Lab lesson](../README.md) · [Academy](https://github.com/P-dot/P-dot/blob/main/docs/ACADEMY.md) · [Evidence standard](https://github.com/P-dot/P-dot/blob/main/docs/LAB-STANDARD.md)

## How to read this evidence

This page is the evidence companion to the lab, not a screenshot gallery. Read the artifacts in execution order and correlate each image or file with the command, job, subsystem state or result described by the lab.

Use four questions while reviewing the evidence:

1. **Intent** — what state or behavior was the lab trying to create or inspect?
2. **Mechanism** — which z/OS component, command, utility or program performed the work?
3. **Observation** — what concrete message, return code, object or state was captured?
4. **Boundary** — what does that artifact support, and what would require additional evidence?

The manifest below is retained as the factual index from the executed lab. Its descriptions are the source of truth for what each artifact was captured to demonstrate.

## Evidence manifest

# Evidence Index

## 01 — Proven `L04MAPS` fixed-format reference

`01-l04maps-proven-fixed-format-reference.png`

Shows the previously successful BMS member used as the local formatting reference. The screenshot includes continuation markers at the right edge.

## 02 — `MFLSET` with ISPF column ruler

`02-mflset-cols-continuation-work.png`

Shows `IBMUSER.CICS.MAPS(MFLSET)` while using `COLS` to inspect fixed-format placement and column 72.

## 03 — Adapted `MFLMAP` JCL

`03-mflmap-jcl.png`

Shows the MFL BMS generation JCL using `ASMA90`, `IEWL`, `DFH410.CICS.SDFHMAC`, and the existing CICS MAPS/COPY/LOAD libraries.

## 04 — Current RC=0008 checkpoint

`04-mflmap-rc0008.png`

Shows the current assembler checkpoint ending with `Return Code 008`.

This is intentionally retained as a diagnostic milestone. Part 1 does not claim a successful BMS generation.

## Interpretation discipline

A successful command, return code or panel is interpreted only within the scope described by the lab. It must not be promoted into proof of unrelated production properties such as availability, performance, security hardening or recovery unless those properties have their own evidence.

When troubleshooting, walk the artifacts in order and locate the first point where **expected state** and **observed state** diverge. That point is normally more useful than the final symptom.

## Evidence boundary

**Evidence-backed:** the individual observations explicitly identified in the manifest and the parent lab.

**Not automatically implied:** production readiness, enterprise scale, security completeness, performance characteristics or cross-subsystem behavior that was not exercised by this lab.

## Review questions

- Which artifact establishes the initial or prerequisite state?
- Which artifact is the strongest execution/result proof?
- Is there a separate final-state validation, or only a successful command?
- Which z/OS subsystem owns the observed messages or objects?
- What additional artifact would be required to make a stronger claim?

---
### Continue learning

**Lab:** [Return to the lesson](../README.md)  
**Academy:** [z/OS Engineering Academy](https://github.com/P-dot/P-dot/blob/main/docs/ACADEMY.md) · [Curriculum](https://github.com/P-dot/P-dot/blob/main/docs/CURRICULUM.md) · [Relationships](https://github.com/P-dot/P-dot/blob/main/docs/RELATIONSHIPS.md)
