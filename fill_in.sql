SET SQL_SAFE_UPDATES=0;
USE assignment2;

-- DROPS --

DELETE FROM Participation;
DELETE FROM Sponsors;
DELETE FROM Company;
DELETE FROM Route;
DELETE FROM Competitor;
DELETE FROM Running;

-- Companies --

INSERT INTO Company VALUES ('C1', 'RedBull', '+1 535 535 5335', 'redbull@xtrem.com');
INSERT INTO Company VALUES ('C2', 'Cruzcampo', '+34 18 62 82 80', 'cruzcampo@customer.es');
INSERT INTO Company VALUES ('C3', 'Billabong', '+1 888 258 5712', 'billabong@shop.com');
INSERT INTO Company VALUES ('C4', 'RedBull', '+33 1 82 52 25 28', 'quicksilver@shop.com');

-- Competitor --

INSERT INTO Competitor VALUES ('1A', 'Lucas Bergeron', '+33 6 47 64 06 77', 'l.bergeron@stud.uis.no', 'Grenoble', 'French', 'male', '1997/11/26');
INSERT INTO Competitor VALUES ('2A', 'Alvaro Castro', '+34 78 11 81 15', 'a.castro@stud.uis.no', 'South Spain', 'Spanish', 'male', '1997/06/28');
INSERT INTO Competitor VALUES ('3A', 'Johnny Depp', '+1 000 000 0000', 'jonny.dep@fake.com', 'Kentucky', 'USA', 'male', '1964/12/03');
INSERT INTO Competitor VALUES ('4A', 'Chuck Norris', '+1 123 123 8578', 'chuck.norris@fake.com', 'Texas', 'USA', 'male', '1940/04/10');
INSERT INTO Competitor VALUES ('5A', 'Lukas Kurt', '+47 58 05 05 28', 'l.kurt@stud.uis.no', 'Stavanger', 'Norwegian', 'male', '1998/01/04');
INSERT INTO Competitor VALUES ('6A', 'Cong Tien', '+33 01 48 96 35', 'c.tien@stud.uis.no', 'Stavanger', 'Norwegian', 'male', '1998/10/24');

-- Runnings --

INSERT INTO Running VALUES (1, 'St-Sylvester', '2019/12/31', 'mixed', 'Spain');
INSERT INTO Running VALUES (2, 'NY Marathon', '2019/11/03', 'mixed', 'New York');
INSERT INTO Running VALUES (3, 'GW of China Marathon', '2019/04/15', 'mixed', 'China');
INSERT INTO Running VALUES (4, 'UT4M', '2020/06/20', 'mixed', 'Grenoble');
INSERT INTO Running VALUES (5, 'WCC Slalom Men', '2020/02/11', 'male', 'Austria');

-- Routes --

INSERT INTO Running VALUES (1, 'Children', 3, 10, 1);
INSERT INTO Running VALUES (2, 'Adult', 42, 20, 1);

INSERT INTO Running VALUES (3, 'Adult', 42, 50, 2);

INSERT INTO Running VALUES (4, 'Adult', 42, 6500, 3);

INSERT INTO Running VALUES (5, 'Youth', 21, 20, 4);
INSERT INTO Running VALUES (6, 'Adult', 42, 50, 4);
INSERT INTO Running VALUES (7, 'Senior', 42, 30, 4);

INSERT INTO Running VALUES (8, 'Adult', 2, 100, 5);