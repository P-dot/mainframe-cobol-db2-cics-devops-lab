# Overview

This lab extends the previous DFSORT exercises. Earlier labs used SORT to order records, count records and summarize totals. This lab focuses on selecting or excluding records with DFSORT conditions.

The two jobs are intentionally similar so the difference between `INCLUDE` and `OMIT` is clear:

- `SEL600`: keep records with amount `< 00000600`.
- `OMT400`: remove records with amount `>= 00000400`.

Both jobs use `SORT FIELDS=COPY`, so DFSORT is not being used to reorder the file. It is being used as a record filtering and output formatting utility.
