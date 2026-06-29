-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: [Tu nombre]
-- Fecha: [Fecha de entrega]
-- ══════════════════════════════════════════

-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.
select p.producto_id, p.nombre 
from productos p left outer join ventas v on p.producto_id = v.producto_id
where v.venta_id is null


-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.

select v.venta_id,v.producto_id,cliente_id, cantidad, fecha_venta
from productos p right outer join ventas v on p.producto_id = v.producto_id
where p.producto_id is null


-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

select v.venta_id,v.producto_id,cliente_id, cantidad, fecha_venta,p.producto_id, p.nombre, p.categoria, p.precio
from productos p full outer join ventas v on p.producto_id = v.producto_id

