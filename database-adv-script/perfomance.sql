-- Initial complex query (without optimization)
-- Retrieves all bookings with user, property, and payment details
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    pr.id AS payment_id,
    pr.amount,
    pr.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pr ON b.id = pr.booking_id;

-- Refactored query with WHERE + AND
-- Optimized by filtering only active payments within a date range
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    pr.id AS payment_id,
    pr.amount,
    pr.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pr ON b.id = pr.booking_id
WHERE pr.status = 'completed'
  AND b.start_date >= '2025-01-01';
