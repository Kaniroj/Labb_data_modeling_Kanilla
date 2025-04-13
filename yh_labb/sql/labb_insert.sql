SET search_path TO yrkeskolan;

-- Adresser
INSERT INTO adress (Stad, Gata, Postnummer) VALUES
('Stockholm', 'Sveavägen 1', '11157'),
('Göteborg', 'Avenyn 12', '41136'),
('Malmö', 'Stora Nygatan 3', '21137');

-- Personal Info (spara ID:n)
WITH p AS (
  INSERT INTO personal_info (Personnummer, Förnamn, Efternamn, E_post, Telefonnummer) VALUES
  ('800101-1234', 'Anna', 'Svensson', 'anna@exempel.se', '0701234567'),
  ('820202-2345', 'Björn', 'Karlsson', 'bjorn@exempel.se', '0702345678'),
  ('830303-3456', 'Cecilia', 'Lind', 'cecilia@exempel.se', '0703456789'),
  ('840404-4567', 'David', 'Nilsson', 'david@exempel.se', '0704567890'),
  ('850505-5678', 'Eva', 'Johansson', 'eva@exempel.se', '0705678901')
  RETURNING id, Förnamn
)
SELECT * FROM p;

-- Skola
INSERT INTO skolan (Namn, Organisationsnummer, E_post, Telefonnummer, Adress_id) VALUES
('Yrkeskolan Stockholm', '556677-8899', 'info@yrkessthlm.se', '086611234', 1);

-- Anställda
INSERT INTO anställd (Skolan_ID, Person_ID) VALUES
(1, 1), (1, 2), (1, 3);

-- Utbildningsledare
INSERT INTO utbildningsledare (Anställning_ID) VALUES (1);

-- Lärare
INSERT INTO lärare (Anställning_ID) VALUES (2), (3);

-- Kurser
INSERT INTO kurs (Kurs_namn, Kurs_kod, Poäng, Beskrivning) VALUES
('Databasteknik', 'DB101', 10, 'Introduktion till databaser'),
('Webbutveckling', 'WEB201', 15, 'Bygga webbapplikationer'),
('Systemutveckling', 'SYS301', 20, 'Design och implementation av system');

-- Organisation
INSERT INTO organisation (Namn, Kontaktperson) VALUES
('Tech AB', 'Lisa Andersson');

-- Konsulter
INSERT INTO konsult (Anställning_ID, Organisation_ID, Utbildare_ID, Kurs_ID, Adress_id) VALUES
(3, 1, 'K001', 2, 2);

-- Program
INSERT INTO program (Program_namn, Skolan_ID) VALUES
('Systemutvecklare .NET', 1);

-- Klass
INSERT INTO klass (Program_ID, Utbildningsledare_ID) VALUES
(1, 1);

-- Studenter
INSERT INTO student (Person_ID, Klass_ID) VALUES
(4, 1), (5, 1);

-- Anhöriga (använd rätt Person_ID från personal_info)
INSERT INTO anhörig (Person_ID, Relation, Namn) VALUES
(4, 'Mor', 'Maria Svensson'),
(5, 'Far', 'Karl Karlsson');

-- Program-Kurser
INSERT INTO program_kurs (Kurs_ID, Program_ID) VALUES
(1, 1),
(2, 1),
(3, 1);

-- Enrollment
INSERT INTO enrollment (Student_ID, Kurs_ID) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3);

-- Kurslärare
INSERT INTO kursLärare (Kurs_ID, Lärare_ID) VALUES
(1, 1), 
(2, 2), 
(3, 1);
