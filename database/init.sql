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
(1, 'Docker Overview', 'Test Body 1'),
(2, 'What is acontainer?', 'Test Body 2');
