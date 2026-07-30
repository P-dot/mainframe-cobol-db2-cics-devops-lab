       IDENTIFICATION DIVISION.
       PROGRAM-ID. HOLA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY HOLAMP.

       PROCEDURE DIVISION.
       0000-MAIN.

           EXEC CICS SEND MAP('HOLAMP')
                          MAPSET('HOLAMP')
                          FROM(HOLAMPO)
                          ERASE
           END-EXEC.

           EXEC CICS RETURN
           END-EXEC.
