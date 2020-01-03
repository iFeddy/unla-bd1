CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proveedor_modificar`(
	in pID int,
	in pNuevoNombre varchar(45),
    out pMensaje VARCHAR(255),
    out nResultado INT
)
BEGIN
	update terminal_proveedores set nombre = pNuevoNombre where id = pID;
    IF( row_count() > 0 ) THEN
		set pMensaje = "Proveedor Modificado Correctamente";
        set nResultado = 0;
    ELSE
		set pMensaje = "No se Encontro el Proveedor";
        set nResultado = -1;
    END IF;
END