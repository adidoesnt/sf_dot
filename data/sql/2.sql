-- List all of the drivers and their corresponding cars, regardless of whether they currently own a car or not
SELECT
    drivers.*,
    vehicles.*
FROM
    drivers
    LEFT OUTER JOIN ownerships ON drivers.id = ownerships.driver_id
    LEFT OUTER JOIN vehicles ON ownerships.vehicle_id = vehicles.id;