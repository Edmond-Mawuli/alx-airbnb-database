# Partitioning Report

## Objective
The **Bookings** table is very large, and queries filtering by `start_date` were slow.  
To improve performance, we implemented **range partitioning** on the `start_date` column.

## Implementation
- Created a parent table `bookings_partitioned` partitioned by **RANGE** on `start_date`.
- Defined yearly partitions (`bookings_2024`, `bookings_2025`, etc.).
- Queries targeting a specific year only scan the relevant partition instead of the full table.

## Performance Analysis
Using `EXPLAIN ANALYZE`:
- **Before partitioning**: Queries performed sequential scans over the entire bookings table.
- **After partitioning**: PostgreSQL scanned only the relevant partition, reducing I/O and execution time.

## Results
- **Reduced query execution time** for date range queries.
- **Improved scalability** as new partitions can be added each year without slowing down older queries.
