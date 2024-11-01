--CREATE USER polleria_db IDENTIFIED BY polleria_db;
--GRANT CONNECT, RESOURCE to polleria_db;
--ALTER USER polleria_db QUOTA UNLIMITED ON USERS;

CREATE TABLE Platillo(
    IdPlatillo VARCHAR2(6) PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(100),
    Precio NUMERIC(5,2) NOT NULL CHECK (Precio > 0)
);

CREATE TABLE Extra(
    IdExtra VARCHAR2(6) PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(100),
    Precio NUMERIC(5,2) NOT NULL CHECK (Precio > 0)
);

CREATE TABLE Bebida(
    IdBebida VARCHAR2(6) PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(100),
    Capacidad NUMERIC(4,1) NOT NULL,
    UnidadMedida VARCHAR2(10) NOT NULL,
    Precio NUMERIC(5,2) NOT NULL CHECK (Precio > 0)
);

CREATE TABLE Cliente(
    IdCliente VARCHAR2(6) PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Apellido VARCHAR2(50) NOT NULL,
    TipoCliente VARCHAR2(16) NOT NULL CHECK (TipoCliente IN ('Natural', 'Juridico', 'Ambos')),
    CorreoElectronico VARCHAR2(50)
);

CREATE TABLE ClienteJuridico(
    IdCliente VARCHAR2(6) UNIQUE,
    RUC VARCHAR2(11) UNIQUE,
    
    FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
    PRIMARY KEY (IdCliente, RUC)
);


CREATE TABLE RazonSocial(
    RUC VARCHAR2(10) PRIMARY KEY,
    RazonSocial VARCHAR2(100) NOT NULL UNIQUE,
    FOREIGN KEY (RUC) REFERENCES ClienteJuridico(RUC)
);


CREATE TABLE ClienteNatural(
    IdCliente VARCHAR2(6) UNIQUE,
    DNI VARCHAR2(8),
    FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
    PRIMARY KEY(IdCliente, DNI)
);

CREATE TABLE Mozo(
    IdMozo VARCHAR2(6),
    Nombre VARCHAR2(50) NOT NULL,
    Apellido VARCHAR2(50) NOT NULL,
    DNI INTEGER UNIQUE NOT NULL,
    Telefono INTEGER UNIQUE NOT NULL CHECK (Telefono > 900000000),
    PRIMARY KEY (IdMozo)
);


CREATE TABLE Pedido(
    IdPedido VARCHAR2(6) PRIMARY KEY,
    Fecha DATE DEFAULT SYSDATE NOT NULL,
    IdMozo VARCHAR2(6) NOT NULL,
    
    FOREIGN KEY (IdMozo) REFERENCES Mozo(IdMozo)
);

CREATE TABLE DetallePlatillo(
    IdPedido VARCHAR2(6),
    IdPlatillo VARCHAR2(6),
    Cantidad INTEGER NOT NULL CHECK (Cantidad > 0),
    FOREIGN KEY (IdPlatillo) REFERENCES Platillo(IdPlatillo),
    FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido),
    PRIMARY KEY (IdPedido, IdPlatillo)
);


CREATE TABLE BebidaPedido(
    IdPedido VARCHAR2(6),
    IdBebida VARCHAR2(6),
    Cantidad INTEGER NOT NULL CHECK (Cantidad > 0),
    FOREIGN KEY (IdBebida) REFERENCES Bebida(IdBebida),
    FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido),
    PRIMARY KEY (IdPedido, IdBebida)
);

CREATE TABLE ExtraPedido(
    IdPedido VARCHAR2(6),
    IdExtra VARCHAR2(6),
    Cantidad INTEGER NOT NULL CHECK (Cantidad > 0),
    FOREIGN KEY (IdExtra) REFERENCES Extra(IdExtra),
    FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido),
    PRIMARY KEY (IdPedido, IdExtra)
);

CREATE TABLE Comprobante(
    IdComprobante VARCHAR2(6) PRIMARY KEY,
    FechaEmision DATE DEFAULT SYSDATE NOT NULL,
    Total NUMERIC(5,2) NOT NULL,
    TipoComprobante VARCHAR2(16) NOT NULL CHECK (TipoComprobante IN ('Boleta', 'Factura'))
);

CREATE TABLE Factura(
    IdFactura VARCHAR2(6) PRIMARY KEY,
    NumeroFactura VARCHAR2(15) NOT NULL,
    IdComprobante VARCHAR2(6) NOT NULL UNIQUE,
    FOREIGN KEY (IdComprobante) REFERENCES Comprobante(IdComprobante)
);

CREATE TABLE Boleta(
    IdBoleta VARCHAR2(6) PRIMARY KEY,
    NumeroBoleta VARCHAR2(15) NOT NULL,
    IdComprobante VARCHAR2(6) NOT NULL UNIQUE,
    FOREIGN KEY (IdComprobante) REFERENCES Comprobante(IdComprobante)
);
