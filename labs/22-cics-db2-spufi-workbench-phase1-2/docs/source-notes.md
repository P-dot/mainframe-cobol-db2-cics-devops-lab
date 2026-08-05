# Fuente base del lab

Este lab se basa en el vídeo/transcripción de Mainframe Corner sobre preparación de entorno Db2 para convertir una transacción CICS/VSAM en una transacción CICS/Db2.

Alcance tomado del autor:

- Preparar datasets de trabajo para Db2.
- Usar SPUFI como herramienta de ejecución de SQL almacenado en miembros.
- Usar un dataset de salida para revisar SQLCODE y mensajes.
- No construir todavía el entorno completo de Db2: Storage Group, Database, Tablespace, Table, Index, Inserts y DCLGEN quedan para fases posteriores del Lab 22.

Aportación/adaptación al entorno del laboratorio:

- Se usa prefijo `IBMUSER.DB2LAB.*`, no `M.CORNER.*`.
- Se valida primero SPUFI contra catálogo Db2 con una consulta no destructiva.
- Se documentan los errores `SQLCODE -204`, `SQLCODE -142` y el comportamiento `SQLCODE 100` en SELECT dentro de SPUFI.
