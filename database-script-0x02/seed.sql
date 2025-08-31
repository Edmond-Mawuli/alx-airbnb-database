
-- Users

INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (uuid_generate_v4(), 'John', 'Doe', 'john.doe@example.com', 'hashed_pw_123', '1234567890', 'guest'),
    (uuid_generate_v4(), 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_pw_234', '9876543210', 'host'),
    (uuid_generate_v4(), 'Michael', 'Brown', 'michael.brown@example.com', 'hashed_pw_345', NULL, 'admin'),
    (uuid_generate_v4(), 'Sarah', 'Johnson', 'sarah.j@example.com', 'hashed_pw_456', '5551234567', 'guest');


-- Properties

INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
    (uuid_generate_v4(), 
        (SELECT user_id FROM users WHERE email = 'alice.smith@example.com'),
        'Cozy Apartment Downtown',
        'A modern 2-bedroom apartment close to city center.',
        'Accra, Ghana',
        50.00
    ),
    (uuid_generate_v4(), 
        (SELECT user_id FROM users WHERE email = 'alice.smith@example.com'),
        'Beachfront Villa',
        'Spacious villa with ocean view and private pool.',
        'Cape Coast, Ghana',
        120.00
    );


-- Bookings

INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (uuid_generate_v4(),
        (SELECT property_id FROM properties WHERE name = 'Cozy Apartment Downtown'),
        (SELECT user_id FROM users WHERE email = 'john.doe@example.com'),
        '2025-09-10', '2025-09-15',
        250.00,
        'confirmed'
    ),
    (uuid_generate_v4(),
        (SELECT property_id FROM properties WHERE name = 'Beachfront Villa'),
        (SELECT user_id FROM users WHERE email = 'sarah.j@example.com'),
        '2025-10-05', '2025-10-10',
        600.00,
        'pending'
    );


-- Payments

INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
    (uuid_generate_v4(),
        (SELECT booking_id FROM bookings WHERE total_price = 250.00),
        250.00,
        'credit_card'
    ),
    (uuid_generate_v4(),
        (SELECT booking_id FROM bookings WHERE total_price = 600.00),
        300.00, -- Partial payment
        'paypal'
    );


-- Reviews

INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
    (uuid_generate_v4(),
        (SELECT property_id FROM properties WHERE name = 'Cozy Apartment Downtown'),
        (SELECT user_id FROM users WHERE email = 'john.doe@example.com'),
        5,
        'Amazing stay! The apartment was very clean and close to everything.'
    ),
    (uuid_generate_v4(),
        (SELECT property_id FROM properties WHERE name = 'Beachfront Villa'),
        (SELECT user_id FROM users WHERE email = 'sarah.j@example.com'),
        4,
        'Beautiful location, but the WiFi was a bit slow.'
    );


-- Messages

INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
    (uuid_generate_v4(),
        (SELECT user_id FROM users WHERE email = 'john.doe@example.com'),
        (SELECT user_id FROM users WHERE email = 'alice.smith@example.com'),
        'Hello Alice, I would like to confirm my booking details.'
    ),
    (uuid_generate_v4(),
        (SELECT user_id FROM users WHERE email = 'alice.smith@example.com'),
        (SELECT user_id FROM users WHERE email = 'john.doe@example.com'),
        'Hi John, your booking is confirmed. Looking forward to hosting you!'
    );
