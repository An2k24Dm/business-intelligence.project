CREATE TABLE PAIS (
    Pai_cod_pais SERIAL,
    Pai_nb_pais VARCHAR(100) NOT NULL,
    CONSTRAINT pk_pais PRIMARY KEY (Pai_cod_pais)
);

CREATE TABLE CIUDAD (
    Ciu_cod_ciudad SERIAL,
    Ciu_nb_ciudad VARCHAR(100) NOT NULL,
    Fk_pais INTEGER NOT NULL,
    CONSTRAINT pk_ciudad PRIMARY KEY (Ciu_cod_ciudad),
    CONSTRAINT fk_ciudad_pais FOREIGN KEY (Fk_pais) REFERENCES PAIS (Pai_cod_pais) ON DELETE CASCADE
);

CREATE TABLE SEDE (
    Sed_cod_sede SERIAL,
    Sed_nb_sede VARCHAR(150) NOT NULL,
    Fk_ciudad INTEGER NOT NULL,
    CONSTRAINT pk_sede PRIMARY KEY (Sed_cod_sede),
    CONSTRAINT fk_sede_ciudad FOREIGN KEY (Fk_ciudad) REFERENCES CIUDAD (Ciu_cod_ciudad)
);

CREATE TABLE TIPO_EVENTO (
    Tie_cod_tipo_evento SERIAL,
    Tie_nb_tipo_evento VARCHAR(100) NOT NULL,
    CONSTRAINT pk_tipo_evento PRIMARY KEY (Tie_cod_tipo_evento)
);

CREATE TABLE TIPO_STAND (
    Tis_cod_tipo_stand SERIAL,
    Tis_nb_tipo_stand VARCHAR(100) NOT NULL,
    CONSTRAINT pk_tipo_stand PRIMARY KEY (Tis_cod_tipo_stand)
);

CREATE TABLE LEYENDA_ESTRELLA (
    Lee_cod_leyenda_estrella SERIAL,
    Lee_nb_descripcion_leyenda VARCHAR(255) NOT NULL,
    CONSTRAINT pk_leyenda PRIMARY KEY (Lee_cod_leyenda_estrella)
);

CREATE TABLE CATEGORIA (
    Cat_cod_categoria SERIAL,
    Cat_nb_categoria VARCHAR(100) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (Cat_cod_categoria)
);

CREATE TABLE SUBCATEGORIA (
    Sub_cod_subcategoria SERIAL,
    Sub_nb_subcategoria VARCHAR(100) NOT NULL,
    Fk_categoria INTEGER NOT NULL,
    CONSTRAINT pk_subcategoria PRIMARY KEY (Sub_cod_subcategoria),
    CONSTRAINT fk_subcategoria_categoria FOREIGN KEY (Fk_categoria) REFERENCES CATEGORIA (Cat_cod_categoria)
);

CREATE TABLE CLIENTE (
    Cli_cod_cliente SERIAL,
    Cli_nb_cliente VARCHAR(150) NOT NULL,
    Cli_cedula VARCHAR(20) UNIQUE NOT NULL,
    Cli_rif VARCHAR(20) UNIQUE NOT NULL,
    Cli_telefono VARCHAR(20) NOT NULL,
    Cli_direccion VARCHAR(255) NOT NULL,
    Cli_email VARCHAR(150) UNIQUE NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (Cli_cod_cliente)
);

CREATE TABLE VISITANTE (
    Vis_cod_visitante SERIAL,
    Vis_cedula VARCHAR(20) UNIQUE NOT NULL, 
    Vis_nb_visitante VARCHAR(150) NOT NULL,
    Vis_sexo CHAR(1) NOT NULL,
    Vis_email VARCHAR(150) UNIQUE NOT NULL,
    CONSTRAINT pk_visitante PRIMARY KEY (Vis_cod_visitante)
);

