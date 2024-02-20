opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Agregar nuevo proyecto');
	disp('2. Actualizar proyecto');
	disp('3. Salir');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        nombre=input('Descripción del nuevo proyecto: ','s');
        vence=input('Fecha de vencimiento: ','s');
        prog=input('Progreso actual del proyecto: ','s');

        query="INSERT INTO proyectos (decrip,vencimiento,progreso) VALUES ($1,$2,$3)";
        datos=pq_exec_params(conn,query,{nombre,vence,prog});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

    case 2
	    try
        nombre=input('Descripción del proyecto: ','s');
        Nnombre=input('Editar nombre del proyecto: ','s');
        Nfecha=input('Editar fecha de vencimiento: ','s');
        Nprog=input('Editar progreso del proyecto: ','s');

        query="UPDATE proyectos SET decrip=$1,vencimiento=$2,progreso=$3 WHERE decrip=$4";
        datos=pq_exec_params(conn,query,{Nnombre,Nfecha,Nprog,nombre});
        disp('¡Datos actualizados!');

      catch
         disp('Error/Proyecto no encontrado')
      end
	  case 3
      disp('Saliendo del programa...');
      break;

   otherwise
      disp('Opción no válida.');
	end
end
