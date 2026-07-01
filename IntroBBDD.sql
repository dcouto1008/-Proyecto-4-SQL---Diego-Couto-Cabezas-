-- ============================================
-- Ejercicio 1
-- Vuelos (flights) con estado "On Time"
-- ============================================

SELECT flight_id, flight_no
FROM flights
WHERE status = 'On Time';


-- ============================================
-- Ejercicio 2
-- Reservas con importe total superior a 1.000.000
-- ============================================

SELECT *
FROM bookings
WHERE total_amount > 1000000;


-- ============================================
-- Ejercicio 3
-- Todos los datos de los modelos de avión
-- ============================================

SELECT *
FROM aircrafts_data;


-- ============================================
-- Ejercicio 4
-- Identificadores de vuelo realizados con Boeing 737
-- Código de avión = '733'
-- ============================================

SELECT flight_id
FROM flights
WHERE aircraft_code = '733';


-- ============================================
-- Ejercicio 5
-- Información detallada de los tickets comprados
-- por personas llamadas Irina
-- ============================================

SELECT t.*
FROM tickets t
WHERE t.passenger_name ILIKE 'Irina%';


-- ============================================
-- Ejercicio 6 (Opcional)
-- Ciudades con más de un aeropuerto
-- ============================================

SELECT city,
       COUNT(*) AS numero_aeropuertos
FROM airports_data
GROUP BY city
HAVING COUNT(*) > 1
ORDER BY numero_aeropuertos DESC;


-- ============================================
-- Ejercicio 7 (Opcional)
-- Número de vuelos por modelo de avión
-- ============================================

SELECT aircraft_code,
       COUNT(*) AS numero_vuelos
FROM flights
GROUP BY aircraft_code
ORDER BY numero_vuelos DESC;


-- ============================================
-- Ejercicio 8 
-- Reservas con más de un billete
-- ============================================

SELECT book_ref,
       COUNT(*) AS numero_billetes
FROM tickets
GROUP BY book_ref
HAVING COUNT(*) > 1
ORDER BY numero_billetes DESC;


-- ============================================
-- Ejercicio 9 
-- Vuelos con retraso de salida superior a una hora
-- ============================================

SELECT flight_id,
       flight_no,
       scheduled_departure,
       actual_departure,
       actual_departure - scheduled_departure AS retraso
FROM flights
WHERE actual_departure IS NOT NULL
  AND actual_departure - scheduled_departure > INTERVAL '1 hour';