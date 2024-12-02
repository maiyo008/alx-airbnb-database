SELECT 
    user_id, 
    first_name, 
    last_name, 
    email
FROM 
    User u
WHERE 
    (SELECT 
        COUNT(*) 
     FROM 
        Booking b
     WHERE 
        b.user_id = u.user_id) > 3;
