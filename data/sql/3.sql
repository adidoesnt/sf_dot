-- Who are all of the drivers who drive Toyota or Honda cars. Make sure that each driver is only listed once.
WITH
    desired_vehicles AS (
        SELECT
            id
        FROM
            vehicles
        WHERE
            make IN ('Toyota', 'Honda')
    ),
    desired_ownerships AS (
        SELECT
            ownerships.driver_id as id
        FROM
            ownerships
            INNER JOIN desired_vehicles ON ownerships.vehicle_id = desired_vehicles.id
    )
SELECT DISTINCT
    drivers.*
FROM
    drivers
    INNER JOIN desired_ownerships ON drivers.id = desired_ownerships.id;