CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_etapa`(
	in iPatente VARCHAR(8),
    out cMensaje VARCHAR(255),
    out nResultado INT
)
BEGIN
	IF(EXISTS(SELECT * FROM terminal_produccion_etapa WHERE patente = iPatente ORDER BY id ASC LIMIT 1)) THEN
		/*Necesito saber en que estacion esta*/
        SET @iEstacion = (SELECT estacion FROM terminal_produccion_etapa WHERE patente = iPatente ORDER BY id DESC LIMIT 1);
        SET @iTareaActual = (SELECT tareasId FROM terminal_produccion_etapa INNER JOIN terminal_estaciones on terminal_estaciones.id = terminal_produccion_etapa.estacion LIMIT 1);
        SET @iMontajeID = (SELECT montajeId FROM terminal_produccion_etapa INNER JOIN terminal_estaciones on terminal_estaciones.id = terminal_produccion_etapa.estacion LIMIT 1);
        SET @iProxEstacion = (SELECT id FROM terminal_estaciones WHERE montajeId = @iMontajeID and tareasId > @iTareaActual ORDER BY id ASC LIMIT 1);
        SET @iPedidoNro = (SELECT pedidoNro FROM terminal_produccion WHERE patente = iPatente ORDER BY id DESC LIMIT 1);
        /*Actualizo que termino la tarea*/
        IF(IFNULL(@iProxEstacion, 1) = 1) THEN
			UPDATE terminal_estaciones SET disponible = 0 WHERE id = @iEstacion;
			UPDATE terminal_produccion SET fechaEgreso = NOW() WHERE patente = iPatente ORDER BY id DESC LIMIT 1;
			UPDATE terminal_produccion_etapa SET fechaEgreso = NOW() WHERE patente = iPatente ORDER BY id DESC LIMIT 1;
            UPDATE concesionarias_ventas SET entregado = 1, fechaEntrega = NOW() WHERE id = @iPedidoNro;
			set cMensaje = "Termino la produccion llego al final";			
		ELSE
			UPDATE terminal_produccion_etapa SET fechaEgreso = NOW() WHERE patente = iPatente ORDER BY id DESC LIMIT 1;
			INSERT INTO terminal_produccion_etapa (patente, estacion, fechaIngreso) VALUES (iPatente, @iProxEstacion, NOW());
			set nResultado = 0;
			set cMensaje = "Se actualizo la estacion y etapa";
        END IF;
    ELSE
		set nResultado = -1;
		set cMensaje = "";
    END IF;
END