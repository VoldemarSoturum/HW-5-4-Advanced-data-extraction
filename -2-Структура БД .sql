-- 1. Таблица жанров
CREATE TABLE Genre (
    GenreID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL
);

-- 2. Таблица исполнителей
CREATE TABLE Author (
    AuthorID SERIAL PRIMARY KEY,
    Nickname TEXT NOT NULL
);

-- 3. Связующая таблица: Author <-> Genre (многие ко многим)
CREATE TABLE AuthorGenre (
    AuthorID INT REFERENCES Author(AuthorID) ON DELETE CASCADE,
    GenreID INT REFERENCES Genre(GenreID) ON DELETE CASCADE,
    PRIMARY KEY (AuthorID, GenreID)
);

-- 4. Таблица альбомов
CREATE TABLE Album (
    AlbumID SERIAL PRIMARY KEY,
    Title TEXT NOT NULL,
    ReleaseYear INT CHECK (ReleaseYear >= 1000 AND ReleaseYear <= 9999)
);

-- 5. Связующая таблица: Author <-> Album (многие ко многим)
CREATE TABLE AuthorAlbum (
    AuthorID INT REFERENCES Author(AuthorID) ON DELETE CASCADE,
    AlbumID INT REFERENCES Album(AlbumID) ON DELETE CASCADE,
    PRIMARY KEY (AuthorID, AlbumID)
);

-- 6. Таблица треков (один альбом — много треков)
CREATE TABLE Track (
    TrackID SERIAL PRIMARY KEY,
    Title TEXT NOT NULL,
    Duration INTERVAL NOT NULL,
    AlbumID INT REFERENCES Album(AlbumID) ON DELETE CASCADE
);

-- 7. Таблица сборников
CREATE TABLE Compilation (
    CompilationID SERIAL PRIMARY KEY,
    Title TEXT NOT NULL,
    ReleaseYear INT CHECK (ReleaseYear >= 1000 AND ReleaseYear <= 9999)
);

-- 8. Связующая таблица: Compilation <-> Track (многие ко многим)
CREATE TABLE CompilationTrack (
    CompilationID INT REFERENCES Compilation(CompilationID) ON DELETE CASCADE,
    TrackID INT REFERENCES Track(TrackID) ON DELETE CASCADE,
    PRIMARY KEY (CompilationID, TrackID)
);
