opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Agregar nueva tarea');
	disp('2. Marcar como completada');
	disp('3. Salir');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        nombre=input('Descripción de la tarea: ','s');
        fecha=input('Fecha para completarla (Año/mes/día): ','s');

        query="INSERT INTO tareas (descrip,vence) VALUES ($1,$2)";
        datos=pq_exec_params(conn,query,{nombre,fecha});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

    case 2
    try
	    nombre=input('Descripción de la tarea: ','s');
        query="SELECT descrip FROM tareas WHERE descrip=$1";
        buscar=pq_exec_params(conn,query,{nombre});

        if ~isempty(buscar)
          query="DELETE FROM tareas WHERE descrip=$1";
          borrar=pq_exec_params(conn,query,{nombre});
          disp('¡Tarea completada!');

        else
          disp('Error/tarea no encontrada');
        end
      catch
         disp('Error al completar')
      end
	  case 3
     disp('Saliendo del programa...');
     break;

   otherwise
      disp('Opción no válida.');
	end
end
