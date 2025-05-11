
DROP TABLE IF EXISTS movies.genre;

DROP TABLE IF EXISTS movies.genre;

CREATE TABLE movies.genre (
  id INT NOT NULL AUTO_INCREMENT,
  genre_name VARCHAR(100) DEFAULT NULL,
  CONSTRAINT pk_genre PRIMARY KEY (id)
);

INSERT INTO movies.genre (id, genre_name) VALUES
(12,'Adventure'),
(14,'Fantasy'),
(16,'Animation'),
(18,'Drama'),
(27,'Horror'),
(28,'Action'),
(35,'Comedy'),
(36,'History'),
(37,'Western'),
(53,'Thriller'),
(80,'Crime'),
(99,'Documentary'),
(878,'Science Fiction'),
(9648,'Mystery'),
(10402,'Music'),
(10749,'Romance'),
(10751,'Family'),
(10752,'War'),
(10769,'Foreign'),
(10770,'TV Movie');
