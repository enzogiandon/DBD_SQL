-- Punto 10

SELECT C.DNI, C.apellido, C.nombre, SUM(F.TOTAL) AS MONTO_TOTAL
FROM CLIENTE C 
INNER JOIN FACTURA F ON C.idCliente = F.idCliente
GROUP BY
C.DNI, C.apellido, C.nombre
HAVING SUM(F.total) > 100000;