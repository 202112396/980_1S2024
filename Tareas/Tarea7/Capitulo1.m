#OBJETOS NUMÉRICOS
375
3.75e2
3.75E2
0x177

#número_inicial:salto:número_final
1:0.5:10
1:1.5:10
1:1.6:10

M = [1,2,3;4,5,6;7,8,9]
M = [1:4;5:8]

'Cadena de string'
"Cadena de string"

"\\"
"\a"

x = {}
x.secuencia = 1:5
x.matriz = [1,2;44,5]
x.string = 'Secuencia '
x

x.estructura = {}
x.estructura.numero = 0x177
x.estructura.letra = 'A'
x

#Operadores
x = 2
y = 3
x + y
x - y
x * y
x / y
x++ # x = x + 1
x-- # x = x - 1

x < y
x <= y
x == y
x > y
x >= y
x != y

x = 1
y = 0

x & y
x | y
not(x)


#Estructuras de control de flujo
x = 1
y = 0

if (x > y)
  'X es mayor a y'
elseif (x == y)
  'X y Y son iguales'
else
  'Y es mayor a X'
endif

x = 1
y = 0
z = -5
if (x > y & z < 0)
  'X es mayor a y z es menor a 0'
elseif (x == y | z < 0)
  'X y Y son iguales'
else
  'Y es mayor a X'
endif

while(z < y)
  'Valor de z'
  z
  ++z
endwhile

fib = ones(1, 10)
for i = 3:10
  fib(i) = fib(i-1) + fib(i-2);
endfor
fib

try
  m = [1:3;10:15]
catch
  'NO SE PUDO EJECUTAR, se continua con la ejecuacion normal del codigo'
end_try_catch

#Matriz
M = [1,2,7; 4,5,11;0.1,0.2,0.3]
N = [0,1,2; 8,10,12;0x177,0x176,0x125]
M + N
M - N
M .* N
cross(M,N) #M X N
dot(M,N)
M'


#FUNCIONES
[x,b] = hipotenusa(2,2)

#Graficas
x = [-3:0.1:1] #Alternativa x = linspace(-3,1,50)
plot(x, funcion(x),'Color','green','LineStyle',':')
stem(x, funcion(x),'Color','green','LineStyle',':')
title('Titulo')
ylabel('Eje y')
xlabel('Eje x')
legend('Funcion')

#{
x = [0:0.1:4*pi];
y1 = sin(x);
y2 = cos (x);
hold on;
p1 = plot(x,y1);
p2 = plot(x,y2);
set (p1,'Color','red','LineWidth',2)
set (p2,'Color','blue','LineWidth',1)
ylabel('EJE Y');
xlabel('Eje x');
title('Seno y Coseno');
legend('Seno','Coseno');
hold off;
}#