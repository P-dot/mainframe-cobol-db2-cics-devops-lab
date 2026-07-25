# Troubleshooting notes

Common issues in this type of DFSORT lab:

## Wrong field position

If the amount field position is wrong, DFSORT may select the wrong records or no records at all.

The lab uses:

```text
36,8
```

for the amount field.

## Character comparison

The condition uses `CH`, so values must be zero-padded consistently:

```text
C'00000600'
C'00000400'
```

## Empty output

An empty output may indicate that the condition is too restrictive or that the field position does not match the input layout.

## SORTOUT missing

If `SORTOUT` is not defined, DFSORT cannot write the output member. This was a previous issue in earlier labs and is documented here as a recurring diagnostic pattern.
