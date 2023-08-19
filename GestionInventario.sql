CREATE DATABASE DBGESTION_INVENTARIO

GO

USE DBGESTION_INVENTARIO

GO

create table ROL(
IdRol int primary key identity,
Descripcion varchar(50),
FechaRegistro datetime default getdate()
)

go

create table PERMISO(
IdPermiso int primary key identity,
IdRol int references ROL(IdRol),
NombreMenu varchar(100),
FechaRegistro datetime default getdate()
)

go

create table PROVEEDOR(
IdProveedor int primary key identity,
Documento varchar(50),
RazonSocial varchar(50),
Correo varchar(50),
Telefono varchar(50),
Estado bit,
FechaRegistro datetime default getdate()
)

go

create table CLIENTE(
IdCliente int primary key identity,
Documento varchar(50),
NombreCompleto varchar(50),
Correo varchar(50),
Telefono varchar(50),
Estado bit,
FechaRegistro datetime default getdate()
)

go

create table USUARIO(
IdUsuario int primary key identity,
Documento varchar(50),
NombreCompleto varchar(50),
Correo varchar(50),
Contrasena varchar(50),
IdRol int references ROL(IdRol),
Estado bit,
FechaRegistro datetime default getdate()
)


go

create table CATEGORIA(
IdCategoria int primary key identity,
Descripcion varchar(100),
Estado bit,
FechaRegistro datetime default getdate()
)

go

create table PRODUCTO(
IdProducto int primary key identity,
Codigo varchar(50),
Nombre varchar(50),
Descripcion varchar(50),
IdCategoria int references CATEGORIA(IdCategoria),
Stock int not null default 0,
PrecioCompra decimal(10,2) default 0, 
PrecioVenta decimal(10,2) default 0, 
Estado bit,
FechaRegistro datetime default getdate()
)

go

create table COMPRA(
IdCompra int primary key identity,
IdUsuario int references USUARIO(IdUsuario),
IdProveedor int references PROVEEDOR(IdProveedor),
TipoDocumento varchar(50),
NumeroDocumento varchar(50),
MontoTotal decimal(10,2),
FechaRegistro datetime default getdate()
)

go

create table DETALLE_COMPRA(
IdDetalleCompra int primary key identity,
IdCompra int references COMPRA(Idcompra),
IdProducto int references PRODUCTO(IdProducto),
PrecioCompra decimal(10,2) default 0, 
PrecioVenta decimal(10,2) default 0, 
Cantidad int,
MontoTotal decimal(10,2),
FechaRegistro datetime default getdate()
)

go

create table VENTA(
IdVenta int primary key identity,
IdUsuario int references USUARIO(IdUsuario),
TipoDocumento varchar(50),
NumeroDocumento varchar(50),
DocumentoCliente varchar(50),
NombreCliente varchar(100),
MontoPago decimal(10,2),
MontoCambio decimal(10,2),
MontoTotal decimal(10,2),
FechaRegistro datetime default getdate()
)

go

create table DETALLE_VENTA(
IdDetalleVenta int primary key identity,
IdVenta int references VENTA(IdVenta),
IdProducto int references PRODUCTO(IdProducto),
PrecioVenta decimal(10,2),
Cantidad int,
SubTotal decimal(10,2),
FechaRegistro datetime default getdate()
)

go

select * from USUARIO
select * from rol

insert into rol (Descripcion)
values ('ADMINISTRADOR')


insert USUARIO(Documento,NombreCompleto,Correo,Contrasena,IdRol,Estado)
values('20210203','ADMIN','20210203@itla.edu.do','0203','1','1')

DROP TABLE USUARIO;

-- Eliminar registros en la tabla USUARIO
DELETE FROM USUARIO;

-- Si deseas resetear el contador de identidad de la columna IdUsuario
DBCC CHECKIDENT ('USUARIO', RESEED, 0);

-- Eliminar registros en la tabla ROL
DELETE FROM ROL;

-- Si deseas resetear el contador de identidad de la columna IdRol
DBCC CHECKIDENT ('ROL', RESEED, 0);

-- Eliminar la columna Telefono de la tabla USUARIO
ALTER TABLE USUARIO
DROP COLUMN Telefono;

select * from PERMISO

insert into PERMISO(IdRol,NombreMenu) values
(1,'menuusuario'),
(1,'menumantenedor'),
(1,'menuventas'),
(1,'menucompras'),
(1,'menuclientes'),
(1,'menuproveedores'),
(1,'menureportes'),
(1,'menuacercade')

select * from USUARIO
select * from PERMISO
select * from ROL

insert into rol (Descripcion)
values ('EMPLEADO')

insert into PERMISO(IdRol,NombreMenu) values
(2,'menuventas'),
(2,'menucompras'),
(2,'menuclientes'),
(2,'menuproveedores'),
(2,'menuacercade')

select p.IdRol,p.NombreMenu from PERMISO p
inner join ROL r on r.IdRol = p.IdRol
inner join USUARIO u on u.IdRol = r.IdRol
where u.IdUsuario = 1


insert USUARIO(Documento,NombreCompleto,Correo,Contrasena,IdRol,Estado)
values('10','EMPLEADO','@gmil.com','10','2','1')