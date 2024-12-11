-- Look up all vehicles of make Toyota and model Camry. Explain what you see in the query plan for that query. Please explain how that query plan can be expedited so that the query completes faster and more efficiently. Apply the "fix" and demonstrate that the query is now faster.
SELECT
    *
FROM
    vehicles
WHERE
    make = 'Toyota'
    AND model = 'Camry';

-- Drop the index if it exists
DROP INDEX IF EXISTS vehicles_idx;

-- Before Index
EXPLAIN ANALYZE
SELECT
    *
FROM
    vehicles
WHERE
    make = 'Toyota'
    AND model = 'Camry';

-- Create an index
CREATE INDEX vehicles_idx ON vehicles (make, model);

-- After Index
EXPLAIN ANALYZE
SELECT
    *
FROM
    vehicles
WHERE
    make = 'Toyota'
    AND model = 'Camry';