CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concesionarias_eliminar`(
	in cId int,
    out cMensaje varchar(255),
    out nResultado int
)
BEGIN
	update concesionarias set eliminado = 1, eliminadoFecha = now() where id = cId;
    IF (SELECT row_count() > 0) THEN
		set cMensaje = "Concesionaria dada de Baja Correctamente";
        set nResultado = 0;
	ELSE 
		set cMensaje = "ID de Concesionaria no Encontrado";
        set nResultado = -1;
    END IF;
END