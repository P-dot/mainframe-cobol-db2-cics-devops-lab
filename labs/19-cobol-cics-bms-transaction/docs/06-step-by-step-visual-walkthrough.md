# Visual walkthrough - Lab 19

This file is a quick operator-facing visual guide that ties the main screenshots to the flow of the lab.

## 1) Establish regional context
- Start from the region baseline and confirm the environment is active.
- Evidence: `../evidence/screenshots/01-cics-all4-db2conn-baseline.png`

## 2) Prepare the BMS map
- Edit `IBMUSER.CICS.MAPS(HOLAMP)` and correct the BMS syntax.
- Evidence:
  - `../evidence/screenshots/02-holamp-bms-source-corrected.png`
  - `../evidence/screenshots/03-cmpmap-jcl-build-map.png`

## 3) Debug the first map build
- The first map build returns RC=12.
- Inspect MAPASM and the detailed diagnostic view to locate the source issues.
- Evidence:
  - `../evidence/screenshots/04-cmpmap-first-run-rc12.png`
  - `../evidence/screenshots/05-mapasm-summary-rc12.png`
  - `../evidence/screenshots/06-mapasm-error-detail-dfh.png`

## 4) Prepare the COBOL CICS program
- Create `IBMUSER.CICS.SRC(HOLA)` with `EXEC CICS SEND MAP`.
- Evidence:
  - `../evidence/screenshots/07-hola-cobol-source.png`

## 5) Debug and complete the COBOL build
- Fix JCL syntax and dataset flow until `TRN`, `COBOL`, and `LKED` complete.
- Evidence:
  - `../evidence/screenshots/08-cmphola-jcl-error-disp-apostrophe.png`
  - `../evidence/screenshots/09-cmphola-cobol-step-sysin-not-found.png`
  - `../evidence/screenshots/10-cmphola-success-page1.png`
  - `../evidence/screenshots/11-cmphola-success-page2.png`

## 6) Register the runtime objects in CICS
- Define `PROGRAM`, `MAPSET`, and `TRANSACTION`, then install the group.
- Evidence:
  - `../evidence/screenshots/12-ceda-define-program-hola.png`
  - `../evidence/screenshots/13-ceda-define-mapset-holamp.png`
  - `../evidence/screenshots/14-ceda-define-transaction-hola.png`
  - `../evidence/screenshots/15-ceda-install-group-lab19.png`

## 7) Handle the runtime library issue
- The first execution fails because CICS cannot locate the load module.
- Define a CICS `LIBRARY` resource for `IBMUSER.CICS.LOAD`.
- Evidence:
  - `../evidence/screenshots/16-runtime-program-not-available.png`
  - `../evidence/screenshots/18-ceda-define-library-lab19lib.png`

## 8) Final execution
- Re-run `HOLA` and verify the map is displayed successfully.
- Evidence:
  - `../evidence/screenshots/19-final-transaction-screen-hola.png`
