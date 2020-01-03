CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concesionarias_alta`(
	in 	cNombre varchar(45),
    out cID int,
    out cMensaje varchar(255),
    out nResultado int
)
BEGIN
	if exists(select nombre, id from concesionarias where nombre = cNombre) then
		set cMensaje= 'La Concesionaria ya Existe en la Base de Datos';
		set cID = (select id from concesionarias where nombre = cNombre);
        set nResultado = -1;
    else
		insert into concesionarias(nombre) values(cNombre);
		set cMensaje= 'Ingreso Exitoso';
        set cID = (select id from concesionarias where nombre = cNombre);
        set nResultado = 0;
    end if;
END