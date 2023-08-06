/*We’ve curated a set of interesting data sets for you: Top movies, Top countries by population, 
Solar system objects by size, Marvel characters, Furniture store sales, Earned KA badges, 
Winston's donut logs, Card game results, and NFL draft picks. 

Pick one of those data sets or create a data set like that, and use advanced SELECT queries to 
discover things about the data. What sort of questions might one have about that data, like if 
they were using it for an app or a business idea? Here are some ideas:

What are average, max, and min values in the data?
What about those numbers per category in the data (using HAVING)?
What ways are there to group the data values that don’t exist yet (using CASE)?
What interesting ways are there to filter the data (using AND/OR)? */

/* Marvel Heroes and Villains
 Based on the website http://marvel.wikia.com/Main_Page
 with popularity data from http://observationdeck.io9.com/something-i-found-marvel-character-popularity-poll-cb-1568108064 
 and power grid data from http://marvel.wikia.com/Power_Grid#Power
 Collected by: https://www.khanacademy.org/profile/Mentrasto/
 */

CREATE TABLE marvels (
      ID INTEGER PRIMARY KEY
    , name TEXT
    , popularity INTEGER
    , alignment TEXT
    , gender TEXT
    , height_m NUMERIC
    , weight_kg NUMERIC
    , hometown TEXT
    , intelligence INTEGER
    , strength INTEGER
    , speed INTEGER
    , durability INTEGER
    , energy_Projection INTEGER
    , fighting_Skills INTEGER
  )
;
    
INSERT INTO marvels VALUES(1, "Spider Man", 1, "Good", "Male", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4); 

INSERT INTO marvels VALUES(2, "Iron Man", 20, "Neutral", "Male", 1.98, 102.58, "USA", 6, 6, 5, 6, 6, 4);

INSERT INTO marvels VALUES(3, "Hulk", 18, "Neutral", "Male", 2.44, 635.29, "USA", 1, 7, 3, 7, 5, 4); 

INSERT INTO marvels VALUES(4, "Wolverine", 3, "Good", "Male", 1.6, 88.46, "Canada", 2, 4, 2, 4, 1, 7);

INSERT INTO marvels VALUES(5, "Thor", 5, "Good", "Male", 1.98, 290.3, "Asgard", 2, 7, 7, 6, 6, 4);

INSERT INTO marvels VALUES(6, "Green Goblin", 91, "Bad", "Male", 1.93, 174.63, "USA", 4, 4, 3, 4, 3, 3);

INSERT INTO marvels VALUES(7, "Magneto", 11, "Neutral", "Male", 1.88, 86.18, "Germany", 6, 3, 5, 4, 6, 4);

INSERT INTO marvels VALUES(8, "Thanos", 47, "Bad", "Male", 2.01, 446.79, "Titan", 6, 7, 7, 6, 6, 4);

INSERT INTO marvels VALUES(9, "Loki", 32, "Bad", "Male", 1.93, 238.14, "Jotunheim", 5, 5, 7, 6, 6, 3);

INSERT INTO marvels VALUES(10, "Doctor Doom", 19, "Bad", "Male", 2.01, 188.24, "Latveria", 6, 4, 5, 6, 6, 4);

INSERT INTO marvels VALUES(11, "Jean Grey", 8, "Good", "Female", 1.68, 52.16, "USA", 3, 2, 7, 7, 7, 4);

INSERT INTO marvels VALUES(12, "Rogue", 4, "Good", "Female", 1.73, 54.43, "USA", 7, 7, 7, 7, 7, 7);

INSERT INTO marvels VALUES(13, "Storm", 2, "Good", "Female", 1.80, 66, "Kenya", 2, 2, 3, 2, 5, 4);

INSERT INTO marvels VALUES(14, "Nightcrawler", 6, "Good", "Male", 1.75, 73, "Germany", 3, 2, 7, 2, 1, 3);

INSERT INTO marvels VALUES(15, "Gambit", 7, "Good", "Male", 1.88, 81, "EUA", 2, 2, 2, 2, 2, 4);

INSERT INTO marvels VALUES(16, "Captain America", 9, "Good", "Male", 1.88, 108, "EUA", 3, 3, 2, 3, 1, 6);

INSERT INTO marvels VALUES(17, "Cyclops", 10, "Good", "Male", 1.90, 88, "EUA", 3, 2, 2, 2, 5, 4);

INSERT INTO marvels VALUES(18, "Emma Frost", 12, "Neutral", "Female", 1.78, 65, "EUA", 4, 4, 2, 5, 5, 3);

INSERT INTO marvels VALUES(19, "Kitty Pryde", 13, "Good", "Female", 1.68, 50, "EUA", 4, 2, 2, 3, 1, 5);

INSERT INTO marvels VALUES(20, "Daredevil", 14, "Good", "Male", 1.83, 91, "EUA", 3, 3, 2, 2, 4, 5);

INSERT INTO marvels VALUES(21, "Punisher", 50, "Neutral", "Male", 1.85, 91, "EUA", 3, 3, 2, 2, 1, 6);

INSERT INTO marvels VALUES(22, "Silver Surfer", 33, "Good", "Male", 1.93, 102, "Zenn-La", 3, 7, 7, 6, 7, 2);

INSERT INTO marvels VALUES(23, "Ghost Rider", 86, "Good", "Male", 1.88, 99, "EUA", 2, 4, 3, 5, 4, 2);

INSERT INTO marvels VALUES(24, "Venom", 78, "Neutral", "Male", 1.90, 118, "EUA", 3, 4, 2, 6, 1, 4);

INSERT INTO marvels VALUES(25, "Juggernaut", 76, "Neutral", "Male", 2.87, 862, "EUA", 2, 7, 2, 7, 1, 4);

INSERT INTO marvels VALUES(26, "Professor X", 58, "Good", "Male", 1.83, 86, "EUA", 5, 2, 2, 2, 5, 3);


/*Initial look at the data.*/

SELECT
    *
FROM
    marvels
;
    
/*Shows shortest Marvel character in the table.*/

SELECT
      name
    , MIN(height_m) AS shortest_marvel_character
FROM
    marvels
;

/*Shows tallest Marvel character in the table.*/

SELECT
      name
    , MAX(height_m) AS tallest_marvel_character
FROM
    marvels
; 

/*Shows average weight of the Marvel characters in the table.*/

SELECT
     ROUND(AVG(weight_kg)) AS avg_weight
FROM
    marvels
; 

/*Finding the name and popularity of the Marvel characters with a popularity greater than 10 
and then ordering by popularity giving the top 10 most popular Marvel characters.*/

SELECT
      name
    , popularity
FROM
    marvels
WHERE 
    popularity > 10
ORDER BY
    popularity desc
LIMIT 10
;    
    
/*Using a CASE statement: Add a new column for Marvel characters with an intelligence greater than 3 (call them smart),
and less than 5 (call them dumb) otherwise average.*/
    
SELECT
      name
    , alignment
    , CASE
        WHEN intelligence >= 5 THEN 'Smart'
        WHEN intelligence <= 3 THEN 'Dumb'
        ELSE 'Average'
        END AS 'intelligence_rank'
FROM
    marvels
ORDER BY
       intelligence_rank DESC

;
  
/* HAVING CLAUSE: Shows which Marvel characters that would have to shop at the big and tall store.*/

SELECT
       name
     , weight_kg
     , height_m
FROM
    marvels
GROUP BY
    weight_kg
HAVING
    weight_kg > 100 AND height_m >1.85
ORDER BY
    weight_kg desc
    
    
    
