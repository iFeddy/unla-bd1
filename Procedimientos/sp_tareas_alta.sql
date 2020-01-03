CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tareas_alta`(
	in NombreTarea VARCHAR(45),
    out nResultado INT,
    out cMensaje VARCHAR(255)
)
BEGIN
	INSERT INTO terminal_tareas (nombre) VALUES (NombreTarea);
    set nResultado = 0;
    set cMensaje = "Tarea Agregada Correctamente";
END