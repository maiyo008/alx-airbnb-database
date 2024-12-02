# Sample Data Insertion for Airbnb Clone Database

This directory provides SQL scripts to populate the Airbnb Clone database with realistic sample data. The data is structured to simulate real-world scenarios and to test the functionality of the application backend.

---

## Purpose

The sample data is designed to:
- Test the functionality of the database schema.
- Provide realistic scenarios for application development and testing.
- Simulate interactions between users, properties, bookings, payments, messages, and reviews.

---

## Structure

### Tables and Sample Data:
1. **User Table**  
   - Includes users with different roles (`Guest`, `Host`, `Admin`).
   - Sample users have unique email addresses, names, and roles.
   
2. **Property Table**  
   - Lists sample properties with details like name, location, price per night, and descriptions.
   
3. **Booking Table**  
   - Records bookings by users for specific properties with details like start and end dates, total price, and booking status.
   
4. **Payment Table**  
   - Tracks payment information, such as amounts, methods, and timestamps.
   
5. **Message Table**  
   - Contains sample conversations between users, including timestamps and message bodies.
   
6. **Review Table**  
   - Records feedback and ratings left by users for properties.

---

## Sample Data Highlights

### Users
- 5 users: 2 Guests, 2 Hosts, and 1 Admin.  
- Example:
  ```sql
  INSERT INTO User (first_name, last_name, email, password_hash, phone_number, role, created_at)
  VALUES ('John', 'Doe', 'john.doe@example.com', 'hashedpassword123', '1234567890', 'Guest', NOW());
