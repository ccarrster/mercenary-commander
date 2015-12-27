CREATE TABLE game (
     id MEDIUMINT NOT NULL AUTO_INCREMENT,
     createdtimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (id)
);

CREATE TABLE user (
     id MEDIUMINT NOT NULL AUTO_INCREMENT,
     createdtimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     handle TEXT,
     PRIMARY KEY (id)
);

CREATE TABLE gameuser (
     id MEDIUMINT NOT NULL AUTO_INCREMENT,
     gameid MEDIUMINT,
     userid MEDIUMINT,
     PRIMARY KEY (id)
);

CREATE TABLE history (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	createdtimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	gameid MEDIUMINT,
	action TEXT,
	PRIMARY KEY (id)
);

CREATE TABLE gametype (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	gameid MEDIUMINT,
	gametype TEXT,
	PRIMARY KEY (id)
);

CREATE TABLE city (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	name TEXT,
	PRIMARY KEY (id)
);

1 INSERT INTO city (name) VALUES('Torino');
2 INSERT INTO city (name) VALUES('Milano');
3 INSERT INTO city (name) VALUES('Venezia');
4 INSERT INTO city (name) VALUES('Genova');
5 INSERT INTO city (name) VALUES('Mantova');
6 INSERT INTO city (name) VALUES('Ferrara');
7 INSERT INTO city (name) VALUES('Parma');
8 INSERT INTO city (name) VALUES('Modena');
9 INSERT INTO city (name) VALUES('Bologna');
10 INSERT INTO city (name) VALUES('Lucca');
11 INSERT INTO city (name) VALUES('Firenze');
12 INSERT INTO city (name) VALUES('Urbino');
13 INSERT INTO city (name) VALUES('Siena');
14 INSERT INTO city (name) VALUES('Spoleto');
15 INSERT INTO city (name) VALUES('Ancona');
16 INSERT INTO city (name) VALUES('Roma');
17 INSERT INTO city (name) VALUES('Napoli');


CREATE TABLE cityconnection (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	cityid MEDIUMINT,
	connection MEDIUMINT,
	PRIMARY KEY (id)
);

INSERT INTO cityconnection (cityid, connection) VALUES(1, 2);
INSERT INTO cityconnection (cityid, connection) VALUES(1, 4);

INSERT INTO cityconnection (cityid, connection) VALUES(2, 1);
INSERT INTO cityconnection (cityid, connection) VALUES(2, 4);
INSERT INTO cityconnection (cityid, connection) VALUES(2, 3);
INSERT INTO cityconnection (cityid, connection) VALUES(2, 5);
INSERT INTO cityconnection (cityid, connection) VALUES(2, 7);
INSERT INTO cityconnection (cityid, connection) VALUES(2, 8);

INSERT INTO cityconnection (cityid, connection) VALUES(3, 2);
INSERT INTO cityconnection (cityid, connection) VALUES(3, 5);
INSERT INTO cityconnection (cityid, connection) VALUES(3, 6);

INSERT INTO cityconnection (cityid, connection) VALUES(4, 1);
INSERT INTO cityconnection (cityid, connection) VALUES(4, 2);
INSERT INTO cityconnection (cityid, connection) VALUES(4, 7);

INSERT INTO cityconnection (cityid, connection) VALUES(5, 2);
INSERT INTO cityconnection (cityid, connection) VALUES(5, 3);
INSERT INTO cityconnection (cityid, connection) VALUES(5, 6);
INSERT INTO cityconnection (cityid, connection) VALUES(5, 8);

INSERT INTO cityconnection (cityid, connection) VALUES(6, 3);
INSERT INTO cityconnection (cityid, connection) VALUES(6, 5);
INSERT INTO cityconnection (cityid, connection) VALUES(6, 9);
INSERT INTO cityconnection (cityid, connection) VALUES(6, 8);

