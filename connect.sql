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

--INSERTION DES ENTREES 1e test

INSERT INTO Participant (firstname, lastname, brithdate, cin, phone, email, address, username, password ) VALUES ('Abdelali', 'TAHA','1993-01-07', 'JK856594', '+212603189492', 'abdeltahaali@gmail.com', 'NR 35 RUE 8 HAY ERAKKI', 'detoyas', '5f4dcc3b5aa765d61d8327deb882cf99');

-- SUPPRESSION DES ENTREES
DELETE From participant Where id  in (2,3);

-- INSERTION DES DONNEES: Participant
INSERT INTO Participant VALUES ('1', 'Najib', 'AMHALI', '1995-05-26', 'BK542567', '+212568548485', 'najmahlinajib@yahoo.com', 'NR5 BOULEVARD HASSAN 2', 'najibali', '6d23daa2be7acb71854879e709be68a7cb563017' );
INSERT INTO Participant (firstname, lastname, brithdate, cin, phone, email, address, username, password ) VALUES 
('John', 'Doe', '1995-03-15', 'AB123456', '+1234567890', 'john.doe@example.com', '123 Main St', 'john_doe', 'c4ca4238a0b923820dcc509a6f75849b'),
('Alice', 'Smith', '1988-07-22', 'CD789012', '+0987654321', 'alice.smith@example.com', '456 Oak Ave', 'alice_smith', 'c81e728d9d4c2f636f067f89cc14862c'),
('Bob', 'Johnson', '1990-11-03', 'EF345678', '+1122334455', 'bob.johnson@example.com', '789 Pine Rd', 'bob_johnson', 'eccbc87e4b5ce2fe28308fd9f2a7baf3'),
('Emily', 'Jones', '1985-05-08', 'GH901234', '+3344556677', 'emily.jones@example.com', '101 Cedar Ln', 'emily_jones', 'a87ff679a2f3e71d9181a67b7542122c'),
('Michael', 'Williams', '1992-09-18', 'IJ567890', '+5566778899', 'michael.williams@example.com', '202 Elm Blvd', 'michael_williams', 'e4da3b7fbbce2345d7772b0674a318d5'),
('Sophia', 'Brown', '1980-12-05', 'KL123456', '+9988776655', 'sophia.brown@example.com', '303 Birch Ct', 'sophia_brown', '1679091c5a880faf6fb5e6087eb1b2dc'),
('Emma', 'Miller', '1987-04-12', 'MN345678', '+7777888899', 'emma.miller@example.com', '404 Maple St', 'emma_miller', '8f14e45fceea167a5a36dedd4bea2543'),
('Daniel', 'Wilson', '1998-08-25', 'OP567890', '+1122334455', 'daniel.wilson@example.com', '505 Oak Ave', 'daniel_wilson', 'c9f0f895fb98ab9159f51fd0297e236d'),
('Olivia', 'Taylor', '1993-01-30', 'QR123456', '+3344556677', 'olivia.taylor@example.com', '606 Pine Rd', 'olivia_taylor', '45c48cce2e2d7fbdea1afc51c7c6ad26'),
('Matthew', 'Clark', '1984-06-17', 'ST789012', '+5566778899', 'matthew.clark@example.com', '707 Cedar Ln', 'matthew_clark', 'd3d9446802a44259755d38e6d163e820'),
('Ava', 'Anderson', '1990-09-08', 'UV901234', '+9988776655', 'ava.anderson@example.com', '808 Elm Blvd', 'ava_anderson', '6512bd43d9caa6e02c990b0a82652dca'),
('Liam', 'Moore', '1982-12-01', 'WX567890', '+1234567890', 'liam.moore@example.com', '909 Birch Ct', 'liam_moore', 'c20ad4d76fe97759aa27a0c99bff6710'),
('Ella', 'Thomas', '1995-02-14', 'YZ123456', '+0987654321', 'ella.thomas@example.com', '1010 Maple St', 'ella_thomas', 'c51ce410c124a10e0db5e4b97fc2af39'),
('Noah', 'Roberts', '1989-07-29', 'AB678901', '+7777888899', 'noah.roberts@example.com', '111 Oak Ave', 'noah_roberts', 'c4ca4238a0b923820dcc509a6f75849b'),
('Isabella', 'Lee', '1996-11-05', 'CD234567', '+3344556677', 'isabella.lee@example.com', '1212 Pine Rd', 'isabella_lee', 'c81e728d9d4c2f636f067f89cc14862c'),
('Logan', 'Baker', '1986-03-22', 'EF789012', '+1122334455', 'logan.baker@example.com', '1313 Cedar Ln', 'logan_baker', 'eccbc87e4b5ce2fe28308fd9f2a7baf3');
-- INSERTION DES DONNEES: Organisator
INSERT INTO organisator VALUES (10, 'Tawfik', 'MOULNAKHLA', '+21256558585', 'moulnakhla@ticket.ma');
INSERT INTO organisator VALUES (11, 'Hamza', 'SBAI', '+212528383451', 'yallahassociation@gmail.com');
INSERT INTO organisator (firstname, lastname, phone, email) VALUES ('Hamza', 'SBAI', '+212528383451', 'yallahassociation@gmail.com');

