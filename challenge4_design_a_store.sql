/*Create your own store! Your store should sell one type of things, like clothing or bikes, whatever you want
 store to specialize in. You should have a table for all the items in your store, and at least 5 columns 
 for the kind of data you think you'd need to store. You should sell at least 15 items, and use select 
 statements to order your items by price and show at least one statistic about the items.*/

CREATE TABLE lego_store (unique_id INTEGER PRIMARY KEY, name TEXT, price INTEGER, piece_count INTEGER, rating INTEGER, category TEXT);

INSERT INTO lego_store VALUES (1, "millenium_falcon", 800, 7541,10,"star_wars");
INSERT INTO lego_store VALUES (2, "captain_rex_helmet", 70, 854,8,"star_wars");
INSERT INTO lego_store VALUES (3, "disney_castle", 400, 4837,7,"disney");
INSERT INTO lego_store VALUES (4, "titanic", 680, 9090,10,"icons");
INSERT INTO lego_store VALUES (5, "lunar_research_base", 130, 786,6,"city");
INSERT INTO lego_store VALUES (6, "rocket_launch_center", 160, 1010,7,"city");
INSERT INTO lego_store VALUES (7, "hogwarts_castle", 470, 6020,9,"harry_potter");
INSERT INTO lego_store VALUES (8, "expecto_patronum", 70, 754,6,"harry_potter");
INSERT INTO lego_store VALUES (9, "at_at", 170, 1267,10,"star_wars");
INSERT INTO lego_store VALUES (10, "r2_d2", 240, 2314,10,"star_wars");
INSERT INTO lego_store VALUES (11, "friendship_tree_house", 80, 1114,7,"friends");
INSERT INTO lego_store VALUES (12, "beach_amusement_park", 120, 1348,7,"friends");
INSERT INTO lego_store VALUES (13, "sea_rescue_center", 50, 376,6,"friends");
INSERT INTO lego_store VALUES (14, "sanctum_sanctorum", 250, 2708,8,"marvel");
INSERT INTO lego_store VALUES (15, "daily_bugle", 350, 3772,10,"marvel");

SELECT * FROM lego_store where piece_count > 1200 order by price


