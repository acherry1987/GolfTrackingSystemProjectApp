CREATE DATABASE  IF NOT EXISTS `Golf`;
USE `Golf`;

CREATE TABLE `User` (
  `name` varchar(64) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `streetNumber` varchar(10) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postalCode` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`name`)
);

CREATE TABLE `GolfCourse` (
  `name` varchar(128) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `streetNumber` varchar(10) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postalCode` varchar(12) DEFAULT NULL,
  `rating` decimal(3,1) NOT NULL,
  `slope` smallint(6) NOT NULL,
  PRIMARY KEY (`name`)
);

CREATE TABLE `Score` (
  `userName` varchar(64) NOT NULL,
  `courseName` varchar(128) NOT NULL,
  `datePlayed` date NOT NULL,
  `rawScore` smallint(6) NOT NULL,
  `netScore` smallint(6) NOT NULL,
  `handicap` decimal(4,2) NOT NULL,
  PRIMARY KEY (`userName`, `courseName`, `datePlayed`)
);

INSERT INTO User (name) Values('Ricardo Vazquez');
INSERT INTO User (name) Values('Mikhail Vinogradov');
INSERT INTO User (name,email,phoneNumber)
VALUES ('Andrew Cherry', 'andrewcherry.v@gmail.com', '(519) 590-2180');

INSERT INTO GolfCourse (name, rating, slope) VALUES('Grey Silo', 67.2, 126);
INSERT INTO GolfCourse (name, rating, slope) VALUES('Pebble Beach', 73.2, 135);

INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-01', 87, 86, 16.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-02', 90, 90, 20.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-03', 81, 81, 11.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-04', 84, 82, 12.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-05', 87, 86, 16.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-06', 83, 83, 13.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-07', 84, 83, 12.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-08', 84, 84, 15.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-09', 95, 92, 22.5);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-10', 98, 94, 23.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-11', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-12', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-13', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-14', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-15', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-16', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-17', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-18', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-19', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Andrew Cherry', 'Grey Silo', '2015-05-20', 103, 99, 28.1);

INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-01', 87, 85, 15.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-02', 90, 89, 19.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-03', 82, 82, 12.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-04', 84, 83, 13.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-05', 80, 80, 10.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-06', 84, 84, 14.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-07', 84, 82, 12.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-08', 84, 84, 15.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-09', 95, 93, 22.5);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-10', 98, 95, 24.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-11', 103, 100, 29.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-12', 103, 100, 29.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-13', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-14', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-15', 97, 97, 26.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-16', 98, 95, 24.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-17', 89, 89, 18.7);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-18', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-19', 87, 87, 15.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Mikhail Vinogradov', 'Grey Silo', '2015-05-20', 84, 84, 14.0);

INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-01', 87, 84, 14.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-02', 90, 88, 18.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-03', 81, 81, 11.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-04', 84, 82, 12.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-05', 79, 79, 9.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-06', 83, 83, 13.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-07', 84, 80, 10.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-08', 84, 84, 15.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-09', 95, 92, 22.5);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-10', 98, 94, 23.2);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-11', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-12', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-13', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-14', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-15', 97, 97, 26.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-16', 98, 94, 23.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-17', 89, 89, 18.7);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-18', 103, 99, 28.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-19', 84, 85, 15.1);
INSERT INTO Score (userName, courseName, datePlayed, rawScore, netScore, handicap)
VALUES('Ricardo Vazquez', 'Grey Silo', '2015-05-20', 84, 84, 14.0);
