/* Creation of Tables
*/
CREATE TABLE Users
( 	userID 			INT			 	NOT NULL,
	email			VARCHAR(30)		NOT NULL,
	firstName 		VARCHAR(25) 	NOT NULL,
	lastName 		VARCHAR(25) 	NOT NULL,
	PRIMARY KEY (userID) );

CREATE TABLE Game
( 	gameTitle		VARCHAR(50)		NOT NULL,
	releaseDate		DATE			NOT NULL,
	PRIMARY KEY (gameTitle, releaseDate) );

CREATE TABLE Genre
(	genre			VARCHAR(20)		NOT NULL,
	gameTitle		VARCHAR(50)		NOT NULL,
	releaseDate		DATE			NOT NULL,
	PRIMARY KEY (genre, gameTitle, releaseDate),
	FOREIGN KEY (gameTitle) REFERENCES Game(gameTitle),
	FOREIGN KEY (releaseDate) REFERENCES Game(releaseDate) );

CREATE TABLE Owns
( 	userID		 	INT			 	NOT NULL,
	gameTitle		VARCHAR(50)		NOT NULL,
	releaseDate		DATE			NOT NULL,
	PRIMARY KEY (userID, gameTitle, releaseDate),
	FOREIGN KEY (gameTitle) REFERENCES Game(gameTitle),
	FOREIGN KEY (releaseDate) REFERENCES Game(releaseDate) );

CREATE TABLE Publisher
( 	publisherName 	VARCHAR(20) 	NOT NULL,
	parentPublisher VARCHAR(20),
	PRIMARY KEY (publisherName),
	FOREIGN KEY (parentPublisher) REFERENCES Publisher(publisherName) );

CREATE TABLE Developer
( 	developerName 	VARCHAR(20) 	NOT NULL,
	parentPublisher VARCHAR(20),
	PRIMARY KEY (developerName),
	FOREIGN KEY (parentPublisher) REFERENCES Publisher(publisherName) );

CREATE TABLE Develops
( 	developerName 	VARCHAR(20) 	NOT NULL,
	gameTitle		VARCHAR(50)		NOT NULL,
	releaseDate		DATE			NOT NULL,
	PRIMARY KEY (developerName, gameTitle, releaseDate),
	FOREIGN KEY (developerName) REFERENCES Developer(developerName),
	FOREIGN KEY (gameTitle) REFERENCES Game(gameTitle),
	FOREIGN KEY (releaseDate) REFERENCES Game(releaseDate) );
	
CREATE TABLE Publishes
( 	publisherName 	VARCHAR(20) 	NOT NULL,
	gameTitle		VARCHAR(50)		NOT NULL,
	releaseDate		DATE			NOT NULL,
	PRIMARY KEY (publisherName, gameTitle, releaseDate),
	FOREIGN KEY (publisherName) REFERENCES Publisher(publisherName),
	FOREIGN KEY (gameTitle) REFERENCES Game(gameTitle),
	FOREIGN KEY (releaseDate) REFERENCES Game(releaseDate) );
	
CREATE TABLE Platform
(	platformName	VARCHAR(20)		NOT NULL,
	releaseDate		DATE			NOT NULL,
	manufacturer	VARCHAR(20)		NOT NULL,
	PRIMARY KEY (platformName),
	FOREIGN KEY (manufacturer) REFERENCES Publisher(publisherName) );

CREATE TABLE Model
(	model			VARCHAR(20)		NOT NULL,
	platformName	VARCHAR(20)		NOT NULL,
	PRIMARY KEY (model, platformName),
	FOREIGN KEY (platformName) REFERENCES Platform(platformName) );
	
CREATE TABLE Has
(	gameTitle		VARCHAR(50)		NOT NULL,
	releaseDate		DATE			NOT NULL,
	platformName	VARCHAR(20)		NOT NULL,
	PRIMARY KEY (gameTitle, releaseDate, platformName),
	FOREIGN KEY (gameTitle) REFERENCES Game(gameTitle),
	FOREIGN KEY (releaseDate) REFERENCES Game(releaseDate),
	FOREIGN KEY (platformName) REFERENCES Platform(platformName) );

/* HAFHMORE - Populating the database with INSERT INTO statements 	*/
/* and other auxiliary statements					*/

