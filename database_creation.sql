DROP SCHEMA IF EXISTS test;
CREATE SCHEMA test;
USE test;
DROP TABLE IF EXISTS `test`.`user`;




CREATE TABLE `test`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `joining_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_admin` BIT(1) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `age` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));


INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(1, 'kote', 'kote@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(2, 'kot', 'kot@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(3, 'kotek', 'kotek@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(4, 'ozzy', 'ozzy@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(5, 'ozzyk', 'ozzyk@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(6, 'omnomnom', 'omnomnom@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(7, 'koteA', 'koteA@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(8, 'koteB', 'koteB@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(9, 'kotekote', 'kotekote@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(10, 'sheba', 'sheba@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(11, 'harly', 'koteharly@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(12, 'acdc', 'koteacdc@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(13, 'niaw', 'koteniaw@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(14, 'kotemon', 'kotemon@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(15, 'kotera', 'kotera@gmail.com', 5, true, '2016-11-14 19:50:58');
INSERT INTO user(id, name, email, age, is_admin, joining_date) VALUES(16, 'koteas', 'koteas@gmail.com', 5, true, '2016-11-14 19:50:58');

