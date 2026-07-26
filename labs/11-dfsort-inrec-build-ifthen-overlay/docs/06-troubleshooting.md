# Troubleshooting notes

Common DFSORT/JCL issues for this lab:

| Symptom | Likely cause | Fix |
|---|---|---|
| JCL error | Missing `//`, bad continuation, wrong delimiter | Check `SYSIN DD *` and closing `/*` |
| `ICE007A` or syntax error | Incorrect comma, parenthesis, or literal | Review `INREC` syntax and continuation lines |
| Output fields shifted | Wrong field positions or lengths | Verify positions against `record-layout.md` |
| All records classified the same | Wrong amount position or comparison type | Confirm `36,8,ZD,LT,400` |
| `SORTOUT NOT DEFINED` | Missing `SORTOUT DD` | Add/repair `SORTOUT` statement |
| Input not found | Wrong PDS/member name | Verify `IBMUSER.COBOL.FILE80(CLIENTE1)` |
