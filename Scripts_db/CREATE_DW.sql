
--DIMENSIONES

CREATE TABLE DIM_SEDE (
    sk_sede SERIAL,
    cod_pais INTEGER NOT NULL,
    nb_pais VARCHAR(100) NOT NULL,
    cod_ciudad INTEGER NOT NULL,
    nb_ciudad VARCHAR(100) NOT NULL,
    cod_sede INTEGER NOT NULL,
    nb_sede VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dim_sede PRIMARY KEY (sk_sede)
);

CREATE TABLE DIM_EVENTO (
    sk_evento SERIAL,
    cod_evento INTEGER NOT NULL,
    cod_tipo_evento INTEGER NOT NULL,
    nb_tipo_evento VARCHAR(100) NOT NULL,
    nb_evento VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dim_evento PRIMARY KEY (sk_evento)
);

CREATE TABLE DIM_TIPO_STAND (
    sk_tipo_stand SERIAL,
    cod_tipo_stand INTEGER NOT NULL,
    nb_tipo_stand VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dim_tipo_stand PRIMARY KEY (sk_tipo_stand)
);

CREATE TABLE DIM_LEYENDA (
    sk_leyenda SERIAL,
    cod_leyenda INTEGER NOT NULL,
    nb_leyenda VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dim_leyenda PRIMARY KEY (sk_leyenda)
);

CREATE TABLE DIM_VISITANTE (
    sk_visitante SERIAL,
    cod_visitante INTEGER NOT NULL,
    cedula INTEGER NOT NULL,
    nb_visitante VARCHAR(100) NOT NULL,
    sexo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dim_visitante PRIMARY KEY (sk_visitante)
);

CREATE TABLE DIM_TIEMPO (
    sk_tiempo SERIAL,
    cod_anio INTEGER NOT NULL,
    cod_trimestre INTEGER NOT NULL,
    des_trimestre VARCHAR(100) NOT NULL,
    cod_mes INTEGER NOT NULL,
    desc_mes VARCHAR(20) NOT NULL,
    desc_mes_corta VARCHAR(20) NOT NULL,
    cod_semana INTEGER NOT NULL,
    cod_dia_anio INTEGER NOT NULL,
    cod_dia_mes INTEGER NOT NULL,
    cod_dia_semana INTEGER NOT NULL,
    desc_dia_semana VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT pk_dim_tiempo PRIMARY KEY (sk_tiempo)
);

CREATE TABLE DIM_CLIENTE (
    sk_cliente SERIAL,
    cod_cliente INTEGER NOT NULL,
    ci_rif VARCHAR(100) NOT NULL,
    nb_cliente VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dim_cliente PRIMARY KEY (sk_cliente)
);

CREATE TABLE DIM_CATEGORIA (
    sk_categoria SERIAL,
    cod_subcategoria INTEGER NOT NULL,
    nb_subcategoria VARCHAR(100) NOT NULL,
    cod_categoria INTEGER NOT NULL,
    nb_categoria VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dim_categoria PRIMARY KEY (sk_categoria)
);

--TABLAS DE HECHOS

CREATE TABLE FACT_META (
    sk_evento INTEGER NOT NULL,
    sk_sede INTEGER NOT NULL,
    sk_fecha_evento INTEGER NOT NULL,
    nro_stands_propuestos INTEGER NOT NULL,
    cantidad_estim_visitantes INTEGER NOT NULL,
    meta_ingreso NUMERIC(10,4) NOT NULL,
    CONSTRAINT pk_fact_evento PRIMARY KEY (sk_evento, sk_sede, sk_fecha_evento),
    CONSTRAINT fk_fe_dim_evento FOREIGN KEY (sk_evento) REFERENCES DIM_EVENTO (sk_evento),
    CONSTRAINT fk_fe_dim_sede FOREIGN KEY (sk_sede) REFERENCES DIM_SEDE (sk_sede),
    CONSTRAINT fk_fe_dim_tiempo FOREIGN KEY (sk_fecha_evento) REFERENCES DIM_TIEMPO (sk_tiempo)
);

