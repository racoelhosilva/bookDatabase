----------------------
-- Value Insertions --
----------------------

-- Publisher
insert into PUBLISHER values (1, 'Saída de Emergência', 'Portugal', 2003);
insert into PUBLISHER(publisherID, pname, pcountry) values (2, 'Editorial Presença', 'Portugal');
insert into PUBLISHER(publisherID, pname) values (3, 'Penguin Random House'), (4, 'HarperCollins');

-- Book
insert into BOOK(bookID, title, yearPublished, publisher) values (1, 'Fundação', 1951, 1), (2, 'Fundação e Império', 1952, 1),(3, 'Segunda Fundação', 1953, 1);
insert into BOOK values (4, 'To Kill A Mockingbird', 1960, 'EN', 'M', 4);

-- Author
insert into AUTHOR(authorID, aname) values (1, 'Isaac Asimov');
insert into AUTHOR values (2, 'Harper Lee', 'United States of America', 1926);

-- Writes (Relation between AUTHOR and BOOK)
insert into WRITES values (1, 1), (2, 1), (3, 1);
insert into WRITES(aID, bID) values (2, 4);

-- Collection
insert into COLLECTION values (1, 'Fundação', 7);

-- ColNum
insert into COLNUM values (1,1,1),(1,2,2),(1,3,3);

-- Reading
insert into READING values (1, '2021-01-28', '2021-02-04', 7), (2, '2021-02-04', '2021-02-07', 3), (3, '2021-02-08', '2021-02-20', 12);
insert into READING(readingID, startDate, endDate) values (4, '2021-04-16', '2021-05-29');

-- Rating
insert into RATING values (1,1,9,10,10,9,10,10,9);
insert into RATING values (2,2,8,10,10,8,9,9,9), (3,3,9,10,10,10,10,9,9);
insert into RATING values (4,4,8,7,9,9,7,7,10);
