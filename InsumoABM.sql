USE `terminalautomotriz`;
DROP procedure IF EXISTS `insumoAlta`;

DELIMITER $$
USE `terminalautomotriz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insumoAlta`(
	in nombreInsumoA varchar(45),
    in descripcionA varchar(45),
	out nResultado int,
    out nMensaje varchar(45)
)
BEGIN
	if exists(select nombreInsumo from insumo where nombreInsumo=nombreInsumoA)then
    set nResultado=-1;
    set nMensaje='Error,insumo ya cargado';
    else
    insert into insumo(nombreInsumo,descripcion)
    values(nombreInsumoA,descripcionA);
    set nResultado=0;
    set nMensaje='Ingreso exitoso';
    end if;
END$$

DELIMITER ;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `insumoEliminar`;

DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE insumoEliminar (
	in idE int
)
BEGIN
	update insumo set eliminado=true,fechaEliminado=now() where idInsumo=idE;
END$$

DELIMITER ;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `insumoModificar`;

DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE insumoModificar (
	in nombreInsumoM varchar(45),
    in descripcionM varchar(45),
    in idM int
)
BEGIN
	update insumo set nombreInsumo=nombreInsumoM,descripcion=descripcionM
    where idInsumo=idM;
END$$

DELIMITER ;
