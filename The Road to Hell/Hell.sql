SELECT
  CASE WHEN sequence_number = 1 THEN journey_name END AS journey,
  CONCAT(stations.station_name, ' (', journey_stop.sequence_number, ')') AS station_name
FROM
  journey_stop
  JOIN
    journey ON journey.id = journey_stop.journey_id
  JOIN
    stations ON stations.id = journey_stop.station_id
WHERE
  journey.id IN
  (
    SELECT
      journey_id
    FROM
      journey_stop
    JOIN
      stations ON stations.id = journey_stop.station_id
    WHERE
      stations.station_name = 'Hell'
  )
ORDER BY
  journey_id,
  journey_stop.sequence_number;
