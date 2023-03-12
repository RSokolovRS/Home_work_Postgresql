SELECT * FROM albums
WHERE year_of_issur = 2018;

SELECT * FROM traks 
ORDER BY  time_trak desc
LIMIT 1;

SELECT * FROM traks 
WHERE time_trak > 3.5;

SELECT * FROM collection
WHERE year_of_issur BETWEEN '2018-01-01' AND '2020-12-31';

SELECT * FROM executors
WHERE name LIKE '____' 
OR  name LIKE '_____' 
OR  name LIKE '_______';

SELECT * FROM traks
WHERE name  LIKE '%Мой%' 
OR name LIKE 'My%';