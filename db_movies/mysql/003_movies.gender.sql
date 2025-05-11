

DROP TABLE IF EXISTS movies.gender;

CREATE TABLE movies.gender (
  id INT NOT NULL,-- AUTO_INCREMENT,
  gender VARCHAR(20) DEFAULT NULL,
  CONSTRAINT pk_gender PRIMARY KEY (id)
);

INSERT INTO movies.gender (id, gender) VALUES
(0,'Unspecified'),
(1, 'Female'),
(2, 'Male');