/* Populate Users*/
INSERT INTO Users VALUES (01, 'gxb5147@uncw.edu','George','Bohorquez');
INSERT INTO Users VALUES (02, 'ams1347@uncw.edu','Aaron','Schwartz');
INSERT INTO Users VALUES (03, 'ean1597@uncw.edu','Bella','Novicki');
INSERT INTO Users VALUES (04, 'mpg1793@uncw.edu','Max','Groover');

/* Populate Publisher */
INSERT INTO Publisher VALUES ('Square Enix', NULL);
INSERT INTO Publisher VALUES ('Sony', NULL);
INSERT INTO Publisher VALUES ('Nintendo', NULL);
INSERT INTO Publisher VALUES ('Microsoft', NULL);
INSERT INTO Publisher VALUES ('Spike Chunsoft', NULL);
INSERT INTO Publisher VALUES ('Nippon Ichi Software', NULL);
INSERT INTO Publisher VALUES ('NIS America', 'Nippon Ichi Software');
INSERT INTO Publisher VALUES ('Capcom', NULL);
INSERT INTO Publisher VALUES ('Activision', NULL);
INSERT INTO Publisher VALUES ('Atlus', NULL);
INSERT INTO Publisher VALUES ('Electronic Arts', NULL);

/* Populate Developer */
INSERT INTO Developer VALUES ('Square Enix', 'Square Enix');
INSERT INTO Developer VALUES ('Atlus', 'Atlus');
INSERT INTO Developer VALUES ('Spike Chunsoft', 'Spike Chunsoft');
INSERT INTO Developer VALUES ('Capcom', 'Capcom');
INSERT INTO Developer VALUES ('Sucker Punch', 'Sony');
INSERT INTO Developer VALUES ('Naughty Dog', 'Sony');
INSERT INTO Developer VALUES ('Bungie', 'Microsoft');
INSERT INTO Developer VALUES ('Nintendo', 'Nintendo');
INSERT INTO Developer VALUES ('Team Ico', 'Sony');
INSERT INTO Developer VALUES ('BioWare', 'Electronic Arts');
INSERT INTO Developer VALUES ('Ready at Dawn Studios', 'Sony');
INSERT INTO Developer VALUES ('Intelligent Systems', 'Nintendo');

/* Populate Platform */
INSERT INTO Platform VALUES ('PlayStation Portable', '2005-03-24', 'Sony');
INSERT INTO Platform VALUES ('PlayStation Vita', '2012-02-22', 'Sony');
INSERT INTO Platform VALUES ('PlayStation 2', '2000-03-04', 'Sony');
INSERT INTO Platform VALUES ('PlayStation 3', '2006-11-11', 'Sony');
INSERT INTO Platform VALUES ('PlayStation 4', '2013-11-15', 'Sony');
INSERT INTO Platform VALUES ('Wii U', '2012-11-12', 'Nintendo');
INSERT INTO Platform VALUES ('Nintendo Switch', '2017-03-03', 'Nintendo');
INSERT INTO Platform VALUES ('Xbox 360', '2005-11-22', 'Microsoft');
INSERT INTO Platform VALUES ('Xbox One', '2013-11-22', 'Microsoft');
INSERT INTO Platform VALUES ('Microsoft Windows', '1985-11-20', 'Microsoft');
INSERT INTO Platform VALUES ('Nintendo 3DS', '2011-02-26', 'Nintendo');

/* Populate Model */
INSERT INTO Model VALUES ('PSP-1000', 'PlayStation Portable');
INSERT INTO Model VALUES ('PSP-2000', 'PlayStation Portable');
INSERT INTO Model VALUES ('PSP-3000', 'PlayStation Portable');
INSERT INTO Model VALUES ('PSP Go', 'PlayStation Portable');

INSERT INTO Model VALUES ('Vita-1000', 'PlayStation Vita');
INSERT INTO Model VALUES ('Vita-2000', 'PlayStation Vita');

INSERT INTO Model VALUES ('PS2 [Original]', 'PlayStation 2');
INSERT INTO Model VALUES ('PS2 Slim', 'PlayStation 2');

INSERT INTO Model VALUES ('PS3 [Original]', 'PlayStation 3');
INSERT INTO Model VALUES ('PS3 Slim', 'PlayStation 3');
INSERT INTO Model VALUES ('PS3 Super Slim', 'PlayStation 3');

