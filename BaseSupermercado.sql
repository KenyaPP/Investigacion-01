create database Supermercado

use Supermercado

create table Sucursal(

codigo_sucursal varchar(5) primary key not null,
nombre char(50),
direccion char(50),
fecha_de_apertura date,
codigo_pais varchar(5)
)

create table Producto(

codigo_producto varchar(5) primary key not null,
nombre char(50),
precio_unitario decimal(10,2),
cantidad_en_almacen Int,
cantidad_vendida Int,
codigo_departamento varchar(5)
)

create table Proveedor(

codigo_proveedor varchar(5) primary key not null,
nombre varchar(50),
telefono varchar(20),
articulos text,
codigo_sucursal varchar(5)

)

create table Rol_Empleado(

codigo_rol varchar(5) primary key not null,
nombre varchar(50),
cantidad_de_asignados Int,
salario_base decimal(10,2),

)

create table Empleado(

codigo_empleado varchar(5) primary key not null,
nombre char(50),
fecha_nacimiento date,
fecha_de_contratacion date,
codigo_rol varchar(5),
codigo_sucursal varchar(5)

)

create table Pais(

codigo_pais varchar(5) primary key not null,
nombre char(50),
capital char(50),
continente char(50)
)

create table Departamento(

codigo_departamento varchar(5) primary key not null,
nombre char(50),
numero_de_empleados Int,
ventas decimal(10,2)
)



--tabla producto
create table Sucursal_Producto (
  codigo_sucursal varchar(5),
  codigo_producto varchar(5),
  primary key (codigo_sucursal, codigo_producto),
  foreign key (codigo_sucursal) references Sucursal(codigo_sucursal),
  foreign key (codigo_producto) references Producto(codigo_producto)
)



ALTER TABLE Empleado add constraint fk_rol_empleado_empleado
foreign key (codigo_rol) references Rol_Empleado(codigo_rol)

ALTER TABLE Empleado add constraint fk_sucursal_empleado
foreign key (codigo_sucursal) references Sucursal(codigo_sucursal)

ALTER TABLE Proveedor add constraint fk_sucursal_proveedor
foreign key (codigo_sucursal) references Sucursal(codigo_sucursal)

ALTER TABLE Producto add constraint fk_categoria_producto
foreign key (codigo_departamento) references Departamento(codigo_departamento)

ALTER TABLE Sucursal add constraint fk_pais_sucursal
foreign key (codigo_pais) references Pais(codigo_pais)

select * from Rol_Empleado

insert into Rol_Empleado values ('RM001', 'Cajero', 10, 800)
insert into Rol_Empleado values ('RM002', 'Reponedor', 20, 700)
insert into Rol_Empleado values ('RM003', 'Supervisor', 5, 900)
insert into Rol_Empleado values ('RM004', 'Limpieza', 10, 600)

select * from Pais

insert into Pais values ('CP001','El Salvador','San Salvador','Centro America')
insert into Pais values ('CP002','Mexico','Ciudad de Mexico','Norte America')
insert into Pais values ('CP003','Japon','Tokyo','Asia')
insert into Pais values ('CP004','Brazil','Brasilia','Sur America')

select * from Departamento

Insert into Departamento values ('CD001','Departamento de productos frescos',10,12000)
Insert into Departamento values ('CD002','Departamento de comestibles',15,10000)
Insert into Departamento values ('CD003','Departamento de productos para el hogar',5,1000)
Insert into Departamento values ('CD004','Departamento de electrónica',6,500)


select * from Sucursal

insert into Sucursal values ('CS001','Sucursal El Salvador','Av. Principal 123','2022-01-01','CP001')
insert into Sucursal values ('CS002','Sucursal Mexico','Av. Los Pinos 123','2019-11-11','CP002')
insert into Sucursal values ('CS003','Sucursal Japon','Jr. Huallaga 456','2000-5-8','CP003')
insert into Sucursal values ('CS004','Sucursal Brazil','Calle 5 de Mayo 789','2023-01-01','CP004')

select * from Producto

INSERT INTO Producto (codigo_producto, nombre, precio_unitario, cantidad_en_almacen, cantidad_vendida, codigo_departamento)
VALUES ('CPR01', 'Arroz', 2.50, 100, 50, 'CD001');

INSERT INTO Producto (codigo_producto, nombre, precio_unitario, cantidad_en_almacen, cantidad_vendida, codigo_departamento)
VALUES ('CPR02', 'Leche', 1.80, 50, 20, 'CD002');

INSERT INTO Producto (codigo_producto, nombre, precio_unitario, cantidad_en_almacen, cantidad_vendida, codigo_departamento)
VALUES ('CPR03', 'Pan', 0.80, 200, 150, 'CD003');

INSERT INTO Producto (codigo_producto, nombre, precio_unitario, cantidad_en_almacen, cantidad_vendida, codigo_departamento)
VALUES ('CPR04', 'Carne', 5.00, 30, 10, 'CD004');

select * from Proveedor

