# Evidence index

## Main workflow screenshots

- `01-crin50-create-entr50-jcl.png` - JCL used to allocate `IBMUSER.COBOL.ENTR50`.
- `02-ispf-dataset-list-entr50-created.png` - ISPF 3.4 showing the dataset exists on volume `SBSYS1`.
- `03-entr50-fixed-records-loaded.png` - Input records loaded into the `FB 50` sequential dataset.
- `04-cmppru3-compile-link-jcl.png` - Compile/link-edit JCL for `PRUEBA3`.
- `05-prueba3-cobol-sequential-file-source.png` - COBOL source using `SELECT`, `FD`, `FILE STATUS`, `OPEN`, `READ`, and `CLOSE`.
- `06-runpru3-execution-jcl.png` - Runtime JCL connecting DDNAME `ENTRADA` to `IBMUSER.COBOL.ENTR50`.
- `07-runpru3-sysout-final-output.png` - Final `SYSOUT` showing all five records printed.

## Debug screenshots

- `debug/01-compile-error-file-status-unquoted-10-page1.png` - Earlier compile error involving unquoted file status value.
- `debug/02-compile-error-file-status-unquoted-10-page2.png` - Continuation of the same compile analysis.
- `debug/03-final-remaining-unquoted-10-line34.png` - Final remaining line to correct: second `MOVE 10` needed quotes.

## Raw evidence

- `raw/FICHEROS-lab20-final-evidence.docx` - User-provided evidence document for the completed lab.
