
SET SEARCH_path TO yrkeskolan; 

-- Create schema and set path
CREATE SCHEMA IF NOT EXISTS yrkeskolan;
SET SEARCH_PATH TO yrkeskolan;

-- Insert sample data into Adress
INSERT INTO Adress VALUES
(1, 'Stockholm', 'Sveavägen 10', '11157'),
(2, 'Göteborg', 'Avenyn 5', '41136'),
(3, 'Malmö', 'Storgatan 3', '21145');

-- Insert sample data into personal_info
INSERT INTO personal_info VALUES
(1, '19900101-1234', 'Anna', 'Svensson', 'anna@example.com', '0701234567', 'Mamma: Eva Svensson'),
(2, '19851212-4321', 'Erik', 'Johansson', 'erik@example.com', '0707654321', 'Bror: Lars Johansson'),
(3, '19951130-6789', 'Maria', 'Andersson', 'maria@example.com', '0709876543', 'Far: Bengt Andersson');

-- Insert sample data into skolan
INSERT INTO skolan VALUES
(1, 'Tekniska Institutet', '556677-8899', 'kontakt@ti.se', '085550000', 1),
(2, 'Handelsakademin', '112233-4455', 'info@ha.se', '031700000', 2);

-- Insert sample data into anställd
INSERT INTO anställd VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

-- Insert sample data into utbildningsledare
INSERT INTO utbildningsledare VALUES
(1, 1);

-- Insert sample data into kurs
INSERT INTO kurs VALUES
(1, 'Programmering 1', 'PRG1', 100, 'Introduktion till programmering'),
(2, 'Databaser', 'DB1', 100, 'Grundläggande databashantering');

-- Insert sample data into lärare
INSERT INTO lärare VALUES
(1, 2, 1),
(2, 3, 2);

-- Insert sample data into konsult
INSERT INTO konsult VALUES
(1, 3, 'ORG-001', 'UTB-001', 2, 3);

-- Insert sample data into program
INSERT INTO program VALUES
(1, 'Systemutveckling', 1),
(2, 'Ekonomi', 2);

-- Insert sample data into Klass
INSERT INTO Klass VALUES
(1, 1, 1);

-- Insert sample data into student
INSERT INTO student VALUES
(1, 2, 1),
(2, 3, 1);

-- Insert sample data into program_kurs
INSERT INTO program_kurs VALUES
(1, 1),
(2, 1);

-- Insert sample data into enrollment
INSERT INTO enrollment VALUES
(1, 1),
(2, 2);
