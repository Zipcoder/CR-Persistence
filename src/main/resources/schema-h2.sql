DROP TABLE IF EXISTS PERSON;

CREATE TABLE PERSON (
  ID INT NOT NULL AUTO_INCREMENT,
  FIRST_NAME VARCHAR2(255) NOT NULL DEFAULT '',
  LAST_NAME VARCHAR2(255) NOT NULL DEFAULT '',
  MOBILE VARCHAR2(20) NOT NULL DEFAULT '',
  BIRTHDAY DATE DEFAULT NULL,
  HOME_ID SMALLINT DEFAULT NULL,
  PRIMARY KEY (ID));

  ALTER TABLE PERSON
  ADD FOREIGN KEY (HOME_ID)
  REFERENCES HOME(ID);


DROP TABLE IF EXISTS HOME;

CREATE TABLE HOME (
  ID INT NOT NULL AUTO_INCREMENT,
  ADDRESS VARCHAR2(255) not null default '',
  HOMENUMBER varchar2(255) NOT NULL DEFAULT '',
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR2(100) NOT NULL UNIQUE,
  runtime SMALLINT NOT NULL,
  genre VARCHAR2(50),
  imdb_score NUMBER(10,1),
  rating VARCHAR2(10)
);

-- Tables for in-class example

DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
  id INT NOT NULL AUTO_INCREMENT,
  make VARCHAR2(50) NOT NULL DEFAULT '',
  model VARCHAR2(50) NOT NULL DEFAULT '',
  year VARCHAR2(5) NOT NULL DEFAULT '01907',
  PRIMARY KEY (id),
  CONSTRAINT unique_make_model_year UNIQUE (make, model, year)

);

DROP TABLE IF EXISTS auto_prices;

CREATE TABLE auto_prices (
  id INT PRIMARY KEY AUTO_INCREMENT,
  car_id INT REFERENCES cars(id),
  package VARCHAR2(15) NOT NULL,
  price NUMBER(10,2) NOT NULL CHECK(price > 0),
  CONSTRAINT unique_package_per_car UNIQUE (car_id, package)


);


DROP SEQUENCE hibernate_sequence;

CREATE SEQUENCE hibernate_sequence;


INSERT INTO movies (title, runtime, genre, imdb_score, rating) VALUES ('Howard the Duck', 110, 'Sci-Fi', 4.6, 'PG');
INSERT INTO movies (title, runtime, genre, imdb_score, rating) VALUES('Lavalantula', 83, 'Horror', 4.7, 'TV-14');
INSERT INTO movies (title, runtime, genre, imdb_score, rating) VALUES('Starship Troopers', 129, 'Sci-Fi', 7.2, 'PG-13');
INSERT INTO movies (title, runtime, genre, imdb_score, rating) VALUES('Waltz With Bashir', 90, 'Documentary', 8.0, 'R');
INSERT INTO movies (title, runtime, genre, imdb_score, rating) VALUES('Spaceballs', 96, 'Comedy', 7.1, 'PG');
INSERT INTO movies (title, runtime, genre, imdb_score, rating) VALUES('Monsters Inc.', 92, 'Animation', 8.1, 'G');
INSERT INTO movies (title, runtime, genre, imdb_score, rating) VALUES('2001: A Space Odyssey', 149, 'Sci-Fi', 8.3, 'G');
INSERT INTO movies (title, runtime, genre, imdb_score, rating) VALUES('Blade Runner 2049', 164, 'Sci-Fi', 8.2, 'R');
INSERT INTO movies (title, runtime, genre, imdb_score, rating) VALUES('Mad Max: Fury Road', 120, 'Action', 8.1, 'R');
INSERT INTO movies (title, runtime, genre, imdb_score, rating) VALUES('Titanic', 194, 'Romance', 7.8, 'PG-13');

INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('36 E. Bayberry Rd.Savannah, GA 31404', '565-6895');
INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('11 Essex Dr.Farmingdale, NY 11735', '454-4544');
INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('920 Arlington Street Clifton, NJ 07011', '985-4515');
INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('234 High Street, PA 19159 ', '267-3940');

INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID ) VALUES ('Carbral', 'Sheeri', '230-4233', '1970-02-23', 2);
INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID) VALUES ( 'Sharam', 'Raj', '186-5223', '1980-08-31', 3);
INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Durand', 'Noelle', '395-6161', '1960-07-06', 1);
INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Smith', 'Thomas', '395-6181', '1987-07-06', 1);
INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Smith', 'Jane', '393-6181', '1987-12-06', 3);
INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Brown', 'Doug', '466-6241', '1954-12-07', 3);

SELECT * FROM movies;

SELECT title FROM movies
WHERE genre = 'Sci-Fi';

SELECT title FROM movies
WHERE imdb_score >= 6.5;

SELECT title FROM movies
WHERE rating = 'G' OR rating = 'PG'
AND runtime < 100;

SELECT AVG(runtime) AS AverageRunTime
FROM movies
WHERE imdb_score < 7.5
GROUP BY genre;

UPDATE movies
SET rating = 'R'
WHERE title = 'Starship Troopers';

SELECT id, rating FROM movies
WHERE genre = 'Horror' OR genre = 'Documentary';

SELECT rating, AVG(imdb_score) as avgIMDB, MAX(imdb_score) as maxIMDB, MIN(imdb_score) as minIMDB
FROM movies
GROUP BY rating;

SELECT rating, AVG(imdb_score) as avgIMDB, MAX(imdb_score) as maxIMDB, MIN(imdb_score) as minIMDB
FROM movies
GROUP BY rating
HAVING COUNT(*) > 1;

DELETE FROM movies
WHERE rating = 'R';