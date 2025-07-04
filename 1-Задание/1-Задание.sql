/*------------------------------------------------------------------------------------*/
/*-------------------------ЗАДАНИЕ 1--------------------------------------------*/
/*------------------------------------------------------------------------------------*/
/*
 * Задание 1

Продолжаем работать со своей базой данных. В этом задании заполните базу данных из
 домашнего задания к занятию "Работа с SQL. Создание БД". В ней должно быть:

    не менее 4 исполнителей,
    не менее 3 жанров,
    не менее 3 альбомов,
    не менее 6 треков,
    не менее 4 сборников.

Внимание: должны быть заполнены все поля каждой таблицы, 
в том числе таблицы связей исполнителей с жанрами, исполнителей с альбомами, 
сборников с треками.
 * 
 * 
 * 
 * */

----ДОБАВЛЯЕМ 4 ЖАНРА-----------

INSERT INTO Genre (Name) VALUES
('Рок'),           
('Фолк Металл'),   
('Панк'),          
('Дед Метал');     
SELECT * FROM Genre;
/*------------------------------------------------------------------------------------*/
------Просматриваем введённые жанры
--SELECT * FROM Genre;
--------Удаление жанра

--DELETE FROM Genre WHERE Name = 'Поп';

---Удаление жанра по ИД

--DELETE FROM Genre WHERE GenreID = 1;
--DELETE FROM Genre WHERE GenreID = 3;
--DELETE FROM Genre WHERE GenreID = 4;
--DELETE FROM Genre WHERE GenreID = 6;
/*------------------------------------------------------------------------------------*/

-------Добавляем не менее 4х исполнгителей---------------------------- 

INSERT INTO Author (Nickname) VALUES
('Led Zeppelin'), ('The Beatles'),('Queen'),('Pink Floyd'),('Metallica'),('Nirvana'),     -- 1  — рок
('Eluveitie'),('Finntroll'),('Korpiklaani'),('Wind Rose'),('Ensiferum'),         -- 2  — фолк‑металл
('The Offspring'),('Green Day'),('Sex Pistols'),('Ramones'),('Sum 41'),('Sex Pistols'),           -- 3  — панк
('Cannibal Corpse'),('Arch Enemy'),('Morbid Angel'),('Amon Amarth'),('Behemoth');             -- 4  — дед/дэт‑метал
SELECT * FROM Author;

------Добавляем каждому исполнителю по 4 альбома---------------------

-- 1. Led Zeppelin (ID 1)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Led Zeppelin', 1969),
        ('Led Zeppelin II', 1969),
        ('Led Zeppelin IV', 1971),
        ('Physical Graffiti', 1975)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 1, AlbumID FROM new_albums;

-- 2. The Beatles (ID 2)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Please Please Me', 1963),
        ('Help!', 1965),
        ('Abbey Road', 1969),
        ('Sgt. Pepper''s Lonely Hearts Club Band', 1967)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 2, AlbumID FROM new_albums;

-- 3. Queen (ID 3)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Queen', 1973),
        ('Sheer Heart Attack', 1974),
        ('A Night at the Opera', 1975),
        ('News of the World', 1977)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 3, AlbumID FROM new_albums;

-- 4. Pink Floyd (ID 4)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('The Piper at the Gates of Dawn', 1967),
        ('Meddle', 1971),
        ('The Dark Side of the Moon', 1973),
        ('The Wall', 1979)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 4, AlbumID FROM new_albums;

-- 5. Metallica (ID 5)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Kill ’Em All', 1983),
        ('Ride the Lightning', 1984),
        ('Master of Puppets', 1986),
        ('…And Justice for All', 1988)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 5, AlbumID FROM new_albums;

-- 6. Nirvana (ID 6)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Bleach', 1989),
        ('Nevermind', 1991),
        ('In Utero', 1993),
        ('MTV Unplugged in New York', 1994)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 6, AlbumID FROM new_albums;

-- 7. Eluveitie (ID 7)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Spirit', 2006),
        ('Slania', 2008),
        ('Evocation I: The Arcane Dominion', 2009),
        ('Helvetios', 2012)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 7, AlbumID FROM new_albums;

-- 8. Finntroll (ID 8)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Midnattens Widunder', 1999),
        ('Nattfödd', 2004),
        ('Ur Jordens Djup', 2007),
        ('Blodsvept', 2013)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 8, AlbumID FROM new_albums;

-- 9. Korpiklaani (ID 9)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Spirit of the Forest', 2003),
        ('Voice of Wilderness', 2005),
        ('Tales Along This Road', 2006),
        ('Karkelo', 2009)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 9, AlbumID FROM new_albums;

-- 10. Wind Rose (ID 10)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Shadows Over Lothadruin', 2014),
        ('Stonehymn', 2017),
        ('Wintersaga', 2019),
        ('Warfront', 2021)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 10, AlbumID FROM new_albums;

