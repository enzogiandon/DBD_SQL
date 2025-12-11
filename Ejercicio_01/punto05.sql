SELECT 
    P.nombreP,
    P.descripcion,
    P.precio,
    SUM(D.cantidad) AS veces_vendido
FROM Producto P
LEFT JOIN Detalle D ON P.idProducto = D.idProducto
GROUP BY 
    P.idProducto,
    P.nombreP,
    P.descripcion,
    P.precio
ORDER BY 
    P.nombreP;
