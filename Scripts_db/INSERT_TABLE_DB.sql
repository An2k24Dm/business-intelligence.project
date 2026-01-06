INSERT INTO PAIS (Pai_nb_pais) VALUES
('Venezuela');

INSERT INTO CIUDAD (Ciu_nb_ciudad, Fk_pais) VALUES
('Caracas', 1),
('Maracay', 1),
('Valencia', 1);

INSERT INTO SEDE (Sed_nb_sede, Fk_ciudad) VALUES
('Las Mercedes', 1),
('El Hatillo', 1),
('Galipán', 1),
('Sebucán', 1),
('Centro Maracay', 2),
('Zona Industrial Valencia', 3);

INSERT INTO TIPO_EVENTO (Tie_nb_tipo_evento) VALUES
('Feria'),
('Bazar'),
('Exposición');

INSERT INTO TIPO_STAND (Tis_nb_tipo_stand) VALUES
('Mínima'),
('Estándar'),
('Máximo/Ajustable');

INSERT INTO LEYENDA_ESTRELLA (Lee_nb_descripcion_leyenda) VALUES
('Malo'),
('Regular'),
('Bueno'),
('Muy Bueno'),
('Excelente');

INSERT INTO CATEGORIA (Cat_nb_categoria) VALUES
('Comida'),
('Ropa y Calzado'),
('Deporte'),
('Hogar'),
('Tecnología'),
('Belleza'),
('Arte y Artesanía'),
('Bebidas'),
('Niños y Bebés');

INSERT INTO SUBCATEGORIA (Sub_nb_subcategoria, Fk_categoria) VALUES
('Hamburguesas', 1),
('Ropa para Damas', 2),
('Artículos Deportivos', 3),
('Electrodomésticos', 4),
('Accesorios Móviles', 5),
('Cuidado Personal', 6),
('Cuadros y Pintura', 7),
('Cafetería', 8),
('Juguetes', 9),
('Ropa para Niños', 9);

INSERT INTO CLIENTE (Cli_nb_cliente, Cli_cedula, Cli_rif, Cli_telefono, Cli_direccion, Cli_email) VALUES
('DulceManía C.A.', 'J29876123', 'J-29876123-5', '02121234567', 'Caracas', 'contacto@dulcemania.com'),
('Moda Latina', 'J20887411', 'J-20887411-9', '02129998877', 'Caracas', 'ventas@modalatina.com'),
('Burger House', 'J30011223', 'J-30011223-0', '02127654321', 'Caracas', 'info@burgerhouse.com');

INSERT INTO VISITANTE (Vis_cedula, Vis_nb_visitante, Vis_sexo, Vis_email) VALUES
('14523698', 'José León', 'M', 'jleon@gmail.com'),
('19874563', 'Ana Villalba', 'F', 'ana.villalba@gmail.com'),
('20458963', 'Marcos Rivero', 'M', 'marcos.rivero@gmail.com'),
('18645239', 'Laura Rodriguez', 'F', 'laurar@gmail.com');

INSERT INTO EVENTO (Eve_nb_evento, Eve_fecha_inicio, Eve_fecha_fin, Eve_descripcion, Eve_email, Fk_tipo_evento, Fk_sede) VALUES
('Feria de Comida Caracas 2025', '2025-03-10', '2025-03-12', 'Feria gastronómica con comida tradicional y gourmet', 'info@feriacomida.com', 1, 1),
('Bazar Artesanal El Hatillo 2025', '2025-04-20', '2025-04-22', 'Bazar de artesanías, ropa y accesorios', 'contacto@bazarhatillo.com', 2, 2),
('Expo Deportes Galipán 2025', '2025-05-15', '2025-05-17', 'Exposición de artículos deportivos y actividades recreativas', 'expodeportes@galipan.com', 3, 3);

INSERT INTO EVENTO_STAND (Fk_evento, Fk_tipo_stand, Evs_cantidad_estimada, Evs_mts_cuadrados_stand, Evs_precio) VALUES
(1, 1, 20, 6, 500),
(1, 2, 15, 12, 800),
(1, 3, 10, 15, 1000),
(2, 1, 25, 6, 500),
(2, 2, 10, 12, 800),
(2, 3, 5, 15, 1000),
(3, 1, 30, 6, 500),
(3, 2, 15, 12, 800),
(3, 3, 8, 15, 1000);

INSERT INTO CONTRATO (Con_fecha_alquiler, Con_mts_cuadrados_adicionales, Con_monto, Fk_cliente, Fk_evento, Fk_subcategoria, Fk_tipo_stand) VALUES
('2025-02-15', 0, 400, 1, 1, 1, 1),
('2025-02-20', 2, 750, 2, 1, 4, 3),
('2025-03-01', 0, 300, 3, 1, 2, 1),
('2025-04-01', 0, 600, 2, 2, 3, 2),
('2025-04-05', 3, 900, 1, 2, 1, 3),
('2025-05-01', 0, 650, 3, 3, 5, 2);

INSERT INTO ENTRADA (Ent_fecha_entrada, Ent_hora_entrada, Ent_recomienda_amigo, Ent_calificacion, Fk_evento, Fk_visitante, Fk_leyenda_estrella) VALUES
('2025-03-10', '10:15', TRUE, 5, 1, 1, 5),
('2025-03-10', '13:40', TRUE, 4, 1, 2, 4),
('2025-04-20', '11:00', FALSE, 3, 2, 3, 3),
('2025-05-15', '14:30', TRUE, 5, 3, 4, 5);