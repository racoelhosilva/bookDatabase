----------------------------
-- Initial configurations --
----------------------------

-- Drop existing tables
drop table if exists BOOK;
drop table if exists PUBLISHER;
drop table if exists AUTHOR;
drop table if exists WRITES;
drop table if exists COLLECTION;
drop table if exists COLNUM;
drop table if exists READING;
drop table if exists RATING;

-- Basic configurations for output
.mode columns
.headers on

-- Enabling sqlite options
PRAGMA foreign_keys=ON;

-----------------------
-- Table Definitions --
-----------------------

-- Single book entity
-- central entity
create table BOOK (
       bookID INTEGER PRIMARY KEY NOT NULL,
       title TEXT NOT NULL,
       yearPublished INTEGER,
       language TEXT DEFAULT 'PT' CONSTRAINT possibleLanguages CHECK (language in ('PT', 'EN')),
       format TEXT DEFAULT 'M' CONSTRAINT possibleFormats CHECK (format in ('P', 'D', 'M')),
       publisher INTEGER,
       FOREIGN KEY(publisher) REFERENCES PUBLISHER(publisherID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Publisher entity, only referenced by BOOK
-- publisher of books, associated with them
create table PUBLISHER(
       publisherID INTEGER PRIMARY KEY NOT NULL,
       pname TEXT NOT NULL,
       pcountry TEXT,
       yearFoundation INTEGER
);

-- Author entity, related to WRITES
-- writer of books, associated with them
create table AUTHOR(
       authorID INTEGER PRIMARY KEY NOT NULL,
       aname TEXT NOT NULL,
       acountry TEXT,
       birthYear INTEGER
);

-- Relation that connects BOOK with AUTHOR
-- Note: a book can be written by more than one person
create table WRITES(
       bID INTEGER,
       aID INTEGER,
       FOREIGN KEY(bID) REFERENCES BOOK(bookID) ON DELETE SET NULL ON UPDATE CASCADE,
       FOREIGN KEY(aID) REFERENCES AUTHOR(authorID) ON DELETE SET NULL ON UPDATE CASCADE,
       PRIMARY KEY(bID, aID)
);

-- Collection entity, specified with a number
-- used for tracking a set of books that are similar and connected
create table COLLECTION(
       collectionID INTEGER PRIMARY KEY NOT NULL,
       cname TEXT NOT NULL,
       total INTEGER
);

-- Collection Number entity, connects book with collection
-- associates a number to the book when inside the collection
create table COLNUM(
       cID INTEGER,
       bID INTEGER,
       num INTEGER,
       FOREIGN KEY(cID) REFERENCES COLLECTION(collectionID) ON DELETE SET NULL ON UPDATE CASCADE,
       FOREIGN KEY(bID) REFERENCES BOOK(bookID) ON DELETE SET NULL ON UPDATE CASCADE,
       PRIMARY KEY(cID, bID),
       UNIQUE(cID, num)
);

-- Reading entity, associated with BOOK
-- specifies one entire reading of the book
create table READING(
       readingID INTEGER PRIMARY KEY NOT NULL,
       startDate TEXT,
       endDate TEXT,
       duration INTEGER
);

-- Rating entity, relates BOOK to READING
-- Note: a book can be read different times for different ratings
create table RATING(
       bID INTEGER,
       rID INTEGER,
       captivatingEntertaining INTEGER,
       worldBuildingAtmosphere INTEGER,
       characters INTEGER,
       emotionalImpact INTEGER,
       plot INTEGER,
       writingStyle INTEGER,
       logic INTEGER,
       FOREIGN KEY(bID) REFERENCES BOOK(bookID) ON DELETE SET NULL ON UPDATE CASCADE,
       FOREIGN KEY(rID) REFERENCES READING(readingID) ON DELETE SET NULL ON UPDATE CASCADE,
       PRIMARY KEY(rID)
);