INSERT INTO Model VALUES ('PS4 [Original]', 'PlayStation 4');
INSERT INTO Model VALUES ('PS4 Slim', 'PlayStation 4');
INSERT INTO Model VALUES ('PS4 Pro', 'PlayStation 4');

INSERT INTO Model VALUES ('Nintendo Switch [Original]', 'Nintendo Switch');
INSERT INTO Model VALUES ('Nintendo Switch Lite', 'Nintendo Switch');

INSERT INTO Model VALUES ('Xbox 360 [Original]', 'Xbox 360');
INSERT INTO Model VALUES ('Xbox 360 S', 'Xbox 360');
INSERT INTO Model VALUES ('Xbox 360 E', 'Xbox 360');

INSERT INTO Model VALUES ('Xbox One [Original]', 'Xbox One');
INSERT INTO Model VALUES ('Xbox One S', 'Xbox One');
INSERT INTO Model VALUES ('Xbox One S Digital Edition', 'Xbox One');
INSERT INTO Model VALUES ('Xbox One X', 'Xbox One');

INSERT INTO Model VALUES ('Nintendo 3DS XL', 'Nintendo 3DS');


/* Populate Game */
INSERT INTO Game VALUES ('Dissidia 012 Final Fantasy', '2011-03-22');
INSERT INTO Game VALUES ('Persona 4 Golden', '2012-06-14');
INSERT INTO Game VALUES ('The Legend of Zelda: Breath of the Wild', '2017-03-03');
INSERT INTO Game VALUES ("Uncharted 4: A Thief's End", '2016-05-10');
INSERT INTO Game VALUES ('God of War: Ghost of Sparta', '2010-11-02');
INSERT INTO Game VALUES ('Danganronpa 2: Goodbye Despair', '2012-07-26');
INSERT INTO Game VALUES ('Shadow of the Colossus', '2005-10-18');
INSERT INTO Game VALUES ('Sly 2: Band of Thieves', '2004-09-14');
INSERT INTO Game VALUES ('Fire Emblem: Three Houses', '2019-07-26');
INSERT INTO Game VALUES ('Resident Evil 6', '2012-10-02');
INSERT INTO Game VALUES ('Dragon Age: Inquisition', '2014-11-18');
INSERT INTO Game VALUES ('Destiny 2', '2017-09-06');

/* Populate Genre, Develops, Publishes, and Has, sorted by individual game */

/* Game: Dissidia 012 Final Fantasy */
INSERT INTO Genre VALUES ('Fighting', 'Dissidia 012 Final Fantasy', '2011-03-22');
INSERT INTO Develops VALUES ('Square Enix', 'Dissidia 012 Final Fantasy', '2011-03-22');
INSERT INTO Publishes VALUES ('Square Enix', 'Dissidia 012 Final Fantasy', '2011-03-22');
INSERT INTO Has VALUES ('Dissidia 012 Final Fantasy', '2011-03-22', 'PlayStation Portable');

/* Game: God of War: Ghost of Sparta */
INSERT INTO Genre VALUES ('Action','God of War: Ghost of Sparta', '2010-11-02');
INSERT INTO Develops VALUES ('Ready at Dawn Studios', 'God of War: Ghost of Sparta', '2010-11-02');
INSERT INTO Publishes VALUES ('Sony', 'God of War: Ghost of Sparta', '2010-11-02');
INSERT INTO Has VALUES ('God of War: Ghost of Sparta', '2010-11-02', 'PlayStation Portable');

/* Game: Fire Emblem: Three Houses */
INSERT INTO Genre VALUES ('SRPG','Fire Emblem: Three Houses', '2019-07-26');
INSERT INTO Develops VALUES ('Intelligent Systems', 'Fire Emblem: Three Houses', '2019-07-26');
INSERT INTO Publishes VALUES ('Nintendo', 'Fire Emblem: Three Houses', '2019-07-26');
INSERT INTO Has VALUES ('Fire Emblem: Three Houses', '2019-07-26', 'Nintendo 3DS');

/* Game: Persona 4 Golden */
INSERT INTO Genre VALUES ('JRPG','Persona 4 Golden', '2012-06-14');
INSERT INTO Genre VALUES ('Life Sim', 'Persona 4 Golden', '2012-06-14');
INSERT INTO Develops VALUES ('Atlus', 'Persona 4 Golden', '2012-06-14');
INSERT INTO Publishes VALUES ('Atlus', 'Persona 4 Golden', '2012-06-14');
INSERT INTO Has VALUES ('Persona 4 Golden', '2012-06-14', 'PlayStation Vita');

