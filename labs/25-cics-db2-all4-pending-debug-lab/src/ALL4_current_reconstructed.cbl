       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALL4.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY ALL4MP.
       COPY SQLCA.

       01  DCLCLIENTES.
           05 CL1                 PIC X(9).
           05 CL2                 PIC X(20).
           05 CL3                 PIC X(30).
           05 CL4                 PIC X(35).

       01  MI-COMMAREA            PIC X(8) VALUE 'ALL4CTX'.
       01  WS-CICS-RESP           PIC S9(8) COMP VALUE 0.
       01  WS-SQLCODE-DISP        PIC -999999999.

       PROCEDURE DIVISION.

       0000-MAIN.

           EXEC SQL
                WHENEVER SQLERROR CONTINUE
           END-EXEC.

           EXEC SQL
                WHENEVER SQLWARNING CONTINUE
           END-EXEC.

           EXEC SQL
                WHENEVER NOT FOUND CONTINUE
           END-EXEC.

           IF EIBCALEN = 0
              PERFORM 1000-PRIMERA-VEZ
           ELSE
              PERFORM 2000-RECIBIR-MAPA
           END-IF.

           GOBACK.

       1000-PRIMERA-VEZ.
           MOVE LOW-VALUES TO ALL4MPO.
           MOVE 'INTRODUCE DNI Y PULSA ENTER' TO MSGO.
           PERFORM 8000-ENVIAR-MAPA.
           PERFORM 9000-RETORNAR-CICS.

       2000-RECIBIR-MAPA.
           MOVE LOW-VALUES TO ALL4MPI.
           MOVE LOW-VALUES TO ALL4MPO.
           EXEC CICS RECEIVE
                MAP('ALL4MP')
                MAPSET('ALL4MP')
                INTO(ALL4MPI)
                RESP(WS-CICS-RESP)
           END-EXEC.
           EVALUATE WS-CICS-RESP
              WHEN DFHRESP(NORMAL)
                   PERFORM 3000-PROCESAR-DNI
              WHEN DFHRESP(MAPFAIL)
                   PERFORM 4000-FALLO-MAPA
              WHEN OTHER
                   PERFORM 7000-ERROR-CICS
           END-EVALUATE.

       3000-PROCESAR-DNI.
           MOVE DNII TO CL1.
           MOVE LOW-VALUES TO ALL4MPO.
           EXEC SQL
                SELECT NOMBRE,
                       APELLIDOS,
                       DIRECCION
                  INTO :CL2,
                       :CL3,
                       :CL4
                  FROM IBMUSER.CLIENTES
                 WHERE DNI = :CL1
           END-EXEC.
           EVALUATE SQLCODE
              WHEN 0
                   MOVE CL1 TO DNIO
                   MOVE CL2 TO NOMBREO
                   MOVE CL3 TO APELLIDO
                   MOVE CL4 TO DIRECCIO
                   MOVE 'CLIENTE ENCONTRADO EN DB2' TO MSGO
              WHEN +100
                   MOVE CL1 TO DNIO
                   MOVE SPACES TO NOMBREO
                   MOVE SPACES TO APELLIDO
                   MOVE SPACES TO DIRECCIO
                   MOVE 'CLIENTE NO EXISTE EN DB2' TO MSGO
              WHEN OTHER
                   PERFORM 7100-ERROR-DB2
           END-EVALUATE.
           PERFORM 8000-ENVIAR-MAPA.
           PERFORM 9000-RETORNAR-CICS.

       4000-FALLO-MAPA.
           MOVE LOW-VALUES TO ALL4MPO.
           MOVE 'NO HAS INTRODUCIDO NINGUN DNI' TO MSGO.
           PERFORM 8000-ENVIAR-MAPA.
           PERFORM 9000-RETORNAR-CICS.

       7000-ERROR-CICS.
           MOVE LOW-VALUES TO ALL4MPO.
           MOVE 'ERROR CICS RECIBIENDO EL MAPA' TO MSGO.
           PERFORM 8000-ENVIAR-MAPA.
           PERFORM 9000-RETORNAR-CICS.

       7100-ERROR-DB2.
           MOVE SQLCODE TO WS-SQLCODE-DISP.
           MOVE SPACES TO MSGO.
           STRING 'ERROR DB2 SQLCODE '
                  WS-SQLCODE-DISP
             DELIMITED BY SIZE
             INTO MSGO
           END-STRING.

       8000-ENVIAR-MAPA.
           EXEC CICS SEND
                MAP('ALL4MP')
                MAPSET('ALL4MP')
                FROM(ALL4MPO)
                ERASE
                FREEKB
           END-EXEC.

       9000-RETORNAR-CICS.
           EXEC CICS RETURN
                TRANSID('ALL4')
                COMMAREA(MI-COMMAREA)
                LENGTH(8)
           END-EXEC.
