# Monitor and Refine Database Performance

## Objective
The goal is to continuously monitor database performance by analyzing query execution plans and making schema adjustments such as creating indexes or modifying schema design.

---

## Monitoring Queries

We used `EXPLAIN ANALYZE` to examine the performance of frequently used queries in the **Airbnb database**.

---

### Query 1: Fetch bookings for a user
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 123;
