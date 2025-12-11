-- Ejercicio 3
-- Primero tomo los productos no vendidos a Garcia, y de ahi busco el DNI

SELECT DISTINCT P.idProducto, P.nombreP, P.descripcion, P.precio, P.stock
FROM Producto P
WHERE P.idProducto IN (

    -- Productos vendidos al DNI pedido
    SELECT D.idProducto
    FROM Cliente C
    INNER JOIN Factura F ON C.idCliente = F.idCliente
    INNER JOIN Detalle D ON F.nroTicket = D.nroTicket
    WHERE C.DNI = 45789456

)
AND P.idProducto NOT IN (

    -- Productos vendidos a cualquier Garcia
    SELECT D.idProducto
    FROM Cliente C
    INNER JOIN Factura F ON C.idCliente = F.idCliente
    INNER JOIN Detalle D ON F.nroTicket = D.nroTicket
    WHERE C.apellido = 'Garcia'
);

