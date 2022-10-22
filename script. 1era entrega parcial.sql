USE ENTREGABLE;

-- tabla de agentes -- 
CREATE TABLE AGENTES (
	legajo INT NOT NULL auto_increment,
    id_no_cuit INT NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    id_email INT NOT NULL UNIQUE,
    id_no_celular INT NOT NULL,
    id_organismo INT NOT NULL,
    asiento_funciones INT NOT NULL,
    id_domicilio INT NOT NULL UNIQUE,
    fecha_de_nacimiento DATE NOT NULL,
    id_ingreso INT NOT NULL UNIQUE,
    id_egreso INT UNIQUE,
    CONSTRAINT PK_agentes PRIMARY KEY (legajo)
    );
    
    -- 
CREATE TABLE CUITS (
    id_no_cuit INT NOT NULL UNIQUE AUTO_INCREMENT,
    no_cuit DECIMAL(11) NOT NULL UNIQUE,
CONSTRAINT PK_cuits PRIMARY KEY (id_no_cuit)
    );
    
CREATE TABLE DOMICILIOS (
	id_domicilio INT NOT NULL UNIQUE AUTO_INCREMENT,
	calle VARCHAR(70) NOT NULL,
	altura DECIMAL(4) NOT NULL,
    piso DECIMAL(3), 
    departamento VARCHAR(15),
    localidad INT NOT NULL,
CONSTRAINT PK_DOMICILIOS PRIMARY KEY (id_domicilio)
    );

-- TABLA INGRESO DE AGENTES--      
CREATE TABLE INGRESO_AGENTES (
	id_ingreso INT NOT NULL UNIQUE AUTO_INCREMENT,
    fecha_de_ingreso DATE NOT NULL,
CONSTRAINT PK_INGRESO_AGENTES PRIMARY KEY (id_ingreso)
	);
    
--  TABLA EGRESO DE AGENTES--
CREATE TABLE EGRESO_AGENTES (
	id_egreso INT NOT NULL UNIQUE AUTO_INCREMENT,
    fecha_de_egreso DATE NOT NULL,
    id_motivo INT NOT NULL,
CONSTRAINT PK_EGRESO_AGENTES PRIMARY KEY (id_egreso) 
    );
    
-- TABLA MOTIVOS DE EGRESO--
CREATE TABLE MOTIVO_DE_EGRESO (
	id_motivo INT NOT NULL UNIQUE AUTO_INCREMENT,
    motivo VARCHAR(50) NOT NULL UNIQUE,
CONSTRAINT PK_MOTIVO_DE_EGRESO PRIMARY KEY (id_motivo)
	);
    
-- TABLA E-MAILS--
CREATE TABLE EMAIL (
	id_email INT NOT NULL UNIQUE AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE,
CONSTRAINT PK_EMAIL PRIMARY KEY (id_email)
    );
    
-- TABLA DE NRO DE TELEFONOS CELULARES --
CREATE TABLE NO_CELULAR (
	id_no_celular INT NOT NULL UNIQUE AUTO_INCREMENT,
    no_celular INT NOT NULL UNIQUE,
CONSTRAINT PK_NO_CELULAR PRIMARY KEY (id_no_celular)
	);
    
-- TABLA DE BENEFICIARIOS --
CREATE TABLE BENEFICIARIOS (
	id_beneficiario INT NOT NULL UNIQUE AUTO_INCREMENT,
    legajo INT UNIQUE,
    id_no_cuit INT NOT NULL UNIQUE,
CONSTRAINT PK_BENEFICIARIOS PRIMARY KEY (id_beneficiario)
	);
    
-- TABLA DE CARGOS DE FUNCIONARIOS --
CREATE TABLE CARGOS_FUNCIONARIOS (
	id_cargo INT NOT NULL UNIQUE AUTO_INCREMENT,
    id_organismo INT NOT NULL,
    id_jerarquia_funcionario INT NOT NULL,
    nombre_del_cargo VARCHAR(120) NOT NULL,
    descripcion VARCHAR(500),
CONSTRAINT PK_CARGOS_FUNCIONARIOS PRIMARY KEY (id_cargo)
	);
    
-- TABLA DE PLANTA DE FUNCIONARIOS --
CREATE TABLE PLANTA_DE_FUNCIONARIOS(
	id_cargo INT NOT NULL UNIQUE,
    legajo INT NOT NULL UNIQUE,
CONSTRAINT PK_PLANTA_DE_FUNCIONARIOS PRIMARY KEY (id_cargo, legajo)
	);
    
