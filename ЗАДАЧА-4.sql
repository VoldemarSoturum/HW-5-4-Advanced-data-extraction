---==================================================================================================----
---===================================ЗАДАНИЕ 4 (НЕОБЯЗАТЕЛЬНОЕ)===============================================----
---==================================================================================================----
---==================================================================================================----

----ДА Я КАК БЫ И ОТ ОБЯЗАТЕЛЬНЫХ В ШОКЕ, И НЕМНОГО ПРИДУРЕЛ....
/*--
Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.

Внимание: результаты запросов не должны быть пустыми, при необходимости добавьте данные в таблицы.

    1) Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
    2) Наименования треков, которые не входят в сборники.
    3) Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
    4) Названия альбомов, содержащих наименьшее количество треков.
--*/

-----1) Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT al.Title AS AlbumTitle
FROM Album al
JOIN AuthorAlbum aa ON al.AlbumID = aa.AlbumID
JOIN AuthorGenre ag ON aa.AuthorID = ag.AuthorID
JOIN Genre g ON ag.GenreID = g.GenreID
GROUP BY al.AlbumID, al.Title
HAVING COUNT(DISTINCT g.GenreID) > 1;
/*--Выбираем альбомы, с которыми связано более одного жанра (через исполнителей). 
 Группируем по альбому и фильтруем по количеству уникальных жанров. --*/

------2) Наименования треков, которые не входят в сборники.
SELECT t.Title AS TrackTitle
FROM Track t
LEFT JOIN CompilationTrack ct ON t.TrackID = ct.TrackID
WHERE ct.CompilationID IS NULL;

------3) Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
WITH MinDuration AS (
    SELECT MIN(Duration) AS MinDur
    FROM Track
)
SELECT DISTINCT au.Nickname, t.Title AS TrackTitle, t.Duration
FROM Track t
JOIN Album al ON t.AlbumID = al.AlbumID
JOIN AuthorAlbum aa ON al.AlbumID = aa.AlbumID
JOIN Author au ON aa.AuthorID = au.AuthorID
JOIN MinDuration md ON t.Duration = md.MinDur;
/*--Сначала находим минимальную продолжительность, затем 
 выбираем всех исполнителей и названия треков с этой длительностью. --*/

-------4) Названия альбомов, содержащих наименьшее количество треков.

WITH TrackCounts AS (
    SELECT al.AlbumID, al.Title AS AlbumTitle, COUNT(t.TrackID) AS TrackCount
    FROM Album al
    LEFT JOIN Track t ON al.AlbumID = t.AlbumID
    GROUP BY al.AlbumID, al.Title
),
MinTrackCount AS (
    SELECT MIN(TrackCount) AS MinCount
    FROM TrackCounts
)
SELECT tc.AlbumTitle, tc.TrackCount
FROM TrackCounts tc
JOIN MinTrackCount mtc ON tc.TrackCount = mtc.MinCount;
/*--Считаем количество треков по каждому альбому,
  потом выбираем минимальное количество и возвращаем альбомы, 
  соответствующие этому количеству. --*/

---Проверяем в реальности всех трэков по альбомам
SELECT 
    al.AlbumID,
    al.Title AS AlbumTitle,
    t.TrackID,
    t.Title AS TrackTitle,
    t.Duration
FROM Album al
LEFT JOIN Track t ON al.AlbumID = t.AlbumID
ORDER BY al.Title, t.TrackID;





