create table if not exists usuario (
	ID_usuario int,
	Nombre varchar(25)
);
insert into usuario values (1,'Alejandro');

create table if not exists fisicos(
	ejercicio varchar(35),
	dificultad int,
	rutina varchar(20)
);
insert into fisicos values ('Despechadas inclinadas',1,'Lunes y viernes');

create table if not exists tareas(
	descrip varchar(30),
	vence varchar(35)
);
insert into tareas values ('Ir de compras','2024/02/19');

create table if not exists consumo(
	fecha varchar(35),
	litros float
);
insert into consumo values ('2024/02/20',3);

create table if not exists lectura(
	libro varchar(30),
	autor varchar(25),
	meta varchar(25)
);
insert into lectura values ('Cien años de soledad','Gabriel García Márquez','Seis meses');

create table if not exists alimento(
	calorias float,
	descripcion varchar(30),
	peso float
);
insert into alimento values (56.12,'Carne adobada',70.56);

create table if not exists proyectos(
	decrip varchar(30),
	vencimiento varchar(30),
	progreso varchar(25)
);
insert into proyectos values ('Aprender a tocar guitarra','2024/05/01','Principiante');

create table if not exists viajes(
	aloj float,
	trans float,
	alimentos float,
	total float generated always as (aloj + trans + alimentos) stored
);
insert into viajes values (567,470,250);

create table if not exists sueño(
	horas int,
	periodo varchar(30)
);
insert into sueño values (6,'9:40 pm');