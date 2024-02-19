pkg load database;
conn=pq_connect(setdbopts('dbname','tarea','host','localhost','port','5432','user','postgres','password','alequipe18'));

opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Agregar nuevo estudiante');
	disp('2. Editar información');
	disp('3. Eliminar información');
	disp('4. Salir');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        nombre=input('Nombre del estudiante: ','s');
        edad=input('Edad del estudiante: ');
        genero=input('Género del estudiante (1)M (0)H: ');
        if(genero==1)
          gen=true;
        elseif(genero==0)
          gen=false;
        else
          disp('Opción inválida')
          break
        end
        direc=input('Dirección del estudiante: ','s');

        query="INSERT INTO estudiante (nombre,edad,genero,direccion) VALUES ($1,$2,$3,$4)";
        datos=pq_exec_params(conn,query,{nombre,edad,gen,direc});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

    case 2
	    try
        nombre=input('Nombre del estudiante: ','s');
        Nnombre=input('Editar nombre del estudiante: ','s');
        Nedad=input('Editar edad del estudiante: ');
        genero=input('Editar género del estudiante (1)M (0)H: ');
        if(genero==1)
            Ngen=true;
          elseif(genero==0)
            Ngen=false;
          else
            disp('Opción inválida')
            break
          end
        Ndirec=input('Editar dirección del estudiante: ','s');

        query="UPDATE estudiante SET nombre=$1,edad=$2,genero=$3,direccion=$4 WHERE nombre=$5";
        datos=pq_exec_params(conn,query,{Nnombre,Nedad,Ngen,Ndirec,nombre});
        disp('¡Datos actualizados!');

      catch
         disp('Error/estudiante no encontrado')
      end
	  case 3
      try
        nombre=input('Nombre del estudiante: ','s');
        query="SELECT nombre,edad FROM estudiante WHERE nombre=$1";
        buscar=pq_exec_params(conn,query,{nombre});

        if ~isempty(buscar)
          query="DELETE FROM estudiante WHERE nombre=$1";
          borrar=pq_exec_params(conn,query,{nombre});
          disp('¡Datos eliminados!');

        else
          disp('Error/estudiante no encontrado');
        end
      catch
        disp('Error al eliminar');
      end
	  case 4
      disp('Saliendo del programa...');

   otherwise
      disp('Opción no válida.');
	end
end
