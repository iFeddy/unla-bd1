USE `terminalautomotriz`;
DROP procedure IF EXISTS `ProveedorAlta`;

DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE ProveedorAlta (
	in razonSocialA varchar(45),
    out nResultado int,
    out nMensaje varchar(25)
)
BEGIN
	if exists(select razonSocial from proveedor where razonSocial=razonSocialA)then
    set nResultado=-1;
    set nMensaje='Error, ya existe';
    else
    insert into proveedor(razonSocial)
    values(razonSocialA);
    set nResultado=0;
    set nMensaje='Ingreso exitoso';
    end if;
END$$

DELIMITER ;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `proveedorEliminar`;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `proveedorEliminar`;

DELIMITER $$
USE `terminalautomotriz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorEliminar`(
	in idE int
)
BEGIN
	update proveedor set eliminado=true,fechaEliminado=now() where idProveedor=idE;
END$$

DELIMITER ;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `proveedorModificar`;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `proveedorModificar`;

DELIMITER $$
USE `terminalautomotriz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedorModificar`(
	in razonSocialM varchar(45),
    in idM int
)
BEGIN
	update proveedor set razonSocial=razonSocialM where idProveedor=idM;
END$$

DELIMITER ;

