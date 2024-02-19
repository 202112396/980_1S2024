pkg load database;
conn=pq_connect(setdbopts('dbname','tarea','host','localhost','port','5432','user','postgres','password','alequipe18'));

opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Agregar nueva venta');
	disp('2. Mostrar información');
	disp('3. Salir');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        nombre=input('Nombre del cliente: ','s');
        producto=input('Producto de la venta: ','s');
        precio=input('Precio de la venta: ');

        query="INSERT INTO ventas (cliente,producto,precio) VALUES ($1,$2,$3)";
        datos=pq_exec_params(conn,query,{nombre,producto,precio});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

	  case 2
      try
        nombre=input('Nombre del cliente de la venta: ','s');
        query="SELECT cliente,producto,precio FROM ventas WHERE cliente=$1";
        buscar=pq_exec_params(conn,query,{nombre})

      catch
        disp('Error al mostrar/Venta no encontrada');
      end
	  case 3
      disp('Saliendo del programa...');
      break;

   otherwise
      disp('Opción no válida.');
	end
end
