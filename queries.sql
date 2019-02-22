USE assignment2;

-- Select all companies who sponsors a running whith a children route.

-- basic --
SELECT * FROM Competitor;

SELECT dni FROM participation;

-- tuples --
SELECT DISTINCT C.name
FROM Company C, Sponsors S, Running R, Route T
WHERE C.NIF = S.NIF and S.id_running = R.id_running and R.id_running = T.id_running and T.category = 'Childish';

SELECT DISTINCT C.name
FROM Competitor C, Participation P
WHERE C.name = P.name;

-- order by, having, group by --
SELECT * FROM Participation
ORDER BY time;

SELECT category, COUNT(category) as numberRoutes
FROM route
group by category
HAVING COUNT(category) >2;

-- SUM -- 
SELECT participation.dni , SUM(time) 
FROM participation
group by participation.dni;

SELECT  Competitor.name, SUM(participation.time) as totalTime
FROM Participation
INNER JOIN Competitor 
ON Competitor.dni=Participation.dni
WHERE competitor.name='Johnny Depp';

-- VIEW --
CREATE OR REPLACE VIEW People_USA AS
SELECT name, nationality
FROM Competitor
WHERE nationality = 'USA';

SELECT * FROM People_USA;

-- IN --
SELECT * FROM running
WHERE name IN ('NY Marathon', 'GW of China Marathon', 'UT4M');

-- EXIST --
SELECT name
FROM Competitor
WHERE EXISTS (SELECT category FROM participation 
WHERE dni = Competitor.dni AND category = 'juvenil');

-- LIKE -- 
SELECT *
FROM Competitor
WHERE competitor.name LIKE 'lu%';

-- JOIN --

SELECT  Competitor.name, Participation.position, Participation.time, Participation.category
FROM Participation
INNER JOIN Competitor 
ON Competitor.dni=Participation.dni
WHERE competitor.name='Johnny Depp';

SELECT Competitor.name
FROM Participation, Running
INNER JOIN Competitor
ON Participation.dni = Competitor.dni
WHERE running.name='UT4M' and running.name='NY Marathon';