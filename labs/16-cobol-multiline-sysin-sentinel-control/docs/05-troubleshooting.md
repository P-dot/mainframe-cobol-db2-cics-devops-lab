# Troubleshooting

## First letter missing from output

If a line is written without a leading control character, the first letter becomes `W-CTRL` and will not be printed.

Use:

```text
+PRIMER MENSAJE
```

## Infinite loop

If `ACCEPT W-ENTRADA` is removed from `2000-PROCESO`, `W-CTRL` never changes and the loop can run indefinitely.

## Sentinel printed

This lab avoids printing `%` by reading before the loop and processing only while `W-CTRL` is not `%`.

## Truncation

`W-TEXTO` is `PIC X(50)`, so longer input text is truncated.
