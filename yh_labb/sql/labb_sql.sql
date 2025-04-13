-- Skapa schema
DROP SCHEMA IF EXISTS yrkeskolan CASCADE;
CREATE SCHEMA yrkeskolan;
SET search_path TO yrkeskolan;

CREATE TABLE IF NOT EXISTS adress (
  id SERIAL PRIMARY KEY,
  Stad VARCHAR(100),
  Gata VARCHAR(100),
  Postnummer VARCHAR(10)
);



-- Personal Info
CREATE TABLE IF NOT EXISTS personal_info (
  id SERIAL PRIMARY KEY,
  Personnummer VARCHAR(20),
  Förnamn VARCHAR(50),
  Efternamn VARCHAR(50),
  E_post VARCHAR(100),
  Telefonnummer VARCHAR(20)
);

-- Anhörig
CREATE TABLE IF NOT EXISTS anhörig (
  id SERIAL PRIMARY KEY,
  Person_ID INT REFERENCES personal_info(id),
  Relation VARCHAR(50),
  Namn VARCHAR(100)
);

-- Skolan
CREATE TABLE IF NOT EXISTS skolan (
  id SERIAL PRIMARY KEY,
  Namn VARCHAR(100),
  Organisationsnummer VARCHAR(50),
  E_post VARCHAR(100),
  Telefonnummer VARCHAR(20),
  Adress_id INT REFERENCES adress(id)
);

-- Anställd
CREATE TABLE IF NOT EXISTS anställd (
  id SERIAL PRIMARY KEY,
  Skolan_ID INT REFERENCES skolan(id),
  Person_ID INT REFERENCES personal_info(id)
);

-- Utbildningsledare
CREATE TABLE IF NOT EXISTS utbildningsledare (
  id SERIAL PRIMARY KEY,
  Anställning_ID INT REFERENCES anställd(id)
);

-- Lärare
CREATE TABLE IF NOT EXISTS lärare (
  id SERIAL PRIMARY KEY,
  Anställning_ID INT REFERENCES anställd(id)
);

-- Kurs
CREATE TABLE IF NOT EXISTS kurs (
  id SERIAL PRIMARY KEY,
  Kurs_namn VARCHAR(100),
  Kurs_kod VARCHAR(50),
  Poäng INT,
  Beskrivning VARCHAR(255)
);

-- Organisation
CREATE TABLE IF NOT EXISTS organisation (
  id SERIAL PRIMARY KEY,
  Namn VARCHAR(100),
  Kontaktperson VARCHAR(100)
);

-- Konsult
CREATE TABLE IF NOT EXISTS konsult (
  id SERIAL PRIMARY KEY,
  Anställning_ID INT REFERENCES anställd(id),
  Organisation_ID INT REFERENCES organisation(id),
  Utbildare_ID VARCHAR(50),
  Kurs_ID INT REFERENCES kurs(id),
  Adress_id INT REFERENCES adress(id)
);

-- Program
CREATE TABLE IF NOT EXISTS program (
  id SERIAL PRIMARY KEY,
  Program_namn VARCHAR(100),
  Skolan_ID INT REFERENCES skolan(id)
);

-- Klass
CREATE TABLE IF NOT EXISTS klass (
  id SERIAL PRIMARY KEY,
  Program_ID INT REFERENCES program(id),
  Utbildningsledare_ID INT REFERENCES utbildningsledare(id)
);

-- Student
CREATE TABLE IF NOT EXISTS student (
  id SERIAL PRIMARY KEY,
  Person_ID INT REFERENCES personal_info(id),
  Klass_ID INT REFERENCES klass(id)
);

-- Program-Kurs
CREATE TABLE IF NOT EXISTS program_kurs (
  Kurs_ID INT REFERENCES kurs(id),
  Program_ID INT REFERENCES program(id),
  PRIMARY KEY (Kurs_ID, Program_ID)
);

-- Enrollment
CREATE TABLE IF NOT EXISTS enrollment (
  Student_ID INT REFERENCES student(id),
  Kurs_ID INT REFERENCES kurs(id),
  PRIMARY KEY (Student_ID, Kurs_ID)
);

-- Kurslärare
CREATE TABLE IF NOT EXISTS kursLärare (
  Kurs_ID INT REFERENCES kurs(id),
  Lärare_ID INT REFERENCES lärare(id),
  PRIMARY KEY (Kurs_ID, Lärare_ID)
);
