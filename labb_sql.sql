Create SCHEMA IF NOT EXISTS yrkeskolan;

SET SEARCH_path TO yrkeskolan; 

-- Skapa tabellen Adress
CREATE TABLE Adress (
  Adress_id INT PRIMARY KEY,
  Stad VARCHAR(100),
  Gata VARCHAR(100),
  Postnummer VARCHAR(10)
);

-- Skapa tabellen personal_info
CREATE TABLE personal_info (
  Person_ID INT PRIMARY KEY,
  Personnummer VARCHAR(20),
  Förnamn VARCHAR(50),
  Efternamn VARCHAR(50),
  E_post VARCHAR(100),
  Telefonnummer VARCHAR(20)
);

-- Skapa tabellen anhörig
CREATE TABLE anhörig (
  Anhörig_ID INT PRIMARY KEY,
  Person_ID INT REFERENCES personal_info(Person_ID),
  Relation VARCHAR(50),
  Namn VARCHAR(100)
);

-- Skapa tabellen skolan
CREATE TABLE skolan (
  Skolan_ID INT PRIMARY KEY,
  Namn VARCHAR(100),
  Organisationsnummer VARCHAR(50),
  E_post VARCHAR(100),
  Adress_id INT REFERENCES Adress(Adress_id)
);

-- Skapa tabellen anställd
CREATE TABLE anställd (
  Anställning_ID INT PRIMARY KEY,
  Skolan_ID INT REFERENCES skolan(Skolan_ID),
  Person_ID INT REFERENCES personal_info(Person_ID)
);

-- Skapa tabellen utbildningsledare
CREATE TABLE utbildningsledare (
  Utbildningsledare_ID INT PRIMARY KEY,
  Anställning_ID INT REFERENCES anställd(Anställning_ID)
);

-- Skapa tabellen kurs
CREATE TABLE kurs (
  Kurs_ID INT PRIMARY KEY,
  Kurs_namn VARCHAR(100),
  Kurs_kod VARCHAR(50),
  Poäng INT,
  Beskrivning VARCHAR(255)
);

-- Skapa tabellen lärare
CREATE TABLE lärare (
  Lärare_ID INT PRIMARY KEY,
  Anställning_ID INT REFERENCES anställd(Anställning_ID)
);

-- Skapa tabellen organisation
CREATE TABLE organisation (
  Organisation_ID VARCHAR(50) PRIMARY KEY,
  Namn VARCHAR(100),
  Kontaktperson VARCHAR(100)
);

-- Skapa tabellen konsult
CREATE TABLE konsult (
  Konsult_ID INT PRIMARY KEY,
  Anställning_ID INT REFERENCES anställd(Anställning_ID),
  Organisation_ID VARCHAR(50) REFERENCES organisation(Organisation_ID),
  Utbildare_ID VARCHAR(50),
  Kurs_ID INT REFERENCES kurs(Kurs_ID),
  Adress_id INT REFERENCES Adress(Adress_id)
);

-- Skapa tabellen program
CREATE TABLE program (
  Program_ID INT PRIMARY KEY,
  Program_namn VARCHAR(100),
  Skolan_ID INT REFERENCES skolan(Skolan_ID)
);

-- Skapa tabellen Klass
CREATE TABLE Klass (
  Klass_ID INT PRIMARY KEY,
  Program_ID INT REFERENCES program(Program_ID),
  Utbildningsledare_ID INT REFERENCES utbildningsledare(Utbildningsledare_ID)
);

-- Skapa tabellen student
CREATE TABLE student (
  Student_ID INT PRIMARY KEY,
  Person_ID INT REFERENCES personal_info(Person_ID),
  Klass_ID INT REFERENCES Klass(Klass_ID)
);

-- Skapa tabellen program_kurs
CREATE TABLE program_kurs (
  Kurs_ID INT REFERENCES kurs(Kurs_ID),
  Program_ID INT REFERENCES program(Program_ID),
  PRIMARY KEY (Kurs_ID, Program_ID)
);

-- Skapa tabellen enrollment
CREATE TABLE enrollment (
  Student_ID INT REFERENCES student(Student_ID),
  Kurs_ID INT REFERENCES kurs(Kurs_ID),
  PRIMARY KEY (Student_ID, Kurs_ID)
);

-- Skapa tabellen KursLärare (många-till-många)
CREATE TABLE KursLärare (
  Kurs_ID INT REFERENCES kurs(Kurs_ID),
  Lärare_ID INT REFERENCES lärare(Lärare_ID),
  PRIMARY KEY (Kurs_ID, Lärare_ID)
);
