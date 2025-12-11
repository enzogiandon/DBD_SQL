SELECT A.especie, A.anios, A.CALLE, A.nro, L.nombreL, PDOR.apellido
FROM ARBOL A 
INNER JOIN LOCALIDAD L ON A.codigoPostal = L.codigoPostal
INNER JOIN PODA P ON P.nroArbol = A.nroArbol
INNER JOIN PODADOR PDOR ON P.DNI = PDOR.DNI
WHERE (PDOR.NOMBRE = 'Juan' AND PDOR.apellido = 'Perez')
OR (PDOR.NOMBRE = 'Jose' AND PDOR.apellido = 'Garcia')