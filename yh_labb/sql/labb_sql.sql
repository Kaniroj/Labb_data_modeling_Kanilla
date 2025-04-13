-- Skapa schema
DROP SCHEMA IF EXISTS yrkeskolan CASCADE;
CREATE SCHEMA yrkeskolan;
SET SEARCH_PATH TO yrkeskolan;

-- Tabeller

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
  Telefonnummer VARCHAR(20),
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