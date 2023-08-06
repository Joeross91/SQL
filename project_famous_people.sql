/**In this project, you’re going to make your own table with some small 
set of “famous people”, then make more tables about things they do and join 
those to create nice human readable lists. Contains at least two tables with at 
least 15 rows total. One of the tables contains a column that relates to the primary key of another table.
Has at least one query that does a JOIN.*/

CREATE TABLE billionares (
      id INTEGER PRIMARY KEY AUTOINCREMENT
    , full_name TEXT
    , age INTEGER
    , nationality TEXT
  )
;
INSERT INTO billionares (full_name, age, nationality) VALUES ("Bernard Arnault", 74, "France");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Elon Musk", 51, "US");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Jeff Bezos", 59, "US");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Larry Ellison", 78, "US");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Warren Buffet", 92, "US");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Bill Gates", 67, "US");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Michael Bloomberg", 81, "US");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Carlos Slim Helu", 83, "Mexico");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Mukesh Ambani", 65, "India");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Steve Ballmer", 67, "US");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Francoise Bettencort Meyers", 69, "France");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Larry Page", 50, "US");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Amancio Ortega", 87, "Spain");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Sergey Brin", 49, "US");

INSERT INTO billionares (full_name, age, nationality) VALUES ("Zhong Shanshan", 68, "China");


CREATE table wealth (
      id INTEGER PRIMARY KEY AUTOINCREMENT
    , billionare_id INTEGER
    , net_worth TEXT
    , source_wealth TEXT
  )
;
    
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (1, "211 billion", "LVMH");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (2, "180 billion", "Tesla_SpaceX");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (3, "114 billion", "Amazon");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (4, "107 billion", "Oracle");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (5, "106 billion", "Berkshire Hathaway");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (6, "104 billion", "Microsoft");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (7, "95 billion", "Bloomberg LP");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (8, "93 billion", "Telecom");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (9, "83 billion", "Diversified");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (10, "81 billion", "Microsoft");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (11, "80 billion", "Loreal");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (12, "79 billion", "Google");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (13, "77 billion", "Zara");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (14, "76 billion", "Google");

INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (15, "68 billion", "Beverages");


/*Return total net worth for each billionare*/

SELECT
      billionares.full_name
    , wealth.net_worth
FROM
    billionares
JOIN wealth
  ON billionares.id = wealth.billionare_id
;
