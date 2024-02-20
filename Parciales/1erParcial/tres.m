opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Agregar consumo de hoy');
	disp('2. Mostrar registro');
	disp('3. Salir');
	disp('|Recuerda tomar de 2 a 3 litros diarios|');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        hoy=now();
        fecha=datestr(hoy, 'yyyy-mm-dd HH:MM:SS');
        disp(['Fecha y hora actual: ' fecha]);
        lt=input('Cantidad de agua (en litros): ');

        query="INSERT INTO consumo (fecha,litros) VALUES ($1,$2)";
        datos=pq_exec_params(conn,query,{fecha,lt});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

	  case 2
      try
        query="SELECT * FROM consumo";
        buscar=pq_exec_params(conn,query,{nombre})

      catch
        disp('Error al mostrar');
      end
	  case 3
      disp('Saliendo del programa...');
      break;

   otherwise
      disp('Opción no válida.');
	end
end
