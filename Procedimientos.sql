CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionariaAlta`(
	in nombreA varchar(45),
    in telefonoA varchar(45),
    in direccionA varchar(45)
)
BEGIN
	insert into concesionaria(nombre,telefono,direccion) 
    values(nombreA,telefonoA,direccionA);
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionariaEliminar`(in idE int)
BEGIN
	delete from concesionaria where idConcesionaria=idE;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionariaModificacion`(
	in nombreM varchar(45),
    in telefonoM varchar(45),
    in direccionM varchar(45),
    in idM int
)
BEGIN
	update concesionaria set nombre=nombreM,telefono=telefonoM,direccion=direccionM
    where idConcesionaria=idM;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `pedidosAlta`(
	in tipoPedidoA varchar(45),
    in cantidadA int,
    in idConcesionariaA int
)
BEGIN
	insert into pedidos(tipoPedido,cantidad,Concesionaria_idConcesionaria)
    values(tipoPedidoA,cantidadA,idConcesionariaA);
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `pedidosEliminar`(in idE int)
BEGIN
	delete from pedidos where idPedidos=idE;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `pedidosModificar`(
	in tipoPedidoM varchar(45),
    in cantidadM int,
    in idM int
)
BEGIN
	update pedidos set tipoPedido=tipoPedidoM,cantidad=cantidadM
    where idPedidos=idM;
END