INSERT INTO Proveedor (codigo_proveedor, nombre, telefono, articulos, codigo_sucursal)
VALUES ('PRO01', 'Proveedor A', '987654321', 'Frutas y verduras', 'CS001');

INSERT INTO Proveedor (codigo_proveedor, nombre, telefono, articulos, codigo_sucursal)
VALUES ('PRO02', 'Proveedor B', '945678921', 'Carnes', 'CS002');

INSERT INTO Proveedor (codigo_proveedor, nombre, telefono, articulos, codigo_sucursal)
VALUES ('PRO03', 'Proveedor C', '986734521', 'Lácteos', 'CS003');

INSERT INTO Proveedor (codigo_proveedor, nombre, telefono, articulos, codigo_sucursal)
VALUES ('PRO04', 'Proveedor D', '956743621', 'Limpieza y aseo personal', 'CS004');

select * from Empleado

INSERT INTO Empleado (codigo_empleado, nombre, fecha_nacimiento, fecha_de_contratacion, codigo_rol, codigo_sucursal)
VALUES ('EMP01', 'Juan Perez', '1990-01-01', '2020-01-01', 'RM001', 'CS001');

INSERT INTO Empleado (codigo_empleado, nombre, fecha_nacimiento, fecha_de_contratacion, codigo_rol, codigo_sucursal)
VALUES ('EMP02', 'Ana Gomez', '1995-05-15', '2021-02-01', 'RM002', 'CS002');

INSERT INTO Empleado (codigo_empleado, nombre, fecha_nacimiento, fecha_de_contratacion, codigo_rol, codigo_sucursal)
VALUES ('EMP03', 'Pedro Rodriguez', '1988-12-10', '2018-07-01', 'RM003', 'CS003');

INSERT INTO Empleado (codigo_empleado, nombre, fecha_nacimiento, fecha_de_contratacion, codigo_rol, codigo_sucursal)
VALUES ('EMP04', 'Maria Sanchez', '1992-08-20', '2022-01-15', 'RM004', 'CS004');

SELECT * FROM Sucursal_Producto

INSERT INTO Sucursal_Producto (codigo_sucursal, codigo_producto) VALUES ('CS001', 'CPR01');

INSERT INTO Sucursal_Producto (codigo_sucursal, codigo_producto) VALUES ('CS001', 'CPR02');

INSERT INTO Sucursal_Producto (codigo_sucursal, codigo_producto) VALUES ('CS002', 'CPR01');

INSERT INTO Sucursal_Producto (codigo_sucursal, codigo_producto) VALUES ('CS002', 'CPR03');

INSERT INTO Sucursal_Producto (codigo_sucursal, codigo_producto) VALUES ('CS003', 'CPR02');

INSERT INTO Sucursal_Producto (codigo_sucursal, codigo_producto) VALUES ('CS004', 'CPR04');

--Campos calculados

--saber la edad a partir de la fecha de nacimiento

SELECT nombre, DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) - 
       CASE 
         WHEN MONTH(fecha_nacimiento) > MONTH(GETDATE()) 
           OR (MONTH(fecha_nacimiento) = MONTH(GETDATE()) 
               AND DAY(fecha_nacimiento) > DAY(GETDATE())) 
         THEN 1 
         ELSE 0 
       END AS edad
FROM Empleado;

-- saber cuanto lleva trabajando a partir de la fecha de contratacion

SELECT nombre, DATEDIFF(YEAR, fecha_de_contratacion, GETDATE()) - 
       CASE 
         WHEN MONTH(fecha_de_contratacion) > MONTH(GETDATE()) 
           OR (MONTH(fecha_de_contratacion) = MONTH(GETDATE()) 
               AND DAY(fecha_de_contratacion) > DAY(GETDATE())) 
         THEN 1 
         ELSE 0 
       END AS [Años contratado]
FROM Empleado;

-- saber la cantidad de dinero generado por las ventas de un producto

select nombre, (precio_unitario * cantidad_vendida) as [Ganancia de venta] from Producto

--saber la ganacia estimada de productos en almacen

select nombre, (precio_unitario * cantidad_en_almacen) as [Ganacia estimada de productos en reserva] from Producto

-- saber el inpuesto del 15% a pagar por todo lo vendido

SELECT SUM(precio_unitario * cantidad_vendida) * 0.15 AS "Impuesto a Pagar"
FROM Producto;

-- saber el salari anual de cada rol

SELECT e.codigo_empleado as [Codigo empleado], r.nombre as Cargo, r.salario_base * 12 AS "Salario Anual"
FROM Empleado e
JOIN Rol_Empleado r ON e.codigo_rol = r.codigo_rol;

--saber el descuento de 5% del seguro medico al salario

SELECT e.codigo_empleado, r.nombre, r.salario_base AS "Salario Base", 
       r.salario_base * 0.05 AS "Seguro Médico (5%)"
FROM Empleado e
JOIN Rol_Empleado r ON e.codigo_rol = r.codigo_rol;
