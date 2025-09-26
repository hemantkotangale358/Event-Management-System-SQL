-- Create Tables
CREATE TABLE Venues (
    venue_id SERIAL PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    capacity INT CHECK (capacity > 0)
);

CREATE TABLE Events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    venue_id INT REFERENCES Venues(venue_id) ON DELETE CASCADE
);

CREATE TABLE Attendees (
    attendee_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Registrations (
    registration_id SERIAL PRIMARY KEY,
    event_id INT REFERENCES Events(event_id) ON DELETE CASCADE,
    attendee_id INT REFERENCES Attendees(attendee_id) ON DELETE CASCADE,
    ticket_type VARCHAR(50) DEFAULT 'General'
);
-- Insert Sample Data

-- Venues
INSERT INTO Venues (venue_name, location, capacity) VALUES
('Grand Hall', 'Mumbai', 500),
('City Convention Center', 'Nagpur', 300),
('Open Air Theatre', 'Pune', 800);

-- Events
INSERT INTO Events (event_name, event_date, venue_id) VALUES
('Tech Conference 2025', '2025-05-10', 1),
('Startup Pitch Fest', '2025-05-15', 2),
('Music Festival', '2025-06-01', 3);

-- Attendees
INSERT INTO Attendees (full_name, email) VALUES
('Amit Sharma', 'amit@example.com'),
('Priya Verma', 'priya@example.com'),
('Rahul Mehta', 'rahul@example.com'),
('Sneha Patil', 'sneha@example.com'),
('Arjun Singh', 'arjun@example.com');

-- Registrations
INSERT INTO Registrations (event_id, attendee_id, ticket_type) VALUES
(1, 1, 'VIP'),
(1, 2, 'General'),
(2, 3, 'General'),
(2, 4, 'Student'),
(3, 5, 'VIP'),
(3, 1, 'General');

-- SQL Queries (Simple)
-- 1. View all events with venue details
SELECT e.event_name, e.event_date, v.venue_name, v.location
FROM Events e
JOIN Venues v ON e.venue_id = v.venue_id;

-- 2. List all attendees
SELECT * FROM Attendees;

-- 3. Find all attendees registered for 'Tech Conference 2025'
SELECT a.full_name, a.email
FROM Attendees a
JOIN Registrations r ON a.attendee_id = r.attendee_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.event_name = 'Tech Conference 2025';

-- 4. Count how many people registered for each event
SELECT e.event_name, COUNT(r.registration_id) AS total_registrations
FROM Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
GROUP BY e.event_name;

-- 5. Update an attendee’s email
UPDATE Attendees
SET email = 'amit.sharma@example.com'
WHERE full_name = 'Amit Sharma';

-- 6. Delete a registration (cancelling ticket)
DELETE FROM Registrations
WHERE registration_id = 6;

-- 7. Show events happening in May 2025
SELECT event_name, event_date
FROM Events
WHERE EXTRACT(MONTH FROM event_date) = 5;

-- 8. Find venue capacity for 'Music Festival'
SELECT v.venue_name, v.capacity
FROM Venues v
JOIN Events e ON v.venue_id = e.venue_id
WHERE e.event_name = 'Music Festival';

-- 9. Add a new attendee
INSERT INTO Attendees (full_name, email)
VALUES ('Karan Joshi', 'karan@example.com');

-- 10. Show all VIP ticket registrations
SELECT a.full_name, e.event_name, r.ticket_type
FROM Registrations r
JOIN Attendees a ON r.attendee_id = a.attendee_id
JOIN Events e ON r.event_id = e.event_id
WHERE r.ticket_type = 'VIP';