SELECT person.name, movie.earnings_rank
FROM oscar
INNER JOIN person ON person.person_id=oscar.person_id
INNER JOIN movie ON movie.movie_id=oscar.movie_id
WHERE oscar.type='bestpicture' AND movie.earnings_rank=(SELECT MIN(earnings_rank) FROM movie)