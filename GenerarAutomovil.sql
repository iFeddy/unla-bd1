USE `terminalautomotriz`;
DROP procedure if exists `GenerarAutomovil`;

DELIMITER $$

CREATE PROCEDURE GenerarAutomovil ()

BEGIN
    
    declare curDetallePedido
    cursor for select idPedidos,Cantidad 
	FROM detallePedido WHERE idPedido = idPedidoParametro;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
           
	OPEN curDetallePedido;
		DECLARE idPedidoParametro INTEGER DEFAULT 0;
		DECLARE getDetalle INTEGER DEFAULT 0;
    
		getDetalle: LOOP
			FETCH curDetallePedido INTO idPedidoParametro, Cantidad
			IF finished = 1 THEN
			LEAVE getDetalle
			END IF;
 
			SET nInsertados = 0;
 
				-- Aca loopeo para hacer N inserts.
			WHILE nInsertados < nCantidadDetalle DO
 
				INSERT INTO Vehiculo (idModelo, idPedido)
				VALUES (idModeloParametro, idPedidoParametro);
 
				SET nInsertados = nInsertados  +1;
 
			END WHILE

        
	END LOOP getDetalle;
    
    CLOSE curDetallePedido;
        
        
        
END

DELIMITER ;

