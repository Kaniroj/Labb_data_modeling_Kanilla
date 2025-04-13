
-- Rensa och skapa nytt schema
DROP SCHEMA IF EXISTS yrkeskolan CASCADE;
CREATE SCHEMA yrkeskolan;
SET SEARCH_PATH TO yrkeskolan;

-- Skapa tabeller
CREATE TABLE Adress (
  Adress_id SERIAL PRIMARY KEY,
  Stad VARCHAR(100),
  Gata VARCHAR(100),
  Postnummer VARCHAR(10)
);

CREATE TABLE personal_info (
  Person_ID SERIAL PRIMARY KEY,
  Personnummer VARCHAR(20),
  Förnamn VARCHAR(50),
  Efternamn VARCHAR(50),
  E_post VARCHAR(100),
  Telefonnummer VARCHAR(20)
);

CREATE TABLE anhörig (
  Anhörig_ID SERIAL PRIMARY KEY,
  Person_ID INT REFERENCES personal_info(Person_ID),
  Relation VARCHAR(50),
  Namn VARCHAR(100)
);

CREATE TABLE skolan (
  Skolan_ID SERIAL PRIMARY KEY,
  Namn VARCHAR(100),
  Organisationsnummer VARCHAR(50),
  E_post VARCHAR(100),
  Adress_id INT REFERENCES Adress(Adress_id)
);

CREATE TABLE anställd (
  Anställning_ID SERIAL PRIMARY KEY,
  Skolan_ID INT REFERENCES skolan(Skolan_ID),
  Person_ID INT REFERENCES personal_info(Person_ID)
);

CREATE TABLE utbildningsledare (
  Utbildningsledare_ID SERIAL PRIMARY KEY,
  Anställning_ID INT REFERENCES anställd(Anställning_ID)
);

CREATE TABLE kurs (
  Kurs_ID SERIAL PRIMARY KEY,
  Kurs_namn VARCHAR(100),
  Kurs_kod VARCHAR(50),
  Poäng INT,
  Beskrivning VARCHAR(255)
);

CREATE TABLE lärare (
  Lärare_ID SERIAL PRIMARY KEY,
  Anställning_ID INT REFERENCES anställd(Anställning_ID)
);

CREATE TABLE organisation (
  Organisation_ID VARCHAR(50) PRIMARY KEY,
  Namn VARCHAR(100),
  Kontaktperson VARCHAR(100)
);

CREATE TABLE konsult (
  Konsult_ID SERIAL PRIMARY KEY,
  Anställning_ID INT REFERENCES anställd(Anställning_ID),
  Organisation_ID VARCHAR(50) REFERENCES organisation(Organisation_ID),
  Utbildare_ID VARCHAR(50),
  Kurs_ID INT REFERENCES kurs(Kurs_ID),
  Adress_id INT REFERENCES Adress(Adress_id)
);

CREATE TABLE program (
  Program_ID SERIAL PRIMARY KEY,
  Program_namn VARCHAR(100),
  Skolan_ID INT REFERENCES skolan(Skolan_ID)
);

CREATE TABLE Klass (
  Klass_ID SERIAL PRIMARY KEY,
  Program_ID INT REFERENCES program(Program_ID),
  Utbildningsledare_ID INT REFERENCES utbildningsledare(Utbildningsledare_ID)
);

CREATE TABLE student (
  Student_ID SERIAL PRIMARY KEY,
  Person_ID INT REFERENCES personal_info(Person_ID),
  Klass_ID INT REFERENCES Klass(Klass_ID)
);

CREATE TABLE program_kurs (
  Kurs_ID INT REFERENCES kurs(Kurs_ID),
  Program_ID INT REFERENCES program(Program_ID),
  PRIMARY KEY (Kurs_ID, Program_ID)
);

CREATE TABLE enrollment (
  Student_ID INT REFERENCES student(Student_ID),
  Kurs_ID INT REFERENCES kurs(Kurs_ID),
  PRIMARY KEY (Student_ID, Kurs_ID)
);

CREATE TABLE KursLärare (
  Kurs_ID INT REFERENCES kurs(Kurs_ID),
  Lärare_ID INT REFERENCES lärare(Lärare_ID),
  PRIMARY KEY (Kurs_ID, Lärare_ID)
);

-- Infoga exempeldata
INSERT INTO Adress (Stad, Gata, Postnummer) VALUES
('Stockholm', 'Sveavägen 10', '11157'),
('Göteborg', 'Avenyn 5', '41136'),
('Malmö', 'Storgatan 3', '21145');

INSERT INTO personal_info (Personnummer, Förnamn, Efternamn, E_post, Telefonnummer) VALUES
('19900101-1234', 'Anna', 'Svensson', 'anna@example.com', '0701234567'),
('19851212-4321', 'Erik', 'Johansson', 'erik@example.com', '0707654321'),
('19951130-6789', 'Maria', 'Andersson', 'maria@example.com', '0709876543');

INSERT INTO anhörig (Person_ID, Relation, Namn) VALUES
(1, 'Mor', 'Eva Svensson'),
(2, 'Bror', 'Lars Johansson');

INSERT INTO skolan (Namn, Organisationsnummer, E_post, Adress_id) VALUES
('Tekniska Institutet', '556677-8899', 'kontakt@ti.se', 1),
('Handelsakademin', '112233-4455', 'info@ha.se', 2);

INSERT INTO anställd (Skolan_ID, Person_ID) VALUES
(1, 1),
(1, 2),
(2, 3);

INSERT INTO utbildningsledare (Anställning_ID) VALUES
(1);

INSERT INTO kurs (Kurs_namn, Kurs_kod, Poäng, Beskrivning) VALUES
('Programmering 1', 'PRG1', 100, 'Introduktion till programmering'),
('Databaser', 'DB1', 100, 'Grundläggande databashantering');

INSERT INTO lärare (Anställning_ID) VALUES
(2),
(3);

INSERT INTO organisation VALUES
('ORG-001', 'Konsultbolaget AB', 'Sara Blom');

INSERT INTO konsult (Anställning_ID, Organisation_ID, Utbildare_ID, Kurs_ID, Adress_id) VALUES
(3, 'ORG-001', 'UTB-001', 2, 3);

INSERT INTO program (Program_namn, Skolan_ID) VALUES
('Systemutveckling', 1),
('Ekonomi', 2);

INSERT INTO Klass (Program_ID, Utbildningsledare_ID) VALUES
(1, 1);

INSERT INTO student (Person_ID, Klass_ID) VALUES
(2, 1),
(3, 1);

INSERT INTO program_kurs (Kurs_ID, Program_ID) VALUES
(1, 1),
(2, 1);

INSERT INTO enrollment (Student_ID, Kurs_ID) VALUES
(1, 1),
(2, 2);

INSERT INTO KursLärare (Kurs_ID, Lärare_ID) VALUES
(1, 1),
(1, 2),
(2, 2);
