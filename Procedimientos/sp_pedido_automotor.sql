CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_automotor`(
	in ConcesionariaID INT,
    in ModeloPedido INT,
    out nPatente VARCHAR(8),
    out nResultado INT,
    out cMensaje VARCHAR(255)
)
BEGIN
	DECLARE cur_termino INT DEFAULT 0;
    DECLARE cur_insumo_id INT;
    DECLARE cur_insumo_cant INT;
    DECLARE cur_insumos CURSOR FOR SELECT insumoId, cant FROM autos_insumos WHERE modeloId = ModeloPedido;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET cur_termino = 1;
    
	IF(EXISTS(SELECT * FROM concesionarias WHERE id = ConcesionariaID)) THEN
		IF(EXISTS(SELECT * FROM autos_modelos WHERE id = ModeloPedido)) THEN
				set nResultado = 0;
                /*Buscar la cantidad de autos que hay en produccion para sacar la fecha de entrega aprox*/
                INSERT INTO concesionarias_ventas (concesionariaId, modeloId, fechaEntregaAprox) VALUES (ConcesionariaID, ModeloPedido, NOW() + INTERVAL 7 DAY);
				SET @PedidoNro = (SELECT id FROM concesionarias_ventas ORDER BY id DESC LIMIT 1);
                /*Ingresa el Auto a Produccion y si no tiene los insumos pide a los proveedores*/
                OPEN cur_insumos;
                REPEAT
                FETCH cur_insumos INTO cur_insumo_id, cur_insumo_cant;
                IF((SELECT stock FROM insumos WHERE id = cur_insumo_id LIMIT 1) < cur_insumo_cant) THEN
					INSERT INTO insumos_pedidos (insumoId, cantidad, proveedorId, pedidoNro) VALUES
                    (cur_insumo_id, cur_insumo_cant - (SELECT stock FROM insumos WHERE id = cur_insumo_id LIMIT 1), 
                    (SELECT proveedorId FROM insumos_detalle WHERE insumosId = cur_insumo_id ORDER BY precio DESC LIMIT 1), @PedidoNro);
                END IF;
                UNTIL cur_termino END REPEAT;
                CLOSE cur_insumos;
                /*Ahora Ingresa el Auto a Produccion VER ERROR de PATENTE DUPLICADA*/
                SELECT @iPatente := UPPER(SUBSTRING(MD5(RAND()) FROM 1 FOR 6));

                INSERT INTO terminal_produccion (modeloId, patente, pedidoNro, fechaIngreso) VALUES (ModeloPedido, @iPatente, @PedidoNro, NOW());
				
                UPDATE terminal_produccion SET montajeId = (SELECT id FROM terminal_montaje WHERE modelo = ModeloPedido) ORDER BY id DESC LIMIT 1;

                IF( row_count() < 1 ) THEN
					set cMensaje = "Error Patente Duplicada";
					set nResultado = -2;
				END IF;
                /*El Auto Ingresa a Montaje*/
                IF(EXISTS(SELECT * FROM terminal_montaje where modelo = ModeloPedido)) THEN
					UPDATE terminal_montaje SET PromAutosMes = (SELECT CONCAT((SELECT COUNT(*) FROM terminal_produccion WHERE MONTH(fechaIngreso) = MONTH(CURRENT_DATE())) * 100 / COUNT(*), "%") as Prom FROM terminal_produccion WHERE modeloId = ModeloPedido) WHERE modelo = ModeloPedido;
                ELSE
					INSERT INTO terminal_montaje (modelo, promAutosMes) VALUES (ModeloPedido, (SELECT CONCAT((SELECT COUNT(*) FROM terminal_produccion WHERE MONTH(fechaIngreso) = MONTH(CURRENT_DATE())) * 100 / COUNT(*), "%") as Prom FROM terminal_produccion));
				END IF;
                set nPatente = @iPatente;
                set cMensaje = "El Auto Fue Derivado a Produccion correctamente";
                set nResultado = 0;
            ELSE
				set cMensaje = "No Existe el Modelo de Auto";
                set nResultado = -1;
        END IF;
        ELSE
			set cMensaje = "No Existe la Concesionaria";
            set nResultado = -1;
    END IF;
END