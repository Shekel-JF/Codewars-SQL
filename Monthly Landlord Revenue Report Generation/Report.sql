WITH costs AS
(
  SELECT
    property_id, 
    CAST(SUM(cost) FILTER(WHERE EXTRACT(YEAR FROM maintenance.maintenance_date) = 2024 AND EXTRACT(MONTH FROM maintenance.maintenance_date) = 4) AS INTEGER) AS cost  
  FROM
    maintenance
  GROUP BY
    property_id
)
SELECT
  landlord.id AS landlord_id, 
  landlord.name AS name, 
  COALESCE(SUM(rent), 0) AS total_rent, 
  COALESCE(SUM(cost), 0) AS total_cost, 
  COALESCE(SUM(rent), 0) - COALESCE(SUM(cost), 0) AS amount_payable
FROM
  property
LEFT JOIN
  costs ON property.id = costs.property_id
RIGHT JOIN
  landlord ON landlord_id = landlord.id
GROUP BY
  landlord.id,
  landlord.name
ORDER BY
  total_rent DESC,
  landlord_id DESC