-- List all of the vehicles are for driver with id 5
WITH
    desired_ownerships AS (
        SELECT
            vehicle_id
        FROM
            ownerships
        WHERE
            driver_id = 5
    )
SELECT
    vehicles.*
FROM
    desired_ownerships
    INNER JOIN vehicles ON desired_ownerships.vehicle_id = vehicles.id;