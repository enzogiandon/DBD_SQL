/* PUNTO 6 
*/

SELECT C.nombre, C.apellido, C.telefono, C.DNI
FROM CLIENTE C 
WHERE C.idCliente IN (
	SELECT C.idCliente
	FROM CLIENTE C
	INNER JOIN FACTURA F ON F.idCliente = C.idCliente
	INNER JOIN DETALLE D ON F.nroTicket = d.nroTicket
	INNER JOIN PRODUCTO P ON D.idProducto = P.idProducto
	WHERE  P.nombreP = 'prod1'
)	

AND C.idCliente IN (
	SELECT C.idCliente
	FROM CLIENTE C
	INNER JOIN FACTURA F ON F.idCliente = C.idCliente
	INNER JOIN DETALLE D ON F.nroTicket = d.nroTicket	
	INNER JOIN PRODUCTO P ON D.idProducto = P.idProducto
	WHERE  P.nombreP = 'prod2'
)	
 AND C.idCliente NOT IN (
	SELECT C.idCliente
	FROM CLIENTE C
	INNER JOIN FACTURA F ON F.idCliente = C.idCliente
	INNER JOIN DETALLE D ON F.nroTicket = d.nroTicket	
	INNER JOIN PRODUCTO P ON D.idProducto = P.idProducto
	WHERE  P.nombreP = 'prod3'
 
 
 )


