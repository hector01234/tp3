-- dml (donde se crea y usa la base de datos, y armado de tablas )
-- creacion y uso de la base de datos
-- funcion basica para escoger la base de datos 
drop database if exists escuela;
create database escuela;
use escuela;


-- creacion de tabla de productos 

create table productos (
   id_producto int not null AUTO_INCREMENT primary key,
   nombre varchar (60),
   descripcion varchar (60),
   costo double
);

-- creacion de la tabla sucursales

create table sucursales (
   id_sucursal int not null AUTO_INCREMENT primary key,
   nombre varchar (60),
   direccion varchar (80)
);

-- creacion de la tabla de conexion de muchos a muchos 

create table productos_sucursales (
    id_sucursal int not null,
    id_producto int not null,
    stock int (5),
    primary key (id_sucursal, id_producto),
    foreign key (id_sucursal) references productos (id_producto),
    foreign key (id_producto) references sucursales (id_sucursal)
);

-- ddl (donde se llenan las tablas y se alteran )

-- inserccion de tablas comenzando por productos

insert into productos(
   nombre,
   descripcion,
   costo

)values(
  'borradores',
  'sirven para tinta y tiza',
  '850.00'
);
insert into productos(
   nombre,
   descripcion,
   costo

)values(
  'ventiladores',
  'fabricados en china',
  '40000.00'
);

insert into productos(
   nombre,
   descripcion,
   costo

)values(
  'cortinas',
  'compradas en once',
  '2000.00'
);

-- inserccion de la tabla  sucursales

insert into sucursales(
     nombre,
     direccion

) values(
    'escuela tecnica n13',
    'avenida de mayo al 3458'
);
insert into sucursales(
     nombre,
     direccion

) values(
    'escuela media n47',
    'Avenida corrientes 587'
);
insert into sucursales(
     nombre,
     direccion

) values(
    'escuela primaria springfield',
    'lavalle 600'
);

insert into productos_sucursales (
    id_sucursal ,
    id_producto ,
    stock

) values (
1,
1,
300
);
insert into productos_sucursales (
    id_sucursal ,
    id_producto ,
    stock

) values (
1,
3,
100
);
insert into productos_sucursales (
    id_sucursal ,
    id_producto ,
    stock

) values (
2,
1,
200
);
insert into productos_sucursales (
    id_sucursal ,
    id_producto ,
    stock

) values (
2,
2,
60
);
insert into productos_sucursales (
    id_sucursal ,
    id_producto ,
    stock

) values (
3,
2,
10
);
insert into productos_sucursales (
    id_sucursal ,
    id_producto ,
    stock

) values (
3,
1,
90
);

select  productos.nombre as mercancia,
       productos.costo as precio,
       sucursales.nombre as titulo,
       sucursales.direccion as ubicacion
       from productos_sucursales
       join sucursales
	    on productos_sucursales.id_sucursal = sucursales.id_sucursal 
       join productos
      on  productos_sucursales.id_producto = productos.id_producto
       