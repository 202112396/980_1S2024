opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Agregar nuevo ejercicio');
	disp('2. Mostrar información');
	disp('3. Salir');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        ejercicio=input('Nombre del ejercicio: ','s');
        dific=input('Dificultad del ejercicio: ');
        rutina=input('Rutina del ejercicio: ','s');

        query="INSERT INTO fisicos (ejercicio,dificultad,rutina) VALUES ($1,$2,$3)";
        datos=pq_exec_params(conn,query,{ejercicio,dific,rutina});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

	  case 2
      try
        nombre=input('Nombre del ejercicio: ','s');
        query="SELECT ejercicio,dificultad,rutina FROM fisicos WHERE ejercicio=$1";
        buscar=pq_exec_params(conn,query,{nombre})

      end
	  case 3
      disp('Saliendo del programa...');
      break;

   otherwise
      disp('Opción no válida.');
	end
end
