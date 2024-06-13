# build-a-celestial-bodies-db

A database of celestial bodies using PostgreSQL.

## How to run

```bash
# Rebuild the dump `universe.sql`
psql -U postgres < universe.sql

# log in to the db
psql --username=freecodecamp --dbname=postgres

# connect to db
\c universe

# view all tables in db
\d

# view an individual table
\d table_name

# view all rows associated with a table
select * from table_name
```