CREATE TABLE FACT_EVENTO_STAND (
    sk_evento INTEGER NOT NULL,
    sk_tipo_stand INTEGER NOT NULL,
    cantidad_estimada INTEGER NOT NULL,
    mt2 NUMERIC(10,4) NOT NULL,
    precio NUMERIC(10,4) NOT NULL,
    CONSTRAINT pk_fact_evento_stand PRIMARY KEY (sk_evento, sk_tipo_stand),
    CONSTRAINT fk_fes_dim_evento FOREIGN KEY (sk_evento) REFERENCES DIM_EVENTO (sk_evento),
    CONSTRAINT fk_fes_dim_tipo_stand FOREIGN KEY (sk_tipo_stand) REFERENCES DIM_TIPO_STAND (sk_tipo_stand)
);

CREATE TABLE FACT_ALQUILER (
    sk_evento INTEGER NOT NULL,
    sk_cliente INTEGER NOT NULL,
    sk_fec_alquiler INTEGER NOT NULL,
    sk_tipo_stand INTEGER NOT NULL,
    sk_categoria INTEGER NOT NULL,
    num_contrato INTEGER NOT NULL,
    num_stand INTEGER NOT NULL,
    mt2_adicionales NUMERIC(10,4) NOT NULL,
    monto NUMERIC(10,4) NOT NULL,
    cantidad INTEGER NOT NULL,
    CONSTRAINT pk_fact_alquiler PRIMARY KEY (sk_evento, sk_cliente, sk_fec_alquiler, sk_tipo_stand, sk_categoria, num_contrato, num_stand),
    CONSTRAINT fk_fa_dim_evento FOREIGN KEY (sk_evento) REFERENCES DIM_EVENTO (sk_evento),
    CONSTRAINT fk_fa_dim_cliente FOREIGN KEY (sk_cliente) REFERENCES DIM_CLIENTE (sk_cliente),
    CONSTRAINT fk_fa_dim_tiempo FOREIGN KEY (sk_fec_alquiler) REFERENCES DIM_TIEMPO (sk_tiempo),
    CONSTRAINT fk_fa_dim_tipo_stand FOREIGN KEY (sk_tipo_stand) REFERENCES DIM_TIPO_STAND (sk_tipo_stand),
    CONSTRAINT fk_fa_dim_categoria FOREIGN KEY (sk_categoria) REFERENCES DIM_CATEGORIA (sk_categoria)
);

CREATE TABLE FACT_VISITA (
    sk_evento INTEGER NOT NULL,
    sk_visitante INTEGER NOT NULL,
    sk_fec_entrada INTEGER NOT NULL,
    sk_leyenda_estrellas INTEGER NOT NULL,
    num_entrada INTEGER NOT NULL,
    hora_entrada TIME NOT NULL,
    cantidad_visitantes INTEGER NOT NULL,
    calificacion VARCHAR(10) NOT NULL,
    recomienda_amigo VARCHAR(100) NOT NULL,
    CONSTRAINT pk_fact_visita PRIMARY KEY (sk_evento, sk_visitante, sk_fec_entrada, sk_leyenda_estrellas, num_entrada),
    CONSTRAINT fk_fe_dim_evento FOREIGN KEY (sk_evento) REFERENCES DIM_EVENTO (sk_evento),
    CONSTRAINT fk_fe_dim_visitante FOREIGN KEY (sk_visitante) REFERENCES DIM_VISITANTE (sk_visitante),
    CONSTRAINT fk_fe_dim_tiempo FOREIGN KEY (sk_fec_entrada) REFERENCES DIM_TIEMPO (sk_tiempo),
    CONSTRAINT fk_fe_dim_leyenda FOREIGN KEY (sk_leyenda_estrellas) REFERENCES DIM_LEYENDA (sk_leyenda)
);
