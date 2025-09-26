

# Event Management System 

* SQL-based Event Management System using **PostgreSQL** and **pgAdmin**
* Demonstrates database creation, relationships, and queries to manage events, attendees, venues, and registrations

---

## Features

* Create and manage **Venues**, **Events**, **Attendees**, and **Registrations**
* Perform SQL operations: **INSERT**, **UPDATE**, **DELETE**, **SELECT**
* Retrieve event details along with venue information
* Track registrations and ticket types (**General**, **VIP**, **Student**)
* Generate reports: attendee lists, event registration counts
* Ensure data integrity using **primary keys**, **foreign keys**, and **constraints**

---

## Tables

* **Venues** – Stores venue information: name, location, capacity
* **Events** – Stores event details: name, date, venue
* **Attendees** – Stores attendee details: full name, email
* **Registrations** – Tracks attendee registrations for events with ticket types

---

## Sample Queries

* View all events with venue details
* List all attendees
* Find attendees registered for a specific event
* Count total registrations for each event
* Update an attendee’s email
* Delete a registration (cancel ticket)
* Show events happening in a specific month
* Find venue capacity for an event
* Add a new attendee
* Show all VIP ticket registrations

---

## Sample Data

* **Venues**: Grand Hall, City Convention Center, Open Air Theatre
* **Events**: Tech Conference 2025, Startup Pitch Fest, Music Festival
* **Attendees**: Amit Sharma, Priya Verma, Rahul Mehta, Sneha Patil, Arjun Singh
* **Ticket Types**: General, VIP, Student

---

## How to Use

* Clone this repository
* Open **pgAdmin** and connect to your PostgreSQL server
* Run the `event_management.sql` file to create tables and insert sample data
* Execute the provided queries to interact with the database

---

## Technologies

* PostgreSQL
* pgAdmin
* SQL