INSERT INTO cityconnection (cityid, connection) VALUES(7, 2);
INSERT INTO cityconnection (cityid, connection) VALUES(7, 4);
INSERT INTO cityconnection (cityid, connection) VALUES(7, 8);
INSERT INTO cityconnection (cityid, connection) VALUES(7, 10);

INSERT INTO cityconnection (cityid, connection) VALUES(8, 2);
INSERT INTO cityconnection (cityid, connection) VALUES(8, 5);
INSERT INTO cityconnection (cityid, connection) VALUES(8, 6);
INSERT INTO cityconnection (cityid, connection) VALUES(8, 7);
INSERT INTO cityconnection (cityid, connection) VALUES(8, 10);
INSERT INTO cityconnection (cityid, connection) VALUES(8, 9);
INSERT INTO cityconnection (cityid, connection) VALUES(8, 11);

INSERT INTO cityconnection (cityid, connection) VALUES(9, 6);
INSERT INTO cityconnection (cityid, connection) VALUES(9, 8);
INSERT INTO cityconnection (cityid, connection) VALUES(9, 11);
INSERT INTO cityconnection (cityid, connection) VALUES(9, 12);

INSERT INTO cityconnection (cityid, connection) VALUES(10, 7);
INSERT INTO cityconnection (cityid, connection) VALUES(10, 8);
INSERT INTO cityconnection (cityid, connection) VALUES(10, 11);

INSERT INTO cityconnection (cityid, connection) VALUES(11, 8);
INSERT INTO cityconnection (cityid, connection) VALUES(11, 9);
INSERT INTO cityconnection (cityid, connection) VALUES(11, 10);
INSERT INTO cityconnection (cityid, connection) VALUES(11, 12);
INSERT INTO cityconnection (cityid, connection) VALUES(11, 13);
INSERT INTO cityconnection (cityid, connection) VALUES(11, 14);
INSERT INTO cityconnection (cityid, connection) VALUES(11, 16);

INSERT INTO cityconnection (cityid, connection) VALUES(12, 9);
INSERT INTO cityconnection (cityid, connection) VALUES(12, 11);
INSERT INTO cityconnection (cityid, connection) VALUES(12, 14);
INSERT INTO cityconnection (cityid, connection) VALUES(12, 15);

INSERT INTO cityconnection (cityid, connection) VALUES(13, 11);
INSERT INTO cityconnection (cityid, connection) VALUES(13, 16);

INSERT INTO cityconnection (cityid, connection) VALUES(14, 11);
INSERT INTO cityconnection (cityid, connection) VALUES(14, 12);
INSERT INTO cityconnection (cityid, connection) VALUES(14, 16);
INSERT INTO cityconnection (cityid, connection) VALUES(14, 15);
INSERT INTO cityconnection (cityid, connection) VALUES(14, 17);

INSERT INTO cityconnection (cityid, connection) VALUES(15, 12);
INSERT INTO cityconnection (cityid, connection) VALUES(15, 13);
INSERT INTO cityconnection (cityid, connection) VALUES(15, 17);

INSERT INTO cityconnection (cityid, connection) VALUES(16, 11);
INSERT INTO cityconnection (cityid, connection) VALUES(16, 13);
INSERT INTO cityconnection (cityid, connection) VALUES(16, 14);
INSERT INTO cityconnection (cityid, connection) VALUES(16, 17);

INSERT INTO cityconnection (cityid, connection) VALUES(17, 14);
INSERT INTO cityconnection (cityid, connection) VALUES(17, 15);
INSERT INTO cityconnection (cityid, connection) VALUES(17, 16);


CREATE TABLE cityinstance (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	gameid MEDIUMINT,
	cityid MEDIUMINT,
	owner MEDIUMINT NULL,
	bishop BOOLEAN,
	condottiere BOOLEAN,
	PRIMARY KEY (id)
);

CREATE TABLE gamestatus (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	gameid MEDIUMINT,
	started BOOLEAN,
	PRIMARY KEY (id)
);