/* Game: Danganronpa 2: Goodbye Despair */
INSERT INTO Genre VALUES ('Visual Novel', 'Danganronpa 2: Goodbye Despair', '2012-07-26');
INSERT INTO Genre VALUES ('Mystery', 'Danganronpa 2: Goodbye Despair', '2012-07-26');
INSERT INTO Develops VALUES ('Spike Chunsoft', 'Danganronpa 2: Goodbye Despair', '2012-07-26');
INSERT INTO Publishes VALUES ('NIS America', 'Danganronpa 2: Goodbye Despair', '2012-07-26');
INSERT INTO Has VALUES ('Danganronpa 2: Goodbye Despair', '2012-07-26', 'PlayStation Vita');

/* Game: Resident Evil 6 */
INSERT INTO Genre VALUES ('Third Person Shooter', 'Resident Evil 6', '2012-10-02');
INSERT INTO Genre VALUES ('Horror', 'Resident Evil 6', '2012-10-02');
INSERT INTO Develops VALUES ('Capcom', 'Resident Evil 6', '2012-10-02');
INSERT INTO Publishes VALUES ('Capcom', 'Resident Evil 6', '2012-10-02');
INSERT INTO Has VALUES ('Resident Evil 6', '2012-10-02', 'PlayStation 3');
INSERT INTO Has VALUES ('Resident Evil 6', '2012-10-02', 'PlayStation 4');
INSERT INTO Has VALUES ('Resident Evil 6', '2012-10-02', 'Xbox 360');
INSERT INTO Has VALUES ('Resident Evil 6', '2012-10-02', 'Xbox One');

/* Game: Uncharted 4: A Thief's End */
INSERT INTO Genre VALUES ('Third Person Shooter', "Uncharted 4: A Thief's End", '2016-05-10');
INSERT INTO Genre VALUES ('Adventure', "Uncharted 4: A Thief's End", '2016-05-10');
INSERT INTO Develops VALUES ('Naughty Dog', "Uncharted 4: A Thief's End", '2016-05-10');
INSERT INTO Publishes VALUES ('Sony', "Uncharted 4: A Thief's End", '2016-05-10');
INSERT INTO Has VALUES ("Uncharted 4: A Thief's End", '2016-05-10', 'PlayStation 4');

/* Game: Destiny 2 */
INSERT INTO Genre VALUES ('First Person Shooter','Destiny 2', '2017-09-06');
INSERT INTO Genre VALUES ('RPG','Destiny 2', '2017-09-06');
INSERT INTO Develops VALUES ('Bungie', 'Destiny 2', '2017-09-06');
INSERT INTO Publishes VALUES ('Activision', 'Destiny 2', '2017-09-06');
INSERT INTO Has VALUES ('Destiny 2', '2017-09-06', 'PlayStation 4');
INSERT INTO Has VALUES ('Destiny 2', '2017-09-06', 'Xbox One');

/* Game: Sly 2: Band of Thieves */
INSERT INTO Genre VALUES ('Stealth', 'Sly 2: Band of Thieves', '2004-09-14');
INSERT INTO Genre VALUES ('Adventure','Sly 2: Band of Thieves', '2004-09-14');
INSERT INTO Develops VALUES ('Sucker Punch', 'Sly 2: Band of Thieves', '2004-09-14');
INSERT INTO Publishes VALUES ('Sony', 'Sly 2: Band of Thieves', '2004-09-14');
INSERT INTO Has VALUES ('Sly 2: Band of Thieves', '2004-09-14', 'PlayStation 2');

/* Game: The Legend of Zelda: Breath of the Wild */
INSERT INTO Genre VALUES ('Action-Adventure', 'The Legend of Zelda: Breath of the Wild', '2017-03-03');
INSERT INTO Genre VALUES ('Open World', 'The Legend of Zelda: Breath of the Wild', '2017-03-03');
INSERT INTO Develops VALUES ('Nintendo', 'The Legend of Zelda: Breath of the Wild', '2017-03-03');
INSERT INTO Publishes VALUES ('Nintendo', 'The Legend of Zelda: Breath of the Wild', '2017-03-03');
INSERT INTO Has VALUES ('The Legend of Zelda: Breath of the Wild', '2017-03-03', 'Nintendo Switch');
INSERT INTO Has VALUES ('The Legend of Zelda: Breath of the Wild', '2017-03-03', 'Wii U');

