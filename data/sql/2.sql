-- List all of the drivers and their corresponding cars, regardless of whether they currently own a car or not
WITH
    desired_ownerships AS (
        SELECT
            drivers.*,
            ownerships.vehicle_id
        FROM
            drivers
            LEFT OUTER JOIN ownerships ON drivers.id = ownerships.driver_id
    )
SELECT
    desired_ownerships.*,
    vehicles.make,
    vehicles.model,
    vehicles.year,
    vehicles.license_plate
FROM
    desired_ownerships
    LEFT OUTER JOIN vehicles ON desired_ownerships.vehicle_id = vehicles.id;