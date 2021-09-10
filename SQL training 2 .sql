-- Creating Database and Tables 

CREATE DATABASE university_store;
USE university_store;



CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);



CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE
);



INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');



INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

-- JOINS

SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders ON customers.id = orders.customer_id;



SELECT *
FROM orders
JOIN customers ON customers.id = orders.customer_id;



SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders ON customers.id = orders.customer_id
ORDER BY order_date;



SELECT first_name,last_name,UM(amount) AS total_spent
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;



SELECT * FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;



SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id; 



SELECT first_name,last_name,IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;



SELECT IFNULL(first_name,'MISSING') AS first,IFNULL(last_name,'USER') as last,order_date,amount,SUM(amount)
FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;



SELECT * FROM orders
RIGHT JOIN customers ON customers.id = orders.customer_id;   



CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);



CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) 
        REFERENCES students(id)
        ON DELETE CASCADE
);



INSERT INTO students (first_name)
 VALUES ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');



INSERT INTO papers (student_id, title, grade )
 VALUES (1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);



SELECT first_name, title, grade
FROM students
INNER JOIN papers ON students.id = papers.student_id
ORDER BY grade DESC;



SELECT first_name,IFNULL(title, 'MISSING'),IFNULL(grade, 0)
FROM students
LEFT JOIN papers ON students.id = papers.student_id;



SELECT first_name,IFNULL(Avg(grade), 0) AS average, 
    CASE 
      WHEN Avg(grade) IS NULL THEN 'FAILING' 
      WHEN Avg(grade) >= 75 THEN 'PASSING' 
      ELSE 'FAILING' 
    end AS passing_status 
FROM students 
LEFT JOIN papers ON students.id = papers.student_id 
GROUP  BY students.id 
ORDER  BY average DESC;





