# Query Performance Optimization

## Step 1: Initial Query

The following query retrieves all bookings along with user details, property details, and payment details. Save this query in `performance.sql`:

```sql
-- Initial query
SELECT 
    b.booking_id, 
    b.booking_date, 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    p.property_id, 
    p.name AS property_name, 
    pay.payment_id, 
    pay.amount, 
    pay.payment_date
FROM 
    Booking b
JOIN 
    User u 
ON 
    b.user_id = u.user_id
JOIN 
    Property p 
ON 
    b.property_id = p.property_id
LEFT JOIN 
    Payment pay 
ON 
    b.booking_id = pay.booking_id;
```
## Step 2: Analyze Performance Using EXPLAIN
Run the following command to analyze the performance:
```
EXPLAIN
SELECT 
    b.booking_id, 
    b.booking_date, 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    p.property_id, 
    p.name AS property_name, 
    pay.payment_id, 
    pay.amount, 
    pay.payment_date
FROM 
    Booking b
JOIN 
    User u 
ON 
    b.user_id = u.user_id
JOIN 
    Property p 
ON 
    b.property_id = p.property_id
LEFT JOIN 
    Payment pay 
ON 
    b.booking_id = pay.booking_id;
```

**Performance Observations**
* Full Table Scans: Check if any joins cause full table scans due to lack of indexes.
* Unnecessary Columns: If only specific columns are needed, avoid fetching all columns to reduce data transfer.

## Step 3: Refactored Query
Improvements Made
* Selective Columns: Fetch only the necessary columns.
* Indexing: Ensure indexes exist on user_id, property_id, and booking_id to speed up joins.
* Reducing Unnecessary Joins: If payment details are not always required, remove the LEFT JOIN or make it conditional.
Refactored query:
```
-- Refactored query
SELECT 
    b.booking_id, 
    b.booking_date, 
    u.first_name, 
    u.last_name, 
    p.name AS property_name
FROM 
    Booking b
JOIN 
    User u 
ON 
    b.user_id = u.user_id
JOIN 
    Property p 
ON 
    b.property_id = p.property_id
WHERE 
    EXISTS (
        SELECT 1 
        FROM Payment pay 
        WHERE pay.booking_id = b.booking_id
    );
```

**Additional Optimization**
Indexes:
```
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
```

## Step 4: Analyze Refactored Query Performance
Use the EXPLAIN command again to compare the performance of the refactored query with the initial one.

