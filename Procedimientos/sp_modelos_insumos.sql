CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modelos_insumos`(
	in ModeloID VARCHAR(45),
    in InsumoID INT,
    in Cantidad FLOAT,
    out nResultado INT
)
BEGIN
	set nResultado = -1;
	INSERT INTO autos_insumos (modeloId, insumoId, cant) VALUES (ModeloID, InsumoID, Cantidad);
    IF( row_count() > 0 ) THEN
		set nResultado = 0;
    END IF;    
END