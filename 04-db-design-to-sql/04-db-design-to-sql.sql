-- Opdracht 01 - db > sql
CREATE DATABASE IF NOT EXISTS dbfirst;
USE dbfirst;

CREATE SCHEMA IF NOT EXISTS myapp_schema;
USE myapp_schema;

CREATE TABLE Boeken (
    boekID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    titel VARCHAR(255) NOT NULL,
    auteur VARCHAR(255) NOT NULL,
    publicatiedatum DATE,
    beschikbaar BOOLEAN,
    PRIMARY KEY (boekID)
);

CREATE TABLE Leden (
    lidID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    voornaam VARCHAR(255) NOT NULL,
    achternaam VARCHAR(255) NOT NULL,
    geboortedatum DATE,
    lidmaatschapsniveau VARCHAR(255),
    PRIMARY KEY (lidID)
);

CREATE TABLE Uitleningen (
    uitleningID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    boekID INT UNSIGNED,
    lidID INT UNSIGNED,
    uitleendatum DATE,
    retourdatum DATE,
    PRIMARY KEY (uitleningID),
    FOREIGN KEY (boekID) REFERENCES Boeken(boekID),
    FOREIGN KEY (lidID) REFERENCES Leden(lidID)
);

INSERT INTO Boeken (titel, auteur, publicatiedatum, beschikbaar) VALUES
('Het Geheim van de Eenhoorn', 'Hergé', '2023-01-15', TRUE),
('Het Zakmes', 'Carry Slee', '2012-04-12', TRUE),
('1984', 'George Orwell', '1949-06-08', TRUE);

INSERT INTO Leden (voornaam, achternaam, geboortedatum, lidmaatschapsniveau) VALUES
('Alice', 'Johnson', '1990-03-12', 'Premium'),
('Klaas', 'Spek', '2001-02-22', 'Gold'),
('Bob', 'Smith', '1985-08-20', 'Standaard');

INSERT INTO Uitleningen (boekID, lidID, uitleendatum, retourdatum) VALUES
(1, 1, '2023-10-15', '2023-11-15'),
(2, 2, '2023-10-17', '2023-11-17'),
(3, 3, '2023-10-18', '2023-11-18');

-- Opdracht 02 - db maken

CREATE DATABASE IF NOT EXISTS gameraccount;
USE gameraccount;

-- Tabel Gamer
CREATE TABLE Gamer (
    gamerID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    PRIMARY KEY (gamerID)
);

-- Tabel Games
CREATE TABLE Games (
    gameID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    game_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (gameID)
);

-- Tabel Achievements
CREATE TABLE Achievements (
    achievementID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    achievement_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (achievementID)
);

-- Tabel om de relatie tussen Gamer en Games vast te leggen
CREATE TABLE Gamer_Games (
    gamerID INT UNSIGNED NOT NULL,
    gameID INT UNSIGNED NOT NULL,
    PRIMARY KEY (gamerID, gameID),
    FOREIGN KEY (gamerID) REFERENCES Gamer(gamerID),
    FOREIGN KEY (gameID) REFERENCES Games(gameID)
);

-- Tabel om de relatie tussen Gamer en Achievements vast te leggen
CREATE TABLE Gamer_Achievements (
    gamerID INT UNSIGNED NOT NULL,
    achievementID INT UNSIGNED NOT NULL,
    PRIMARY KEY (gamerID, achievementID),
    FOREIGN KEY (gamerID) REFERENCES Gamer(gamerID),
    FOREIGN KEY (achievementID) REFERENCES Achievements(achievementID)
);

-- Opdracht 03 - design > sql :: Code die eruitkomt

CREATE TABLE Gamer (
    gamerID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    PRIMARY KEY (gamerID)
);

-- Tabel Games
CREATE TABLE Games (
    gameID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    game_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (gameID)
);

-- Tabel Achievements
CREATE TABLE Achievements (
    achievementID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    achievement_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (achievementID)
);

-- Tabel om de relatie tussen Gamer en Games vast te leggen
CREATE TABLE Gamer_Games (
    gamerID INT UNSIGNED NOT NULL,
    gameID INT UNSIGNED NOT NULL,
    PRIMARY KEY (gamerID, gameID),
    FOREIGN KEY (gamerID) REFERENCES Gamer(gamerID),
    FOREIGN KEY (gameID) REFERENCES Games(gameID)
);

-- Tabel om de relatie tussen Gamer en Achievements vast te leggen
CREATE TABLE Gamer_Achievements (
    gamerID INT UNSIGNED NOT NULL,
    achievementID INT UNSIGNED NOT NULL,
    PRIMARY KEY (gamerID, achievementID),
    FOREIGN KEY (gamerID) REFERENCES Gamer(gamerID),
    FOREIGN KEY (achievementID) REFERENCES Achievements(achievementID)
);