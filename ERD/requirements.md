#Entities and Relationships in ER Diagram
---
## Entities and Attributes
1. User
user_id (PK), first_name, last_name, email (Unique),password_hash, phone_number, role (guest, host, admin), created_at

2. Property
property_id (PK), host_id (FK → User.user_id), name, description,
location, price_per_night, created_at, updated_at

3. Booking
booking_id (PK), property_id (FK → Property(property_id)), user_id (FK → User(user_id)), start_date, end_date, total_price, status (pending, confirmed, canceled), created_at

4. Payment
payment_id (PK), booking_id (FK → Booking(booking_id)), amount, payment_date,payment_method (credit_card, paypal, stripe)

5. Review
review_id (PK),property_id (FK → Property(property_id)), user_id (FK → User(user_id)), rating (1–5), comment, created_at

6. Message
message_id (PK), sender_id (FK → User(user_id)), recipient_id (FK → User(user_id)), message_body, sent_at

---
##Relationships
User → Property: One host can have many properties (1:N).

User → Booking: One user (guest) can make many bookings (1:N).

Property → Booking: One property can have many bookings (1:N).

Booking → Payment: One booking can have multiple payments (1:N).

User → Review: One user can leave many reviews (1:N).

Property → Review: One property can have many reviews (1:N).

User → Message: A user can send and receive many messages (self-referencing 1:N).

##Entity Relationship Diagram
[Link To The ER Diagram](https://dbdiagram.io/d/airbnb-database-ERD-68b3ccb3777b52b76c540f29)


