-- Create database
CREATE DATABASE IF NOT EXISTS flight_dashboard;
USE flight_dashboard;

-- Drop existing tables (for testing purposes)
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Flights;

-- Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Flights table
CREATE TABLE Flights (
    FlightID INT AUTO_INCREMENT PRIMARY KEY,
    FlightNumber VARCHAR(10),
    Airline VARCHAR(50),
    Origin VARCHAR(50),
    Destination VARCHAR(50),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    Price DECIMAL(10, 2)
);

-- Bookings table
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    FlightID INT,
    BookingDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    SeatNumber VARCHAR(10),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

-- Insert sample users
INSERT INTO Users (FullName, Email, Phone) VALUES
('Alice Johnson', 'alice@example.com', '1234567890'),
('Bob Smith', 'bob@example.com', '0987654321');

-- Insert sample flights
INSERT INTO Flights (FlightNumber, Airline, Origin, Destination, DepartureTime, ArrivalTime, Price) VALUES
('AI101', 'Air India', 'Delhi', 'Mumbai', '2025-05-15 08:00:00', '2025-05-15 10:00:00', 4500.00),
('6E203', 'IndiGo', 'Bangalore', 'Kolkata', '2025-05-16 14:30:00', '2025-05-16 17:00:00', 5200.00),
('SG305', 'SpiceJet', 'Chennai', 'Delhi', '2025-05-17 06:45:00', '2025-05-17 09:30:00', 4800.00);

-- Insert sample bookings
INSERT INTO Bookings (UserID, FlightID, SeatNumber) VALUES
(1, 1, '12A'),
(2, 2, '18B'),
(1, 3, '7C');

-- Test queries
SELECT * FROM Users;
SELECT * FROM Flights;
SELECT * FROM Bookings;

-- Join query to show full booking info
SELECT 
    b.BookingID,
    u.FullName,
    f.FlightNumber,
    f.Origin,
    f.Destination,
    f.DepartureTime,
    b.SeatNumber
FROM Bookings b
JOIN Users u ON b.UserID = u.UserID
JOIN Flights f ON b.FlightID = f.FlightID;
