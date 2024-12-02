-- Aggregation Query: Total Number of Bookings Made by Each User
SELECT 
    User.user_id, 
    User.first_name, 
    User.last_name, 
    COUNT(Booking.booking_id) AS total_bookings
FROM 
    User
LEFT JOIN 
    Booking
ON 
    User.user_id = Booking.user_id
GROUP BY 
    User.user_id, 
    User.first_name, 
    User.last_name
ORDER BY 
    total_bookings DESC;


-- Window Function Query: Rank Properties Based on Total Number of Bookings
SELECT 
    Property.property_id, 
    Property.name AS property_name, 
    COUNT(Booking.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS property_rank
FROM 
    Property
LEFT JOIN 
    Booking
ON 
    Property.property_id = Booking.property_id
GROUP BY 
    Property.property_id, 
    Property.name
ORDER BY 
    property_rank;
