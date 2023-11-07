--------------------
-- Sample Queries --
--------------------

-- BookTitle + AuthorName + YearPublished + Publisher
select title, aname, yearPublished, pname
from WRITES, BOOK, AUTHOR, PUBLISHER
where bID=bookID and aID=authorID and publisherID=published;

-- BookTitle + CollectionName + CollectionNumber
select title, cname, num
from BOOK, COLLECTION, COLNUM
where bookID=bID and cID=collectionID;

-- BookTitle + StartDate + EndDate + Rating
select title, startDate, endDate,
(logic+writingStyle+plot+emotionalImpact+characters+worldBuildingAtmosphere+captivatingEntertaining)/7.0 as rating
from BOOK, READING, RATING
where rID=readingID and bID=bookID;
