
DROP DATABASE IF EXISTS books_db;
CREATE DATABASE books_db;

USE books_db;

DROP TABLE IF EXISTS books_db.author;
CREATE TABLE author (
    id INT NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(400),
    CONSTRAINT pk_author PRIMARY KEY (id)
);

DROP TABLE IF EXISTS books_db.publisher;
CREATE TABLE publisher (
    id INT NOT NULL AUTO_INCREMENT,
    publisher_name VARCHAR(400),
    CONSTRAINT pk_publisher PRIMARY KEY (id)
);

DROP TABLE IF EXISTS books_db.book_language;
CREATE TABLE book_language (
    id INT NOT NULL AUTO_INCREMENT,
    language_code VARCHAR(8),
    language_name VARCHAR(50),
    CONSTRAINT pk_language PRIMARY KEY (id)
);

DROP TABLE IF EXISTS books_db.book;
CREATE TABLE book (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(400),
    isbn13 VARCHAR(13),
    language_id INT,
    num_pages INT,
    publication_date DATE,
    publisher_id INT,
    CONSTRAINT pk_book PRIMARY KEY (id),
    CONSTRAINT fk_book_lang FOREIGN KEY (language_id) REFERENCES book_language (id),
    CONSTRAINT fk_book_pub FOREIGN KEY (publisher_id) REFERENCES publisher (id)
);

DROP TABLE IF EXISTS books_db.book_author;
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    CONSTRAINT pk_bookauthor PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_ba_book FOREIGN KEY (book_id) REFERENCES book (id),
    CONSTRAINT fk_ba_author FOREIGN KEY (author_id) REFERENCES author (id)
);

