/*Challenge: Book list database

Step 1
Create a table to store a list of books. It should have columns for id, name, and rating. 
Add three of your favorite books into the table.
Answer */

CREATE TABLE book_list (id INTEGER PRIMARY KEY, name TEXT, rating INTEGER);

INSERT INTO book_list VALUES (1, 'practice_sql', 9);
INSERT INTO book_list VALUES (2, 'python_for_dummies', 9);
INSERT INTO book_list VALUES (3, 'python_fundamentals', 7);
