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

-- Analyze perfomance
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
