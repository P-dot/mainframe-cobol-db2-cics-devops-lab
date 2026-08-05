-- Continuation point for the next lab.
-- This query was NOT executed in this lab.
SELECT CREATOR, NAME, TBCREATOR, TBNAME
FROM SYSIBM.SYSINDEXES
WHERE CREATOR = 'IBMUSER'
  AND NAME    = 'CLIDNIX';
