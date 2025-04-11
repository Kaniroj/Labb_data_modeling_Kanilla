

# Steg 2: Logisk modell
{   
Entiteter och attribut
Student: StudentID (PK), Förnamn, Efternamn,Personnummer, Email
Utbildare: UtbildareID (PK), Förnam, Efternamn
Utbildningsledare: UtbildningsledareID (PK), Förnamn, Efternamn, Email
Kurs: KursID (PK), Namn, Kurskod, Poäng, Beskrivning
Program: ProgramID (PK), Namn
Klass: KlassID (PK), ProgramID (FK), UtbildningsledareID (FK)

# Kopplingstabeller för M:N-relationer


ProgramKurs (Program  Kurs):, ProgramID (FK), KursID (FK)
KursUtbildare (Kurs  Utbildare): KursID (FK), UtbildareID (FK)

# Logisk modell (textbeskrivning)
Student: StudentID (PK), Förnamn, Efternamn, Personnummer, Email, KlassID (FK)
Utbildare: UtbildareID (PK), Förnamn, Efternamn, Typ
Utbildningsledare: UtbildningsledareID (PK), Förnamn, Efternamn, Email
Kurs: KursID (PK), Namn, Kurskod, Poäng, Beskrivning
Program: ProgramID (PK), Namn
Klass: KlassID (PK), ProgramID (FK), UtbildningsledareID (FK), AnläggningID (FK)
ProgramKurs: ProgramID (FK), KursID (FK)
KursUtbildare: KursID (FK), UtbildareID (FK)    }
...

<img src = "../assets/Labb_02_logikal.png>




