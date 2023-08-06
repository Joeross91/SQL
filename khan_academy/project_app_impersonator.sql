/*Think about your favorite apps, and pick one that stores your data- like a game 
that stores scores, an app that lets you post updates, etc. 
Now in this project, you're going to imagine that the app stores your data 
in a SQL database (which is pretty likely!), and write SQL statements 
that might look like their own SQL.

CREATE a table to store the data.
INSERT a few example rows in the table.
Use an UPDATE to emulate what happens when you edit data in the app.
Use a DELETE to emulate what happens when you delete data in the app.*/

CREATE TABLE lego_store (
      id INTEGER PRIMARY KEY
    , name TEXT
    , price INTEGER
    , piece_count INTEGER
)
;

INSERT INTO lego_store VALUES (1,"World Map", 250, 11695);

INSERT INTO lego_store VALUES (2,"Eiffel Tower", 630, 10001);

INSERT INTO lego_store VALUES (3,"Titanic", 680, 9090);

INSERT INTO lego_store VALUES (4,"Colosseum", 550, 9036);

INSERT INTO lego_store VALUES (5,"Millenium Falcon", 850, 7541);

INSERT INTO lego_store VALUES (6,"AT-AT", 850, 6785);

INSERT INTO lego_store VALUES (7,"Razor Crest", 600, 6187);

INSERT INTO lego_store VALUES (8,"Rivendell", 500, 6167);

INSERT INTO lego_store VALUES (9,"City Markets", 360, 6163);

INSERT INTO lego_store VALUES (10,"Hogwarts Castle", 470, 6020);

INSERT INTO lego_store VALUES (11,"Taj Mahal", 370, 5923);

SELECT
    *
FROM
    lego_store
;

UPDATE 
    lego_store
SET price = 400 
WHERE
    id = 10
;

SELECT
    *
FROM
    lego_store
;

DELETE 
FROM 
    lego_store 
WHERE 
    id = 11
;

SELECT
    *
FROM
    lego_store
;