-- 11. Ensiferum (ID 11)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Ensiferum', 2001),
        ('Iron', 2004),
        ('Victory Songs', 2007),
        ('From Afar', 2009)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 11, AlbumID FROM new_albums;
--------------------------------------------------------------------------
SELECT * FROM Author;

-- 12. The Offspring (ID 12)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Ignition', 1992),
        ('Smash', 1994),
        ('Americana', 1998),
        ('Conspiracy of One', 2000)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 12, AlbumID FROM new_albums;

-- 13. Green Day (ID 13)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Kerplunk', 1991),
        ('Dookie', 1994),
        ('Insomniac', 1995),
        ('American Idiot', 2004)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 13, AlbumID FROM new_albums;
------------------------------------------------------------------------------
SELECT * FROM Author;
------------------------------------------------------------------------------

-- 17. Sex Pistols (ID 17)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Never Mind the Bollocks', 1977),
        ('The Great Rock ’n’ Roll Swindle', 1979),
        ('Spunk', 1992),
        ('Filthy Lucre Live', 1996)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 17, AlbumID FROM new_albums;
-------------------------------------------------------------------------------


-- 15. Ramones (ID 15)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Ramones', 1976),
        ('Leave Home', 1977),
        ('Rocket to Russia', 1977),
        ('Road to Ruin', 1978)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 15, AlbumID FROM new_albums;

-- 16. Sum 41 (ID 16)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('All Killer No Filler', 2001),
        ('Does This Look Infected?', 2002),
        ('Chuck', 2004),
        ('Underclass Hero', 2007)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 16, AlbumID FROM new_albums;
-----------------------------------------------------------------------
SELECT * FROM Author;

-- 18. Cannibal Corpse (ID 18)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Eaten Back to Life', 1990),
        ('Tomb of the Mutilated', 1992),
        ('The Bleeding', 1994),
        ('Kill', 2006)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 18, AlbumID FROM new_albums;

-- 19. Arch Enemy (ID 19)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Black Earth', 1996),
        ('Wages of Sin', 2001),
        ('Doomsday Machine', 2005),
        ('War Eternal', 2014)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 18, AlbumID FROM new_albums;

-- 20. Morbid Angel (ID 20)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Altars of Madness', 1989),
        ('Blessed Are the Sick', 1991),
        ('Covenant', 1993),
        ('Domination', 1995)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 20, AlbumID FROM new_albums;

-- 21. Amon Amarth (ID 21)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Once Sent from the Golden Hall', 1998),
        ('Twilight of the Thunder God', 2008),
        ('Surtur Rising', 2011),
        ('Deceiver of the Gods', 2013)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 21, AlbumID FROM new_albums;

-- 22. Behemoth (ID 22)
WITH new_albums AS (
    INSERT INTO Album (Title, ReleaseYear) VALUES
        ('Satanica', 1999),
        ('Demigod', 2004),
        ('The Apostasy', 2007),
        ('The Satanist', 2014)
    RETURNING AlbumID
)
INSERT INTO AuthorAlbum (AuthorID, AlbumID)
SELECT 22, AlbumID FROM new_albums;
--------------------------------------------------------------------------------------
SELECT * FROM Album;

----------------Наполняем альбомы трэками и их длительностью не менее 6-ти трэков---------------------------

-- Led Zeppelin IV
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (240 - 150 + 1) + 150)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Black Dog'),
        ('Rock and Roll'),
        ('The Battle of Evermore'),
        ('Stairway to Heaven'),
        ('Misty Mountain Hop'),
        ('Four Sticks')
     ) AS t(title)
WHERE a.Title = 'Led Zeppelin IV';

-- Abbey Road
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (240 - 150 + 1) + 150)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Come Together'),
        ('Something'),
        ('Maxwell’s Silver Hammer'),
        ('Oh! Darling'),
        ('Octopus’s Garden'),
        ('I Want You (She’s So Heavy)')
     ) AS t(title)
WHERE a.Title = 'Abbey Road';

