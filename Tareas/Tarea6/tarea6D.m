pkg load database;
conn=pq_connect(setdbopts('dbname','tarea','host','localhost','port','5432','user','postgres','password','alequipe18'));

opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Agregar nuevo pedido');
	disp('2. Actualizar pedido');
	disp('3. Eliminar pedido');
	disp('4. Salir');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        nombre=input('Nombre del destinatario: ','s');
        monto=input('Monto del pedido: ');
        direc=input('Dirección del envío: ','s');

        query="INSERT INTO pedidos (nombre,monto,envio) VALUES ($1,$2,$3)";
        datos=pq_exec_params(conn,query,{nombre,monto,direc});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

    case 2
	    try
        nombre=input('Nombre del destinatario: ','s');
        Nnombre=input('Editar nombre del destinatario: ','s');
        Nmonto=input('Editar monto del envío: ');
        Ndirec=input('Editar dirección del envío: ','s');

        query="UPDATE pedidos SET nombre=$1,monto=$2,envio=$3 WHERE nombre=$4";
        datos=pq_exec_params(conn,query,{Nnombre,Nmonto,Ndirec,nombre});
        disp('¡Datos actualizados!');

      catch
         disp('Error/Pedido no encontrado')
      end
	  case 3
      try
        nombre=input('Nombre del destinatario: ','s');
        query="SELECT nombre FROM pedidos WHERE nombre=$1";
        buscar=pq_exec_params(conn,query,{nombre});

        if ~isempty(buscar)
          query="DELETE FROM pedidos WHERE nombre=$1";
          borrar=pq_exec_params(conn,query,{nombre});
          disp('¡Datos eliminados!');

        else
          disp('Error/Pedido no encontrado');
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
