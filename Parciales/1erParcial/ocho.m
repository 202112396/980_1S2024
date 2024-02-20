opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Agregar nuevo registro de sueño');
	disp('2. Ver historial');
	disp('3. Salir');
	disp('|Recueda dormir al menos 7 - 8 horas diarias|');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        horas=input('Horas dormidas la noche anterior: ');
        periodo=input('Periodo de reposo: ','s');

        query="INSERT INTO sueño (horas,periodo) VALUES ($1,$2)";
        datos=pq_exec_params(conn,query,{horas,periodo});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

	  case 2
      try
        query="SELECT * FROM sueño";
        buscar=pq_exec_params(conn,query)

      catch
        disp('Error al mostrar historial');
      end

	  case 3
      disp('Saliendo del programa...');
      break;

   otherwise
      disp('Opción no válida.');
	end
end
