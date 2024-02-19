/*
--drop table if exists estudiante;
create table estudiante(
	nombre varchar(25),
	edad int,
	genero boolean, --true:mujer false:hombre
	direccion varchar (30)
);

insert into estudiante values ('Alejandro',20,false,'Ciudad de Guatemala');
select * from estudiante;
*/

/*
--drop table if exists presupuesto;
create table presupuesto(
	nombre varchar(25),
	credito float,
	debito float,
	total float generated always as (credito - debito) stored
);

insert into presupuesto values('Universidad',156.90,91);
select * from presupuesto;
*/

/*
--drop table if exists inventario;
create table inventario(
	producto varchar(40),
	stock int,
	precio float
);

insert into inventario values('Jabón de manos',79,17.99);
select * from inventario;
*/

/*
--drop table if exists pedidos;
create table pedidos(
	nombre varchar(25),
	monto float,
	envio varchar(40)
);

insert into pedidos values('Gerardo',600.75,'Zacapa');
select * from pedidos;
*/

/*
--drop table if exists ventas;
create table ventas(
	cliente varchar(25),
	producto varchar(35),
	precio float
);

insert into ventas values('Diana','Producto de limpieza',56.90);
select * from ventas;
*/