/* Game: Shadow of the Colossus */
INSERT INTO Genre VALUES ('Action-Adventure', 'Shadow of the Colossus', '2005-10-18');
INSERT INTO Genre VALUES ('Boss Rush', 'Shadow of the Colossus', '2005-10-18');
INSERT INTO Genre VALUES ('Open World', 'Shadow of the Colossus', '2005-10-18');
INSERT INTO Develops VALUES ('Team Ico', 'Shadow of the Colossus', '2005-10-18');
INSERT INTO Publishes VALUES ('Sony', 'Shadow of the Colossus', '2005-10-18');
INSERT INTO Has VALUES ('Shadow of the Colossus', '2005-10-18', 'PlayStation 2');
INSERT INTO Has VALUES ('Shadow of the Colossus', '2005-10-18', 'PlayStation 3');

/* Game: Dragon Age: Inquisition */
INSERT INTO Genre VALUES ('RPG', 'Dragon Age: Inquisition', '2014-11-18');
INSERT INTO Genre VALUES ('Open World', 'Dragon Age: Inquisition', '2014-11-18');
INSERT INTO Genre VALUES ('Action-Adventure', 'Dragon Age: Inquisition', '2014-11-18');
INSERT INTO Develops VALUES ('BioWare', 'Dragon Age: Inquisition', '2014-11-18');
INSERT INTO Publishes VALUES ('Electronic Arts', 'Dragon Age: Inquisition', '2014-11-18');
INSERT INTO Has VALUES ('Dragon Age: Inquisition', '2014-11-18', 'PlayStation 3');
INSERT INTO Has VALUES ('Dragon Age: Inquisition', '2014-11-18', 'PlayStation 4');
INSERT INTO Has VALUES ('Dragon Age: Inquisition', '2014-11-18', 'Xbox 360');
INSERT INTO Has VALUES ('Dragon Age: Inquisition', '2014-11-18', 'Xbox One');
INSERT INTO Has VALUES ('Dragon Age: Inquisition', '2014-11-18', 'Microsoft Windows');


/* Populate Owns table, sorted by individual User */
/* User 01 */
INSERT INTO Owns VALUES (01, 'Dissidia 012 Final Fantasy', '2011-03-22');
INSERT INTO Owns VALUES (01, 'God of War: Ghost of Sparta', '2010-11-02');
INSERT INTO Owns VALUES (01, 'Fire Emblem: Three Houses', '2019-07-26');

/* User 02 */
INSERT INTO Owns VALUES (02, 'Persona 4 Golden', '2012-06-14');
INSERT INTO Owns VALUES (02, 'Danganronpa 2: Goodbye Despair', '2012-07-26');
INSERT INTO Owns VALUES (02, 'The Legend of Zelda: Breath of the Wild', '2017-03-03');
INSERT INTO Owns VALUES (02, "Uncharted 4: A Thief's End", '2016-05-10');
INSERT INTO Owns VALUES (02, 'Sly 2: Band of Thieves', '2004-09-14');
INSERT INTO Owns VALUES (02, 'Fire Emblem: Three Houses', '2019-07-26');
INSERT INTO Owns VALUES (02, 'Resident Evil 6', '2012-10-02');

/* User 03 */
INSERT INTO Owns VALUES (03, 'The Legend of Zelda: Breath of the Wild', '2017-03-03');
INSERT INTO Owns VALUES (03, 'Shadow of the Colossus', '2005-10-18');
INSERT INTO Owns VALUES (03, 'Dragon Age: Inquisition', '2014-11-18');
INSERT INTO Owns VALUES (03, 'Sly 2: Band of Thieves', '2004-09-14');

/* User 04 */
INSERT INTO Owns VALUES (04, "Uncharted 4: A Thief's End", '2016-05-10');
INSERT INTO Owns VALUES (04, 'Sly 2: Band of Thieves', '2004-09-14');
INSERT INTO Owns VALUES (04, 'Destiny 2', '2017-09-06');
INSERT INTO Owns VALUES (04, 'Dragon Age: Inquisition', '2014-11-18');
INSERT INTO Owns VALUES (04, 'Shadow of the Colossus', '2005-10-18');

