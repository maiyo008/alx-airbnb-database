# SQL Indexing and Query Optimization

## Step 1: Identify High-Usage Columns

### User Table
- `user_id`: Frequently used in `JOIN` clauses with the `Booking` table.
- `email`: Likely used in `WHERE` clauses for user login and authentication.

### Booking Table
- `booking_id`: Primary key used in queries.
- `user_id`: Used in `JOIN` with the `User` table.
- `property_id`: Used in `JOIN` with the `Property` table.
- `booking_date`: Potentially used in `WHERE` or `ORDER BY` clauses for filtering or sorting bookings.

### Property Table
- `property_id`: Frequently used in `JOIN` with the `Booking` table.
- `location`: May be used in `WHERE` clauses for filtering properties by location.

---

## Step 2: Create Indexes

Save the following SQL commands in `database_index.sql`:

```sql
-- Index for User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_id ON User(user_id);

-- Indexes for Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_date ON Booking(booking_date);

-- Indexes for Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_id ON Property(property_id);
```
---
## Step 3: Measure Query Performance (Before and After Indexing)
Use the EXPLAIN or ANALYZE command to check query performance.

**Example 1: Query to Retrieve Bookings for a Specific User**
```
EXPLAIN ANALYZE
SELECT 
    b.booking_id, 
    b.booking_date, 
    p.name AS property_name
FROM 
    Booking b
JOIN 
    Property p
ON 
    b.property_id = p.property_id
WHERE 
    b.user_id = 101;
```
**Example 2: Query to Retrieve Properties in a Specific Location**
```
EXPLAIN ANALYZE
SELECT 
    property_id, 
    name, 
    price_per_night
FROM 
    Property
WHERE 
    location = 'Downtown';
```
----