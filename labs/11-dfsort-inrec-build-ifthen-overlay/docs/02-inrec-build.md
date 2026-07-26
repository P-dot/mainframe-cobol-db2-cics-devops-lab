# INREC BUILD

`INREC BUILD` creates a new record image from selected input fields and literals.

Control statements:

```text
SORT FIELDS=(1,7,ZD,A)
INREC BUILD=(1,7,C' ',8,12,C'-$-',36,8,C' ',28,7,C'-',DATE1)
```

Explanation:

- `SORT FIELDS=(1,7,ZD,A)` sorts by customer number.
- `1,7` copies the customer number.
- `C' '` inserts a blank.
- `8,12` copies the surname.
- `C'-$-'` inserts a literal separator and currency marker.
- `36,8` copies the amount.
- `28,7` copies the city/province field.
- `DATE1` inserts the system date in eight-position format.

The original input record is not updated; the transformation is applied to the output stream.
