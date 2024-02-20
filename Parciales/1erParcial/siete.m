opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Ingresar nuevo gasto de viaje');
	disp('2. Ver registros');
	disp('3. Eliminar registros');
	disp('4. Salir');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        aloj=input('Precio de alojamiento(Q): ');
        trans=input('Precio de transporte(Q): ');
        alim=input('Precio de alimentación(Q): ');
        total=aloj+trans+alim;
        disp(sprintf('Gastaste un total de: %d',total));

        query="INSERT INTO viajes (aloj,trans,alimentos) VALUES ($1,$2,$3)";
        datos=pq_exec_params(conn,query,{aloj,trans,alim});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

    case 2
	    try
        query="SELECT * FROM viajes";
        buscar=pq_exec_params(conn,query)

      catch
         disp('Error al mostrar registros')
      end

	  case 3
      try
        query="SELECT * FROM viajes";
        buscar=pq_exec_params(conn,query);

        if ~isempty(buscar)
          query="DELETE FROM viajes";
          borrar=pq_exec_params(conn,query);
          disp('¡Registros eliminados!');

        else
          disp('Error al eliminar registros');
        end
      catch
        disp('Error al eliminar');
      end
	  case 4
      disp('Saliendo del programa...');
      break;

   otherwise
      disp('Opción no válida.');
	end
end
