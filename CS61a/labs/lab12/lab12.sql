.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE pet = 'dog' AND color = 'blue';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE pet = 'dog' AND color = 'blue';


CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 2 ORDER BY smallest ASC Limit 20;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students AS a, students AS b WHERE a.song = b.song AND a.pet = b.pet AND a.time < b.time; 


CREATE TABLE sevens AS
  SELECT a.seven FROM students AS a, numbers AS b WHERE a.number = 7  and b.'7' = 'True' and a.time = b.time;

