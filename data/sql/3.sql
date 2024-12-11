-- Who are all of the drivers who drive Toyota or Honda cars. Make sure that each driver is only listed once.
SELECT DISTINCT
    drivers.*
FROM
    drivers
    INNER JOIN ownerships ON drivers.id = ownerships.driver_id
    INNER JOIN vehicles ON ownerships.vehicle_id = vehicles.id
WHERE
    vehicles.make IN ('Toyota', 'Honda');