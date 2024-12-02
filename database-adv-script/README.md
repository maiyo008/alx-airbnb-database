# SQL Querying Tasks Documentation

This document provides a detailed overview of the SQL querying tasks performed as part of the project, focusing on joins, subqueries, aggregations, window functions, indexing, query optimization, and partitioning.

---

## 1. SQL Joins

### **Task Objectives**
1. Retrieve bookings and their respective users using an `INNER JOIN`.
2. Retrieve all properties and their reviews using a `LEFT JOIN`, including properties without reviews.
3. Retrieve all users and all bookings using a `FULL OUTER JOIN`, even if there’s no linkage between users and bookings.

### **SQL Queries**
- **INNER JOIN**:  
  Retrieves bookings and their respective users:
  ```sql
  SELECT b.booking_id, u.first_name, u.last_name 
  FROM Booking b
  INNER JOIN User u ON b.user_id = u.user_id;
