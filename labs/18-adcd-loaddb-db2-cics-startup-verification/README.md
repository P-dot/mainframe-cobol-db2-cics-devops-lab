# Lab 18 - ADCD LOADDB startup verification for DB2 and CICS

## Objective

This lab verifies that the local ADCD z/OS 1.11 system running on Hercules is already using the DB startup profile and has DB2 and CICS available.

The lab deliberately avoids running destructive or disruptive startup sequences such as cold-starting JES2 spool. Instead, it documents the current safe state:

- `LOADDB` is the active IPL profile.
- DB2-related address spaces are visible.
- CICS is visible and accessible.
- DB2I panels are available through a DB2-aware TSO logon procedure.

## Environment

- Platform: z/OS ADCD 1.11 on Hercules / zPDT-style lab environment
- IPL device: `0A80`
- IPLPARM volume: `0A82`
- Active IPL profile observed: `LOADDB`
- User: `IBMUSER`
- Validation tools: Console command output, SDSF, TSO/ISPF, DB2I and CICS sign-on screen

## Technical scope

This lab covers:

- `D A,L` subsystem/activity overview
- `D IPLINFO` startup profile verification
- SDSF `DA` address-space review
- DB2 address-space verification
- CICS region verification
- DB2I menu access
- CICS welcome screen access
- Safe documentation of DB2/CICS readiness without re-IPLing or cold-starting the system

## Why this lab is safe

The source video describes a full startup sequence using profiles such as `CS`, `DI`, `DC` and `DB`. Some of those profiles can format spool or perform cold-start initialization.

In this lab, the system is already observed in the desired end state: `LOADDB` is active and DB2/CICS components are visible. Therefore, the lab is framed as verification and documentation rather than reconfiguration.

## Evidence summary

The captured evidence shows:

1. Console/SDSF activity overview with DB2 and CICS-related tasks visible.
2. `D IPLINFO` output showing `USED LOADDB IN SYS1.IPLPARM ON 0A82` and `IEASYS LIST = DB`.
3. SDSF `DA` output showing address spaces such as `D9G1MSTR`, `D9G1IRLM`, `D9GDBM1`, `D9GDIST` and `CICSA`.
4. DB2I primary option menu.
5. CICS welcome screen.

## Professional value

This lab demonstrates operational verification of a mainframe development subsystem stack. Instead of performing risky IPL profile changes, it confirms the current startup profile and validates DB2/CICS availability using normal z/OS operator and user interfaces.
