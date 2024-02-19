opcion=0;
while opcion ~= 4
	disp('Seleccione una opción:')
	disp('1. Calcular IMC')
	disp('2. Leer datos almacenados')
	disp('3. Borrar datos almacenados')
	disp('4. Salir')
	opcion=input('Ingrese su elección: ');
	switch opcion
		case 1
			nombre=input('Ingrese su nombre: ',"s");
			altura=input('Ingrese su altura en metros: ');
			peso=input('Ingrese su peso en kilogramos: ');
			imc=peso/(altura^2);

			if imc<18.5
				rango='Bajo';
			elseif ((imc>=18.5) && (imc<=24.9))
				rango='Normal';
			elseif ((imc>24.9) && (imc<=29.9))
				rango='Sobrepeso';
			elseif imc>29.9
				rango='Obeso';
			end

			disp('Su índice de masa corporal es:'), disp(imc);
			disp('Categoría:'), disp(rango);

			disp('¿Desea guardar su resultado?');
			guarda=input('Si(1)/No(2):');
			if guarda==1
			  archivo = fopen('imc.txt', 'w');
        fprintf(archivo,'%s ', nombre);
        fprintf(archivo,'%d ', altura);
        fprintf(archivo,'%d ', peso);
        fprintf(archivo,'%d ', imc);
        fprintf(archivo,'%s\n', rango);
        fclose(archivo);
        disp('Datos guardados!')
      end

	 case 2
	    archivo = fopen('imc.txt','r');
      datos = fscanf(archivo,'%s');
      fclose(archivo);
      disp(datos);

	 case 3
	    archivo = fopen('imc.txt', 'w');
      fclose(archivo);
      disp('Datos eliminados!')

	 case 4
      disp('Saliendo del programa...');

   otherwise
      disp('Opción no válida.');
	end
end
