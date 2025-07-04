---==================================================================================================----
---==================================-------ЗАДАНИЕ 3-------================================================================----
---==================================================================================================----
---==================================================================================================----
/*--
  Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.

Внимание: результаты запросов не должны быть пустыми, при необходимости добавьте данные в таблицы.

    1) Количество исполнителей в каждом жанре.
    2) Количество треков, вошедших в альбомы 2019–2020 годов.
    3) Средняя продолжительность треков по каждому альбому.
    4) Все исполнители, которые не выпустили альбомы в 2020 году.
    5) Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

 --*/
   
----- 1) Количество исполнителей в каждом жанре.
SELECT g.Name AS Genre,
COUNT(ag.AuthorID) AS ArtistCount
FROM Genre g

LEFT JOIN AuthorGenre ag ON g.GenreID = ag.GenreID --- чтобы жанр без исполнителей тоже попал в выдачу (с нулём)
GROUP BY g.GenreID, g.Name
ORDER BY ArtistCount DESC;

-------2) Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT COUNT(t.TrackID) AS TrackCount_2019_2020
FROM Track t
JOIN Album a ON t.AlbumID = a.AlbumID
WHERE a.ReleaseYear BETWEEN 2019 AND 2020;

--------3) Средняя продолжительность треков по каждому альбому.

select a.Title AS Album,
ROUND(AVG(t.Duration)) || ' sec' AS AvgDuration
FROM Album a
JOIN Track t ON t.AlbumID = a.AlbumID
GROUP BY a.AlbumID, a.Title
ORDER BY AvgDuration DESC;

--------- 4) Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT DISTINCT au.Nickname
FROM Author au
LEFT JOIN AuthorAlbum aa  ON au.AuthorID = aa.AuthorID
LEFT JOIN Album       al  ON aa.AlbumID = al.AlbumID
GROUP BY au.AuthorID, au.Nickname
HAVING SUM(CASE WHEN al.ReleaseYear = 2020 THEN 1 ELSE 0 END) = 0;

--------- 5) Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

-- Выбираем уникальные названия сборников, в которых участвует конкретный исполнитель
SELECT DISTINCT c.Title AS Compilation
-- Таблица Compilation (сборники) обозначена как c
FROM Compilation c
-- Присоединяем таблицу связи сборник-трек (многие-ко-многим)
JOIN CompilationTrack ct ON c.CompilationID = ct.CompilationID
-- Получаем данные о каждом треке, входящем в сборник
JOIN Track t ON ct.TrackID = t.TrackID
-- Получаем альбом, в который входит этот трек
JOIN Album al ON t.AlbumID = al.AlbumID
-- Присоединяем таблицу связи автор-альбом (на случай, если альбом у нескольких исполнителей)
JOIN AuthorAlbum aa ON al.AlbumID = aa.AlbumID
-- Получаем данные об авторе (исполнителе)
JOIN Author au ON aa.AuthorID = au.AuthorID
-- Оставляем только те строки, где исполнитель — Metallica
WHERE au.Nickname = 'Metallica'
-- Сортируем сборники по названию в алфавитном порядке
ORDER BY c.Title;
