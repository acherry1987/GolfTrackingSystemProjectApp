CREATE DATABASE  IF NOT EXISTS `Golf`;
USE `Golf`;

CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `streetNumber` varchar(10) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postalCode` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `GolfCourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
);

CREATE TABLE `Score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) DEFAULT NULL,
  `idGolfCourse` int(11) DEFAULT NULL,
  `datePlayed` date DEFAULT NULL,
  `rawScore` smallint(6) NOT NULL,
  `netScore` smallint(6) NOT NULL,
  `handicap` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO User (firstName,lastName,email,phoneNumber) VALUES ('Andrew', 'Cherry', 'andrewcherry.v@gmail.com', '(519) 590-2180');
INSERT INTO User (firstName,lastName,email,phoneNumber) VALUES ('Jack', 'Nicklaus', 'jack@abc.com', '(123) 456-7890');
INSERT INTO User (firstName,lastName,email,phoneNumber) VALUES ('Jordan', 'Spieth', 'jordan@abc.com', '(123) 456-7890');
INSERT INTO GolfCourse (name, rating, slope) VALUES('Grey Silo', 67.2, 126);
INSERT INTO GolfCourse (name, rating, slope) VALUES('Pebble Beach', 73.2, 135);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-01', 87, 86, 16.2);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-03', 95, 93, 21.4);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-05', 91, 90, 18.7);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-07', 96, 93, 23.3);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-09', 82, 82, 14.3);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-11', 90, 89, 19.5);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-13', 87, 86, 16.7);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-15', 88, 88, 18.4);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-17', 88, 88, 15.6);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-19', 88, 88, 18.4);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-21', 89, 89, 19.1);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-23', 88, 87, 17.3);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-25', 100, 95, 25.6);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-27', 95, 93, 23.1);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-05-29', 93, 91, 21.5);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-06-01', 87, 86, 16.2);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-06-03', 87, 87, 17.3);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-06-05', 86, 86, 16.2);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-06-07', 85, 85, 15.3);
INSERT INTO Score (idUser, idGolfCourse, datePlayed, rawScore, netScore, handicap) VALUES(1, 1, '2015-06-09', 88, 87, 17.3);
