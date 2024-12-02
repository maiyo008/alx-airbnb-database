-- Query 3: FULL OUTER JOIN - Retrieve all users and all bookings, even if a user has no booking or a booking is not linked to a user
SELECT 
    User.user_id AS user_id,
    User.first_name,
    User.last_name,
    User.email,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status
FROM 
    User
FULL OUTER JOIN 
    Booking
ON 
    User.user_id = Booking.user_id;

