-- Initial complex query (unoptimized)
-- Retrieves all bookings along with user details, property details, and payment details
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    fp.id AS payment_id,
    fp.amount,
    fp.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN fee_payments fp ON fp.booking_id = b.id;


-- Optimized query
-- Improvements:
-- 1. Use INNER JOIN only when needed; use LEFT JOIN if payments may be missing.
-- 2. Select only necessary columns instead of "*".
-- 3. Assume indexes already exist on user_id, property_id, and booking_id.

SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.name AS property_name,
    fp.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN fee_payments fp ON fp.booking_id = b.id;
