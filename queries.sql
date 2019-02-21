USE assignment2;

-- Select all companies who sponsors a running whith a children route.

SELECT DISTINCT C.name
FROM Company C, Sponsors S, Running R, Route T
WHERE C.NIF = S.NIF and S.id_running = R.id_running and R.id_running = T.id_running and T.category = 'Children';