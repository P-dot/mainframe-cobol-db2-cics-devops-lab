       IDENTIFICATION DIVISION.
       PROGRAM-ID. PARMVRY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  W-MES                 PIC X(80).
       01  W-CONTADOR            PIC 9(02).

       PROCEDURE DIVISION.
           PERFORM 1000-INICIO.
           PERFORM 2000-PROCESO
              VARYING W-CONTADOR FROM 1 BY 1
              UNTIL W-CONTADOR = 6.
           PERFORM 3000-FIN.

       1000-INICIO.
           ACCEPT W-MES.
           DISPLAY 'INICIO DEL PROGRAMA PARMVRY'.

       2000-PROCESO.
           DISPLAY W-MES.

       3000-FIN.
           STOP RUN.
