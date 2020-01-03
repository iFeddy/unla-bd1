CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insumo_detalles`(
	in CodigoProducto INT,
    in Precio FLOAT,
    in ProveedorID INT,
    out cMensaje VARCHAR(255),
    out nResultado INT
)
BEGIN
	/*ver porque con un segundo proveedor no entra en el primer else*/
	IF(EXISTS(SELECT * FROM insumos_detalle WHERE insumosId = CodigoProducto AND proveedorId = ProveedorID)) THEN
		IF(EXISTS(SELECT * FROM terminal_proveedores where id = ProveedorID)) THEN
			UPDATE insumos_detalle SET precio = Precio WHERE insumosId = CodigoProducto AND proveedorId = ProveedorID; 
			set cMensaje = "Detalle de Precio Actualizado";
			set nResultado = -1;
		ELSE
			set cMensaje = "No se Encontro el Proveedor";
            set nResultado = -3;
        END IF;
    ELSE
		IF(EXISTS(SELECT * FROM insumos WHERE id = CodigoProducto)) THEN
			IF(EXISTS(SELECT * FROM terminal_proveedores where id = ProveedorID)) THEN
				INSERT INTO insumos_detalle (insumosId, precio, proveedorId) VALUES (CodigoProducto, Precio, ProveedorID);
				set cMensaje = "Detalle de Insumo Cargado Exitosamente";
				set nResultado = 0;
			ELSE
            	set cMensaje = "No se Encontro el Proveedor";
				set nResultado = -3;
            END IF;
		ELSE
			set cMensaje = "No se encontro el Insumo";
            set nResultado = -2;
		END IF;
    END IF;
END