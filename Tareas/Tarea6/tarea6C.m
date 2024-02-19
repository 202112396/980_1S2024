pkg load database;
conn=pq_connect(setdbopts('dbname','tarea','host','localhost','port','5432','user','postgres','password','alequipe18'));

opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Agregar nuevo producto');
	disp('2. Actualizar producto');
	disp('3. Eliminar producto');
	disp('4. Salir');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        nombre=input('Nombre del producto: ','s');
        stock=input('Existencias: ');
        precio=input('Precio del producto: ');

        query="INSERT INTO inventario (producto,stock,precio) VALUES ($1,$2,$3)";
        datos=pq_exec_params(conn,query,{nombre,stock,precio});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

    case 2
	    try
        nombre=input('Nombre del producto: ','s');
        Nnombre=input('Actualizar nombre del producto: ','s');
        Nstock=input('Actualizar existencias: ');
        Nprecio=input('Actualizar precio del producto: ');

        query="UPDATE inventario SET producto=$1,stock=$2,precio=$3 WHERE producto=$4";
        datos=pq_exec_params(conn,query,{Nnombre,Nstock,Nprecio,nombre});
        disp('¡Datos actualizados!');

      catch
         disp('Error/producto no encontrado')
      end
	  case 3
      try
        nombre=input('Nombre del producto: ','s');
        query="SELECT producto FROM inventario WHERE producto=$1";
        buscar=pq_exec_params(conn,query,{nombre});

        if ~isempty(buscar)
          query="DELETE FROM inventario WHERE producto=$1";
          borrar=pq_exec_params(conn,query,{nombre});
          disp('¡Datos eliminados!');

        else
          disp('Error/Producto no encontrado');
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
