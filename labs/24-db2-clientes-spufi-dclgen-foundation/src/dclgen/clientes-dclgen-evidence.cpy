      ******************************************************************
      * DCLGEN generado para IBMUSER.CLIENTES.
      * Evidencia: IBMUSER.DB2LAB.DCLSEQ.COBOL.
      * Nota: en este entorno el DCLGEN genero nombres CL1..CL4.
      ******************************************************************
           EXEC SQL DECLARE IBMUSER.CLIENTES TABLE
           ( DNI        CHAR(9)  NOT NULL,
             NOMBRE     CHAR(20) NOT NULL,
             APELLIDOS  CHAR(30) NOT NULL,
             DIRECCION  CHAR(35) NOT NULL
           ) END-EXEC.
      *
       01  DCLCLIENTES.
           10 CL1                  PIC X(9).
           10 CL2                  PIC X(20).
           10 CL3                  PIC X(30).
           10 CL4                  PIC X(35).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 4
      ******************************************************************
