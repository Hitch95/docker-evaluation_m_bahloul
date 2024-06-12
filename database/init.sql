-- init.sql

CREATE DATABASE IF NOT EXISTS docker_doc;
CREATE DATABASE IF NOT EXISTS docker_doc_dev;

USE docker_doc;
CREATE TABLE IF NOT EXISTS article (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(32),
  body TEXT
);

USE docker_doc_dev;
CREATE TABLE IF NOT EXISTS article (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(32),
  body TEXT
);

INSERT INTO article (id, title, body) VALUES 
(1, 'Docker Overview', 'Docker is an open platform fordeveloping, shipping, andrunning applications. Dockerenables you to separate yourapplications from yourinfrastructure so you can deliversoftware quickly'),
(2, 'What is a container?', 'IImagine you’re developing a killer web app that has three main components - a Reactfrontend, a Python API, and a PostgreSQL database. If you wanted to work on thisproject, you’d have to install Node, Python, and PostgreSQL.');
