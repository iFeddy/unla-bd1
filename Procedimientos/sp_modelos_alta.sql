CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modelos_alta`(
	in ModeloNombre VARCHAR(45),
    out nResultado INT
)
BEGIN
	set nResultado = -1;
	INSERT INTO autos_modelos (nombre) VALUES (ModeloNombre);
    IF( row_count() > 0 ) THEN
		set nResultado = 0;
    END IF;    
END