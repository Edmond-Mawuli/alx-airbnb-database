#EXPLANATION OF MY NORMALIZATION STEPS
---
##1NF
For INF, i ensured  that all tables had a primary key and each column
in the table conatained atomic values.
*Example*
**User Table*: Primary key - {*user_id*}
**Property Table*: Primary key - {*property_id*}
>And it could be clearly seen that the values of the column are indidvisble

---
##2NF
For 2NF too, building on the foundation of 1NF, i ensured that each non-key 
column in the table was dependent on the primary key.

---
##3NF
Again, for 3NF, building on the foundation of 2NF, i ensured that there was 
no transistive dependencies in the table.
