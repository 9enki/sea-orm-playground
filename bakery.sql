DROP TABLE IF EXISTS cake;

CREATE TABLE cake (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL
);

INSERT INTO cake (name) VALUES
  ('New York Cheese'),
  ('Chocolate Forest');

DROP TABLE IF EXISTS fruit;

CREATE TABLE fruit (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL,
  cake_id int,
  FOREIGN KEY (cake_id) REFERENCES cake (id)
);

INSERT INTO fruit (name, cake_id) VALUES
  ('Blueberry', 1),
  ('Rasberry', 1),
  ('Strawberry', 2);

INSERT INTO fruit (name, cake_id) VALUES
  ('Apple', NULL),
  ('Banana', NULL),
  ('Cherry', NULL),
  ('Lemon', NULL),
  ('Orange', NULL),
  ('Pineapple', NULL);

DROP TABLE IF EXISTS filling;

CREATE TABLE filling (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL
);

INSERT INTO filling (name) VALUES
  ('Vanilla'),
  ('Lemon'),
  ('Mango');

DROP TABLE IF EXISTS cake_filling;

CREATE TABLE cake_filling (
  cake_id int NOT NULL,
  filling_id int NOT NULL,
  PRIMARY KEY (cake_id, filling_id),
  FOREIGN KEY (cake_id) REFERENCES cake (id),
  FOREIGN KEY (filling_id) REFERENCES filling (id)
);

INSERT INTO cake_filling (cake_id, filling_id) VALUES
  (1, 1),
  (1, 2),
  (2, 2),
  (2, 3);
