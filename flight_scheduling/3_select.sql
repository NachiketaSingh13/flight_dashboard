-- List all flights with route and aircraft info
SELECT f.flight_number, a1.name AS from_airport, a2.name AS to_airport,
       ac.model AS aircraft_model, f.departure_time, f.arrival_time
FROM Flights f
JOIN Routes r ON f.route_id = r.route_id
JOIN Airports a1 ON r.source_airport = a1.airport_id
JOIN Airports a2 ON r.destination_airport = a2.airport_id
JOIN Aircrafts ac ON f.aircraft_id = ac.aircraft_id;

-- List all bookings with passenger and flight info
SELECT b.booking_id, p.full_name, f.flight_number, b.seat_number
FROM Bookings b
JOIN Passengers p ON b.passenger_id = p.passenger_id
JOIN Flights f ON b.flight_id = f.flight_id;

-- Find all flights departing from 'London'
SELECT f.flight_number, f.departure_time
FROM Flights f
JOIN Routes r ON f.route_id = r.route_id
JOIN Airports a ON r.source_airport = a.airport_id
WHERE a.city = 'London';

-- Count number of bookings per flight
SELECT f.flight_number, COUNT(b.booking_id) AS total_bookings
FROM Flights f
LEFT JOIN Bookings b ON f.flight_id = b.flight_id
GROUP BY f.flight_number;
