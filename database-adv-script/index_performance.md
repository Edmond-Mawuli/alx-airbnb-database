# Implement Indexes for Optimization

## Objective
Indexes are used to improve query performance by reducing the amount of data scanned.  
In this task, we identified high-usage columns from the **Users**, **Bookings**, and **Properties** tables and created indexes to optimize common queries.

---

## Indexes Created

### Users Table
- `idx_users_email` → speeds up lookups by email (e.g., login queries).
- `idx_users_id` → improves join operations with related tables.

### Bookings Table
- `idx_bookings_user_id` → optimizes joins between `users` and `bookings`.
- `idx_bookings_property_id` → optimizes joins between `properties` and `bookings`.
- `idx_bookings_start_date` → improves filtering on date ranges (e.g., finding bookings in a period).

### Properties Table
- `idx_properties_location` → optimizes queries filtering/searching by property location.
- `idx_properties_id` → improves joins with other tables like `bookings` and `reviews`.

---

## Performance Measurement

We used `EXPLAIN ANALYZE` to compare query performance **before** and **after** adding indexes.

### Example Query (before indexing)
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 123;
