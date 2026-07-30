# Troubleshooting notes

## DB2I menu does not appear

Possible causes:

- The user logged on with a basic ISPF procedure instead of a DB2-aware procedure.
- DB2 panel libraries are not concatenated.
- DB2 is not active or the DB2 subsystem name differs.

Check the logon procedure and SDSF address spaces.

## CICS welcome screen does not appear

Possible causes:

- CICS region is not active.
- Wrong terminal/session target.
- VTAM/application name mismatch.

Check SDSF `DA` for the CICS region and confirm the correct logon target.

## IPLINFO does not show LOADDB

Do not change IPL parameters blindly. First document the current profile and compare it against the ADCD IPLPARM members available in the system.

## Avoid unnecessary cold starts

Profiles that cold-start JES2 or format spool can remove previous job output. This lab avoids that by verifying the already-active `LOADDB` state.
