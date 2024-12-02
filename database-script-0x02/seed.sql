-- Populating the User table
INSERT INTO user (first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
('John', 'Doe', 'john.doe@example.com', 'hashed_password1', '1234567890', 'Guest', NOW()),
('Jane', 'Smith', 'jane.smith@example.com', 'hashed_password2', '0987654321', 'Host', NOW()),
('Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password3', '1122334455', 'Admin', NOW());

-- Populating the Property table
INSERT INTO property (name, description, location, price_per_night, created_at, updated_at)
VALUES
('Cozy Apartment', 'A beautiful and cozy apartment in the city center.', 'New York', 120, NOW(), NOW()),
('Beach House', 'A luxurious beach house with an ocean view.', 'Miami', 300, NOW(), NOW()),
('Mountain Cabin', 'A quiet cabin in the mountains.', 'Denver', 150, NOW(), NOW());

-- Populating the Booking table
INSERT INTO booking (property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
(1, 1, '2024-12-05', '2024-12-10', 600, 'Confirmed', NOW()),
(2, 1, '2024-12-15', '2024-12-20', 1500, 'Pending', NOW()),
(3, 2, '2024-12-25', '2024-12-30', 750, 'Cancelled', NOW());

-- Populating the Payment table
INSERT INTO payment (booking_id, amount, payment_date, payment_method)
VALUES
(1, 600, '2024-12-01', 'Credit Card'),
(2, 1500, '2024-12-10', 'PayPal');

-- Populating the Message table
INSERT INTO message (sender_id, recipient_id, message_body, sent_at)
VALUES
(1, 2, 'Hi, is the Beach House available for Christmas?', NOW()),
(2, 1, 'Hi John, yes it is available. Would you like to book?', NOW());

-- Populating the Review table
INSERT INTO review (property_id, user_id, rating, comment, created_at)
VALUES
(1, 1, 5, 'Amazing place! Highly recommend.', NOW()),
(2, 1, 4, 'Great view but a bit pricey.', NOW()),
(3, 2, 3, 'Beautiful location but could be cleaner.', NOW());
