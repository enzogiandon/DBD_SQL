-- EJ 7
SELECT DISTINCT f.nroTicket, f.total, f.fecha, f.hora, c.DNI
FROM factura f 
join cliente c on f.idCliente = c.idCliente
WHERE f.nroTicket in (
-- facturas con prod38
	SELECT f.nroTicket
	from factura f2
	inner JOIN Detalle d on f2.nroTicket = d.nroTicket
	inner JOIN Producto p on p.idProducto = d.idProducto
	
	where p.nombreP = 'prod38'
)
OR f.nroTicket IN (
-- facturas con fecha 2023
	SELECT f3.nroTicket
	from factura f3
	WHERE f3.fecha >= '2023-01-01' AND f3.fecha < '2024-01-01'

)