-- TABLA DE NIVELES DE JERARQUIA DE FUNCIONARIOS --
CREATE TABLE JERARQUIA_FUNCIONARIOS (
	id_jerarquia_funcionario INT NOT NULL UNIQUE,
	nombre	VARCHAR(50)	NOT NULL,
	descripcion	VARCHAR(500) NOT NULL,
    CONSTRAINT PK_JERARQUIA_FUNCIONARIOS PRIMARY KEY (id_jerarquia_funcionario)
	);
    
-- TABLA DE ORGANISMOS --
CREATE TABLE ORGANISMOS (
	id_organismo INT NOT NULL UNIQUE AUTO_INCREMENT,
	id_no_cuit INT UNIQUE,
	id_domicilio INT NOT NULL UNIQUE,	
	nombre VARCHAR(200)	NOT NULL UNIQUE,
CONSTRAINT PK_ORGANISMO PRIMARY KEY (id_organismo)
	);
    
-- TABLA DE LOCALIDADES --
CREATE TABLE LOCALIDADES (
	id_localidad INT NOT NULL UNIQUE,
	nombre VARCHAR(150)	NOT NULL,
	id_provincia INT NOT NULL,
	id_pais INT NOT NULL,
CONSTRAINT PK_LOCALIDADES PRIMARY KEY (id_localidad)
	);
    
-- TABLA DE PROVINCIAS --
CREATE TABLE PROVINCIAS (
	id_provincia INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre INT NOT NULL UNIQUE,
    id_pais	VARCHAR(150) NOT NULL,
CONSTRAINT PK_PROVINCIAS PRIMARY KEY (id_provincia)
	);
    
-- TABLA DE PAISES --
CREATE TABLE PAISES (
	id_pais INT NOT NULL UNIQUE	AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL UNIQUE,
CONSTRAINT PK_PAISES PRIMARY KEY (id_pais)
	);
    
-- TABLA DE COMISIONES --
CREATE TABLE COMISIONES (
	id_comision	INT NOT NULL UNIQUE AUTO_INCREMENT,
	no_resolucion VARCHAR(30) NOT NULL,
	lugar_de_salida	INT NOT NULL,
	lugar_de_comision INT NOT NULL,
	fecha_estimada_de_salida DATE NOT NULL,
	fecha_estimada_de_llegada DATE NOT NULL,
	anticipo DECIMAL(8,2) NOT NULL,
	id_beneficiario INT NOT NULL,
	motivo VARCHAR(100),
CONSTRAINT PK_COMISIONES PRIMARY KEY (id_comision)
	);
    
-- TABLA DE PROVEEDORES DE ALOJAMIENTO REGISTRADOS --
CREATE TABLE PROVEEDORES_DE_ALOJAMIENTO (
	id_proveedor INT NOT NULL UNIQUE AUTO_INCREMENT,
	id_domicilio INT NOT NULL,
	id_nivel_estrellas INT NOT NULL,
	nombre_de_fantasia VARCHAR(200)	NOT NULL,
	id_no_cuit INT NOT NULL UNIQUE,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	razon_social VARCHAR(120) UNIQUE,
CONSTRAINT PK_PROVEEDORES_DE_ALOJAMIENTO PRIMARY KEY (id_proveedor)
	);
    
-- TABLA DE NIVEL DEL SERVICIO DE ALOJAMIENTO --
CREATE TABLE NIVEL_DE_SERVICIO_DE_ALOJAMIENTO (
	id_nivel_de_estrellas INT NOT NULL UNIQUE,
	cantidad_de_estrellaS INT NOT NULL UNIQUE,
    descripcion VARCHAR(100) NOT NULL,
CONSTRAINT PK_NIVEL_DE_SERVICIO_DE_ALOJAMIENTO PRIMARY KEY (id_nivel_de_estrellas)
	);
    
-- TABLA DE COMPROBANTES --
CREATE TABLE COMPROBANTES (
	no_comprobante VARCHAR(30) NOT NULL UNIQUE,
	id_tipo_de_factura INT NOT NULL,
	id_organismo INT NOT NULL,
	id_beneficiario INT NOT NULL,
	id_proveedor INT NOT NULL,
	precio_comprobante DECIMAL(8,2) NOT NULL,
	fecha_entrada DATE NOT NULL,
	fecha_salida DATE NOT NULL,
	detalle VARCHAR(120) NOT NULL,
CONSTRAINT PK_COMPROBANTES PRIMARY KEY (no_comprobante)
	);
    
