USE connectevent;
CREATE TABLE EVENT (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre  VARCHAR(255),
    event_time datetime,
    details TEXT
    );

CREATE TABLE Organisator (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(255)
    );

ALTER TABLE event
ADD COLUMN idplace INT;

CREATE TABLE Participants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    brithdate DATE,
    cin VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(255),
    address VARCHAR(255),
    username VARCHAR(255),
    password VARCHAR(255)
    );
ALTER TABLE Participants
RENAME Participant;

CREATE TABLE Place (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address TEXT,
    city VARCHAR(100),
    country VARCHAR(100),
    zipcode VARCHAR(20) 
);

CREATE TABLE Sponsor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    field VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(15),
    address VARCHAR(255)
);

ALTER TABLE event
ADD CONSTRAINT FOREIGN KEY (idplace) REFERENCES event (id);

DROP TABLE Event;

CREATE TABLE Event (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre  VARCHAR(255),
    event_time datetime,
    details TEXT,
    idplace INT,
    FOREIGN KEY (idplace) REFERENCES Place (id)
    );

CREATE TABLE Ticket (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categorie VARCHAR(255),
    price DECIMAL(10,2),
    idevent INT,
    idpartic INT,
    FOREIGN KEY (idevent) REFERENCES Event (id),
    FOREIGN KEY (idpartic) REFERENCES Participant (id) 
);

CREATE TABLE Animate (
    idorganis INT,
    idevent INT,
    FOREIGN KEY (idorganis) REFERENCES Organisator (id),
    FOREIGN KEY (idevent) REFERENCES Event (id)
);

CREATE TABLE Sponsorising (
    idsponsor INT,
    idevent INT,
    FOREIGN KEY (idsponsor) REFERENCES Sponsor (id),
    FOREIGN KEY (idevent) REFERENCES Event (id)
);

