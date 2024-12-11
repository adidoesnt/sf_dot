-- List all of the vehicles are for driver with id 5
SELECT
    vehicles.*
FROM
    ownerships
    INNER JOIN vehicles ON ownerships.vehicle_id = vehicles.id
WHERE
    ownerships.driver_id = 5;