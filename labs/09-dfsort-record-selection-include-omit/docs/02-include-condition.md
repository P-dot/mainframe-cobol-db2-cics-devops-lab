# INCLUDE condition

`INCLUDE COND` keeps only records that satisfy a condition.

Control statements used by `SEL600`:

```text
SORT FIELDS=COPY
INCLUDE COND=(36,8,CH,LT,C'00000600')
OUTREC FIELDS=(DATE1,C' ',8,12,C' $',36,8)
```

Meaning:

- `36,8`: amount field starts at position 36 and has length 8.
- `CH`: compare the field as character data.
- `LT`: less than.
- `C'00000600'`: character constant used for the comparison.

Result: records with amount lower than 600 are written to `CLI600`.
