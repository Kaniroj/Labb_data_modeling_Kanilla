Table Adress {
  Adress_id int [pk]
  Stad varchar(100)
  gata varchar(100)
  post_nummer varchar(10)
}

Table personal_info {
  person_ID int [pk]
  personnummer varchar(20)
  Förnamn varchar(50)
  Efternamn varchar(50)
  E_post varchar(100)
  telefonnummer varchar(20)
  Anhörig_info varchar(255)
}

Table skolan {
  skolan_ID int [pk]
  Namn varchar(100)
  organisationsnummer varchar(50)
  E_post varchar(100)
  telefonnummer varchar(20)
  Asress_id int
}

Table anställd {
  Anställning_ID int [pk]
  skol_ID int
  person_ID int
}

Table utbildningsledare {
  utbildningsledare_ID int [pk]
  Anställning_ID int
}

Table kurs {
  Kurs_ID int [pk]
  kurs_namn varchar(100)
  kurs_kod varchar(50)
  poäng int
  beskrivning varchar(255)
}

Table lärare {
  lärare_ID int [pk]
  Anställning_ID int
  kurs_id int
}

Table konsult {
  konsult_ID int [pk]
  Anställning_ID int
  organisations_ID varchar(50)
  utbildare_ID varchar(50)
  kurs_ID int
  Adress_id int
}

Table program {
  program_ID int [pk]
  program_namn varchar(100)
  skolan_id int
}

Table Klass {
  klass_ID int [pk]
  program_ID int
  Utbildningsledare_ID int
}

Table student {
  student_ID int [pk]
  person_ID int
  klass_ID int
}

Table program_kurs {
  kurs_ID int
  program_ID int

  Primary Key (kurs_ID, program_ID)
}

Table enrollment {
  student_ID int
  kurs_ID int

  Primary Key (student_ID, kurs_ID)
}


Ref: skolan.Asress_id > Adress.Adress_id
Ref: anställd.skol_ID > skolan.skolan_ID
Ref: anställd.person_ID > personal_info.person_ID
Ref: utbildningsledare.Anställning_ID > anställd.Anställning_ID
Ref: lärare.Anställning_ID > anställd.Anställning_ID
Ref: lärare.kurs_id > kurs.Kurs_ID
Ref: konsult.Anställning_ID > anställd.Anställning_ID
Ref: konsult.kurs_ID > kurs.Kurs_ID
Ref: konsult.Adress_id > Adress.Adress_id
Ref: program.skolan_id > skolan.skolan_ID
Ref: Klass.program_ID > program.program_ID
Ref: Klass.Utbildningsledare_ID > utbildningsledare.utbildningsledare_ID
Ref: student.person_ID > personal_info.person_ID
Ref: student.klass_ID > Klass.klass_ID
Ref: program_kurs.kurs_ID > kurs.Kurs_ID
Ref: program_kurs.program_ID > program.program_ID
Ref: enrollment.student_ID > student.student_ID
Ref: enrollment.kurs_ID > kurs.Kurs_ID
