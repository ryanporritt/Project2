CREATE TABLE combined_ratings AS
SELECT rottentomatoes.id, rottentomatoes.film, rottentomatoes.year, rottentomatoes.rotten_tomatoes_ratings, imdb.imdb_ratings
FROM rottentomatoes
JOIN imdb
On rottentomatoes.film = imdb.film;

ALTER TABLE combined_ratings
ADD average_rating float;

SELECT *--avg(rotten_tomatoes_ratings + imdb_ratings)
FROM combined_ratings

update combined_ratings
set average_rating =  (rotten_tomatoes_ratings + imdb_ratings)/2;

SELECT * FROM combined_ratings;