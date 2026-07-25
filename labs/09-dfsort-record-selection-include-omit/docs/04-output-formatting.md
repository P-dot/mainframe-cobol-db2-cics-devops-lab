# Output formatting with OUTREC

Both jobs build a reduced output record. The original 80-byte record is not copied as-is.

`SEL600` uses:

```text
OUTREC FIELDS=(DATE1,C' ',8,12,C' $',36,8)
```

This generates:

```text
YYYYMMDD surname $amount
```

`OMT400` uses:

```text
OUTREC FIELDS=(DATE,C' ',8,12,C' $',36,8)
```

This generates a date in the format observed in the evidence:

```text
MM/DD/YY surname $amount
```

Relevant input fields:

- `8,12`: surname.
- `36,8`: amount.
