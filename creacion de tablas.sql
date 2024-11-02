--CREATE USER polleria_db IDENTIFIED BY polleria_db;
--GRANT CONNECT, RESOURCE to polleria_db;
--ALTER USER polleria_db QUOTA UNLIMITED ON USERS;

CREATE TABLE Platillo(
    Id_Platillo VARCHAR2(6) PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(100),
    Precio NUMERIC(5,2) NOT NULL CHECK (Precio > 0)
);

CREATE TABLE Extra(
    Id_Extra VARCHAR2(6) PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(100),
    Precio NUMERIC(5,2) NOT NULL CHECK (Precio > 0)
);

CREATE TABLE Bebida(
    Id_Bebida VARCHAR2(6) PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(100),
    Capacidad NUMERIC(4,1) NOT NULL,
    Unidad_Medida VARCHAR2(10) NOT NULL,
    Precio NUMERIC(5,2) NOT NULL CHECK (Precio > 0)
);

CREATE TABLE Cliente(
    Id_Cliente VARCHAR2(6) PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Apellido VARCHAR2(50) NOT NULL,
    Tipo_Cliente VARCHAR2(16) NOT NULL CHECK (Tipo_Cliente IN ('Natural', 'Juridico', 'Ambos')),
    Correo_Electronico VARCHAR2(50)
);

CREATE TABLE Cliente_Juridico(
    Id_Cliente VARCHAR2(6) UNIQUE,
    RUC VARCHAR2(11) UNIQUE,
    Razon_Social VARCHAR2(100) UNIQUE NOT NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
    PRIMARY KEY (Id_Cliente, RUC)
);

CREATE TABLE Cliente_Natural(
    Id_Cliente VARCHAR2(6) UNIQUE,
    DNI VARCHAR2(8),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
    PRIMARY KEY(Id_Cliente, DNI)
);

CREATE TABLE Mozo(
    Id_Mozo VARCHAR2(6),
    Nombre VARCHAR2(50) NOT NULL,
    Apellido VARCHAR2(50) NOT NULL,
    DNI INTEGER UNIQUE NOT NULL,
    Telefono INTEGER UNIQUE NOT NULL CHECK (Telefono > 900000000),
    PRIMARY KEY (Id_Mozo)
);

CREATE TABLE Pedido(
    Id_Pedido VARCHAR2(6) PRIMARY KEY,
    Fecha DATE DEFAULT SYSDATE NOT NULL,
    Id_Mozo VARCHAR2(6) NOT NULL,
    
    FOREIGN KEY (Id_Mozo) REFERENCES Mozo(Id_Mozo)
);

CREATE TABLE Detalle_Platillo(
    Id_Pedido VARCHAR2(6),
    Id_Platillo VARCHAR2(6),
    Cantidad INTEGER NOT NULL CHECK (Cantidad > 0),
    FOREIGN KEY (Id_Platillo) REFERENCES Platillo(Id_Platillo),
    FOREIGN KEY (Id_Pedido) REFERENCES Pedido(Id_Pedido),
    PRIMARY KEY (Id_Pedido, Id_Platillo)
);

CREATE TABLE Bebida_Pedido(
    Id_Pedido VARCHAR2(6),
    Id_Bebida VARCHAR2(6),
    Cantidad INTEGER NOT NULL CHECK (Cantidad > 0),
    FOREIGN KEY (Id_Bebida) REFERENCES Bebida(Id_Bebida),
    FOREIGN KEY (Id_Pedido) REFERENCES Pedido(Id_Pedido),
    PRIMARY KEY (Id_Pedido, Id_Bebida)
);

CREATE TABLE Extra_Pedido(
    Id_Pedido VARCHAR2(6),
    Id_Extra VARCHAR2(6),
    Cantidad INTEGER NOT NULL CHECK (Cantidad > 0),
    FOREIGN KEY (Id_Extra) REFERENCES Extra(Id_Extra),
    FOREIGN KEY (Id_Pedido) REFERENCES Pedido(Id_Pedido),
    PRIMARY KEY (Id_Pedido, Id_Extra)
);

CREATE TABLE Comprobante(
    Id_Comprobante VARCHAR2(6) PRIMARY KEY,
    Fecha_Emision DATE DEFAULT SYSDATE NOT NULL,
    Total NUMERIC(5,2) NOT NULL,
    Tipo_Comprobante VARCHAR2(16) NOT NULL CHECK (Tipo_Comprobante IN ('Boleta', 'Factura')),
    Id_Pedido VARCHAR2(6) NOT NULL,
    Id_Cliente VARCHAR2(6) NOT NULL,
    FOREIGN KEY (Id_Pedido) REFERENCES Pedido(Id_Pedido),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)

);

CREATE TABLE Factura(
    Id_Factura VARCHAR2(6) PRIMARY KEY,
    Numero_Factura VARCHAR2(15) NOT NULL,
    Id_Comprobante VARCHAR2(6) NOT NULL UNIQUE,
    FOREIGN KEY (Id_Comprobante) REFERENCES Comprobante(Id_Comprobante)
);

CREATE TABLE Boleta(
    Id_Boleta VARCHAR2(6) PRIMARY KEY,
    Numero_Boleta VARCHAR2(15) NOT NULL,
    Id_Comprobante VARCHAR2(6) NOT NULL UNIQUE,
    FOREIGN KEY (Id_Comprobante) REFERENCES Comprobante(Id_Comprobante)
);
