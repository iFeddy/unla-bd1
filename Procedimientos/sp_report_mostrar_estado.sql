CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_report_mostrar_estado`(
	in iPedidoNro INT
)
BEGIN

	DECLARE iPatente VARCHAR(255);
    DECLARE iFechaEntregado DATETIME;
    DECLARE iEntregado VARCHAR(45);
    DECLARE iEstacion INT;
    DECLARE iTarea VARCHAR(255);
    
    DROP TABLE IF EXISTS tempReporteVehiculo;
    
	CREATE TEMPORARY TABLE tempReporteVehiculo
	(
		NumeroPedido INT not null,
		NumeroPatente VARCHAR(8),
        Terminado VARCHAR(45) not null,
        FechaEntregado datetime,
        Estacion INT,
        Tarea VARCHAR(255)
	);
    
    SELECT 
		terminal_produccion.patente,
		terminal_produccion.fechaEgreso,
		terminal_produccion_etapa.estacion,
		terminal_tareas.nombre
	INTO
		iPatente, iFechaEntregado, iEstacion, iTarea
	FROM
		terminal_produccion
			INNER JOIN
		terminal_produccion_etapa ON terminal_produccion.patente = terminal_produccion_etapa.patente
			INNER JOIN
		terminal_estaciones ON terminal_produccion_etapa.estacion = terminal_estaciones.id
			INNER JOIN
		terminal_tareas ON terminal_tareas.id = terminal_estaciones.tareasId
	WHERE
		pedidoNro = iPedidoNro
	ORDER BY estacion DESC
	LIMIT 1;
    

    IF(IFNULL(iFechaEntregado, 1) = 1) THEN
		set iEntregado = "No";
	ELSE
		set iEntregado = "Si";
        set iEstacion = 0;
        set iTarea = "-";
	END IF;

	INSERT INTO tempReporteVehiculo VALUES (iPedidoNro, iPatente, iEntregado, iFechaEntregado, iEstacion, iTarea);
    SELECT * FROM tempReporteVehiculo;
END