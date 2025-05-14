-- Airports
INSERT INTO Airports (name, city, country, iata_code) VALUES
('Heathrow Airport', 'London', 'UK', 'LHR'),
('John F. Kennedy Airport', 'New York', 'USA', 'JFK'),
('Frankfurt Airport', 'Frankfurt', 'Germany', 'FRA');

-- Aircrafts
INSERT INTO Aircrafts (model, capacity) VALUES
('Boeing 777', 300),
('Airbus A320', 180);

-- Routes
INSERT INTO Routes (source_airport, destination_airport, distance_km) VALUES
(1, 2, 5567),
(2, 3, 6200),
(3, 1, 639);

-- Flights
INSERT INTO Flights (flight_number, route_id, aircraft_id, departure_time, arrival_time) VALUES
('BA101', 1, 1, '2025-06-01 10:00:00', '2025-06-01 16:00:00'),
('LH202', 2, 2, '2025-06-02 14:00:00', '2025-06-02 22:00:00'),
('AF303', 3, 1, '2025-06-03 09:00:00', '2025-06-03 10:20:00');

-- Passengers
INSERT INTO Passengers (full_name, passport_number) VALUES
('Alice Johnson', 'A1234567'),
('Bob Smith', 'B7654321');

-- Bookings
INSERT INTO Bookings (flight_id, passenger_id, seat_number) VALUES
(1, 1, '12A'),
(2, 2, '14B');
