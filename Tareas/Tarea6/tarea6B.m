pkg load database;
conn=pq_connect(setdbopts('dbname','tarea','host','localhost','port','5432','user','postgres','password','alequipe18'));

opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:');
	disp('1. Agregar nuevo gasto');
	disp('2. Editar información');
	disp('3. Mostrar resumen');
	disp('4. Salir');
	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        nombre=input('Nombre del registro: ','s');
        credito=input('Crédito: ');
        debito=input('Débito: ');

        query="INSERT INTO presupuesto (nombre,credito,debito) VALUES ($1,$2,$3)";
        datos=pq_exec_params(conn,query,{nombre,credito,debito});
        disp('¡Datos ingresados!');

      catch
        disp('Error al guardar')
      end

    case 2
	    try
        nombre=input('Nombre del registro: ','s');
        Nnombre=input('Editar nombre del registro: ','s');
        Ncredito=input('Editar el monto de crédito: ');
        Ndebito=input('Editar el monto de débito: ');

        query="UPDATE presupuesto SET nombre=$1,credito=$2,debito=$3 WHERE nombre=$4";
        datos=pq_exec_params(conn,query,{Nnombre,Ncredito,Ndebito,nombre});
        disp('¡Datos actualizados!');

      catch
         disp('Error/Registro no encontrado')
      end
	  case 3
      try
        nombre=input('Nombre del registro: ','s');
        query="SELECT * FROM presupuesto WHERE nombre=$1";
        buscar=pq_exec_params(conn,query,{nombre})

      catch
        disp('Error al eliminar');
      end
	  case 4
      disp('Saliendo del programa...');

   otherwise
      disp('Opción no válida.');
	end
end
