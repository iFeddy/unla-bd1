USE `terminalautomotriz`;
DROP procedure IF EXISTS `ConcesionariaAlta`;

DELIMITER $$
CREATE PROCEDURE ConcesionariaAlta(
	in idConcesionaria INT,
    in Nombre VARCHAR (45),
    in Telefono VARCHAR (45),
    in Direccion TEXT (45),
    out nResultado int,
    out nMensaje varchar(25)
    )

BEGIN
	if exists(select idConcesionaria from Concesionaria where idConcesionaria=idConcesionariaA)then
    set nResultado=-1;
    set nMensaje='Error, ya existe';
    else
    insert into Concesionaria(idConcesionaria)
    values(idConcesionariaA);
    set nResultado=0;
    set nMensaje='Ingreso exitoso';
    end if;
END$$

DELIMITER;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `ConcesionariaBaja`;

DELIMITER $$ 

CREATE PROCEDURE ConcesionariaBaja(
	in idE int
)

BEGIN
	update concesionaria set eliminado=true, fechaEliminado= now () where idConcesionaria=idE;
END$$

DELIMITER;

USE `terminalautomotriz`;
DROP procedure IF EXISTS `ConcesionariaModificar`;

DELIMITER $$

CREATE PROCEDURE ConcesionariaModificar(
	in idConcesionariaM int,
    in NombreM VARCHAR(45), 
	in TelefonoM VARCHAR (45),
    in DireccionM TEXT (45)
    )

BEGIN
	update Concesionaria set Nombre=NombreM, Telefono=TelefonoM, Direccion=Direccion=M
    where idConcesionaria=idConcesionariaM;
END$$

DELIMITER ;
