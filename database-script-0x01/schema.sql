-- Table: User
CREATE TABLE user (
    user_id SERIAL PRIMARY KEY, -- Auto-incremented ID
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE, -- Ensure unique email
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) UNIQUE, -- Optional but unique
    role ENUM('guest', 'host') NOT NULL, -- Role can only be 'guest' or 'host'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Automatically set timestamp
);

-- Table: Property
CREATE TABLE property (
    property_id SERIAL PRIMARY KEY, -- Auto-incremented ID
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL, -- Fixed-point for currency
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Updates on modification
);

-- Table: Booking
CREATE TABLE booking (
    booking_id SERIAL PRIMARY KEY, -- Auto-incremented ID
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL, -- Total cost of booking
    status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending', -- Booking status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Table: Payment
CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY, -- Auto-incremented ID
    booking_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL, -- Payment amount
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of payment
    payment_method ENUM('credit_card', 'debit_card', 'paypal') NOT NULL, -- Payment methods
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

-- Table: Review
CREATE TABLE review (
    review_id SERIAL PRIMARY KEY, -- Auto-incremented ID
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5), -- Rating must be between 1 and 5
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Table: Message
CREATE TABLE message (
    message_id SERIAL PRIMARY KEY, -- Auto-incremented ID
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Indexes for Performance
CREATE INDEX idx_user_email ON User(email); -- Faster lookup for email
CREATE INDEX idx_property_location ON Property(location); -- Faster location-based search
CREATE INDEX idx_booking_status ON Booking(status); -- Optimize status filtering
CREATE INDEX idx_review_property ON Review(property_id); -- Optimize reviews by property