INSERT INTO Organisator VALUES
(12, 'Sarah', 'JOHNSON', '+14155552671', 'sarah.johnson@example.com'),
(13, 'Ahmed', 'ALI', '+212666123456', 'ahmed.ali@example.com'),
(14, 'Emily', 'WANG', '+12065551234', 'emily.wang@example.com'),
(15, 'Carlos', 'GARCIA', '+34911234567', 'carlos.garcia@example.com'),
(16, 'Sophie', 'DUBOIS', '+33123456789', 'sophie.dubois@example.com'),
(17, 'Yusuf', 'KIM', '+821012345678', 'yusuf.kim@example.com'),
(18, 'Mia', 'SATO', '+81345678901', 'mia.sato@example.com'),
(19, 'Luca', 'FERRARI', '+390123456789', 'luca.ferrari@example.com'),
(20, 'Olivia', 'GOMEZ', '+34123456789', 'olivia.gomez@example.com'),
(21, 'Liam', 'CHO', '+82123456789', 'liam.cho@example.com');
DELETE FROM organisator WHERE id in (12,13);
-- INSERTION MULTIPLES ENTREES
INSERT INTO place VALUES 
(15, 'Complex MED V. 18 Bvd Zerktouni Hay Agdal', 'CASABLANCA','MOROCCO', 800000),
(20, 'THEATRE ROYALE. Rue Mohamed Jazouli', 'RABAT','MOROCCO' , 285830),
(14, 'Cinéma Galerie de la Reine 26', 'BRUSSELS', 'BELGIUM', 80000);

