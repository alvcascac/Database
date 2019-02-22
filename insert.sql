SET SQL_SAFE_UPDATES=0;
USE assignment2;

-- DROPS --

DELETE FROM Participation;
DELETE FROM Sponsor;
DELETE FROM Company;
DELETE FROM Route;
DELETE FROM Competitor;
DELETE FROM Running;

-- Companies --

INSERT INTO Company VALUES ('C11111111', 'RedBull', '+1 535 535 5335', 'redbull@xtrem.com');
INSERT INTO Company VALUES ('C22222222', 'Cruzcampo', '+34 18 62 82 80', 'cruzcampo@customer.es');
INSERT INTO Company VALUES ('C33333333', 'Billabong', '+1 888 258 5712', 'billabong@shop.com');
INSERT INTO Company VALUES ('C44444444', 'Quicksilver', '+33 1 82 52 25 28', 'quicksilver@shop.com');

-- Competitor --

INSERT INTO Competitor VALUES ('11111111A', 'Lucas Bergeron', '+33 6 47 64 06 77', 'l.bergeron@stud.uis.no', 'Grenoble', 'French', 'male', '1997/11/26');
INSERT INTO Competitor VALUES ('22222222A', 'Alvaro Castro', '+34 78 11 81 15', 'a.castro@stud.uis.no', 'South Spain', 'Spanish', 'male', '2001/06/28');
INSERT INTO Competitor VALUES ('33333333A', 'Johnny Depp', '+1 000 000 0000', 'jonny.dep@fake.com', 'Kentucky', 'USA', 'male', '1995/12/03');
INSERT INTO Competitor VALUES ('44444444A', 'Chuck Norris', '+1 123 123 8578', 'chuck.norris@fake.com', 'Texas', 'USA', 'male', '1990/04/10');
INSERT INTO Competitor VALUES ('55555555A', 'Lukas Kurt', '+47 58 05 05 28', 'l.kurt@stud.uis.no', 'Stavanger', 'Norwegian', 'male', '2004/01/04');
INSERT INTO Competitor VALUES ('66666666A', 'Cong Tien', '+33 01 48 96 35', 'c.tien@stud.uis.no', 'Stavanger', 'Norwegian', 'male', '2005/10/24');

-- Runnings --

INSERT INTO Running VALUES (1, 'St-Sylvester', '2019/12/31', 'mixed', 'Spain');
INSERT INTO Running VALUES (2, 'NY Marathon', '2019/11/03', 'mixed', 'New York');
INSERT INTO Running VALUES (3, 'GW of China Marathon', '2019/04/15', 'mixed', 'China');
INSERT INTO Running VALUES (4, 'UT4M', '2020/06/20', 'mixed', 'Grenoble');
INSERT INTO Running VALUES (5, 'WCC Slalom Men', '2020/02/11', 'male', 'Austria');

-- Routes --

INSERT INTO Route VALUES (1, 'Childish', 3, 10, 1);
INSERT INTO Route VALUES (2, 'Juvenil', 42, 20, 1);

INSERT INTO Route VALUES (3, 'Senior', 42, 50, 2);

INSERT INTO Route VALUES (4, 'Senior', 42, 6500, 3);

INSERT INTO Route VALUES (5, 'Juvenil', 21, 20, 4);
INSERT INTO Route VALUES (6, 'Senior', 42, 50, 4);
INSERT INTO Route VALUES (7, 'Senior', 42, 30, 4);

INSERT INTO Route VALUES (8, 'Juvenil', 2, 100, 5);

-- Participations --    

INSERT INTO Participation VALUES (4, '11111111A', 3, '01:10:11', 'senior');

INSERT INTO Participation VALUES (1, '22222222A', 2, '00:10:11', 'juvenil');

INSERT INTO Participation VALUES (2, '33333333A', 15, '02:10:11', 'senior');
INSERT INTO Participation VALUES (3, '33333333A', 5, '00:50:11', 'senior');

INSERT INTO Participation VALUES (1, '44444444A', 1, '00:00:01', 'senior');
INSERT INTO Participation VALUES (2, '44444444A', 1, '00:00:01', 'senior');
INSERT INTO Participation VALUES (3, '44444444A', 1, '00:00:01', 'senior');
INSERT INTO Participation VALUES (4, '44444444A', 1, '00:00:01', 'senior');
INSERT INTO Participation VALUES (5, '44444444A', 1, '00:00:01', 'senior');

INSERT INTO Participation VALUES (5, '66666666A', 6, '01:30:20', 'Childish');

-- Sponsor --

INSERT INTO Sponsor VALUES ('C11111111', 2, 'This is going to be a good race');
INSERT INTO Sponsor VALUES ('C11111111', 3, 'We are here to support in all the materials'); 
INSERT INTO Sponsor VALUES ('C22222222', 1, 'we love runners'); 
INSERT INTO Sponsor VALUES ('C22222222', 4, 'I am a runner too'); 
INSERT INTO Sponsor VALUES ('C33333333', 2, 'You can do it'); 
INSERT INTO Sponsor VALUES ('C33333333', 4, 'Just, DO IT!'); 
INSERT INTO Sponsor VALUES ('C44444444', 2, 'We know Chuck Norris is going to win but anyways'); 
INSERT INTO Sponsor VALUES ('C44444444', 5, 'Join us and have fun');