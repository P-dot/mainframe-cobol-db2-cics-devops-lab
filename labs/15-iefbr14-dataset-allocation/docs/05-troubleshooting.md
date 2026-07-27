# Troubleshooting

## Dataset already exists

`DISP=NEW` requires that the target dataset does not already exist. Verify in ISPF 3.4 before submitting.

## Wrong program name

Correct: `PGM=IEFBR14`.

Incorrect: `PGM=IEBR14`.

## JCL continuation error

Continued DD parameter lines must be comma-terminated, except the final parameter line.
