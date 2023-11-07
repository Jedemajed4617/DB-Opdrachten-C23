-- Opdracht 02 - adres tabel

CREATE DATABASE IF NOT EXISTS persoonsite;

USE persoonsite;

CREATE TABLE adres (
    adresID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    straat VARCHAR(255) NOT NULL,
    nummer VARCHAR(10) NOT NULL,
    nummer_toevoeging VARCHAR(10) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    plaats VARCHAR(255) NOT NULL,
    provincie VARCHAR(255) NOT NULL,
    land VARCHAR(255) NOT NULL,
    PRIMARY KEY (adresID)
);

-- Opdracht 03 - persoon tabel

CREATE TABLE persoon (
    persoonID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    telefoonnummer VARCHAR(15) NOT NULL,
    voornaam VARCHAR(255) NOT NULL,
    achternaam VARCHAR(255) NOT NULL,
    geboortedatum DATE NOT NULL,
    geslacht ENUM('Man', 'Vrouw', 'Anders') NOT NULL,
    geboortestad VARCHAR(255) NOT NULL,
    nationaliteit VARCHAR(255) NOT NULL,
    PRIMARY KEY (persoonID)
);

-- opdracht 04 - relaties

CREATE TABLE persoon (
    persoonID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    telefoonnummer VARCHAR(15) NOT NULL,
    voornaam VARCHAR(255) NOT NULL,
    achternaam VARCHAR(255) NOT NULL,
    geboortedatum DATE NOT NULL,
    geslacht ENUM('Man', 'Vrouw', 'Anders') NOT NULL,
    geboortestad VARCHAR(255) NOT NULL,
    nationaliteit VARCHAR(255) NOT NULL,
    adresID INT UNSIGNED NOT NULL,

    PRIMARY KEY (persoonID), -- primary ket toevoegen aan persoonID
    FOREIGN KEY (adresID) REFERENCES adres(adresID) -- een foreign key meegeven aan AdresID
);

-- Opdracht 05 - relaties many many

CREATE TABLE Vlucht (
    vluchtnummer INT UNSIGNED NOT NULL AUTO_INCREMENT,
    vliegtuig_type VARCHAR(255) NOT NULL,
    vertrektijd DATETIME NOT NULL,
    aankomsttijd DATETIME NOT NULL,
    vertrek_vluchthaven VARCHAR(255) NOT NULL,
    aankomst_vluchthaven VARCHAR(255) NOT NULL,
    PRIMARY KEY (vluchtnummer)
);

CREATE TABLE Personeel (
    personeelID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    naam VARCHAR(255) NOT NULL,
    rol VARCHAR(255) NOT NULL,
    PRIMARY KEY (personeelID)
);

-- De tussentabel om de N:N-relatie te beheren in de db
CREATE TABLE Vlucht_Personeel (
    vluchtnummer INT UNSIGNED NOT NULL,
    personeelID INT UNSIGNED NOT NULL,
    PRIMARY KEY (vluchtnummer, personeelID),
    FOREIGN KEY (vluchtnummer) REFERENCES Vlucht(vluchtnummer),
    FOREIGN KEY (personeelID) REFERENCES Personeel(personeelID)
);