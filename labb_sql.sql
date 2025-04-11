Create SCHEMA IF NOT EXISTS yrkeskolan;

SET SEARCH_path TO yrkeskolan; 

CREATE TABLE Adress (
    Adress_id INT PRIMARY KEY,
    Stad VARCHAR(100),
    gata VARCHAR(100),
    post_nummer VARCHAR(10)
);

CREATE TABLE personal_info (
    person_ID INT PRIMARY KEY,
    personnummer VARCHAR(20),
    Förnamn VARCHAR(50),
    Efternamn VARCHAR(50),
    E_post VARCHAR(100),
    telefonnummer VARCHAR(20),
    Anhörig_info VARCHAR(255)
);

CREATE TABLE skolan (
    skolan_ID INT PRIMARY KEY,
    Namn VARCHAR(100),
    organisationsnummer VARCHAR(50),
    E_post VARCHAR(100),
    telefonnummer VARCHAR(20),
    Asress_id INT,
    FOREIGN KEY (Asress_id) REFERENCES Adress(Adress_id)
);

CREATE TABLE anställd (
    Anställning_ID INT PRIMARY KEY,
    skol_ID INT,
    person_ID INT,
    FOREIGN KEY (skol_ID) REFERENCES skolan(skolan_ID),
    FOREIGN KEY (person_ID) REFERENCES personal_info(person_ID)
);

CREATE TABLE utbildningsledare (
    utbildningsledare_ID INT PRIMARY KEY,
    Anställning_ID INT,
    FOREIGN KEY (Anställning_ID) REFERENCES anställd(Anställning_ID)
);

CREATE TABLE kurs (
    Kurs_ID INT PRIMARY KEY,
    kurs_namn VARCHAR(100),
    kurs_kod VARCHAR(50),
    poäng INT,
    beskrivning VARCHAR(255)
);

CREATE TABLE lärare (
    lärare_ID INT PRIMARY KEY,
    Anställning_ID INT,
    kurs_id INT,
    FOREIGN KEY (Anställning_ID) REFERENCES anställd(Anställning_ID),
    FOREIGN KEY (kurs_id) REFERENCES kurs(Kurs_ID)
);

CREATE TABLE konsult (
    konsult_ID INT PRIMARY KEY,
    Anställning_ID INT,
    organisations_ID VARCHAR(50),
    utbildare_ID VARCHAR(50),
    kurs_ID INT,
    Adress_id INT,
    FOREIGN KEY (Anställning_ID) REFERENCES anställd(Anställning_ID),
    FOREIGN KEY (kurs_ID) REFERENCES kurs(Kurs_ID),
    FOREIGN KEY (Adress_id) REFERENCES Adress(Adress_id)
);

CREATE TABLE program (
    program_ID INT PRIMARY KEY,
    program_namn VARCHAR(100),
    skolan_id INT,
    FOREIGN KEY (skolan_id) REFERENCES skolan(skolan_ID)
);

CREATE TABLE Klass (
    klass_ID INT PRIMARY KEY,
    program_ID INT,
    Utbildningsledare_ID INT,
    FOREIGN KEY (program_ID) REFERENCES program(program_ID),
    FOREIGN KEY (Utbildningsledare_ID) REFERENCES utbildningsledare(utbildningsledare_ID)
);

CREATE TABLE student (
    student_ID INT PRIMARY KEY,
    person_ID INT,
    klass_ID INT,
    FOREIGN KEY (person_ID) REFERENCES personal_info(person_ID),
    FOREIGN KEY (klass_ID) REFERENCES Klass(klass_ID)
);

CREATE TABLE program_kurs (
    kurs_ID INT,
    program_ID INT,
    PRIMARY KEY (kurs_ID, program_ID),
    FOREIGN KEY (kurs_ID) REFERENCES kurs(Kurs_ID),
    FOREIGN KEY (program_ID) REFERENCES program(program_ID)
);

CREATE TABLE enrollment (
    student_ID INT,
    kurs_ID INT,
    PRIMARY KEY (student_ID, kurs_ID),
    FOREIGN KEY (student_ID) REFERENCES student(student_ID),
    FOREIGN KEY (kurs_ID) REFERENCES kurs(Kurs_ID)
);
