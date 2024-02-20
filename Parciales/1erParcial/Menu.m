pkg load database;
conn=pq_connect(setdbopts('dbname','1parcial','host','localhost','port','5432','user','postgres','password','alequipe18'));

usuario=input('Ingrese su usuario: ','s');
opcion=0;
  while opcion ~= 9
	disp('Seleccione una opción:');
	disp('1. Diario de ejercicios físicos');
	disp('2. Gestión de tareas pendientes');
	disp('3. Registro de consumo de agua');
	disp('4. Control de hábitos de lectura');
  disp('5. Seguimiento de gastos alimenticios');
  disp('6. Gestor de proyectos personales');
  disp('7. Registro de gastos de viajes');
  disp('8. Control de horas de sueño');
  disp('9. Salir');

	opcion=input('Ingrese su elección: ');
	switch opcion
    case 1
      try
        run("uno.m")
      catch
        disp('Error del programa');
      end
    case 2
      try
        run("dos.m")
      catch
        disp('Error del programa');
      end
    case 3
      try
        run("tres.m")
      catch
        disp('Error del programa');
      end
    case 4
      try
        run("cuatro.m")
      catch
        disp('Error del programa');
      end
    case 5
      try
        run("cinco.m")
      catch
        disp('Error del programa');
      end
    case 6
      try
        run("seis.m")
      catch
        disp('Error del programa');
      end
    case 7
      try
        run("siete.m")
      catch
        disp('Error del programa');
      end
    case 8
      try
        run("ocho.m")
      catch
        disp('Error del programa');
      end
    case 9
      disp('Saliendo del programa...');
      break;

  otherwise
    disp('Opción no válida.');
    end
end
