USE `terminalautomotriz`;
DROP procedure if exists `Montaje_Automovil`;

DELIMITER $$

CREATE PROCEDURE `Montaje_Automovil` (
	/*in NroChasis int,
    */
    out nMensaje Varchar (25)
)



BEGIN
	declare curLineaMontaje
    cursor for select idLineaMontaje from LineaMontaje where idLineaMontaje=idLineaMontajeParametro;
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
    open curLineaMontaje;
		declare idLineaMontajeParametro INTEGER DEFAULT 0;
        declare getParametro;
        
        getParametro: loop 
			fetch curLineaMontaje into idLineaMontaje 
            if finished = 1 then
            leave getLineaMontaje;
            end if;
		
        end loop;
	
    close curLineaMontaje;
    

	
    declare curEstacionesTrabajo
    cursor for select idEstacionesTrabajo from EstacionesTrabajo where idEstacionesTrabajo=idEstacionesTrabajoParametro;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
    open curEstacionesTrabajo;
		declare idEstacionesTrabajoParametro INTEGER DEFAULT 0;
        declare getParametroET;
        
        getParametroET: loop
			fetch curEstacionesTrabajo into idMontaje
            if finished = 1 then
            leave getEstacionesTrabajo;
            end if;
		end loop;
	close curEstacionesTrabajo;
    
    If NroOrden is NULL
		Insert into NroOrden values (1);
	else if
		set nMensaje='Ingreso erróneo, estación ocupada. Chasis' Modelo.NroChasis;
    end if;
    
END