SELECT s.Evs_precio as Precio 
FROM EVENTO_STAND as s
WHERE s.Fk_evento = 1 and s.Fk_tipo_stand = 1;