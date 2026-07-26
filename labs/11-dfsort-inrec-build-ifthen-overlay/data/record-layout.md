# Record layout used in the lab

The lab uses the customer records from `IBMUSER.COBOL.FILE80(CLIENTE1)`.

| Position | Length | Field | Usage in this lab |
|---:|---:|---|---|
| 1 | 7 | Customer number | Sort key in ascending order |
| 8 | 12 | Surname | Included in formatted output |
| 20 | 8 | Name | Kept in the original record; visible in `CLIFLG` |
| 28 | 7 | City / province field | Moved near the end in `CLIINR` |
| 36 | 8 | Amount | Used by `BUILD` and by the `IFTHEN` condition |
| 47 | 5 | Flag area | `OVERLAY` writes `MENOR` or `MAYOR` |

Note: previous labs in this repository use position 36 and length 8 for the amount field, so this lab keeps the same adapted layout.
