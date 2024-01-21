.read data.sql


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, min(price) AS lowest_price FROM inventory GROUP BY item;

CREATE TABLE shop AS
  SELECT name, category FROM products GROUP BY category HAVING min(MSRP/rating);

CREATE TABLE shopping_list AS
  SELECT a.name, b.store FROM shop AS a, lowest_prices AS b WHERE a.name = b.item;

CREATE TABLE total_bandwidth AS
  SELECT sum(a.Mbs) FROM stores AS a, shopping_list AS b WHERE a.store = b.store;

