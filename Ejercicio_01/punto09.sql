SELECT F.nroTicket, F.total, F.FECHA, F.HORA
FROM FACTURA F
INNER JOIN CLIENTE C ON F.idCliente = C.idCliente
WHERE C.nombre = 'Jorge' AND C.apellido = 'Pérez'
AND F.nroTicket NOT IN (
	SELECT F2.nroTicket
	FROM FACTURA F2
	INNER JOIN DETALLE D ON F2.nroTicket = d.nroTicket
	inner join Producto p on  d.idProducto = p.idProducto
	WHERE P.nombreP = 'Z'
);


/* OTRA SUBCONSULTA PUEDE SER

  AND NOT EXISTS (
      SELECT *
      FROM Detalle d
      JOIN Producto p ON p.idProducto = d.idProducto
      WHERE d.nroTicket = f.nroTicket
        AND p.nombreP = 'Z'
  );