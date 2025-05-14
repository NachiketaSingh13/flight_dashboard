DROP TABLE IF EXISTS Bookings, Flights, Routes, Aircrafts, Airports, Passengers;

-- Airports
CREATE TABLE Airports (
    airport_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100),
    iata_code CHAR(3) UNIQUE NOT NULL
);

-- Aircrafts
CREATE TABLE Aircrafts (
    aircraft_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(50),
    capacity INT
);

-- Routes
CREATE TABLE Routes (
    route_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    source_airport INT UNSIGNED,
    destination_airport INT UNSIGNED,
    distance_km INT,
    FOREIGN KEY (source_airport) REFERENCES Airports(airport_id),
    FOREIGN KEY (destination_airport) REFERENCES Airports(airport_id)
);

-- Flights
CREATE TABLE Flights (
    flight_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(10) UNIQUE NOT NULL,
    route_id INT UNSIGNED,
    aircraft_id INT UNSIGNED,
    departure_time DATETIME,
    arrival_time DATETIME,
    FOREIGN KEY (route_id) REFERENCES Routes(route_id),
    FOREIGN KEY (aircraft_id) REFERENCES Aircrafts(aircraft_id)
);

-- Passengers
CREATE TABLE Passengers (
    passenger_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    passport_number VARCHAR(20) UNIQUE
);

-- Bookings
CREATE TABLE Bookings (
    booking_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    flight_id INT UNSIGNED,
    passenger_id INT UNSIGNED,
    seat_number VARCHAR(5),
    booking_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);
