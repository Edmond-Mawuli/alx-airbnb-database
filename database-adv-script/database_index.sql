-- Indexes for Optimization in Airbnb Database

-- 1. Users table
-- Frequently used for lookups and joins on email and id
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- 2. Bookings table
-- Frequently filtered/joined by user_id, property_id, and date ranges
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- 3. Properties table
-- Frequently filtered/joined by location and id
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_id ON properties(id);