-- TABLA DE TIPO DE FACTURA --
CREATE TABLE TIPO_DE_FACTURA (
	id_tipo_de_factura INT NOT NULL UNIQUE,
	tipo_de_actura VARCHAR(1) NOT NULL,
	descripcion VARCHAR(120) NOT NULL,
CONSTRAINT PK_TIPO_DE_FACTURA PRIMARY KEY (id_tipo_de_factura)
	);


-- foreign keys

-- tabla: AGENTES --
ALTER TABLE AGENTES ADD CONSTRAINT FK_ID_NO_CUIT FOREIGN KEY FK_id_no_cuit (id_no_cuit)
    REFERENCES CUITS (id_no_cuit);
ALTER TABLE AGENTES ADD CONSTRAINT FK_ID_EMAIL FOREIGN KEY FK_id_email (id_email)
    REFERENCES EMAIL (id_email);
ALTER TABLE AGENTES ADD CONSTRAINT FK_ID_NO_CELULAR FOREIGN KEY FK_id_no_celular (id_no_celular)
    REFERENCES NO_CELULAR (id_no_celular);
ALTER TABLE AGENTES ADD CONSTRAINT FK_ID_ORGANISMO FOREIGN KEY FK_id_organismo (id_organismo)
    REFERENCES ORGANISMOS (id_organismo);
ALTER TABLE AGENTES ADD CONSTRAINT FK_ASIENTO_FUNCIONES FOREIGN KEY FK_asiento_funciones (asiento_funciones)
    REFERENCES LOCALIDADES (id_localidad);
ALTER TABLE AGENTES ADD CONSTRAINT FK_ID_DOMICILIO FOREIGN KEY FK_domicilio (id_domicilio)
    REFERENCES DOMICILIOS (id_domicilio);
ALTER TABLE AGENTES ADD CONSTRAINT FK_ID_INGRESO FOREIGN KEY FK_id_ingreso (id_ingreso)
    REFERENCES INGRESO_AGENTES (id_ingreso);
ALTER TABLE AGENTES ADD CONSTRAINT FK_ID_EGRESO FOREIGN KEY FK_id_egreso (id_egreso)
    REFERENCES EGRESO_AGENTES (id_egreso);
    
    
    
-- tabla: DOMICILIOS --
ALTER TABLE DOMICILIOS ADD CONSTRAINT FK_ID_CIUDAD FOREIGN KEY FK_codigo_postal (localidad)
    REFERENCES LOCALIDADES (id_localidad);
    
    
-- tabla: EGRESO_AGENTES --
ALTER TABLE EGRESO_AGENTES ADD CONSTRAINT FK_ID_MOTIVO FOREIGN KEY FK_id_motivo (id_motivo)
    REFERENCES MOTIVO_DE_EGRESO (id_motivo);    
    
    
-- tabla: BENEFICIARIOS --
ALTER TABLE BENEFICIARIOS ADD CONSTRAINT FK_ID_CUIT FOREIGN KEY FK_id_no_cuit (id_no_cuit)
    REFERENCES CUITS (id_no_cuit);
ALTER TABLE BENEFICIARIOS ADD CONSTRAINT FK_LEGAJO FOREIGN KEY FK_legajo (legajo)
    REFERENCES AGENTES(legajo);
    
    
-- tabla: CARGOS_FUNCIONARIOS --
ALTER TABLE CARGOS_FUNCIONARIOS ADD CONSTRAINT FK_ID_ORGANISMO_DEL_CARGO FOREIGN KEY FK_id_organismo (id_organismo)
    REFERENCES ORGANISMOS (id_organismo);
ALTER TABLE CARGOS_FUNCIONARIOS ADD CONSTRAINT FK_ID_JERARQUIA_FUNCIONARIO FOREIGN KEY FK_id_jerarquia_funcionario (id_jerarquia_funcionario)
    REFERENCES JERARQUIA_FUNCIONARIOS (id_jerarquia_funcionario);


-- tabla: PLANTA_FUNCIONARIOS --
ALTER TABLE PLANTA_DE_FUNCIONARIOS ADD CONSTRAINT FK_CARGO FOREIGN KEY FK_id_cargo (id_cargo)
    REFERENCES CARGOS_FUNCIONARIOS (id_cargo);
