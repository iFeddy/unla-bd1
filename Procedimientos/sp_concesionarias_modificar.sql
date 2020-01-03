CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concesionarias_modificar`(
	in cID int,
	in cNuevoNombre varchar(45),
    out cMensaje VARCHAR(255),
    out nResultado INT
)
BEGIN
	update concesionarias set nombre = cNuevoNombre where id = cID;
    IF( row_count() > 0 ) THEN
		set cMensaje = "Concesionaria Modificada Correctamente";
        set nResultado = 0;
    ELSE
		set cMensaje = "No se Encontro la Concesionaria";
        set nResultado = -1;
    END IF;
END