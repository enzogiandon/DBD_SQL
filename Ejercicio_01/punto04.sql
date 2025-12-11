-- Ej 4


SELECT DISTINCT P.nombreP, P.descripcion, P.precio, P.stock
FROM Producto P
WHERE P.idProducto NOT IN (
    SELECT D.idProducto
    FROM Cliente C
    JOIN Factura F ON C.idCliente = F.idCliente
    JOIN Detalle D ON F.nroTicket = D.nroTicket
    WHERE C.telefono LIKE '221%'
)
ORDER BY P.nombreP;
