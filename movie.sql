--write a SQL query to list all movies released in 2010 and their ratings, in descending order by rating. For movies with the same rating, order them alphabetically by title.

SELECT movies.title, ratings.rating FROM movies JOIN ratings on movies.id = ratings.movie_id WHERE movies.year = '2010' ORDER BY ratings.rating DESC, movies.title ASC;

-- write a SQL query to list the names of all people who starred in Toy Story.

SELECT name FROM people JOIN stars ON stars.person_id = people.id JOIN movies ON stars.movie_id = movies.id WHERE movies.title = 'Toy Story';

--write a SQL query to list the names of all people who starred in a movie released in 2004, ordered by birth year.

SELECT distinct name FROM people JOIN stars ON stars.person_id = people.id JOIN movies ON stars.movie_id = movies.id JOIN ratings ON ratings.movie_id = movies.id WHERE movies.year = '2004' ORDER BY people.birth;

--write a SQL query to list the names of all people who have directed a movie that received a rating of at least 9.0.

SELECT name FROM people JOIN directors ON directors.person_id = people.id JOIN movies ON directors.movie_id = movies.id JOIN ratings ON ratings.movie_id = movies.id WHERE ratings.rating >= '9';

--write a SQL query to list the titles of the five highest rated movies (in order) that Chadwick Boseman starred in, starting with the highest rated.

SELECT movies.title FROM movies JOIN stars ON stars.movie_id = movies.id JOIN people ON stars.person_id = people.id JOIN ratings ON ratings.movie_id = movies.id
WHERE people.name = 'Chadwick Boseman' ORDER BY ratings.rating DESC LIMIT 5;

--write a SQL query to list the titles of all movies in which both Johnny Depp and Helena Bonham Carter starred.

SELECT title FROM movies JOIN stars ON stars.movie_id = movies.id JOIN people ON stars.person_id = people.id WHERE people.name = 'Johnny Depp'
AND title in (SELECT title FROM movies JOIN stars ON stars.movie_id = movies.id JOIN people ON stars.person_id = people.id WHERE people.name = 'Helena Bonham Carter');

--write a SQL query to list the names of all people who starred in a movie in which Kevin Bacon also starred.

SELECT name FROM people JOIN stars ON stars.person_id = people.id JOIN movies ON stars.movie_id = movies.id WHERE movies.id in
(SELECT movies.id FROM movies JOIN people ON stars.person_id = people.id JOIN stars ON stars.movie_id = movies.id WHERE people.name = 'Kevin Bacon'AND people.birth = '1958')
AND people.name != 'Kevin Bacon';
