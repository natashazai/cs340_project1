--DROP TABLE IF EXISTS books;
--DROP TABLE IF EXISTS members;
--DROP TABLE IF EXISTS borrowings;
--DROP TABLE IF EXISTS fines;
--DROP TABLE IF EXISTS staff;

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
    `bookID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    `title` varchar(300) NOT NULL,
    `author` varchar(300) NOT NULL,
    `publication_year` int(11) NOT NULL CHECK (publication_year > 0),
    `original_language` varchar(100) NOT NULL,
    `genre` varchar(100) NOT NULL,
    --internation standard book number to store as string
    `isbn` varchar(13) NOT NULL UNIQUE,
    `copy_available` int(11) NOT NULL CHECK(available_copies >= 0),
    PRIMARY KEY (`bookID`)
);

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookID`, `title`, `author`, `publication_year`, `original_language`, `genre`, `isbn`, `copy_available`) VALUES
(1, 'The Decameron', `Giovanni Boccaccio`, 1370, 'Italian', 'Romantic', 9780140449303, 4),
(2, 'The Great Gatsby', 'Francis Scott Key Fitzgerald', 1925, 'English', 'Tragedy', 9780333791035, 5),
(3, 'The Shining', 'Stephen King', 1977, 'English', 'Horror', 9780307743657, 3),
(4, 'Crime and Punishment', 'Fyodor Dostoevsky', 1866, 'Russian', 'Crime fiction', 9780333791035, 6),
(5, 'To kill a Mockingbird', 'Harper Lee', 1960, 'English', 'Fiction', 978006112084, 4),
(6, 'Divine Comedy', 'Dante Alighieri', 1321, 'Italian', 'Narrative Poem', 9788889352311, 9),
(7, 'The Call of Cthulhu', 'Howard Phillips Lovecraft', 1928, 'English', 'Horror fiction', 9781568824307, 2),
(8, '1984', 'George Orwell', 1949, 'English', 'Dystopian', 9780451524935, 3),
(9, 'The Book Theif', 'Markus Zusak', 2005, 'English', 'Historical Fiction', 9780375842207, 4),
(10, 'Blood of Elves', 'Andrzej Sapkowski', 1994, 'Polish', 'Fantasy', 9780333791035, 10);

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `memberID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
  `full_name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL UNIQUE,
  `phone_number` varchar(300) UNIQUE,
  `address` varchar(300),
  `join_date` DATE NOT NULL DEFAULT CURRENT_DATE,
  PRIMARY KEY (`memberID`)
);

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberID`, `full_name`, `email`, `phone_number`, `address`, `join_date`) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', '555-1234', '123 Main Dr, Springfield', 2024-02-10),
(2, 'Bob Smith', 'bob.smith@example.com', '555-6574', '176 Deer Run, Springfield', 2024-03-11),
(3, 'John Brown', 'john.brown@example.com', '555-9876', '1294 Garfield St, Springfield', 2024-04-12),
(4, 'Brad Pitt', 'brad.pitt@example.com', '555-3092', '1865 Grafield St, Springfield', 2024-05-13),
(5, 'Will Smith', 'will.smith@example.com', '555-9028', '856 Main Dr, Springfield', 2024-06-14),
(6, 'Emma Watson', 'emma.watson@example.com', '555-9078', '6573 Circle Blvd, Springfield', 2024-07-15),
(7, 'Natalie Portman', 'natalie.portman@example.com', '555-1526', '1654 Circle Blvd, Springfield', 2024-08-16),
(8, 'Scarlet Johanson', 'scarlet.johanson@example.com', '555-3654', '968 Deer Run, Springfield', 2024-09-17),
(9, 'Tom Reddle', 'tom.reddle@example.com', '555-7654', '156 Main Dr, Springfield', 2024-10-20),
(10, 'Harry Potter', 'harry.potter@example.com', '555-8720', '1111 Brown St, Springfield', 2024-11-24);

--
-- Table structure for table `borrowings`
--

CREATE TABLE `borrowings` (
  `borrowingID` int(11) NOT NULL AUTO_INCREMENT,
  `bookID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `borrow_date` DATE NOT NULL,
  `due_date` DATE NOT NULL,
  `return_date` DATE,
  PRIMARY KEY (`borrowingID`),
  FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`),
  FOREIGN KEY (`memberID`) REFERENCES `members` (`memberID`)
);

--
-- Dumping data for table `borrowings`
--

INSERT INTO `borrowings` (`borrowingID`, `bookID`, `memberID`, `borrow_date`, `due_date`, `return_date`) VALUES
(1, , , 2024-09-25, 2024-10-1, NULL),
(1, , , 2024-09-20, 2024-10-5, 2024-10-4),
(1, , , 2024-09-10, 2024-10-1, NULL),
(1, , , 2024-11-01, 2024-11-17, 2024-11-15),
(1, , , 2024-10-06, 2024-10-1, NULL),
(1, , , 2024-10-07, 2024-10-20, 2024-10-19),
(1, , , 2024-10-08, 2024-10-21, NULL),
(1, , , 2024-10-10, 2024-10-23, 2024-10-20),
(1, , , 2024-11-02, 2024-11-15, NULL),
(1, , , 2024-11-03, 2024-11-16, 2024-11-14);

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `fineID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
  `borrowingID` int(11) NOT NULL UNIQUE,
  `memberID` int(11) NOT NULL,
  `amount` int(11) NOT NULL CHECK(amount >= 0),
  `paid_status` BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`fineID`),
  FOREIGN KEY (`borrowingID`) REFERENCES `borrowings` (`borrowingID`),
  FOREIGN KEY (`memberID`) REFERENCES `members` (`memberID`)
);

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`fineID`, `borrowingID`, `memberID`, `amount`, `paid_status`) VALUES
(1, , , 3, 1),
(1, , , 4, 0),
(1, , , 5, 1),
(1, , , 2, 0),
(1, , , 1, 1),
(1, , , 3, 0),
(1, , , 5, 1),
(1, , , 6, 0),
(1, , , 2, 1);

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `position` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL UNIQUE,
  `hire_date` DATE NOT NULL,
  PRIMARY KEY (`staffID`),
);

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `fname`, `lname`, `homeworld`, `age`) VALUES
(1, 'William', 'Adama', 3, 61),
(2, 'Lee', 'Adama', 3, 30),
(3, 'Laura', 'Roslin', 3, NULL),
(4, 'Kara', 'Thrace', 3, NULL),
(5, 'Gaius', 'Baltar', 3, NULL),
(6, 'Saul', 'Tigh', NULL, 71),
(7, 'Karl', 'Agathon', 1, NULL),
(8, 'Galen', 'Tyrol', 1, 32),
(9, 'Callandra', 'Henderson', NULL, NULL);

