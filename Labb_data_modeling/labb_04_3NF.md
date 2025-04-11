Steg 4: Argumentera för 3NF
Förklaring: Vi kontrollerar att modellen uppfyller normalformerna (1NF, 2NF, 3NF).
1NF (Första normalformen):
Alla värden är atomära (inga listor eller grupper i kolumner).

Varje tabell har en primärnyckel.

Uppfyllt!

2NF (Andra normalformen):
Kräver 1NF + alla icke-nyckelattribut måste bero på hela primärnyckeln.

T.ex. i Student beror Förnamn, Efternamn osv. på StudentID, inte bara en del av nyckeln.

I ProgramKurs (sammansatt nyckel) beror inga extra attribut på bara ProgramID eller KursID – tabellen har bara nycklar.

Uppfyllt!

3NF (Tredje normalformen):
Kräver 2NF + inga transitiva beroenden (icke-nyckelattribut får inte bero på andra icke-nyckelattribut).

T.ex. i Student beror Email på StudentID, inte på Förnamn eller Efternamn.

I Kurs beror Beskrivning på KursID, inte på Namn eller Kurskod.

Bonus: I Konsult beror ArvodePerTimma på KonsultID, inte på Företag.

Uppfyllt!

Slutsats: Modellen är i 3NF eftersom redundans är eliminerad, och alla attribut är direkt beroende av primärnycklar utan transitiva beroenden.

