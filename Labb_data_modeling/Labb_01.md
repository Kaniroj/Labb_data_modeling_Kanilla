Labb_data_modeling

# Steg 1: Konceptuell modell
{   
- entiteter och deras relationer:
Student: studenter på YrkesCo.

Utbildare: De som undervisar, konsulter eller anställda.

Utbildningsledare: Ansvarar för klasser.

Kurs: Enskilda kurser med namn, kod, poäng och beskrivning.

Program: Ett program innehåller flera kurser och har klasser.

Klass: En specifik omgång av ett program (3 klasser per program).

Konsult: Utbildare kan vara konsulter med företagsinfo.



- Relationship Statements
Student  Klass: En student tillhör en klass, en klass har flera studenter (1:N).

Utbildningsledare  Klass: En utbildningsledare ansvarar för 3 klasser, en klass har en utbildningsledare (1:N, max 3).

Klass  Program: En klass är en omgång av ett program, ett program har 3 klasser (1:N).

Program  Kurs: Ett program innehåller flera kurser, en kurs kan ingå i flera program (M:N).

Kurs  Utbildare: En kurs undervisas av en eller flera utbildare, en utbildare kan undervisa flera kurser (M:N).

Utbildare  Konsult: En utbildare kan vara en konsult, en konsult är en utbildare (1:1)

  }
  ...

<img src = "../assets/conceptual-01.png">










