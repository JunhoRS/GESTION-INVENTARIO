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

alter table PRODUCTO
(
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


select u.IdUsuario,u.Documento,u.NombreCompleto,u.Correo,u.Contrasena,u.Estado, r.IdRol, r.Descripcion from usuario u
inner join rol r on r.IdRol = u.IdRol


update usuario set estado = 0 where idusuario = 2

CREATE PROC SP_REGISTRARUSUARIO(
@Documento varchar(50),
@NombreCompleto varchar(100),
@Correo varchar (100),
@Contrasena varchar (100),
@IdRol int,
@Estado bit,
@IdUsuarioResultado int output,
@Mensaje varchar (500) output
)
as
begin
	set @IdUsuarioResultado = 0
	set @Mensaje = ''

	if not exists(select * from USUARIO where Documento = @Documento)
	begin
		insert into usuario(Documento,NombreCompleto,Correo,Contrasena,IdRol,Estado) values
		(@Documento,@NombreCompleto,@Correo,@Contrasena,@IdRol,@Estado)

		set @IdUsuarioResultado = SCOPE_IDENTITY()
		
	end
	else
		set @Mensaje = 'No se puede repetir el documento para m�s de un usuario'
end



declare @Respuesta bit
declare @mensaje varchar(500)
exec SP_EDITARUSUARIO 3, '123', 'pruebas 2', 'test@gmail.com','123', 2,1,@Respuesta output,@mensaje output

select @Respuesta

select @mensaje

select * from USUARIO

CREATE PROC SP_EDITARUSUARIO(
@IdUsuario int,
@Documento varchar(50),
@NombreCompleto varchar(100),
@Correo varchar (100),
@Contrasena varchar (100),
@IdRol int,
@Estado bit,
@Respuesta bit output,
@Mensaje varchar (500) output
)
as
begin
	set @Respuesta = 0
	set @Mensaje = ''

	if not exists(select * from USUARIO where Documento = @Documento and idusuario != @IdUsuario)
	begin
		update usuario set
		Documento = @Documento,
		NombreCompleto = @NombreCompleto,
		Correo = @Correo,
		IdRol = @IdRol,
		Estado = @Estado
		where IdUsuario = @IdUsuario
		set @Respuesta = 1
		
	end
	else
		set @Mensaje = 'No se puede repetir el documento para m�s de un usuario'
end





CREATE PROC SP_ELIMINARUSUARIO(
@IdUsuario int,
@Respuesta bit output,
@Mensaje varchar (500) output
)
as
begin
	set @Respuesta = 0
	set @Mensaje = ''
	DECLARE @pasoreglas bit = 1

	if EXISTS (SELECT  * FROM COMPRA C
	INNER JOIN USUARIO U ON U.IdUsuario = C.IdUsuario
	WHERE U.IDUSUARIO = @IdUsuario
	)
	BEGIN
		set @pasoreglas = 0
		set @Respuesta = 0
		set @Mensaje = @Mensaje + 'No se puede eliminar porque el usuario se encuentra relacionado a una compra\n'
	END

	if EXISTS (SELECT  * FROM VENTA V
	INNER JOIN USUARIO U ON U.IdUsuario = V.IdUsuario
	WHERE U.IDUSUARIO = @IdUsuario
	)
	BEGIN
		set @pasoreglas = 0
		set @Respuesta = 0
		set @Mensaje = @Mensaje + 'No se puede eliminar porque el usuario se encuentra relacionado a una venta\n'
	END

	if(@pasoreglas = 1)
	begin
		delete from USUARIO where IdUsuario = @IdUsuario
		set @Respuesta = 1
	end

end

--CATEGORIAS Y PRODUCTOS PROCEDIMIENTOS

alter PROC SP_RegistrarCategoria(
@Descripcion varchar (50),
@Estado bit,
@Resultado int output,
@Mensaje varchar (500) output
)as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * from CATEGORIA WHERE Descripcion = @Descripcion)
	BEGIN
		insert into CATEGORIA(Descripcion,Estado) values (@Descripcion,@Estado)
		set @Resultado = SCOPE_IDENTITY()
	END
	ELSE
		SET @Mensaje = 'No se puede repetir la descripcion de una categoria'
end

--CATEGORIAS Y PRODUCTOS PROCEDIMIENTOS MODIFICACIONES	

