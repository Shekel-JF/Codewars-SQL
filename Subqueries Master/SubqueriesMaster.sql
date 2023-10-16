WITH Solution AS
(
  SELECT
    name,
    REVERSE(SPLIT_PART(REVERSE(name), ' ', 2)) AS first_lastname,
    REVERSE(SPLIT_PART(REVERSE(name), ' ', 1)) AS second_lastname
  FROM PEOPLE
)
SELECT
    RTRIM(SUBSTRING(name, 1, POSITION(first_lastname IN name) - 1)) AS name,
    first_lastname,
    second_lastname
FROM Solution;
