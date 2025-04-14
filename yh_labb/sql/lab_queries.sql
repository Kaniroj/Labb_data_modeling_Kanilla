
-- 1. Alla adresser
SELECT * FROM adress;


-- 2. All personalinformation
SELECT * FROM personal_info;

-- 3. Alla anhöriga kopplade till personer
SELECT 
  pi.Förnamn,
  pi.Efternamn,
  a.Relation,
  a.Namn AS Anhörig_namn
FROM anhörig a
JOIN personal_info pi ON a.Person_ID = pi.id;

-- 4. Alla skolor och deras adress
SELECT 
  sk.Namn AS Skola,
  sk.Organisationsnummer,
  a.Gata,
  a.Stad,
  a.Postnummer
FROM skolan sk
JOIN adress a ON sk.Adress_id = a.id;

-- 5. Alla anställda och vilken skola de tillhör
SELECT 
  pi.Förnamn,
  pi.Efternamn,
  sk.Namn AS Skola
FROM anställd an
JOIN personal_info pi ON an.Person_ID = pi.id
JOIN skolan sk ON an.Skolan_ID = sk.id;

-- 6. Alla utbildningsledare
SELECT 
  pi.Förnamn,
  pi.Efternamn
FROM utbildningsledare ul
JOIN anställd an ON ul.Anställning_ID = an.id
JOIN personal_info pi ON an.Person_ID = pi.id;

-- 7. Alla lärare
SELECT 
  pi.Förnamn,
  pi.Efternamn
FROM lärare l
JOIN anställd an ON l.Anställning_ID = an.id
JOIN personal_info pi ON an.Person_ID = pi.id;

-- 8. Alla kurser
SELECT * FROM kurs;

-- 9. Alla organisationer
SELECT * FROM organisation;

-- 10. Alla konsulter och deras organisationer
SELECT 
  pi.Förnamn,
  pi.Efternamn,
  o.Namn AS Organisation,
  k.Utbildare_ID,
  ku.Kurs_namn
FROM konsult k
JOIN anställd an ON k.Anställning_ID = an.id
JOIN personal_info pi ON an.Person_ID = pi.id
JOIN organisation o ON k.Organisation_ID = o.id
JOIN kurs ku ON k.Kurs_ID = ku.id;

-- 11. Alla program
SELECT * FROM program;

-- 12. Alla klasser och tillhörande utbildningsledare
SELECT 
  kl.id AS Klass_ID,
  p.Program_namn,
  pi.Förnamn AS LedareFörnamn,
  pi.Efternamn AS LedareEfternamn
FROM klass kl
JOIN program p ON kl.Program_ID = p.id
JOIN utbildningsledare ul ON kl.Utbildningsledare_ID = ul.id
JOIN anställd an ON ul.Anställning_ID = an.id
JOIN personal_info pi ON an.Person_ID = pi.id;

-- 13. Alla studenter och deras klass
SELECT 
  s.id AS Student_ID,
  pi.Förnamn,
  pi.Efternamn,
  p.Program_namn
FROM student s
JOIN personal_info pi ON s.Person_ID = pi.id
JOIN klass k ON s.Klass_ID = k.id
JOIN program p ON k.Program_ID = p.id;

-- 14. Kurser som tillhör ett program
SELECT 
  p.Program_namn,
  k.Kurs_namn,
  k.Kurs_kod
FROM program_kurs pk
JOIN program p ON pk.Program_ID = p.id
JOIN kurs k ON pk.Kurs_ID = k.id;

-- 15. Studenter och vilka kurser de är registrerade på
SELECT 
  pi.Förnamn,
  pi.Efternamn,
  k.Kurs_namn
FROM enrollment e
JOIN student s ON e.Student_ID = s.id
JOIN personal_info pi ON s.Person_ID = pi.id
JOIN kurs k ON e.Kurs_ID = k.id;

-- 16. Lärare och vilka kurser de undervisar
SELECT 
  pi.Förnamn,
  pi.Efternamn,
  k.Kurs_namn
FROM kursLärare kl
JOIN lärare l ON kl.Lärare_ID = l.id
JOIN anställd an ON l.Anställning_ID = an.id
JOIN personal_info pi ON an.Person_ID = pi.id
JOIN kurs k ON kl.Kurs_ID = k.id;






