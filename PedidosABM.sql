USE `terminalautomotriz`;
DROP procedure IF EXISTS `pedidosAlta`;

DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE pedidosAlta (
	in tipoPedidoA varchar(45),
    in cantidadA int,
    in idConcesionaria int,
    out nResultado int,
    out nMensaje varchar(25)
)
BEGIN
	if exists(select TipoPedido from pedidos where TipoPedido=tipoPedidoA)then
    set nResultado=-1;
    set nMensaje='Error,ya fue cargado';
    else
    insert into pedidos(tipoPedido,cantidad,concesionaria_idConcesionaria)
    values(tipoPedidoA,cantidadA,idConcesionaria);
    set nResultado=0;
    set nMensaje='ingreso exitoso';
    end if;
END$$

DELIMITER ;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `pedidosEliminar`;

DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE pedidosEliminar (
	in idE int
)
BEGIN
	update pedidos set eliminado=true,fechaEliminado= now() where idPedidos=idE;
END$$

DELIMITER ;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `pedidosModificar`;

DELIMITER $$
USE `terminalautomotriz`$$
CREATE PROCEDURE pedidosModificar (
	in tipoPedidoM varchar(45),
    in cantidadM int,
    in idM int
)
BEGIN
	update pedidos set tipoPedido=tipoPedidoM,cantidad=cantidadM
    where idPedidos=idM;
END$$

DELIMITER ;
