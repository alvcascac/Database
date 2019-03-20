USE assignment2;

-- BASICS --

-- Select all competitors.
SELECT * FROM Competitor;

-- Select all dni participation.
SELECT dni FROM participation;

-- TUPLES --

-- Select all companies who sponsors a running whith a childish route.
SELECT DISTINCT C.name
FROM Company C, Sponsor S, Running R, Route T
WHERE C.NIF = S.NIF and S.id_running = R.id_running and R.id_running = T.id_running and T.category = 'Childish';

-- Select all competitors who run.
SELECT DISTINCT C.name
FROM Competitor C, Participation P
WHERE C.dni = P.dni;

-- Select participators who run in 'UT4M' or 'NY Marathon'.
SELECT DISTINCT C.name
FROM Competitor C, Participation P, Running R
WHERE C.dni = P.dni and P.id_running = R.id_running and (R.name = 'UT4M' or R.name = 'NY Marathon');

-- ORDER BY, HAVING, GROUP BY --

-- Select all participation ordered by time.
SELECT * FROM Participation
ORDER BY time;

-- Select categories which have more than 2 routes
SELECT category, COUNT(category) as numberRoutes
FROM route
group by category
HAVING COUNT(category) >2;

-- SUM & COUNT -- 

-- Select dni with the total amount of time spent in the runs.
SELECT participation.dni , SUM(time) 
FROM participation
group by participation.dni;

-- Select Johnny Depp's total amount of time spent in the runs.
SELECT  Competitor.name, SUM(participation.time) as totalTime
FROM Participation
INNER JOIN Competitor 
ON Competitor.dni=Participation.dni
WHERE competitor.name='Johnny Depp';

-- Count sponsors for each running
SELECT R.name, COUNT(count.NIF) as nb
FROM Running R, 
(SELECT R.id_running, S.NIF
FROM Running R, Sponsor S
WHERE R.id_running = S.id_running) count
WHERE R.id_running = count.id_running
GROUP BY count.id_running;

-- VIEW --

-- Create a view of all competitors coming from USA
CREATE OR REPLACE VIEW People_USA AS
SELECT name, nationality
FROM Competitor
WHERE nationality = 'USA';

-- Display the view
SELECT * FROM People_USA;

-- IN --

-- Select 'NY Marathon', 'GW of China Marathon' and 'UT4M' runnings.
SELECT * FROM running
WHERE name IN ('NY Marathon', 'GW of China Marathon', 'UT4M');

-- EXIST --

-- Select competitors who run in a juvenil route.
SELECT name
FROM Competitor
WHERE EXISTS (SELECT category FROM participation 
WHERE dni = Competitor.dni AND category = 'juvenil');

-- LIKE -- 

-- Select competitor's name starting with lu.
SELECT *
FROM Competitor
WHERE competitor.name LIKE 'lu%';

-- UNION --

-- Select participators who run in 'GW of China Marathon' or are Norwegian.
SELECT DISTINCT C.name
FROM Competitor C, Participation P, Running R
WHERE C.dni = P.dni and P.id_running = R.id_running and R.name = 'GW of China Marathon'
UNION
SELECT DISTINCT C.name
FROM Competitor C
WHERE C.nationality= 'Norwegian';

-- JOIN --

-- Select participators who run in 'UT4M' and 'NY Marathon'.
SELECT * FROM
( SELECT DISTINCT C.name
FROM Competitor C, Participation P, Running R
WHERE C.dni = P.dni and P.id_running = R.id_running and R.name = 'UT4M') query1
INNER JOIN 
( SELECT DISTINCT C.name
FROM Competitor C, Participation P, Running R
WHERE C.dni = P.dni and P.id_running = R.id_running and R.name = 'NY Marathon') query2
USING (name);

-- Select the Johnny Depp participation's infos on each run.
SELECT  Competitor.name, Participation.position, Participation.time, Participation.category
FROM Participation
INNER JOIN Competitor 
ON Competitor.dni=Participation.dni
WHERE competitor.name='Johnny Depp';




-- ASSIGNMENT 3 --

-- Select participators and there time for a specific running
CREATE PROCEDURE getTimes (IN runningName CHAR(50))
SELECT C.name, P.time
FROM Competitor C, Participation P, Running R
WHERE C.dni = P.dni and P.id_running = R.id_running and R.name = runningName
ORDER BY P.time;

CALL getTimes('NY Marathon');


-- Select all particpators in a category for a specific running
CREATE PROCEDURE getParticipators(IN category CHAR(30), IN running CHAR(50))
SELECT DISTINCT C.name
FROM Competitor C, Participation P, Running R
WHERE C.dni = P.dni and P.category = category and P.id_running = R.id_running and R.name = running;

CALL getParticipators('juvenil','St-Sylvester');

-- Transaction

-- A competitor add a participation to a given running

START TRANSACTION;
INSERT INTO Participation VALUES (4, '77777777A', null, null, 'senior');
UPDATE Running SET remainingParticipations = remainingParticipations - 1 WHERE id_running = 4;
COMMIT;