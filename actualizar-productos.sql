-- Deja la tabla `producto` como la siembra ProductoSeeder (un producto por presentacion y etiqueta).
-- El seeder solo corre con la tabla vacia, por eso esto se ejecuta una vez en cada base ya existente:
--   sudo docker exec -i autoFac_mysql mysql -uroot -p autofacapi < actualizar-productos.sql
-- Es seguro repetirlo: los INSERT no duplican filas y los UPDATE solo reescriben los mismos valores.
-- No toca los precios de las garrafas. Los galones nuevos entran con precio 0 (la landing muestra
-- "Consultar precio") hasta que se editen desde Dashboard > Productos.

-- 1) Nombres segun la etiqueta del envase
UPDATE producto SET nombre = 'BLUEGEL'      WHERE nombre = 'BLUE GEL';
UPDATE producto SET nombre = 'BL-50'        WHERE nombre = 'BLUE-50';
UPDATE producto SET nombre = 'BL-22'        WHERE nombre = 'BLUE-22';
UPDATE producto SET nombre = 'DESBLUECUAT'  WHERE nombre = 'DESBLUE CUAT';
UPDATE producto SET nombre = 'ALCOHOL 70%'  WHERE nombre = 'ALCOHOL AL 70%';

-- 2) Garrafa de 20 L: nombre de presentacion e imagen propia
UPDATE producto SET presentacion = 'Garrafa 20 L' WHERE presentacion = '20 L';

UPDATE producto SET imagen_url = 'assets/img/productos/d-20.jpg'         WHERE nombre = 'D-20'        AND presentacion = 'Garrafa 20 L';
UPDATE producto SET imagen_url = 'assets/img/productos/deterblue.jpg'    WHERE nombre = 'DETERBLUE'   AND presentacion = 'Garrafa 20 L';
UPDATE producto SET imagen_url = 'assets/img/productos/power-blue.jpg'   WHERE nombre = 'POWER BLUE'  AND presentacion = 'Garrafa 20 L';
UPDATE producto SET imagen_url = 'assets/img/productos/dermi-blue.jpg'   WHERE nombre = 'DERMI BLUE'  AND presentacion = 'Garrafa 20 L';
UPDATE producto SET imagen_url = 'assets/img/productos/bluegel.jpg'      WHERE nombre = 'BLUEGEL'     AND presentacion = 'Garrafa 20 L';
UPDATE producto SET imagen_url = 'assets/img/productos/bl-50.jpg'        WHERE nombre = 'BL-50'       AND presentacion = 'Garrafa 20 L';
UPDATE producto SET imagen_url = 'assets/img/productos/bl-22.jpg'        WHERE nombre = 'BL-22'       AND presentacion = 'Garrafa 20 L';
UPDATE producto SET imagen_url = 'assets/img/productos/desbluecuat.jpg'  WHERE nombre = 'DESBLUECUAT' AND presentacion = 'Garrafa 20 L';
UPDATE producto SET imagen_url = 'assets/img/productos/alcohol-70.jpg'   WHERE nombre = 'ALCOHOL 70%' AND presentacion = 'Garrafa 20 L';
UPDATE producto SET imagen_url = 'assets/img/productos/bl-40.jpg'        WHERE nombre = 'BL-40'       AND presentacion = 'Garrafa 20 L';

-- 3) Galon de 4 L: una fila nueva por cada etiqueta de galon, copiando categoria y descripcion de la garrafa
INSERT INTO producto (nombre, categoria, descripcion, presentacion, precio, imagen_url)
SELECT g.nombre, g.categoria, g.descripcion, 'Galón 4 L', 0, CONCAT('assets/img/productos/', v.archivo)
FROM producto g
JOIN (
    SELECT 'D-20'        AS nombre, 'd-20-4l.jpg'        AS archivo UNION ALL
    SELECT 'DETERBLUE',             'deterblue-4l.jpg'              UNION ALL
    SELECT 'DERMI BLUE',            'dermi-blue-4l.jpg'             UNION ALL
    SELECT 'BLUEGEL',               'bluegel-4l.jpg'                UNION ALL
    SELECT 'BL-50',                 'bl-50-4l.jpg'                  UNION ALL
    SELECT 'BL-22',                 'bl-22-4l.jpg'                  UNION ALL
    SELECT 'DESBLUECUAT',           'desbluecuat-4l.jpg'            UNION ALL
    SELECT 'BL-40',                 'bl-40-4l.jpg'
) v ON v.nombre = g.nombre
WHERE g.presentacion = 'Garrafa 20 L'
  AND NOT EXISTS (
      SELECT 1 FROM producto x WHERE x.nombre = g.nombre AND x.presentacion = 'Galón 4 L'
  );

SELECT id, nombre, presentacion, precio, imagen_url FROM producto ORDER BY nombre, presentacion;
