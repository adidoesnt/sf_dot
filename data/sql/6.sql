-- The person who initially designed the database tables left some redundancies in the data that we'd like to remove. Can we normalize the vehicles table? Think along the lines of third normal form (3NF)
ALTER TABLE drivers DROP COLUMN IF EXISTS index;
ALTER TABLE vehicles DROP COLUMN IF EXISTS index;
ALTER TABLE ownerships DROP COLUMN IF EXISTS index;

BEGIN;

SELECT
    *
FROM
    vehicles
WHERE
    make = 'Toyota'
    AND model = 'Camry';

-- Migrating
SELECT DISTINCT
    make,
    model INTO models
FROM
    vehicles;

ALTER TABLE models
ADD COLUMN id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY;

SELECT DISTINCT
    make,
    model,
    year INTO editions
FROM
    vehicles;

ALTER TABLE editions
ADD COLUMN id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY;

SELECT DISTINCT
    editions.id,
    editions.year,
    models.id AS model_id INTO temp_editions
FROM
    editions
    INNER JOIN models ON editions.make = models.make
    AND editions.model = models.model;

DROP TABLE editions;

ALTER TABLE temp_editions
RENAME to editions;

WITH
    editions_with_model_info AS (
        SELECT
            editions.id,
            editions.year,
            models.make,
            models.model
        FROM
            editions
            INNER JOIN models ON editions.model_id = models.id
    )
SELECT DISTINCT
    vehicles.id,
    editions_with_model_info.id AS edition_id,
    vehicles.license_plate INTO temp_vehicles
FROM
    vehicles
    INNER JOIN editions_with_model_info ON vehicles.make = editions_with_model_info.make
    AND vehicles.model = editions_with_model_info.model
    AND vehicles.year = editions_with_model_info.year;

DROP TABLE vehicles;

ALTER TABLE temp_vehicles
RENAME TO vehicles;

COMMIT;

SELECT
    *
FROM
    vehicles;

SELECT
    *
FROM
    editions;

SELECT
    *
FROM
    models;