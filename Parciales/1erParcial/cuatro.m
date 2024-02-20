opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Registrar un nuevo libro leído');
  disp('2. Registrar una meta')
	disp('3. Recibir recomendaciones');
	disp('4. Salir');

	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        nombre=input('Título de la obra: ','s');
        autor=input('Autor de la obra: ','s');
        meta=('Terminado');

        query="INSERT INTO lectura (libro,autor,meta) VALUES ($1,$2,$3)";
        datos=pq_exec_params(conn,query,{nombre,autor,meta});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

    case 2
	    try
        nombre=input('Título de la obra: ','s');
        autor=input('Autor de la obra: ','s');
        meta=input('Plazo de la meta: ','s');

        query="INSERT INTO lectura (libro,autor,meta) VALUES ($1,$2,$3)";
        datos=pq_exec_params(conn,query,{nombre,autor,meta});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end
	  case 3
      try
        nombre=input('Libro para recomendar: ','s');
        query="SELECT libro,autor FROM lectura WHERE autor=$1";
        buscar=pq_exec_params(conn,query,{nombre})

      catch
        disp('Error al mostrar');
      end
	  case 4
      disp('Saliendo del programa...');
      break;

   otherwise
      disp('Opción no válida.');
	end
end
