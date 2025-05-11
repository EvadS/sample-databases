
DROP TABLE IF EXISTS movies.language_role;

CREATE TABLE movies.language_role (
  id INT NOT NULL AUTO_INCREMENT,
  language_role VARCHAR(20) DEFAULT NULL,
  CONSTRAINT pk_langrole PRIMARY KEY (id)
);

INSERT INTO movies.language_role (id, language_role) VALUES
(1, 'Original'),
(2, 'Spoken');

-- ------------------------------------------------------
