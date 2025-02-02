-- SQL Script for Retrieving and Analyzing Network Devices

-- Query 1: Retrieve all active routers, sorted by last update time
SELECT device_name, ip_address, location, last_updated
FROM network_devices
WHERE device_type = 'Router'
AND status = 'Active'
ORDER BY last_updated DESC;

-- Query 2: Alternative syntax using Common Table Expression (CTE)
WITH ActiveRouters AS (
    SELECT device_name, ip_address, location, last_updated
    FROM network_devices
    WHERE device_type = 'Router'
    AND status = 'Active'
)
SELECT * FROM ActiveRouters
ORDER BY last_updated DESC;

-- Query 3: Identify devices with low uptime or missing firmware version
SELECT device_name, ip_address, uptime_percentage, firmware_version
FROM network_devices
WHERE uptime_percentage < 95
OR firmware_version IS NULL;

