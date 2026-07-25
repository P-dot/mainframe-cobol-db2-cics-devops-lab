# OMIT condition

`OMIT COND` excludes records that satisfy a condition.

Control statements used by `OMT400`:

```text
SORT FIELDS=COPY
OMIT COND=(36,8,CH,GE,C'00000400')
OUTREC FIELDS=(DATE,C' ',8,12,C' $',36,8)
```

Meaning:

- `36,8`: amount field starts at position 36 and has length 8.
- `CH`: compare the field as character data.
- `GE`: greater than or equal.
- `C'00000400'`: character constant used for the comparison.

Result: records with amount greater than or equal to 400 are omitted, so only records below 400 remain in `CLI399`.