ALTER TABLE PLANTA_DE_FUNCIONARIOS ADD CONSTRAINT FK_FUNCIONARIO FOREIGN KEY FK_legajo (legajo)
    REFERENCES AGENTES (legajo);
    
    
-- tabla: ORGANISMOS
ALTER TABLE ORGANISMOS ADD CONSTRAINT FK_CUIT FOREIGN KEY FK_id_no_cuit (id_no_cuit)
    REFERENCES CUITS (id_no_cuit);
ALTER TABLE ORGANISMOS ADD CONSTRAINT FK_SEDE FOREIGN KEY FK_id_domicilio (id_domicilio)
    REFERENCES DOMICILIOS (id_domicilio);


-- tabla: LOCALIDADES --
ALTER TABLE LOCALIDADES ADD CONSTRAINT FK_provincia FOREIGN KEY FK_provincia (id_provincia)
    REFERENCES PROVINCIAS (id_provincia);
ALTER TABLE LOCALIDADES ADD CONSTRAINT FK_pais FOREIGN KEY FK_id_pais (id_pais)
    REFERENCES PAISES (id_pais);
    
    
-- tabla: PROVINCIAS --
-- primero modifico un valor que cargue incorrectamente. Me daba error 3780--
ALTER TABLE
	PROVINCIAS
MODIFY 
	id_pais INT NOT NULL
;
-- agregamos FK --
ALTER TABLE PROVINCIAS ADD CONSTRAINT FK_ID_PAIS FOREIGN KEY FK_id_pais (id_pais)
    REFERENCES PAISES (id_pais);
    

-- tabla: COMISIONES --
ALTER TABLE COMISIONES ADD CONSTRAINT FK_LUGAR_DE_SALIDA FOREIGN KEY FK_lugar_de_salida (lugar_de_salida)
    REFERENCES localidades (id_localidad);
ALTER TABLE COMISIONES ADD CONSTRAINT FK_LUGAR_DE_COMISION FOREIGN KEY FK_lugar_de_comision (lugar_de_comision)
    REFERENCES LOCALIDADES (id_localidad);
ALTER TABLE COMISIONES ADD CONSTRAINT FK_ID_BENEFICIARIO FOREIGN KEY FK_id_beneficiario (id_beneficiario)
    REFERENCES BENEFICIARIOS (id_beneficiario);
    
    
-- tabla: PROVEEDORES_DE_ALOJAMIENTO --
ALTER TABLE PROVEEDORES_DE_ALOJAMIENTO ADD CONSTRAINT FK_SEDE_PROVEEDOR FOREIGN KEY FK_id_sede (id_domicilio)
    REFERENCES localidades (id_localidad);
ALTER TABLE PROVEEDORES_DE_ALOJAMIENTO ADD CONSTRAINT FK_CANTIDAD_DE_ESTRELLAS FOREIGN KEY FK_cantidad_de_estrellas (id_nivel_estrellas)
    REFERENCES NIVEL_DE_SERVICIO_DE_ALOJAMIENTO (id_nivel_de_estrellas);
ALTER TABLE PROVEEDORES_DE_ALOJAMIENTO ADD CONSTRAINT FK_ID_NO_CUIT_PROVEEDOR FOREIGN KEY FK_id_no_cuit (id_no_cuit)
    REFERENCES CUITS (id_no_cuit);
    
    
-- tabla: COMPROBANTE --
ALTER TABLE COMPROBANTES ADD CONSTRAINT FK_TIPO_DE_FACTURA FOREIGN KEY FK_tipo_de_factura (id_tipo_de_factura)
    REFERENCES TIPO_DE_FACTURA (id_tipo_de_factura);
ALTER TABLE COMPROBANTES ADD CONSTRAINT FK_ORGANISMO_CONTRATANTE FOREIGN KEY FK_organismo (id_organismo)
    REFERENCES ORGANISMOS (id_organismo);
ALTER TABLE COMPROBANTES ADD CONSTRAINT FK_USUARIO_BENEFICIARIO FOREIGN KEY FK_id_beneficiario (id_beneficiario)
    REFERENCES BENEFICIARIOS (id_beneficiario);
ALTER TABLE COMPROBANTES ADD CONSTRAINT FK_PROVEEDOR FOREIGN KEY FK_id_proveedor (id_proveedor)
    REFERENCES PROVEEDORES_DE_ALOJAMIENTO (id_proveedor);

    
    
    
    -- End of file.