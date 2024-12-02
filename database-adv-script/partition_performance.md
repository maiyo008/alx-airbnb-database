# Partitioning Report for Booking Table

## Objective

To improve query performance on the `Booking` table, which contains a large dataset, by implementing table partitioning based on the `start_date` column.

---

## Step 1: Partitioning the Booking Table

The following SQL commands implement partitioning:

### Create a New Partitioned Table
```sql
CREATE TABLE Booking_Partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_date TIMESTAMP NOT NULL,
    amount DECIMAL(10, 2),
    CHECK (start_date >= '2024-01-01' AND start_date < '2024-07-01')
) PARTITION BY RANGE (start_date);

CREATE TABLE Booking_Jan_Jun_2024 PARTITION OF Booking_Partitioned 
FOR VALUES FROM ('2024-01-01') TO ('2024-07-01');

CREATE TABLE Booking_Jul_Dec_2024 PARTITION OF Booking_Partitioned 
FOR VALUES FROM ('2024-07-01') TO ('2025-01-01');
