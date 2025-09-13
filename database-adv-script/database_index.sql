-- database_index.sql
-- ==========================================================
-- Objective:
-- Indexes are used to improve query performance by reducing
-- the amount of data scanned. We identified high-usage columns
-- from the Users, Bookings, and Properties tables and created
-- indexes to optimize common queries.
-- ==========================================================

-- ==========================================================
-- USERS TABLE
-- ==========================================================
-- idx_users_email → speeds up lookups by email (e.g., login queries)
-- idx_users_id    → improves join operations with related tables

DROP INDEX IF EXISTS idx_users_email;
DROP INDEX IF EXISTS idx_users_id;

CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_users_id ON users (id);

-- ==========================================================
-- BOOKINGS TABLE
-- ==========================================================
-- idx_bookings_user_id     → optimizes joins between users and bookings
-- idx_bookings_property_id → optimizes joins between properties and bookings
-- idx_bookings_start_date  → improves filtering on date ranges

DROP INDEX IF EXISTS idx_bookings_user_id;
DROP INDEX IF EXISTS idx_bookings_property_id;
DROP INDEX IF EXISTS idx_bookings_start_date;

CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_start_date ON bookings (start_date);

-- ==========================================================
-- PROPERTIES TABLE
-- ==========================================================
-- idx_properties_location → optimizes queries filtering/searching by location
-- idx_properties_id       → improves joins with bookings and reviews

DROP INDEX IF EXISTS idx_properties_location;
DROP INDEX IF EXISTS idx_properties_id;

CREATE INDEX idx_properties_location ON properties (location);
CREATE INDEX idx_properties_id ON properties (id);

-- ==========================================================
-- PERFORMANCE MEASUREMENT
-- ==========================================================
-- Use EXPLAIN ANALYZE before and after creating indexes
-- Example query:
--
-- EXPLAIN ANALYZE
-- SELECT *
-- FROM bookings
-- WHERE user_id = 123;
--
-- Before indexing: sequential scan
-- After indexing: index scan (faster, lower cost)
