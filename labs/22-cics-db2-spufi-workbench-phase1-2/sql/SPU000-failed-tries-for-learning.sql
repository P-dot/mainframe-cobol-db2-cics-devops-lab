-- Intento 1: falló en el entorno del lab con SQLCODE -204.
-- Motivo observado: SYSIBM.SYSDUMMY1 no estaba definido/resuelto.
SELECT CURRENT DATE
FROM SYSIBM.SYSDUMMY1;

-- Intento 2: falló en el entorno del lab con SQLCODE -142.
-- Motivo observado: esta forma de sentencia no estaba soportada.
VALUES CURRENT DATE;
