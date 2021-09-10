-- Creating Database and Tables 

CREATE DATABASE book_shop;
USE book_shop;



CREATE TABLE books 
    (
        book_id INT NOT NULL AUTO_INCREMENT,
        title VARCHAR(100),
        author_fname VARCHAR(100),
        author_lname VARCHAR(100),
        released_year INT,
        stock_quantity INT,
        pages INT,
        PRIMARY KEY(book_id)
    );



INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
  VALUES ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
  ('Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304),
  ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
  ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
  ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
  ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
  ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
  ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
  ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
  ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
  ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
  ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
  ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
  ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
  ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
  ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
  
-- CRUD

SELECT * FROM books;



SELECT book_id FROM books;



SELECT CONCAT (author_fname, ' ',author_lname) AS full_name FROM books;



SELECT  DISTINCT CONCAT (author_fname, ' ',author_lname) AS full_name FROM books;



UPDATE author_fname SET pages = 292 WHERE title = 'The Namesake';



DELETE FROM books WHERE author_fname  = 'Neil';



SELECT  DISTINCT CONCAT (author_fname, ' ',author_lname) AS full_name FROM books;

--String functions

SELECT REPLACE(title, ' ', '->') AS title FROM books; 



SELECT author_lname AS forwards,REVERSE(author_lname) AS backwards 
FROM books;



SELECT CONCAT(title, ' was released in ', released_year) AS blurb
FROM books;



SELECT title,CHAR_LENGTH(title) AS 'character count'
FROM books;



SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',CONCAT(author_lname, ',', author_fname) AS author,CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;

--Deeper selection

SELECT title FROM books WHERE title LIKE '%stories%';



SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;



SELECT CONCAT(title, ' - ', released_year) AS summary 
FROM books ORDER BY released_year DESC LIMIT 3;



SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';



SELECT title, released_year, stock_quantity 
FROM books ORDER BY stock_quantity LIMIT 3;



SELECT title, author_lname 
FROM books ORDER BY author_lname, title;



SELECT title, author_lname 
FROM books ORDER BY 2,1;



SELECT CONCAT('MY FAVORITE AUTHOR IS ', UPPER(author_fname),' ', UPPER(author_lname),'!') AS yell
FROM books ORDER BY author_lname;

-- Aggregate Functions

SELECT COUNT(*) FROM books;



SELECT released_year, COUNT(*) FROM books GROUP BY released_year;



SELECT Sum(stock_quantity) FROM books;



SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_lname, author_fname;



SELECT CONCAT(author_fname, ' ', author_lname) FROM books
ORDER BY pages DESC LIMIT 1;



SELECT pages, CONCAT(author_fname, ' ', author_lname) FROM books
ORDER BY pages DESC;



SELECT released_year AS year, COUNT(*) AS '# of books',AVG(pages) AS 'avg pages'
FROM books GROUP BY released_year;

-- Logical Operators

SELECT title, released_year FROM books WHERE released_year > 1980;



SELECT title, author_lname FROM books WHERE author_lname IN ('Eggers','Chabon');



SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;



SELECT title, pages FROM books WHERE pages BETWEEN 100 AND 200;



SELECT title,author_lname 
FROM books 
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';



SELECT title,author_lname,
  CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids' OR
      title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
    ELSE 'Novel'
  END AS TYPE
FROM books;



SELECT author_fname,author_lname,
  CASE
    WHEN COUNT(*) = 1 THEN '1 book'
    ELSE CONCAT(COUNT(*), ' books')
  END AS COUNT
FROM books
GROUP BY author_lname,author_fname;

