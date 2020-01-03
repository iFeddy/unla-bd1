CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proveedor_alta`(
	in 	pRazonSocial varchar(45),
    out pID int,
    out pMensaje varchar(255),
    out nResultado INT
)
BEGIN
	if exists(select nombre, id from terminal_proveedores where nombre = pRazonSocial) then
		set pMensaje= 'La Razon Social ya Existe en la Base de Datos';
		set pID = (select id from terminal_proveedores where nombre = pRazonSocial);
        set nResultado = -1;
    else
		insert into terminal_proveedores(nombre) values(pRazonSocial);
		set pMensaje= 'Ingreso Exitoso';
        set pID = (select id from terminal_proveedores where nombre = pRazonSocial);
        set nResultado = 0;
    end if;
END