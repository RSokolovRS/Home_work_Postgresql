-- Домашнее задание к лекции «SELECT-запросы, выборки из одной таблицы»

-- Название и год выхода альбомов, вышедших в 2018 году.
SELECT * FROM albums
WHERE year_of_issur BETWEEN  '2018-01-01' AND '2018-12-31';

-- Название и продолжительность самого длительного трека.
SELECT * FROM traks 
ORDER BY  time_trak desc
LIMIT 1;

--(Второй вариант)Название и продолжительность самого длительного трека.
SELECT t.name, max(t.time_trak) FROM traks AS t 
GROUP BY t.name, t.time_trak
HAVING t.time_trak = (SELECT max(t.time_trak) FROM traks t);
ORDER BY max(t.time_trak)DESC ;
   
SELECT * FROM traks 
WHERE time_trak > 3.5;

SELECT * FROM collection
WHERE year_of_issur BETWEEN '2018-01-01' AND '2020-12-31';

SELECT * FROM executors
WHERE name LIKE '____' 
OR  name LIKE '_____' 
OR  name LIKE '_______';

-- ILIKE - поиск для регистронезависимого значения(только для Латиницы).
SELECT * FROM traks
WHERE name  iLIKE '%Мой%'
OR name LIKE 'My%';


-- Домашнее задание к лекции «Продвинутая выборка данных»

-- 1. Количество исполнителей в каждом жанре, связь многих ко многим.
select count(e.name), j.name from jenres j 
left join jenres_executors je  on je.id_jenre  = j.id_jenre
left join executors e on e.id_executor = je.id_executor 
group by j.name
order by  count(e.name) desc;


-- 2. Количество треков, вошедших в альбомы 2019–2020 годов, связь один ко многим.
SELECT count(t.name), a.year_of_issur FROM albums a 
LEFT JOIN traks t ON t.id_trak = a.id_album
WHERE a.year_of_issur >= '2019-01-01' AND a.year_of_issur <= '2020-12-31'
GROUP BY  a.year_of_issur 
ORDER BY count(t.name) DESC;

-- 3. Средняя продолжительность треков по каждому альбому.
SELECT AVG(time_trak), a.name FROM albums a 
LEFT JOIN traks t ON t.id_trak = a.id_album 
GROUP BY a.name
ORDER BY AVG(time_trak) DESC;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT e.name, a.year_of_issur  FROM executors e 
LEFT JOIN executors_albums ea ON ea.id_executor = e.id_executor
LEFT JOIN albums a ON a.id_album = ea.id_album
WHERE  NOT  a.year_of_issur BETWEEN '2020-01-01' AND '2020-12-31'
ORDER BY a.year_of_issur;

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.name, e.name FROM executors e 
LEFT JOIN executors_albums ea ON ea.id_executor = e.id_executor
LEFT JOIN albums a ON a.id_album = ea.id_album 
LEFT JOIN traks t ON t.id_trak = a.id_album 
LEFT JOIN collection_traks ct ON ct.id_trak = t.id_trak 
LEFT JOIN collection c ON c.id_collection = ct.id_collection
WHERE e.name LIKE '%Guano Apes';

-- 6. Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.name  FROM jenres j 
FULL JOIN jenres_executors je ON j.id_jenre = je.id_jenre 
FULL JOIN executors e ON e.id_executor = je.id_executor 
FULL JOIN executors_albums ea ON ea.id_executor = e.id_executor 
FULL JOIN albums a  ON a.id_album = ea.id_album 
GROUP BY a.name
HAVING count(DISTINCT j.name) > 1  -- DISTINCT- показывает уникадьность значения.
ORDER BY a.name;

-- 7. Наименования треков, которые не входят в сборники.
SELECT t.name  FROM traks t
LEFT JOIN collection_traks ct ON t.id_trak = ct.id_trak 
LEFT JOIN collection c ON c.id_collection = ct.id_collection
WHERE  c.id_collection IS NULL;

-- 8. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек,
--     теоретически таких треков может быть несколько.
SELECT e.name, t.time_trak FROM executors e
LEFT JOIN  executors_albums ea ON ea.id_executor = e.id_executor 
LEFT JOIN albums a ON ea.id_album = a.id_album 
LEFT JOIN traks t ON t.id_trak = a.id_album
GROUP BY e.name, t.time_trak
HAVING t.time_trak = (SELECT min(time_trak) FROM traks)
ORDER BY t.time_trak;

 --Общая таблица.
SELECT  id_trak, t.name, t.id_album, a.id_album, a.name  FROM albums a 
LEFT JOIN traks t ON t.id_album  = a.id_album;

-- 9. Названия альбомов, содержащих наименьшее количество треков.
SELECT a.name, count(t.name) FROM albums a 
FULL JOIN traks t ON t.id_album  = a.id_album
GROUP BY a.name
ORDER BY count(t.name);