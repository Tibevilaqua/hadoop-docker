CREATE DATABASE IF NOT EXISTS db_test;
USE db_test;

DROP TABLE IF EXISTS test;

CREATE TABLE IF NOT EXISTS test (
  id serial NOT NULL PRIMARY KEY,
  name varchar(100),
  email varchar(200),
  department varchar(200),
  modified timestamp default CURRENT_TIMESTAMP NOT NULL,
  INDEX `modified_index` (`modified`)
);

INSERT INTO test (name, email, department) VALUES ('alice', 'alice@abc.com', 'engineering');
INSERT INTO test (name, email, department) VALUES ('bob', 'bob@abc.com', 'sales');
INSERT INTO test (name, email, department) VALUES ('bob', 'bob@abc.com', 'sales');
INSERT INTO test (name, email, department) VALUES ('bob', 'bob@abc.com', 'sales');
INSERT INTO test (name, email, department) VALUES ('bob', 'bob@abc.com', 'sales');
INSERT INTO test (name, email, department) VALUES ('bob', 'bob@abc.com', 'sales');
INSERT INTO test (name, email, department) VALUES ('bob', 'bob@abc.com', 'sales');
INSERT INTO test (name, email, department) VALUES ('bob', 'bob@abc.com', 'sales');
INSERT INTO test (name, email, department) VALUES ('bob', 'bob@abc.com', 'sales');
INSERT INTO test (name, email, department) VALUES ('bob', 'bob@abc.com', 'sales');
INSERT INTO test (name, email, department) VALUES ('alice', 'ali\\ce@abc.com', 'engineering');
INSERT INTO test (name, email, department) VALUES ('alice', 'ali\\ce@a\\bc.com', 'engineering');


CREATE TABLE IF NOT EXISTS test3 (
  id serial NOT NULL PRIMARY KEY,
  name varchar(100),
  email varchar(200),
  department varchar(200),
  modified timestamp default CURRENT_TIMESTAMP NOT NULL,
  INDEX `modified_index` (`modified`)
);


CREATE TABLE IF NOT EXISTS customers (
  customer_id int NOT NULL PRIMARY KEY auto_increment,
  customer_fname varchar(100),
  customer_lname varchar(200),
  customer_city varchar(200)
);


INSERT INTO customers (customer_fname, customer_lname, customer_city) VALUES ('alice a', 'engineering', 'melbourne');
INSERT INTO customers (customer_fname, customer_lname, customer_city) VALUES ('alice b', 'engineering', 'melbourne');
INSERT INTO customers (customer_fname, customer_lname, customer_city) VALUES ('jake a', 'painter', 'melbourne');
INSERT INTO customers (customer_fname, customer_lname, customer_city) VALUES ('Simon a', 'Software engineer', 'brisbane');
INSERT INTO customers (customer_fname, customer_lname, customer_city) VALUES ('Patrick a', 'Singer', 'perth');
INSERT INTO customers (customer_fname, customer_lname, customer_city) VALUES ('Patrick b', 'Singer', 'perth');
INSERT INTO customers (customer_fname, customer_lname, customer_city) VALUES ('alice a', 'Singer', 'melbourne');


CREATE TABLE IF NOT EXISTS order_items (
  order_item_id int NOT NULL PRIMARY KEY auto_increment,
  order_item_description varchar(200)
);

INSERT INTO order_items (order_item_description) VALUES ('Guitar');
INSERT INTO order_items (order_item_description) VALUES ('Bass');
INSERT INTO order_items (order_item_description) VALUES ('Microphone');
INSERT INTO order_items (order_item_description) VALUES ('Drum');
INSERT INTO order_items (order_item_description) VALUES ('Tuba');


CREATE TABLE IF NOT EXISTS orders (
  order_id int NOT NULL PRIMARY KEY auto_increment,
  order_date timestamp default CURRENT_TIMESTAMP NOT NULL,
  order_customer_id int,
  order_item_id int,
  order_status varchar(200),
  FOREIGN KEY customer_id(order_customer_id)
  REFERENCES customers(customer_id),
  FOREIGN KEY item_id(order_item_id)
  REFERENCES order_items(order_item_id)
);


INSERT INTO orders (order_customer_id, order_item_id, order_status) VALUES (1, 1, 'pending');
INSERT INTO orders (order_customer_id, order_item_id, order_status) VALUES (1, 2, 'delivered');
INSERT INTO orders (order_customer_id, order_item_id, order_status) VALUES (2, 3, 'in-transit');
INSERT INTO orders (order_customer_id, order_item_id, order_status) VALUES (2, 4, 'lost');
INSERT INTO orders (order_customer_id, order_item_id, order_status) VALUES (3, 5, 'pending');
INSERT INTO orders (order_customer_id, order_item_id, order_status) VALUES (3, 1, 'in-transit');
INSERT INTO orders (order_customer_id, order_item_id, order_status) VALUES (4, 2, 'delivered');
INSERT INTO orders (order_customer_id, order_item_id, order_status) VALUES (4, 3, 'pending');
INSERT INTO orders (order_customer_id, order_item_id, order_status) VALUES (4, 4, 'pending');
INSERT INTO orders (order_customer_id, order_item_id, order_status) VALUES (4, 5, 'pending');