-- Created by Sebastian de la Garza (and IntelliSense from Visual Studio Code)
CREATE DATABASE testdb2;

USE testdb2;

CREATE TABLE videos (
    catalogNo INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    certificate VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    dailyRental VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL,
    DirectorNo INT NOT NULL,
    FOREIGN KEY (DirectorNo) REFERENCES Directors(DirectorNo)
);

CREATE TABLE Directors (
    DirectorNo INT AUTO_INCREMENT PRIMARY KEY,
    DirectorName VARCHAR(50) NOT NULL
);

CREATE TABLE VideosForRent (
    videoNo INT AUTO_INCREMENT PRIMARY KEY,
    available VARCHAR(10) NOT NULL,
    catalogNo INT NOT NULL,
    FOREIGN KEY (catalogNo) REFERENCES videos(catalogNo)
);

CREATE TABLE Members (
    memberNo INT AUTO_INCREMENT PRIMARY KEY,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50),
    sex VARCHAR(10),
    DOB DATE,
    address VARCHAR(100) NOT NULL,
    dateJoined DATE NOT NULL
);

CREATE TABLE RentalAgreements (
    rentalNo INT AUTO_INCREMENT PRIMARY KEY,
    memberNo INT NOT NULL,
    FOREIGN KEY (memberNo) REFERENCES Members(memberNo),
    videoNo INT NOT NULL,
    FOREIGN KEY (videoNo) REFERENCES VideosForRent(videoNo),
    dateOut DATE NOT NULL,
    dateReturn DATE
);

INSERT INTO videos (title, certificate, category, dailyRental, price, DirectorNo)
VALUES ("Sully", "PG-13", "Drama", 4, 2.99, 4);

INSERT INTO videos (title, certificate, category, dailyRental, price, DirectorNo)
VALUES ("The Shawshank Redemption", "R", "Drama", 5, 2.99, 1);

INSERT INTO videos (title, certificate, category, dailyRental, price, DirectorNo)
VALUES ("Avengers: Endgame", "PG-13", "Action", 7, 3.99, 5);

INSERT INTO videos (title, certificate, category, dailyRental, price, DirectorNo)
VALUES ("The Dark Knight", "PG-13", "Action", 5, 3.99, 2);

INSERT INTO videos (title, certificate, category, dailyRental, price, DirectorNo)
VALUES ("Inception", "PG-13", "Sci-Fi", 3, 4.99, 3);

INSERT INTO videos (title, certificate, category, dailyRental, price, DirectorNo)
VALUES ("Jurassic Park", "PG-13", "Adventure", 4, 2.99, 6);


INSERT INTO Directors (DirectorName)
VALUES ("Frank Darabont");

INSERT INTO Directors (DirectorName)
VALUES ("Christopher Nolan");

INSERT INTO Directors (DirectorName)
VALUES ("Steven Spielberg");   

INSERT INTO Directors (DirectorName)
VALUES ("Clint Eastwood");

INSERT INTO Directors (DirectorName)
VALUES ("Anthony Russo & Joe Russo");


INSERT INTO VideosForRent (available, catalogNo)
VALUES ("Yes", 1);

INSERT INTO VideosForRent (available, catalogNo)
VALUES ("Yes", 2);

INSERT INTO VideosForRent (available, catalogNo)
VALUES ("No", 3);

INSERT INTO VideosForRent (available, catalogNo)
VALUES ("Yes", 4);

INSERT INTO VideosForRent (available, catalogNo)
VALUES ("No", 5);

INSERT INTO VideosForRent (available, catalogNo)
VALUES ("Yes", 5);

INSERT INTO VideosForRent (available, catalogNo)
VALUES ("No", 2);


INSERT INTO Members (fName, lName, sex, DOB, address, dateJoined)
VALUES ("Lorna", "Smith", "Female", "1990-05-14", "123 Main St, Springfield", "2022-01-10");

INSERT INTO Members (fName, DOB, address, dateJoined)
VALUES ("StayHome", "1985-11-23", "456 Elm St, Shelbyville", "1999-06-15");

INSERT INTO Members (fName, lName, sex, DOB, address, dateJoined)
VALUES ("Mike", "Johnson", "Male", "1978-02-28", "789 Oak St, Capital City", "2020-09-05");

INSERT INTO Members (fName, lName, sex, DOB, address, dateJoined)
VALUES ("Emily", "Davis", "Female", "1995-07-19", "321 Pine St, Ogdenville", "2023-03-22");

INSERT INTO Members (fName, lName, sex, DOB, address, dateJoined)
VALUES ("John", "Williams", "Male", "1982-12-11", "654 Maple St, North Haverbrook", "2021-11-30");

INSERT INTO Members (fName, DOB, address, dateJoined)
VALUES ("Flix Co." , "2000-04-05", "987 Cedar St, Brockway", "2005-08-18");