alter PROC SP_EditarCategoria(
@IdCategoria int,
@Descripcion varchar (50),
@Estado bit,
@Resultado bit output,
@Mensaje varchar (500) output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * from CATEGORIA WHERE Descripcion = @Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set
		Descripcion = @Descripcion,
		Estado = @Estado
		where IdCategoria = @IdCategoria
	ELSE
	begin
		set @Resultado = 0
		SET @Mensaje = 'No se puede repetir la descripcion de una categoria'
		end
end


CREATE PROC SP_EliminarCategoria(
@IdCategoria int,
@Resultado bit output,
@Mensaje varchar (500) output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (
	select * from CATEGORIA c
	inner join PRODUCTO p on p.IdCategoria = c.IdCategoria
	where c.IdCategoria = @IdCategoria
	)
	begin
		delete top(1) from CATEGORIA where IdCategoria = @IdCategoria
	end
	ELSE
	begin
		set @Resultado = 0
		SET @Mensaje = 'Categoria ya relacionada a un producto'
	end
end

SELECT * FROM CATEGORIA

INSERT INTO CATEGORIA(Descripcion,Estado)VALUES('ELECTRONICA',1)
INSERT INTO CATEGORIA(Descripcion,Estado)VALUES('COMIDA',1)
INSERT INTO CATEGORIA(Descripcion,Estado)VALUES('LIMPIEZA',1)




--PROCEDIMIENTOS PARA LOS PRODUCTOS

create PROC SP_RegistrarProducto(
@Codigo varchar (20),
@Nombre varchar (30),
@Descripcion varchar (30),
@IdCategoria int,
@Estado bit,
@Resultado int output,
@Mensaje varchar (500) output
)as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * from PRODUCTO WHERE Codigo = @Codigo)
	BEGIN
		insert into PRODUCTO(Codigo,Nombre,Descripcion,IdCategoria,Estado) values (@Codigo,@Nombre,@Descripcion,@IdCategoria,@Estado)
		set @Resultado = SCOPE_IDENTITY()
	END
	ELSE
		SET @Mensaje = 'Ya existe un producto con el mismo codigo'
end


create PROC SP_ModificarProducto(
@IdProducto int,
@Codigo varchar (20),
@Nombre varchar (30),
@Descripcion varchar (30),
@IdCategoria int,
@Estado bit,
@Resultado bit output,
@Mensaje varchar (500) output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * from PRODUCTO WHERE Codigo = @Codigo and IdProducto != @IdProducto)
		update PRODUCTO set
		Codigo = @Codigo,
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdCategoria = @IdCategoria,
		Estado = @Estado
		where IdProducto = @IdProducto
	ELSE
	begin
		SET @Resultado = 0
		SET @Mensaje = 'Ya existe un producto con el mismo codigo'
	end
end

create PROC SP_EliminarProducto(
@IdProducto int,
@Resultado bit output,
@Mensaje varchar (500) output
)as
begin
	SET @Resultado = 0
	SET @Mensaje = ''
	declare @pasoreglas bit = 0

	IF NOT EXISTS (SELECT * from DETALLE_COMPRA dc
	inner join PRODUCTO p on p.IdProducto = dc.IdProducto
	where p.IdProducto = @IdProducto
	)
	BEGIN
		set @pasoreglas = 0
		SET @Resultado = 0
		SET @Mensaje = @Mensaje + 'No se puede eliminar porque se encuentra relacionada a una compra\n'
		
	END

	if exists (select * from DETALLE_VENTA dv
	INNER JOIN PRODUCTO p ON p.IdProducto = dv.IdProducto
	WHERE p.IdProducto = @IdProducto
	)
	BEGIN
		set @pasoreglas = 0
		SET @Resultado = 0
		SET @Mensaje = @Mensaje + 'No se puede eliminar porque se encuentra relacionada a una VENTA\n'		
	END

	IF(@pasoreglas = 1)
	begin
		delete from PRODUCTO where IdProducto = @IdProducto
		set @Resultado = 1
	end
end


select IdProducto,Codigo,Nombre,p.Descripcion,c.IdCategoria,c.Descripcion[DescripcionCategoria], Stock, PrecioCompra, PrecioVenta from PRODUCTO p
inner join CATEGORIA c on c.IdCategoria = p.IdCategoria


SELECT * FROM PRODUCTO

INSERT INTO PRODUCTO(Codigo,Nombre,Descripcion,IdCategoria,Estado)VALUES('101010','gaseosa','1litro',5,1)
INSERT INTO PRODUCTO(Descripcion,Estado)VALUES('COMIDA',1)
INSERT INTO PRODUCTO(Descripcion,Estado)VALUES('LIMPIEZA',1)
