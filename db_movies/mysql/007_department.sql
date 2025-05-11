DROP TABLE IF EXISTS movies.department;

CREATE TABLE movies.department (
  id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(200) DEFAULT NULL,
  CONSTRAINT pk_department PRIMARY KEY (id)
);



INSERT INTO movies.department (id, department_name) VALUES
(1,'Camera'),
(2,'Directing'),
(3,'Production'),
(4,'Writing'),
(5,'Editing'),
(6,'Sound'),
(7,'Art'),
(8,'Costume & Make-Up'),
(9,'Crew'),
(10,'Visual Effects'),
(11,'Lighting'),
(12,'Actors');

COMMIT;