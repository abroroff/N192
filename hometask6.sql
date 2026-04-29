CREATE TABLE author (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);



INSERT INTO author (name) VALUES
('Alisher Navoiy'),
('George Orwell'),
('William Shakespeare'),
('J.R.R. Tolkien'),
('J.K. Rowling'),
('Dan Brown'),
('Arthur Conan Doyle'),
('Robert Martin'),
('Steve McConnell'),
('Cal Newport');



CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    author_id INT,
    quantity INT,
    FOREIGN KEY (author_id) REFERENCES author(id)
);



INSERT INTO books (title, genre, author_id, quantity) VALUES
('Xamsa', 'Poetry', 1, 12),
('Lison ut-Tayr', 'Poetry', 1, 8),
('Farhod va Shirin', 'Romance', 1, 6),
('Mahbub ul-Qulub', 'Philosophy', 1, 5),
('1984', 'Dystopian', 2, 15),
('Animal Farm', 'Satire', 2, 10),
('Hamlet', 'Drama', 3, 20),
('Othello', 'Drama', 3, 14),
('Romeo and Juliet', 'Romance', 3, 18),
('The Hobbit', 'Fantasy', 4, 25),
('LOTR', 'Fantasy', 4, 30),
('Harry Potter 1', 'Fantasy', 5, 40),
('Harry Potter 2', 'Fantasy', 5, 35),
('Inferno', 'Thriller', 6, 17),
('Da Vinci Code', 'Thriller', 6, 22),
('Sherlock Holmes', 'Detective', 7, 28),
('The Sign of Four', 'Detective', 7, 24),
('Clean Code', 'Programming', 8, 11),
('Code Complete', 'Programming', 9, 9),
('Deep Work', 'Self-help', 10, 13);



select * from author;
+----+---------------------+
| id | name                |
+----+---------------------+
|  1 | Alisher Navoiy      |
|  2 | George Orwell       |
|  3 | William Shakespeare |
|  4 | J.R.R. Tolkien      |
|  5 | J.K. Rowling        |
|  6 | Dan Brown           |
|  7 | Arthur Conan Doyle  |
|  8 | Robert Martin       |
|  9 | Steve McConnell     |
| 10 | Cal Newport         |
+----+---------------------+



select * from books;
+----+------------------+-------------+-----------+----------+
| id | title            | genre       | author_id | quantity |
+----+------------------+-------------+-----------+----------+
|  1 | Xamsa            | Poetry      |         1 |       12 |
|  2 | Lison ut-Tayr    | Poetry      |         1 |        8 |
|  3 | Farhod va Shirin | Romance     |         1 |        6 |
|  4 | Mahbub ul-Qulub  | Philosophy  |         1 |        5 |
|  5 | 1984             | Dystopian   |         2 |       15 |
|  6 | Animal Farm      | Satire      |         2 |       10 |
|  7 | Hamlet           | Drama       |         3 |       20 |
|  8 | Othello          | Drama       |         3 |       14 |
|  9 | Romeo and Juliet | Romance     |         3 |       18 |
| 10 | The Hobbit       | Fantasy     |         4 |       25 |
| 11 | LOTR             | Fantasy     |         4 |       30 |
| 12 | Harry Potter 1   | Fantasy     |         5 |       40 |
| 13 | Harry Potter 2   | Fantasy     |         5 |       35 |
| 14 | Inferno          | Thriller    |         6 |       17 |
| 15 | Da Vinci Code    | Thriller    |         6 |       22 |
| 16 | Sherlock Holmes  | Detective   |         7 |       28 |
| 17 | The Sign of Four | Detective   |         7 |       24 |
| 18 | Clean Code       | Programming |         8 |       11 |
| 19 | Code Complete    | Programming |         9 |        9 |
| 20 | Deep Work        | Self-help   |        10 |       13 |
+----+------------------+-------------+-----------+----------+



select name, json_arrayagg(genre) from author as a
	inner join books as b
	on a.id = b.author_id
	group by a.id
	having a.name = "Alisher Navoiy";
