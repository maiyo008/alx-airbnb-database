# Airbnb Clone Database Schema

## Overview
This project represents a database schema for an Airbnb-like application. The database manages key entities such as users, properties, bookings, payments, reviews, and messages. The schema is designed for scalability, maintainability, and performance.

## Database Entities and Relationships
The database consists of the following tables:

- **User**: Manages user accounts and profiles.
- **Property**: Represents properties listed by hosts.
- **Booking**: Tracks booking details for properties.
- **Payment**: Handles payment transactions.
- **Review**: Stores reviews and ratings for properties.
- **Message**: Facilitates communication between users.

The relationships between these entities are depicted in the ERD (Entity Relationship Diagram).

---

## Schema Details

### 1. User Table
Stores information about users (guests and hosts).

| Column         | Type           | Constraints                     |
|----------------|----------------|----------------------------------|
| user_id        | SERIAL         | Primary Key                     |
| first_name     | VARCHAR(50)    | Not Null                        |
| last_name      | VARCHAR(50)    | Not Null                        |
| email          | VARCHAR(100)   | Not Null, Unique                |
| password_hash  | VARCHAR(255)   | Not Null                        |
| phone_number   | VARCHAR(15)    | Unique                          |
| role           | ENUM           | Not Null, `guest` or `host`     |
| created_at     | TIMESTAMP      | Default: `CURRENT_TIMESTAMP`    |

---

### 2. Property Table
Represents properties listed by users.

| Column         | Type           | Constraints                     |
|----------------|----------------|----------------------------------|
| property_id    | SERIAL         | Primary Key                     |
| name           | VARCHAR(100)   | Not Null                        |
| description    | TEXT           | Not Null                        |
| location       | VARCHAR(255)   | Not Null                        |
| price_per_night| DECIMAL(10, 2) | Not Null                        |
| created_at     | TIMESTAMP      | Default: `CURRENT_TIMESTAMP`    |
| updated_at     | TIMESTAMP      | Default: `CURRENT_TIMESTAMP` on update |

---

### 3. Booking Table
Tracks booking information for properties.

| Column         | Type           | Constraints                     |
|----------------|----------------|----------------------------------|
| booking_id     | SERIAL         | Primary Key                     |
| property_id    | INT            | Foreign Key: `Property(property_id)` |
| user_id        | INT            | Foreign Key: `User(user_id)`    |
| start_date     | DATE           | Not Null                        |
| end_date       | DATE           | Not Null                        |
| total_price    | DECIMAL(10, 2) | Not Null                        |
| status         | ENUM           | Default: `pending`              |
| created_at     | TIMESTAMP      | Default: `CURRENT_TIMESTAMP`    |

---

### 4. Payment Table
Handles payment transactions for bookings.

| Column         | Type           | Constraints                     |
|----------------|----------------|----------------------------------|
| payment_id     | SERIAL         | Primary Key                     |
| booking_id     | INT            | Foreign Key: `Booking(booking_id)` |
| amount         | DECIMAL(10, 2) | Not Null                        |
| payment_date   | TIMESTAMP      | Default: `CURRENT_TIMESTAMP`    |
| payment_method | ENUM           | Not Null, e.g., `credit_card`, `paypal` |

---

### 5. Review Table
Stores user reviews and ratings for properties.

| Column         | Type           | Constraints                     |
|----------------|----------------|----------------------------------|
| review_id      | SERIAL         | Primary Key                     |
| property_id    | INT            | Foreign Key: `Property(property_id)` |
| user_id        | INT            | Foreign Key: `User(user_id)`    |
| rating         | INT            | CHECK (rating BETWEEN 1 AND 5)  |
| comment        | TEXT           | Optional                        |
| created_at     | TIMESTAMP      | Default: `CURRENT_TIMESTAMP`    |

---

### 6. Message Table
Supports messaging between users.

| Column         | Type           | Constraints                     |
|----------------|----------------|----------------------------------|
| message_id     | SERIAL         | Primary Key                     |
| sender_id      | INT            | Foreign Key: `User(user_id)`    |
| recipient_id   | INT            | Foreign Key: `User(user_id)`    |
| message_body   | TEXT           | Not Null                        |
| sent_at        | TIMESTAMP      | Default: `CURRENT_TIMESTAMP`    |

---

## Relationships
- A **User** can list multiple **Properties**.
- A **User** can make multiple **Bookings** for different **Properties**.
- Each **Booking** is associated with a **Payment**.
- A **Property** can have multiple **Reviews**.
- Users can exchange **Messages** with one another.

---

## SQL Schema Creation
The SQL scripts for creating the database tables, constraints, and indexes are included in this repository under the `db_schema.sql` file. Use the following commands to set up the database:

1. Connect to your PostgreSQL database:
   ```bash
   psql -U your_username -d your_database