INSERT INTO Members (fName, lName, sex, DOB, address, dateJoined)
VALUES ("John", "Cast", "Male", "1993-09-30", "159 Walnut St, Springfield", "2024-02-14");

INSERT INTO Members (fName, lName, sex, DOB, address, dateJoined)
VALUES ("Anna", "Stevenson", "Female", "1988-03-22", "753 Birch St, Shelbyville", "2022-12-01");

INSERT INTO Members (fName, address, dateJoined)
VALUES ("Portable Cinema Ltd.", "852 Spruce St, Capital City", "2019-05-20");

INSERT INTO Members (fName, lName, sex, DOB, address, dateJoined)
VALUES ("James", "Brown", "Male", "1990-05-14", "147 Chestnut St, Ogdenville", "2020-10-10");


INSERT INTO RentalAgreements (memberNo, videoNo, dateOut, dateReturn)
VALUES (1, 2, "2024-06-01", "2024-06-05");

INSERT INTO RentalAgreements (memberNo, videoNo, dateOut, dateReturn)
VALUES (3, 1, "2024-06-03", "2024-06-07");

INSERT INTO RentalAgreements (memberNo, videoNo, dateOut, dateReturn)
VALUES (2, 4, "2024-06-02", "2024-06-06");

INSERT INTO RentalAgreements (memberNo, videoNo, dateOut, dateReturn)
VALUES (4, 5, "2024-06-04", "2024-06-08");

INSERT INTO RentalAgreements (memberNo, videoNo, dateOut, dateReturn)
VALUES (1, 3, "2024-06-05", "2024-06-10");

INSERT INTO RentalAgreements (memberNo, videoNo, dateOut, dateReturn)
VALUES (5, 6, "2024-06-06", "2024-06-12");

INSERT INTO RentalAgreements (memberNo, videoNo, dateOut, dateReturn)
VALUES (2, 2, "2024-06-07", "2024-06-11");

INSERT INTO RentalAgreements (memberNo, videoNo, dateOut, dateReturn)
VALUES (2, 1, "2024-06-08", "2024-06-15");

INSERT INTO RentalAgreements (memberNo, videoNo, dateOut)
VALUES (6, 4, "2024-06-09");

 

-- 1
SELECT COUNT(catalogNo) AS Cardinality FROM videos;

-- 2
SELECT fName, lName FROM Members ORDER BY fName ASC, lName ASC;

-- 3
SELECT Videos.Title, Directors.DirectorName FROM (Videos INNER JOIN Directors ON Videos.DirectorNo = Directors.DirectorNo);

-- 4
SELECT Members.fName AS Investor, SUM(Videos.Price) AS Investment
FROM Videos INNER JOIN (VideosForRent INNER JOIN (Members INNER JOIN RentalAgreements ON Members.memberNo = RentalAgreements.memberNo) ON VideosForRent.videoNo = RentalAgreements.videoNo) ON Videos.catalogNo = VideosForRent.catalogNo
WHERE fName = "StayHome";

-- 5
SELECT Videos.title, COUNT(VideosForRent.catalogNo) 
FROM Videos INNER JOIN VideosForRent ON Videos.catalogNo = VideosForRent.catalogNo
GROUP BY VideosForRent.catalogNo;

-- 6
SELECT category, COUNT(title)
FROM Videos
GROUP BY category;

-- 7
SELECT title, dailyRental FROM Videos WHERE dailyRental = (SELECT MAX(dailyRental) FROM Videos);

-- 8
SELECT Videos.title, SUM(Videos.Price) FROM Videos INNER JOIN VideosForRent ON Videos.catalogNo = VideosForRent.catalogNo
GROUP BY VideosForRent.catalogNo;

-- 9
SELECT Members.fName FROM Members INNER JOIN RentalAgreements ON Members.memberNo = RentalAgreements.memberNo
WHERE dateReturn IS NULL;

-- 10 (this one was done with the help of vibe coding)
SELECT Videos.title, COUNT(VideosForRent.catalogNo)
FROM Videos INNER JOIN VideosForRent ON Videos.catalogNo = VideosForRent.catalogNo
GROUP BY Videos.title
HAVING COUNT(VideosForRent.catalogNo) = (
    SELECT MAX(TimesRented)
    FROM (
        SELECT COUNT(VideosForRent.catalogNo) AS TimesRented
        FROM Videos INNER JOIN VideosForRent ON Videos.catalogNo = VideosForRent.catalogNo
        GROUP BY Videos.title
    ) AS temp_table
);

-- 11
SELECT DOB FROM Members WHERE DOB <> NULL;

-- 12
SELECT Videos.title 
FROM Videos LEFT JOIN VideosForRent ON Videos.catalogNo = VideosForRent.catalogNo
WHERE VideosForRent.videoNo IS NULL;

-- 13
SELECT * FROM Members WHERE DOB = (SELECT DOB FROM Members WHERE fName = "Lorna" AND lName = "Smith");
