# Troubleshooting

## IDCAMS does not find the dataset

Symptoms:

- `CATCHK` return code is not 0.
- `READMBR` is bypassed by the `COND` condition.
- `MSGOK` does not run.

Check:

- Dataset spelling.
- Catalog status.
- HLQ and PDS name.

## Member is not readable

Symptoms:

- `CATCHK` succeeds.
- `READMBR` fails.
- `MSGOK` does not run.

Check:

- Member name.
- PDS contents.
- Dataset allocation and permissions.

## IF/THEN block does not execute

Check that the step name and return-code reference match:

```jcl
//        IF (READMBR.RC = 0) THEN
```

`READMBR` must be the exact step name used earlier in the job.

## SYSOUT message not visible

Open the job output in SDSF and inspect the `MSGOK` output section.