+----------------+-----------------------------------------------+
| name           | json_arrayagg(genre)                          |
+----------------+-----------------------------------------------+
| Alisher Navoiy | ["Poetry", "Poetry", "Romance", "Philosophy"] |
+----------------+-----------------------------------------------+



select name, json_arrayagg(genre) from author as a
	inner join books as b
	on a.id = b.author_id
	group by a.id;
+---------------------+-----------------------------------------------+
| name                | json_arrayagg(genre)                          |
+---------------------+-----------------------------------------------+
| Alisher Navoiy      | ["Poetry", "Poetry", "Romance", "Philosophy"] |
| George Orwell       | ["Dystopian", "Satire"]                       |
| William Shakespeare | ["Drama", "Drama", "Romance"]                 |
| J.R.R. Tolkien      | ["Fantasy", "Fantasy"]                        |
| J.K. Rowling        | ["Fantasy", "Fantasy"]                        |
| Dan Brown           | ["Thriller", "Thriller"]                      |
| Arthur Conan Doyle  | ["Detective", "Detective"]                    |
| Robert Martin       | ["Programming"]                               |
| Steve McConnell     | ["Programming"]                               |
| Cal Newport         | ["Self-help"]                                 |
+---------------------+-----------------------------------------------+



SELECT a.name, b.genre, COUNT(*) AS soni
	FROM author a
	JOIN books b ON a.id = b.author_id
	GROUP BY a.name, b.genre;
+---------------------+-------------+------+
| name                | genre       | soni |
+---------------------+-------------+------+
| Alisher Navoiy      | Poetry      |    2 |
| Alisher Navoiy      | Romance     |    1 |
| Alisher Navoiy      | Philosophy  |    1 |
| George Orwell       | Dystopian   |    1 |
| George Orwell       | Satire      |    1 |
| William Shakespeare | Drama       |    2 |
| William Shakespeare | Romance     |    1 |
| J.R.R. Tolkien      | Fantasy     |    2 |
| J.K. Rowling        | Fantasy     |    2 |
| Dan Brown           | Thriller    |    2 |
| Arthur Conan Doyle  | Detective   |    2 |
| Robert Martin       | Programming |    1 |
| Steve McConnell     | Programming |    1 |
| Cal Newport         | Self-help   |    1 |
+---------------------+-------------+------+



SELECT genre, COUNT(*) AS soni
	FROM books
	GROUP BY genre
	ORDER BY soni DESC
	LIMIT 1;
+---------+------+
| genre   | soni |
+---------+------+
| Fantasy |    4 |
+---------+------+



SELECT a.name, b.genre, COUNT(*) AS soni
	FROM author a
	JOIN books b ON a.id = b.author_id
	GROUP BY a.name, b.genre;
+---------------------+-------------+------+
| name                | genre       | soni |
+---------------------+-------------+------+
| Alisher Navoiy      | Poetry      |    2 |
| Alisher Navoiy      | Romance     |    1 |
| Alisher Navoiy      | Philosophy  |    1 |
| George Orwell       | Dystopian   |    1 |
| George Orwell       | Satire      |    1 |
| William Shakespeare | Drama       |    2 |
| William Shakespeare | Romance     |    1 |
| J.R.R. Tolkien      | Fantasy     |    2 |
| J.K. Rowling        | Fantasy     |    2 |
| Dan Brown           | Thriller    |    2 |
| Arthur Conan Doyle  | Detective   |    2 |
| Robert Martin       | Programming |    1 |
| Steve McConnell     | Programming |    1 |
| Cal Newport         | Self-help   |    1 |
+---------------------+-------------+------+



SELECT a.name, SUM(b.quantity) AS jami
	FROM author a
	JOIN books b ON a.id = b.author_id
	GROUP BY a.name
	ORDER BY jami DESC
	LIMIT 1;
+--------------+------+
| name         | jami |
+--------------+------+
| J.K. Rowling |   75 |
+--------------+------+
