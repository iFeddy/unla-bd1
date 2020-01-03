CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_produccion`(
	in iPatente VARCHAR(8),
    out nResultado INT,
    out cMensaje VARCHAR(255)
)
BEGIN
	/* Ver si esta disponible la estacion para iniciar la primer tarea */
	IF(EXISTS(SELECT * FROM terminal_estaciones WHERE montajeId = (SELECT montajeId FROM terminal_produccion WHERE patente = iPatente LIMIT 1) ORDER by tareasId ASC LIMIT 1)) THEN
		/*Primera Tarea */
        SET @iID = (SELECT id FROM terminal_estaciones WHERE montajeId = (SELECT montajeId FROM terminal_produccion WHERE patente = iPatente LIMIT 1) ORDER by tareasId ASC LIMIT 1);
		IF(EXISTS(SELECT * FROM terminal_estaciones where id = @iID AND disponible = 0)) THEN
			/*Estacion Disponible*/
			UPDATE terminal_estaciones SET disponible = 1 WHERE id = @iID;
            INSERT INTO terminal_produccion_etapa (patente, estacion, fechaIngreso) VALUES (iPatente, @iID, NOW());
            set cMensaje = "Estacion Disponible - Asignada a la Patente Ingresada";
			set nResultado = 0;
		ELSE
			set nResultado = -1;
			set cMensaje = "La estacion se encuentra ocupada";
        END IF;
    ELSE
		set nResultado = -2;
        set cMensaje = "No Se Encontraron Estaciones con Tareas";
    END IF;
END