opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Ingresar registro nuevo');
	disp('2. Mostrar registros');
	disp('3. Eliminar registros');
	disp('4. Salir');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        cal=input('Calorías consumidas: ');
        nombre=input('Nombre de la comida: ','s');
        peso=input('Tu peso actual: ');

        query="INSERT INTO alimento (calorias,descripcion,peso) VALUES ($1,$2,$3)";
        datos=pq_exec_params(conn,query,{cal,nombre,peso});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar');
      end

    case 2
	    try
        query="SELECT * FROM alimento";
        buscar=pq_exec_params(conn,query)

      catch
         disp('Erro al mostrar registro');
      end

	  case 3
      try
        query="SELECT * FROM alimento";
        buscar=pq_exec_params(conn,query);

        if ~isempty(buscar)
          query="DELETE FROM alimento";
          borrar=pq_exec_params(conn,query);
          disp('¡Datos eliminados!');

        else
          disp('Error/No existen registros');
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
