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

-- ColNum
