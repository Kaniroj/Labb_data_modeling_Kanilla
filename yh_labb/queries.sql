SET SEARCH_PATH TO yrkeskolan;

SELECT k.Klass_ID, pi.Förnamn || ' ' || pi.Efternamn AS Utbildningsledare
FROM Klass k
JOIN utbildningsledare ul ON k.Utbildningsledare_ID = ul.Utbildningsledare_ID
JOIN personal_info pi ON ul.Person_ID = pi.Person_ID
WHERE k.Klass_ID = 1;

SELECT p.Program_namn, k.Kurs_namn, pi.Förnamn || ' ' || pi.Efternamn AS Utbildare
FROM program p
JOIN program_kurs pk ON p.Program_ID = pk.Program_ID
JOIN kurs k ON pk.Kurs_ID = k.Kurs_ID
JOIN KursLärare kl ON k.Kurs_ID = kl.Kurs_ID
JOIN lärare l ON kl.Lärare_ID = l.Lärare_ID
JOIN personal_info pi ON l.Person_ID = pi.Person_ID
WHERE p.Program_namn = 'Systemutveckling';

SELECT p.Program_namn, COUNT(pk.Kurs_ID) AS Antal_kurser
FROM program p
JOIN program_kurs pk ON p.Program_ID = pk.Program_ID
WHERE p.Program_namn = 'Systemutveckling'
GROUP BY p.Program_namn;