INSERT INTO Place VALUES
(25, 'Stadium Street 42', 'NEW YORK', 'USA', 500000),
(30, 'Convention Center Plaza 10', 'LOS ANGELES', 'USA', 200000),
(18, 'Opera House Square 15', 'PARIS', 'FRANCE', 350000),
(35, 'Festival Hall 8', 'SYDNEY', 'AUSTRALIA', 150000),
(40, 'Exhibition Center Street 5', 'TORONTO', 'CANADA', 180000),
(22, 'Amphitheater Avenue 12', 'ROME', 'ITALY', 120000),
(45, 'Sports Complex Lane 30', 'TOKYO', 'JAPAN', 250000),
(50, 'Arena Square 3', 'MOSCOW', 'RUSSIA', 300000),
(27, 'Performance Hall 17', 'BARCELONA', 'SPAIN', 100000),
(55, 'Music Arena Road 22', 'BERLIN', 'GERMANY', 220000),
(60, 'Expo Center Drive 7', 'DUBAI', 'UAE', 280000),
(33, 'Civic Center Boulevard 14', 'SAN FRANCISCO', 'USA', 160000),
(70, 'Community Hall Street 25', 'LONDON', 'UK', 200000);
INSERT INTO place VALUES (10, 'Megarama Marrakech', 'Marrakech', 'MOROCCO', 254875);
INSERT INTO Sponsor (name, field, email, phone, address) VALUES
("ABC Corporation", "Technology", "abc.corp@example.com", "+1234567890", "123 Tech Street, City"),
("XYZ Industries", "Manufacturing", "xyz.industries@example.com", "+9876543210", "456 Factory Lane, Town"),
("Global Finance Inc.", "Finance", "global.finance@example.com", "+1122334455", "789 Wall Street, Metropolis"),
("Tech Innovators Ltd.", "Information Technology", "tech.innovators@example.com", "+3344556677", "101 Silicon Valley, Tech City"),
("Green Energy Solutions", "Renewable Energy", "green.energy@example.com", "+5566778899", "202 Eco Street, Green Town"),
("Luxury Brands Group", "Fashion", "luxury.brands@example.com", "+9988776655", "303 Fashion Avenue, Style City"),
("Healthcare Partners LLC", "Healthcare", "healthcare.partners@example.com", "+1234567890", "404 Wellness Boulevard, Health Town"),
("Foodie Delights Co.", "Food and Beverage", "foodie.delights@example.com", "+7777888899", "505 Culinary Street, Flavor City"),
("Travel Ventures Ltd.", "Travel and Tourism", "travel.ventures@example.com", "+1122334455", "606 Adventure Lane, Explore City"),
("Entertainment Studios", "Media and Entertainment", "entertainment.studios@example.com", "+3344556677", "707 Star Street, Hollywood");
INSERT INTO event VALUES
(1, 'ART Workshop', '2024-04-13 20:00:00', 'Altelier apprentissage art abstract', 20),
(3, 'Musique LIVE', '2024-05-26 19:00:00', 'Symphonie Musique Andalousse', 15),
(5, 'Diffusion du Film', '2024-05-26 21:00:00', 'Tranquility', 10),
(6, 'Shakespearian Theatre', '2024-03-02 19:00:00', 'Macbeth', 14);

INSERT INTO ticket (categorie, price, idevent, idpartic) VALUES
('A', 150.00, 2, 4),
('B', 250.00, 3,  1),
('VIP', 50.00, 6, 5),
('GOLD', 70.00, 6, 5);
 
INSERT INTO animate(idorganis, idevent) VALUES
(11 , 1),
(12, 2);

INSERT INTO sponsorising (idsponsor, idevent) VALUES
(1, 3),
(2, 1),
(3, 2),
(4, 6);

INSERT INTO event VALUES
(2, 'Match Football', '2023-05-26 19:00:00', 'Finale CAF Champions League', 15);

--INSERTION DES SPONSORS
INSERT INTO sponsor (name, field, email, phone, address) VALUES ("OCP Group", "Mining", "sponsorising@ocpgroup.ma", "+212548494949", "18 Hay Tacharouk Khouribga");

-- MODIFICATION DES ENTREES
UPDATE Participant SET cin = 'KL256896' WHERE id = 1;
UPDATE Participant SET cin = 'NW226625', firstname='Ali' WHERE id = 4;

UPDATE event SET idplace = 20 WHERE id = 3;

-- AFFICHAGE
SELECT firstname, lastname FROM Participant;
SELECT firstname, lastname FROM Participant WHERE id = 4;

SELECT * FROM participant;
SELECT * FROM participant ORDER BY firstname;

SELECT firstname, lastname FROM participant WHERE id = 15;
Select * FROM event WHERE idplace= 20 AND id = 3;
Select * FROM event WHERE idplace= 20 OR idplace = 14;

SELECT firstname AS 'prenom' , lastname AS 'nom' FROM participant;

SELECT COUNT (firstname) AS 'Nombre de participants' FROM participant;

SELECT field 
FROM sponsor 
ORDER BY name DESC;

SELECT firstname, lastname, cin FROM participant WHERE cin LIKE '_T%2';
SELECT firstname, lastname FROM participant WHERE id BETWEEN 1 AND 5;

SELECT * FROM event ;