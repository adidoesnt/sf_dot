-- Who are all the drivers who own both a Toyota and a Honda car at the same time. Make sure that each driver is only listed once.
WITH
    hondas AS (
        SELECT
            id
        FROM
            vehicles
        WHERE
            make = 'Honda'
    ),
    toyotas AS (
        SELECT
            id
        FROM
            vehicles
        WHERE
            make = 'Toyota'
    ),
    honda_ownerships AS (
        SELECT
            driver_id
        FROM
            ownerships
            INNER JOIN hondas ON ownerships.vehicle_id = hondas.id
    ),
    toyota_ownerships AS (
        SELECT
            driver_id
        FROM
            ownerships
            INNER JOIN toyotas ON ownerships.vehicle_id = toyotas.id
    ),
    driver_ids AS (
        SELECT
            honda_ownerships.driver_id
        FROM
            honda_ownerships
            INNER JOIN toyota_ownerships ON honda_ownerships.driver_id = toyota_ownerships.driver_id
    )
SELECT
    drivers.*
FROM
    drivers
    INNER JOIN driver_ids ON drivers.id = driver_ids.driver_id;