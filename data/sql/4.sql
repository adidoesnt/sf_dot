-- Who are all the drivers who own both a Toyota and a Honda car at the same time. Make sure that each driver is only listed once.
SELECT DISTINCT
    drivers.*
FROM
    drivers
    INNER JOIN ownerships AS ownerships_1 ON drivers.id = ownerships_1.driver_id
    INNER JOIN vehicles AS vehicles_1 ON ownerships_1.vehicle_id = vehicles_1.id
    INNER JOIN ownerships AS ownerships_2 ON drivers.id = ownerships_2.driver_id
    INNER JOIN vehicles AS vehicles_2 ON ownerships_2.vehicle_id = vehicles_2.id
WHERE
    vehicles_1.make = 'Honda'
    AND vehicles_2.make = 'Toyota';