-- A Night at the Opera
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (240 - 150 + 1) + 150)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Death on Two Legs'),
        ('Lazing on a Sunday Afternoon'),
        ('I’m in Love with My Car'),
        ('You’re My Best Friend'),
        ('''39'),
        ('Bohemian Rhapsody')
     ) AS t(title)
WHERE a.Title = 'A Night at the Opera';

-- The Dark Side of the Moon
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (240 - 150 + 1) + 150)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Speak to Me'),
        ('Breathe'),
        ('Time'),
        ('Money'),
        ('Us and Them'),
        ('Brain Damage')
     ) AS t(title)
WHERE a.Title = 'The Dark Side of the Moon';

-- Master of Puppets
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (240 - 150 + 1) + 150)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Battery'),
        ('Master of Puppets'),
        ('The Thing That Should Not Be'),
        ('Welcome Home (Sanitarium)'),
        ('Disposable Heroes'),
        ('Orion')
     ) AS t(title)
WHERE a.Title = 'Master of Puppets';

---Nevermind. Повторный безопасный запрос (ничего не вставит, если всё уже есть). А то писал ошибку на уникальность.
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (240 - 150 + 1) + 150)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Smells Like Teen Spirit'),
        ('In Bloom'),
        ('Come as You Are'),
        ('Breed'),
        ('Lithium'),
        ('Polly')
     ) AS t(title)
WHERE a.Title = 'Nevermind'
 ---- отвечает за безопасность данный участок запроса
AND NOT EXISTS (
    SELECT 1 FROM Track tr
    WHERE tr.AlbumID = a.AlbumID AND tr.Title = t.title
);

----Просмотр трэков в альбоме Nevermind, для проверки себя любимого.
/*-
SELECT Title FROM Track
WHERE AlbumID = (SELECT AlbumID FROM Album WHERE Title = 'Nevermind');

---------
SELECT * FROM Track;
--------------------------------------------------------------------------------


---------------ЗАПРОС ДЛЯ ПРОВЕРКИ СВЯЗЕЙ АВТОРОВ С АЛЬБОМАМИ----------------------

SELECT a.Nickname AS Author, al.Title AS Album
FROM Author a
JOIN AuthorAlbum aa ON a.AuthorID = aa.AuthorID
JOIN Album al ON aa.AlbumID = al.AlbumID
ORDER BY a.Nickname;

--------------ЗАПРОС ДЛЯ ОТОБРАЖЕНИЯ АВТОРОВ ТРЭКОВ ЧЕРЕЗ ИХ АЛЬБОМЫ--------------

SELECT au.Nickname AS Author, al.Title AS Album, t.Title AS Track
FROM Author au
JOIN AuthorAlbum aa ON au.AuthorID = aa.AuthorID
JOIN Album al ON aa.AlbumID = al.AlbumID
JOIN Track t ON al.AlbumID = t.AlbumID
ORDER BY au.Nickname, al.Title;
---================================================================================---
--------------БЛИН!!!!!! БОРЬБА С ДУБЛИКАТАМИ ТРЭКОВ В АЛЬБОМАХ-----------------------
---================================================================================---

---Проверка на дубликаты и вывод их количества
SELECT Title, AlbumID, COUNT(*)
FROM Track
GROUP BY Title, AlbumID
HAVING COUNT(*) > 1;

--Удаление дубликатов трэков в альбоме
DELETE FROM Track
WHERE TrackID NOT IN (
    SELECT MIN(TrackID)
    FROM Track
    GROUP BY Title, AlbumID
);
*/

--!!!!!Ограничение!!!!! для предотвращение дубликатов в будующем для сочетания Title + AlbumID
ALTER TABLE Track
ADD CONSTRAINT unique_track_per_album
UNIQUE (Title, AlbumID);


------================================================================================---
----------ВТОРАЯ ПОРЦИЯ ТРЭКОВ ДЛЯ АЛЬБОМОВ---------------------------------------------
----------БАЗА ПОЧТИ ЗАПОЛНЕНА НЕ ССАТЬ!!!-----------------------------------------------
--====================================================================================---

-- Led Zeppelin — Houses of the Holy
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('The Song Remains the Same'),
        ('The Rain Song'),
        ('Over the Hills and Far Away'),
        ('Dancing Days'),
        ('No Quarter'),
        ('The Ocean')
     ) AS t(title)
WHERE a.Title = 'Houses of the Holy';

-- The Beatles — Rubber Soul
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Drive My Car'),
        ('Norwegian Wood'),
        ('Nowhere Man'),
        ('Michelle'),
        ('Girl'),
        ('In My Life')
     ) AS t(title)
WHERE a.Title = 'Rubber Soul';

-- Queen — The Game
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Play the Game'),
        ('Dragon Attack'),
        ('Another One Bites the Dust'),
        ('Need Your Loving Tonight'),
        ('Crazy Little Thing Called Love'),
        ('Save Me')
     ) AS t(title)
WHERE a.Title = 'The Game';

-- Pink Floyd — Wish You Were Here
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Shine On You Crazy Diamond (Part I–V)'),
        ('Welcome to the Machine'),
        ('Have a Cigar'),
        ('Wish You Were Here'),
        ('Shine On You Crazy Diamond (Part VI–IX)'),
        ('Wine and Whispers')
     ) AS t(title)
WHERE a.Title = 'Wish You Were Here';

-- Metallica — Ride the Lightning
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Fight Fire with Fire'),
        ('Ride the Lightning'),
        ('For Whom the Bell Tolls'),
        ('Fade to Black'),
        ('Trapped Under Ice'),
        ('Creeping Death')
     ) AS t(title)
WHERE a.Title = 'Ride the Lightning';

-- Nirvana — In Utero
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Serve the Servants'),
        ('Scentless Apprentice'),
        ('Heart-Shaped Box'),
        ('Rape Me'),
        ('Dumb'),
        ('All Apologies')
     ) AS t(title)
WHERE a.Title = 'In Utero';

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-----------Фантазия есть, желание есть, ночь большая, Так что ГО ЕЩЁ НАКИДЫВАТЬ В БД----
-------ДЛИТЕЛЬНОСТЬ РАНДОМНАЯ от 180 до 300 секунд-------------

-- Eluveitie — Slania
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Inis Mona'),
        ('Slania'),
        ('Omnos'),
        ('A Rose for Epona'),
        ('King'),
        ('The Arcane Dominion')
     ) AS t(title)
WHERE a.Title = 'Slania';

-- Finntroll — Nattfödd
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Nattfödd'),
        ('Jaktens Tid'),
        ('Under Bergets Rot'),
        ('Svart Sorg'),
        ('Trollhammaren'),
        ('Skog')
     ) AS t(title)
WHERE a.Title = 'Nattfödd';

-- Korpiklaani — Tales Along This Road
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Juodaan Viinaa'),
        ('Wooden Pints'),
        ('Vodka'),
        ('Beer Beer'),
        ('Tales Along This Road'),
        ('Happy Little Boozer')
     ) AS t(title)
WHERE a.Title = 'Tales Along This Road';

-- Wind Rose — Wintersaga
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Warriors of the North'),
        ('The Lone Defender'),
        ('Wintersaga'),
        ('Battlecry'),
        ('Warchild'),
        ('The Village')
     ) AS t(title)
WHERE a.Title = 'Wintersaga';

-- Ensiferum — Iron
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Iron'),
        ('Burning Leaves'),
        ('Blood Is the Price of Glory'),
        ('The Phantom Boat'),
        ('My Ancestors’ Blood'),
        ('Token of Time')
     ) AS t(title)
WHERE a.Title = 'Iron';

-- The Offspring — Americana
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Welcome'),
        ('Have You Ever'),
        ('Staring at the Sun'),
        ('Pretty Fly (for a White Guy)'),
        ('The Kids Aren’t Alright'),
        ('Feelings')
     ) AS t(title)
WHERE a.Title = 'Americana';

-- Green Day — Dookie
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Burnout'),
        ('Having a Blast'),
        ('Chump'),
        ('Longview'),
        ('Welcome to Paradise'),
        ('Pulling Teeth')
     ) AS t(title)
WHERE a.Title = 'Dookie';

-- Ramones — Rocket to Russia
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Cretin Hop'),
        ('Teenage Lobotomy'),
        ('Beat on the Brat'),
        ('Sheena Is a Punk Rocker'),
        ('Rocky Road to Ruin'),
        ('I Don’t Care')
     ) AS t(title)
WHERE a.Title = 'Rocket to Russia';

-- Sum 41 — All Killer No Filler
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Fat Lip'),
        ('Motivation'),
        ('In Too Deep'),
        ('Summer'),
        ('Handle This'),
        ('All She’s Got')
     ) AS t(title)
WHERE a.Title = 'All Killer No Filler';

-- Cannibal Corpse — The Bleeding
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Staring Through the Eyes of the Dead'),
        ('Fucked with a Knife'),
        ('Covered with Sores'),
        ('A Skull Full of Maggots'),
        ('The Bleeding'),
        ('Rotting Head')
     ) AS t(title)
WHERE a.Title = 'The Bleeding';

-- Arch Enemy — Wages of Sin
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Wages of Sin'),
        ('Dead Eyes See No Future'),
        ('Burning Angel'),
        ('Heart of Darkness'),
        ('Enemy Within'),
        ('We Will Rise')
     ) AS t(title)
WHERE a.Title = 'Wages of Sin';

-- Morbid Angel — Covenant
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Rapture'),
        ('Pitiless Reign'),
        ('Ageless Sacrifice'),
        ('Covenants Death'),
        ('God of Our Own Divinity'),
        ('Fall from Grace')
     ) AS t(title)
WHERE a.Title = 'Covenant';

-- Amon Amarth — Versus the World
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Versus the World'),
        ('Death in Fire'),
        ('A Fury Whose Name I Do Not Know'),
        ('Wolves of the Sea'),
        ('Fate of Norns'),
        ('Risen from the Sea')
     ) AS t(title)
WHERE a.Title = 'Versus the World';

-- Behemoth — Demigod
INSERT INTO Track (Title, Duration, AlbumID)
SELECT t.title, FLOOR(RANDOM() * (300 - 180 + 1) + 180)::INT, a.AlbumID
FROM Album a,
     (VALUES
        ('Conquer All'),
        ('As Above So Below'),
        ('Demigod'),
        ('From the Pagan Vastlands'),
        ('XUL'),
        ('Decade of Therion')
     ) AS t(title)
WHERE a.Title = 'Demigod';

----ОГраничение на будущее, чтобы длительность трека  была больше нуля.

ALTER TABLE Track
ADD CONSTRAINT check_duration_positive CHECK (Duration > 0);


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-----------Такс. Теперь делаем сборники по трэкам------------------------------------------
--------------Хэликоптэр нихт. Пописдофали------------------------------------------------
-------------------------------------------------------------------------------------------
-----НЕ МЕНЕЕ ЧЕТЫРЁХ СБОРНИКОВ НУЖНО БУДЕТ НАКИДАТЬ В БД, НУ ЧТО Ж....--------------------


----Сборник Classic Rock Hits. ОСТИАЛЬНЫЕ КЛЕПАЕМ ПО АНАЛОГИИ

INSERT INTO Compilation (Title, ReleaseYear) VALUES ('Classic Rock Hits', 2025);

INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT c.CompilationID, t.TrackID
FROM Compilation c
JOIN Track t ON t.Title IN (
    'Stairway to Heaven', 'Come Together', 'Money',
    'Bohemian Rhapsody', 'Master of Puppets', 'Smells Like Teen Spirit'
)
WHERE c.Title = 'Classic Rock Hits';


-----Сборник: Folk & Metal Fusion

INSERT INTO Compilation (Title, ReleaseYear) VALUES ('Folk & Metal Fusion', 2025);

INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT c.CompilationID, t.TrackID
FROM Compilation c
JOIN Track t ON t.Title IN (
    'Inis Mona', 'Trollhammaren', 'Vodka',
    'Wintersaga', 'Iron', 'Fate of Norns'
)
WHERE c.Title = 'Folk & Metal Fusion';

------Сборник: Punk Rock Anthems

INSERT INTO Compilation (Title, ReleaseYear) VALUES ('Punk Rock Anthems', 2025);

INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT c.CompilationID, t.TrackID
FROM Compilation c
JOIN Track t ON t.Title IN (
    'Pretty Fly (for a White Guy)', 'Longview', 'Sheena Is a Punk Rocker',
    'Fat Lip', 'Anarchy in the UK', 'Holiday'
)
WHERE c.Title = 'Punk Rock Anthems';

-----Сборник: Death & Extreme Metal Collection

INSERT INTO Compilation (Title, ReleaseYear) VALUES ('Death & Extreme Metal Collection', 2025);

INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT c.CompilationID, t.TrackID
FROM Compilation c
JOIN Track t ON t.Title IN (
    'Staring Through the Eyes of the Dead', 'Dead Eyes See No Future',
    'Rapture', 'Demigod', 'Wolves of the Sea', 'Battery'
)
WHERE c.Title = 'Death & Extreme Metal Collection';

-----Сборник: 90s Alternative and Grunge

INSERT INTO Compilation (Title, ReleaseYear) VALUES ('90s Alternative and Grunge', 2025);

INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT c.CompilationID, t.TrackID
FROM Compilation c
JOIN Track t ON t.Title IN (
    'Lithium', 'Breed', 'Come as You Are',
    'Welcome to Paradise', 'Smells Like Teen Spirit', 'In Bloom'
)
WHERE c.Title = '90s Alternative and Grunge';

-----Сборник: Epic Metal Ballads

INSERT INTO Compilation (Title, ReleaseYear) VALUES ('Epic Metal Ballads', 2025);

INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT c.CompilationID, t.TrackID
FROM Compilation c
JOIN Track t ON t.Title IN (
    'The Lone Defender', 'My Ancestors’ Blood',
    'Happy Little Boozer', 'A Rose for Epona',
    'Under Bergets Rot', 'Burning Angel'
)
WHERE c.Title = 'Epic Metal Ballads';

--------------------------------------"Названия сборников, вышедших в период с 2018 по 2020 год включительно. ДЛЯ ВЫПОЛНЕНИЯ ДРУГИХ ЗАДАНИЙ"
INSERT INTO Compilation (Title, ReleaseYear) VALUES
('Modern Metal Mayhem', 2018),
('Alternative Pulse', 2019),
('Folk Rock Revival', 2020);

INSERT INTO CompilationTrack (CompilationID, TrackID) VALUES
(12, 149), -- A Skull Full of Maggots
(12, 166), -- Demigod
(12, 168), -- XUL
(12, 162); -- God of Our Own Divinity

INSERT INTO CompilationTrack (CompilationID, TrackID) VALUES
(13, 31),  -- Smells Like Teen Spirit
(13, 90),  -- Dumb
(13, 128), -- Burnout
(13, 126); -- The Kids Aren’t Alright

INSERT INTO CompilationTrack (CompilationID, TrackID) VALUES
(14, 94),  -- Omnos
(14, 93),  -- Slania
(14, 104), -- Juodaan Viinaa
(14, 108); -- Tales Along This Road
------Проверяем....
SELECT 
    c.Title AS Compilation,
    t.Title AS Track
FROM CompilationTrack ct
JOIN Compilation c ON ct.CompilationID = c.CompilationID
JOIN Track t ON ct.TrackID = t.TrackID
WHERE c.ReleaseYear BETWEEN 2018 AND 2020
ORDER BY c.Title;


/*
-----------ПРОВЕРЯЕМ!!! ПРОВЕРЯЕМ БЛИН СПИСОК ВСЕХ ТРЭКОВ В СБОРНИКАХ С АВТОРАМИ И АЛЬБОМИ---------

SELECT 
    c.Title AS Compilation,
    t.Title AS Track,
    a.Title AS Album,
    au.Nickname AS Author
FROM CompilationTrack ct
JOIN Compilation c ON ct.CompilationID = c.CompilationID
JOIN Track t ON ct.TrackID = t.TrackID
JOIN Album a ON t.AlbumID = a.AlbumID
JOIN AuthorAlbum aa ON a.AlbumID = aa.AlbumID
JOIN Author au ON aa.AuthorID = au.AuthorID
ORDER BY c.Title, t.Title;

----Е-бой при первой проверке всё пусто. проверяем таблицу сборников

SELECT * FROM Compilation;  ---Названия сбоников есть, значит всё гуд.
-----Задвоение сборников, блин.... Походу два раза где-то выполнил запрос на создание сборника...
SELECT * FROM CompilationTrack; --- Проверяем привязку трэка к сборнику.

-------------------------------------------------------------------------------------------------
--- Пусто блин. А значит пора писать запрос на воссоединение сборника с существующими трэками...
-------------------------------------------------------------------------------------------------


----Перечислим сборники которые точно есть в Compilastion

SELECT CompilationID, Title
FROM Compilation
ORDER BY CompilationID;

-----Опять же помню, что создал дубликаты, натыкал пару раз запрос по невнимательности, а значит 
-------пришло время их удалить
DELETE FROM Compilation c1
USING Compilation c2
WHERE 
    c1.CompilationID > c2.CompilationID
    AND c1.Title = c2.Title;
*/

-----Опять таки, чтобы в будующенм дубликатов не было внесено, то добавляем !!ОГРАНИЧЕНИЕ НА УНИКАЛЬНОСТЬ ДЛЯ СБОРНИКОВ!!!
ALTER TABLE Compilation
ADD CONSTRAINT unique_title UNIQUE (Title);


/*
------------------------------------------------------------------------------------------------------
-----------------И опять привязываем трэки к сборникам------------------------------------------------
------------------------------------------------------------------------------------------------------

-- 1. Classic Rock Hits
INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT 1, TrackID FROM Track
WHERE Title IN (
  'Stairway to Heaven', 'Bohemian Rhapsody', 'Come Together',
  'Money', 'Time', 'Rock and Roll'
) AND AlbumID IN (
  SELECT AlbumID FROM Album WHERE Title IN (
    'Led Zeppelin IV', 'A Night at the Opera', 'Abbey Road', 'The Dark Side of the Moon'
  )
) LIMIT 6;

-- 2. Folk & Metal Fusion
INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT 2, TrackID FROM Track
WHERE Title IN (
  'Inis Mona', 'Havoc', 'Trollhammaren',
  'Vodka', 'Wintersaga', 'Battle Song'
) LIMIT 6;

-- 3. Punk Rock Anthems
INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT 3, TrackID FROM Track
WHERE Title IN (
  'Anarchy in the UK', 'Blitzkrieg Bop', 'American Idiot',
  'Pretty Fly (for a White Guy)', 'Fat Lip', 'Holiday'
) LIMIT 6;

-- 4. Death & Extreme Metal Collection
INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT 4, TrackID FROM Track
WHERE (Title IN (
    'Demigod', 'From the Pagan Vastlands', 'XUL',
    'A Skull Full of Maggots', 'Burning Angel', 'Covered with Sores',
    'Dead Eyes See No Future', 'Enemy Within', 'Fucked with a Knife',
    'Heart of Darkness', 'Rotting Head', 'Staring Through the Eyes of the Dead',
    'The Bleeding', 'Wages of Sin', 'We Will Rise',
    'Ageless Sacrifice', 'Covenants Death', 'Fall from Grace',
    'God of Our Own Divinity', 'Pitiless Reign', 'Rapture'
))
AND AlbumID IN (
    SELECT AlbumID FROM Album WHERE Title IN (
        'Demigod', 'The Bleeding', 'Wages of Sin', 'Covenant'
    )
)
LIMIT 6;


-- 5. 90s Alternative and Grunge
INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT 5, TrackID FROM Track
WHERE Title IN (
  'Smells Like Teen Spirit', 'Come as You Are', 'Lithium',
  'In Bloom', 'Polly', 'Breed'
) AND AlbumID IN (
  SELECT AlbumID FROM Album WHERE Title = 'Nevermind'
) LIMIT 6;

-- 6. Epic Metal Ballads
INSERT INTO CompilationTrack (CompilationID, TrackID)
SELECT 6, TrackID FROM Track
WHERE Title IN (
  'Nothing Else Matters', 'Fade to Black', 'The Unforgiven',
  'Bohemian Rhapsody', 'Stairway to Heaven', 'Brain Damage'
) LIMIT 6;


-----------ПРОВЕРЯЕМ!!! ПРОВЕРЯЕМ БЛИН СПИСОК ВСЕХ ТРЭКОВ В СБОРНИКАХ С АВТОРАМИ И АЛЬБОМИ---------

SELECT 
    c.Title AS Compilation,
    t.Title AS Track,
    a.Title AS Album,
    au.Nickname AS Author
FROM CompilationTrack ct
JOIN Compilation c ON ct.CompilationID = c.CompilationID
JOIN Track t ON ct.TrackID = t.TrackID
JOIN Album a ON t.AlbumID = a.AlbumID
JOIN AuthorAlbum aa ON a.AlbumID = aa.AlbumID
JOIN Author au ON aa.AuthorID = au.AuthorID
ORDER BY c.Title, t.Title;

----============НУ ВОТ ОПЯТЬ Death & Extreme Metal Collection обделил============== 
*/
----Проверим какие у дэзметалистов есть трэки
SELECT 
    au.Nickname AS Author,
    a.Title AS Album,
    t.Title AS Track
FROM Track t
JOIN Album a ON t.AlbumID = a.AlbumID
JOIN AuthorAlbum aa ON a.AlbumID = aa.AlbumID
JOIN Author au ON aa.AuthorID = au.AuthorID
WHERE au.Nickname IN (
    'Cannibal Corpse', 'Arch Enemy', 'Morbid Angel', 'Amon Amarth', 'Behemoth'
)
ORDER BY au.Nickname, t.Title;

----Поправил дэзметалистов и проверяем. ПРОВЕРЯЕМ!----------------

---------ПРОВЕРЯЕМ ЕСТЬ ЛИ СБОРНИКИ БЕЗ ТРЭКОВ---------------
SELECT 
    c.CompilationID,
    c.Title
FROM Compilation c
LEFT JOIN CompilationTrack ct ON c.CompilationID = ct.CompilationID
WHERE ct.TrackID IS NULL;

SELECT Title FROM Track ORDER BY Title;
----Всё. Все сборники заполнены-------
---==================================================================================================----
---==================================================================================================----
---==================================================================================================----
/*----------------------------------------------------
"Внимание: должны быть заполнены все поля каждой таблицы, 
в том числе таблицы связей исполнителей с жанрами, исполнителей с альбомами, 
сборников с треками."

ДА БЛИН....
--------------------------------*/
---
SELECT * FROM Album; ---- заполнено
----
SELECT * FROM AuthorGenre; ---- пусто, заполняем ниже------------------------------------------------

SELECT * FROM Genre;

INSERT INTO AuthorGenre (AuthorID, GenreID)
SELECT a.AuthorID, g.GenreID
FROM Author a
JOIN Genre g ON
  (a.Nickname IN ('Led Zeppelin', 'The Beatles', 'Queen', 'Pink Floyd', 'Metallica', 'Nirvana') AND g.Name = 'Рок')
  OR (a.Nickname IN ('Eluveitie','Finntroll','Korpiklaani','Wind Rose','Ensiferum') AND g.Name = 'Фолк Металл')
  OR (a.Nickname IN ('The Offspring','Green Day','Sex Pistols','Ramones','Sum 41') AND g.Name = 'Панк')
  OR (a.Nickname IN ('Cannibal Corpse','Arch Enemy','Morbid Angel','Amon Amarth','Behemoth') AND g.Name = 'Дед Метал');


----ПРОВЕРЯЕМ ЧТО ТАБЛИЦА ЗАПОЛНЕНА
SELECT ag.AuthorID, a.Nickname, ag.GenreID, g.Name
FROM AuthorGenre ag
JOIN Author a ON ag.AuthorID = a.AuthorID
JOIN Genre g ON ag.GenreID = g.GenreID
ORDER BY a.Nickname;

---------------------ВСЁ ОКЕЙ ПРОВЕРЯЕМ ДАЛЬШЕ-------------------------------------------

----------------------------------------------------------------------------------------------------
SELECT * FROM Compilation; --- проставленны какие-то не реальные значения. а точнее вообще никакие.

----НАпрягаем память, гуглим и смолтрим какой жанр когда был популярен и подходящий сборрник под это...

---обновляем даты популярнеости сборников
UPDATE Compilation SET ReleaseYear = 1990 WHERE Title = 'Classic Rock Hits';
UPDATE Compilation SET ReleaseYear = 2015 WHERE Title = 'Folk & Metal Fusion';
UPDATE Compilation SET ReleaseYear = 2002 WHERE Title = 'Punk Rock Anthems';
UPDATE Compilation SET ReleaseYear = 2006 WHERE Title = 'Death & Extreme Metal Collection'; --- лучшее время
UPDATE Compilation SET ReleaseYear = 1999 WHERE Title = '90s Alternative and Grunge';
UPDATE Compilation SET ReleaseYear = 2010 WHERE Title = 'Epic Metal Ballads';

----------------------------------------------------------------------------------------------------

--------------------------------ПРОВЕРЯЕМ КАЖДУЮ ТАБЛИЦУ НА НЕДОЗАПОЛНЕННЫЕ ПОЛЯ-------------------

----- Проверка таблицы Genre
SELECT * FROM Genre;
----Проверка таблицы Author
SELECT * FROM Author;
---Проверка таблицы AuthorGenre и связей между исполнителями и жанрами
SELECT ag.AuthorID, a.Nickname, ag.GenreID, g.Name
FROM AuthorGenre ag
JOIN Author a ON ag.AuthorID = a.AuthorID
JOIN Genre g ON ag.GenreID = g.GenreID;
---Проверка таблицы Album и заполненность ReleaseYear
SELECT AlbumID, Title, ReleaseYear
FROM Album
ORDER BY ReleaseYear IS NULL, Title;
----- Проверка таблицы AuthorAlbum и связь между исполнителями и альбомами
SELECT aa.AuthorID, a.Nickname, aa.AlbumID, al.Title
FROM AuthorAlbum aa
JOIN Author a ON aa.AuthorID = a.AuthorID
JOIN Album al ON aa.AlbumID = al.AlbumID;

---- Проверка таблицы Track и пустые Duration
SELECT TrackID, Title, Duration, AlbumID
FROM Track
ORDER BY Duration IS NULL, Title;

---Compilation
SELECT CompilationID, Title, ReleaseYear
FROM Compilation
ORDER BY ReleaseYear IS NULL, Title;

----CompilationTrack
SELECT 
    ct.CompilationID,
    c.Title AS Compilation,
    ct.TrackID,
    t.Title AS Track
FROM CompilationTrack ct
JOIN Compilation c ON ct.CompilationID = c.CompilationID
JOIN Track t ON ct.TrackID = t.TrackID
ORDER BY c.Title, t.Title;

-----=======================ВСЁ ОК, ВСЕ ДАННЫЕ НА МЕСТЕ=========================-----


--===============ДОПОЛНИТЕЛЬНО ДЛЯ АНАЛИТИКИ ЧТОБЫ НЕ ОСТАВЛЯТЬ ПУСТЫЕ АЛЬБОМЫ БЕЗ ТРЭКОВ ИБО ** оно конём заполнять всё========---
---------------fвто-добавление треков в пустые альбомы
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT al.AlbumID, al.Title AS AlbumTitle
        FROM Album al
        LEFT JOIN Track t ON al.AlbumID = t.AlbumID
        WHERE t.TrackID IS NULL
    LOOP
        INSERT INTO Track (Title, Duration, AlbumID)
        VALUES (
            'AutoTrack for ' || rec.AlbumTitle,
            180,
            rec.AlbumID
        );
    END LOOP;
END $$;

-----запрос, который выведет для каждого трека его название,
---- название альбома и имя исполнителя (или исполнителей, если их несколько для альбома):
---- Так же  запрос связывает треки с альбомами, а альбомы — с исполнителями. Таким образом, 
-----для каждого трека будет видно, к какому исполнителю он относится.
SELECT 
    t.Title AS TrackTitle,
    al.Title AS AlbumTitle,
    au.Nickname AS AuthorName
FROM Track t
JOIN Album al ON t.AlbumID = al.AlbumID
JOIN AuthorAlbum aa ON al.AlbumID = aa.AlbumID
JOIN Author au ON aa.AuthorID = au.AuthorID
ORDER BY au.Nickname, al.Title, t.Title;


---==================================================================================================----
---==================================================================================================----
---==================================================================================================----
---==================================================================================================----
