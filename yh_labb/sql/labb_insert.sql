-- Testdata
INSERT INTO Adress (Stad, Gata, Postnummer) VALUES
('Stockholm', 'Sveavägen 10', '11157'),
('Göteborg', 'Avenyn 5', '41136'),
('Malmö', 'Storgatan 3', '21145');

INSERT INTO personal_info (Personnummer, Förnamn, Efternamn, E_post, Telefonnummer) VALUES
('19900101-1234', 'Anna', 'Svensson', 'anna@example.com', '0701234567'),
('19851212-4321', 'Erik', 'Johansson', 'erik@example.com', '0707654321'),
('19951130-6789', 'Maria', 'Andersson', 'maria@example.com', '0709876543');

INSERT INTO skolan (Namn, Organisationsnummer, E_post, Telefonnummer, Adress_id) VALUES
('Tekniska Institutet', '556677-8899', 'kontakt@ti.se', '085550000', 1),
('Handelsakademin', '112233-4455', 'info@ha.se', '031700000', 2);

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
('ORG-001', 'DataPartner AB', 'Eva Karlsson');

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

INSERT INTO program_kurs VALUES
(1, 1),
(2, 1);

INSERT INTO enrollment VALUES
(1, 1),
(2, 2);

INSERT INTO KursLärare VALUES
(1, 1),
(1, 2),
(2, 2);