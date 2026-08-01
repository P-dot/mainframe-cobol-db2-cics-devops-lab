# Build and run procedure

## 1. Create input dataset

Submit:

```text
IBMUSER.ML.JCL(CRIN50)
```

Expected result:

```text
CRIN50 MAXCC 0000
IBMUSER.COBOL.ENTR50 cataloged
```

## 2. Load test records

Edit:

```text
IBMUSER.COBOL.ENTR50
```

Use `COLS` to confirm columns 1-50, then insert the sample records from `data/entrada-ejemplo-fb50.txt`.

## 3. Compile and link-edit

Submit:

```text
IBMUSER.ML.JCL(CMPPRU3)
```

Expected result:

```text
COBOL COND CODE 0000
LKED  COND CODE 0000
```

## 4. Execute

Submit:

```text
IBMUSER.ML.JCL(RUNPRU3)
```

Expected result:

```text
RUNPRU3 MAXCC 0000
```

Open `SYSOUT` and verify that all five input records were printed.
