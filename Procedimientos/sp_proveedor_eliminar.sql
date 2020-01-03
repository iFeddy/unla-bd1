CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proveedor_eliminar`(
	in pID int,
    out pMensaje varchar(255),
    out nResultado INT
)
BEGIN
	update terminal_proveedores set eliminado = 1, eliminadoFecha = now() where id = pID;
    IF (SELECT row_count() > 0) THEN
		set pMensaje = "Proveedor dada de Baja Correctamente";
        set nResultado = 0;
	ELSE 
		set pMensaje = "ID de Proveedor no Encontrado";
        set nResultado = -1;
    END IF;
END