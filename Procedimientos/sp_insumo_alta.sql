CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insumo_alta`(
	in CodigoInsumo INT,
	in NombreInsumo VARCHAR(45),
    in DescInsumo VARCHAR(45),
    in StockInicial INT,
    out nResultado INT,
    out cMensaje VARCHAR(45)
)
BEGIN
	IF(EXISTS(SELECT * FROM insumos WHERE id = CodigoInsumo)) THEN
		set cMensaje = "Ya esta cargado el Insumo";
        set nResultado = -1;
    ELSE
		INSERT INTO insumos (id, nombre, descripcion, stock) VALUES (CodigoInsumo, NombreInsumo, DescInsumo, StockInicial);
		set cMensaje = "Insumo Cargado Exitosamente";
        set nResultado = 0;
    END IF;
END