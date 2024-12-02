# Database Normalization for Airbnb Clone

This document outlines the steps taken to ensure the Airbnb Clone database design adheres to **Third Normal Form (3NF)**. The process eliminates redundancies and ensures data integrity by adhering to normalization principles.

---

## Steps to Normalize the Database

### Step 1: First Normal Form (1NF)
**Definition**: A table is in 1NF if it contains only atomic (indivisible) values and each column contains values of a single type.

- Each table in the ERD (e.g., `User`, `Property`, `Booking`, etc.) already complies with 1NF.  
  - All columns hold atomic values (e.g., `first_name`, `price_per_night`, `start_date`).
  - There are no repeating groups or arrays in any table.

### Step 2: Second Normal Form (2NF)
**Definition**: A table is in 2NF if it is in 1NF and all non-key attributes are fully dependent on the primary key.

- **Violations Checked**:
  - Ensure no partial dependencies exist in tables with composite primary keys.
  - Example: In the `Booking` table, attributes like `start_date`, `end_date`, and `total_price` depend fully on `booking_id`.  
    No partial dependencies are identified.

- **Conclusion**:
  - All tables satisfy 2NF as every non-key column depends entirely on the primary key.

### Step 3: Third Normal Form (3NF)
**Definition**: A table is in 3NF if it is in 2NF and there are no transitive dependencies (i.e., non-key attributes depend only on the primary key and not on other non-key attributes).

#### Review of Potential Violations:
1. **`Property` Table**:  
   - Columns: `property_id`, `name`, `description`, `location`, `price_per_night`, `created_at`, `updated_at`.  
   - No transitive dependencies found. Each column depends only on `property_id`.

2. **`Booking` Table**:  
   - Columns: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`.  
   - Potential Issue: `total_price` is dependent on `property_id` (via `price_per_night`) and the difference between `start_date` and `end_date`.  
     **Resolution**: Remove `total_price` from the `Booking` table and calculate it dynamically when needed using the formula:
     ```
     total_price = DATEDIFF(end_date, start_date) * price_per_night
     ```

3. **`User` Table**:  
   - Columns: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`.  
   - No transitive dependencies identified.

4. **`Payment` Table**:  
   - Columns: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`.  
   - No transitive dependencies identified.

5. **`Review` Table**:  
   - Columns: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`.  
   - No transitive dependencies identified.

6. **`Message` Table**:  
   - Columns: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`.  
   - No transitive dependencies identified.

---

## Updated Database Design After Normalization

### Changes Made:
1. Removed the `total_price` column from the `Booking` table.
2. Added a note to calculate `total_price` dynamically using the property price and booking duration.

### Resulting Tables:
- **User**: No changes.
- **Property**: No changes.
- **Booking**: Removed `total_price`.
- **Payment**: No changes.
- **Message**: No changes.
- **Review**: No changes.

---

## Explanation of Achieving 3NF

- All attributes in each table depend only on the primary key.
- There are no partial or transitive dependencies in the schema.
- The database design minimizes redundancy and ensures data integrity while maintaining query efficiency.

---

## Conclusion

The database schema for the Airbnb Clone is now fully normalized to 3NF. Any redundant or dependent attributes have been removed or adjusted to adhere to normalization principles.
