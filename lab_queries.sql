
-- Set the schema
SET SEARCH_PATH TO yrkeskolan;

-- 1. Get all students and their class info
SELECT s.student_ID, pi.Förnamn, pi.Efternamn, k.klass_ID, p.program_namn
FROM student s
JOIN personal_info pi ON s.person_ID = pi.person_ID
JOIN Klass k ON s.klass_ID = k.klass_ID
JOIN program p ON k.program_ID = p.program_ID;

-- 2. List all courses and the teachers assigned to them
SET SEARCH_PATH TO yrkeskolan;
SELECT ku.kurs_namn, pi.Förnamn, pi.Efternamn
FROM lärare l
JOIN anställd a ON l.Anställning_ID = a.Anställning_ID
JOIN personal_info pi ON a.person_ID = pi.person_ID
JOIN kurs ku ON l.kurs_id = ku.Kurs_ID;

-- 3. Show all students enrolled in "Databaser" course
SET SEARCH_PATH TO yrkeskolan;
SELECT pi.Förnamn, pi.Efternamn, ku.kurs_namn
FROM enrollment e
JOIN student s ON e.student_ID = s.student_ID
JOIN personal_info pi ON s.person_ID = pi.person_ID
JOIN kurs ku ON e.kurs_ID = ku.Kurs_ID
WHERE ku.kurs_namn = 'Databaser';

-- 4. Find all schools and their addresses
SET SEARCH_PATH TO yrkeskolan;
SELECT sk.Namn, a.Stad, a.gata, a.post_nummer
FROM skolan sk
JOIN Adress a ON sk.Asress_id = a.Adress_id;

-- 5. Get the full list of programs with their assigned utbildningsledare
SET SEARCH_PATH TO yrkeskolan;
SELECT p.program_namn, pi.Förnamn, pi.Efternamn
FROM program p
JOIN Klass k ON p.program_ID = k.program_ID
JOIN utbildningsledare u ON k.Utbildningsledare_ID = u.utbildningsledare_ID
JOIN anställd a ON u.Anställning_ID = a.Anställning_ID
JOIN personal_info pi ON a.person_ID = pi.person_ID;

SELECT 
  k.Kurs_namn,
  k.Kurs_kod,
  pi.Förnamn || ' ' || pi.Efternamn AS Lärare_Namn
FROM KursLärare kl
JOIN kurs k ON kl.Kurs_ID = k.Kurs_ID
JOIN lärare l ON kl.Lärare_ID = l.Lärare_ID
JOIN anställd a ON l.Anställning_ID = a.Anställning_ID
JOIN personal_info pi ON a.Person_ID = pi.Person_ID
ORDER BY k.Kurs_namn, Lärare_Namn;