CREATE TABLE EVENTO (
    Eve_cod_evento SERIAL,
    Eve_nb_evento VARCHAR(150) NOT NULL,
    Eve_fecha_inicio DATE NOT NULL,
    Eve_fecha_fin DATE NOT NULL,
    Eve_descripcion TEXT,
    Eve_email VARCHAR(150) UNIQUE NOT NULL,
    Fk_tipo_evento INTEGER NOT NULL,
    Fk_sede INTEGER NOT NULL,
    CONSTRAINT pk_evento PRIMARY KEY (Eve_cod_evento),
    CONSTRAINT fk_evento_sede FOREIGN KEY (Fk_sede) REFERENCES SEDE (Sed_cod_sede),
    CONSTRAINT fk_evento_tipo_evento FOREIGN KEY (Fk_tipo_evento) REFERENCES TIPO_EVENTO (Tie_cod_tipo_evento)
);

CREATE TABLE CONTRATO (
    Con_nro_stand SERIAL,
    Con_fecha_alquiler DATE NOT NULL,
    Con_mts_cuadrados_adicionales DECIMAL(10,2) DEFAULT 0,
    Con_monto DECIMAL(10,2) NOT NULL,
    Fk_cliente INTEGER NOT NULL,
    Fk_evento INTEGER NOT NULL,
    Fk_subcategoria INTEGER NOT NULL,
    Fk_tipo_stand INTEGER NOT NULL,
    CONSTRAINT pk_contrato PRIMARY KEY (Con_nro_stand),
    CONSTRAINT fk_contrato_cliente FOREIGN KEY (Fk_cliente) REFERENCES CLIENTE (Cli_cod_cliente),
    CONSTRAINT fk_contrato_evento FOREIGN KEY (Fk_evento) REFERENCES EVENTO (Eve_cod_evento),
    CONSTRAINT fk_contrato_subcategoria FOREIGN KEY (Fk_subcategoria) REFERENCES SUBCATEGORIA (Sub_cod_subcategoria),
    CONSTRAINT fk_contrato_tipo_stand FOREIGN KEY (Fk_tipo_stand) REFERENCES TIPO_STAND (Tis_cod_tipo_stand)
);

CREATE TABLE EVENTO_STAND (
    Fk_evento INTEGER NOT NULL,
    Fk_tipo_stand INTEGER NOT NULL,
    Evs_cantidad_estimada INTEGER NOT NULL,
    Evs_mts_cuadrados_stand DECIMAL(10,2) NOT NULL,
    Evs_precio DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_evento_stand PRIMARY KEY (Fk_evento, Fk_tipo_stand),
    CONSTRAINT fk_evento_stand_evento FOREIGN KEY (Fk_evento) REFERENCES EVENTO (Eve_cod_evento),
    CONSTRAINT fk_evento_stand_tipo_stand FOREIGN KEY (Fk_tipo_stand) REFERENCES TIPO_STAND (Tis_cod_tipo_stand)
);

CREATE TABLE ENTRADA (
    Ent_nro_entrada SERIAL,
    Ent_fecha_entrada DATE NOT NULL,
    Ent_hora_entrada TIME NOT NULL,
    Ent_recomienda_amigo BOOLEAN NOT NULL,
    Ent_calificacion INTEGER NOT NULL,
    Fk_evento INTEGER NOT NULL,
    Fk_visitante INTEGER NOT NULL,
    Fk_leyenda_estrella INTEGER NOT NULL,
    CONSTRAINT pk_entrada PRIMARY KEY (Ent_nro_entrada),
    CONSTRAINT fk_entrada_evento FOREIGN KEY (Fk_evento) REFERENCES EVENTO (Eve_cod_evento),
    CONSTRAINT fk_entrada_visitante FOREIGN KEY (Fk_visitante) REFERENCES VISITANTE (Vis_cod_visitante),
    CONSTRAINT fk_entrada_leyenda FOREIGN KEY (Fk_leyenda_estrella) REFERENCES LEYENDA_ESTRELLA (Lee_cod_leyenda_estrella)
);