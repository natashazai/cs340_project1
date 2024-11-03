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
(1, 'The Decameron', `Giovanni Boccaccio`, 1370, 'Italian', 'Romantic/ Tragedy', 9780140449303, 4),
(2, 'The Great Gatsby', 'Francis Scott Key Fitzgerald', 1925, 'English', 'Tragedy', 9780333791035, 5),
(3, 'The Great Gatsby', 'Francis Scott Key Fitzgerald', 1925, 'English', 'Tragedy', 9780333791035, 10),
(4, 'The Great Gatsby', 'Francis Scott Key Fitzgerald', 1925, 'English', 'Tragedy', 9780333791035, 10),
(5, 'The Great Gatsby', 'Francis Scott Key Fitzgerald', 1925, 'English', 'Tragedy', 9780333791035, 10),
(6, 'The Great Gatsby', 'Francis Scott Key Fitzgerald', 1925, 'English', 'Tragedy', 9780333791035, 10),
(7, 'The Great Gatsby', 'Francis Scott Key Fitzgerald', 1925, 'English', 'Tragedy', 9780333791035, 10),
(8, 'The Great Gatsby', 'Francis Scott Key Fitzgerald', 1925, 'English', 'Tragedy', 9780333791035, 10),
(9, 'The Great Gatsby', 'Francis Scott Key Fitzgerald', 1925, 'English', 'Tragedy', 9780333791035, 10),
(10, 'The Great Gatsby', 'Francis Scott Key Fitzgerald', 1925, 'English', 'Tragedy', 9780333791035, 10);

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
(1, 'William', 'Adama', 3, 61),
(2, 'Lee', 'Adama', 3, 30),
(3, 'Laura', 'Roslin', 3, NULL),
(4, 'Kara', 'Thrace', 3, NULL),
(5, 'Gaius', 'Baltar', 3, NULL),
(6, 'Saul', 'Tigh', NULL, 71),
(7, 'Karl', 'Agathon', 1, NULL),
(8, 'Galen', 'Tyrol', 1, 32),
(9, 'Callandra', 'Henderson', NULL, NULL),
(10, 'Callandra', 'Henderson', NULL, NULL);

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
(1, 'William', 'Adama', 3, 61),
(2, 'Lee', 'Adama', 3, 30),
(3, 'Laura', 'Roslin', 3, NULL),
(4, 'Kara', 'Thrace', 3, NULL),
(5, 'Gaius', 'Baltar', 3, NULL),
(6, 'Saul', 'Tigh', NULL, 71),
(7, 'Karl', 'Agathon', 1, NULL),
(8, 'Galen', 'Tyrol', 1, 32),
(9, 'Callandra', 'Henderson', NULL, NULL);

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `fineID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
  `borrowingID` int(11) NOT NULL UNIQUE,
  `memberID` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `paid_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`fineID`),
  FOREIGN KEY (`borrowingID`) REFERENCES `borrowings` (`borrowingID`),
  FOREIGN KEY (`memberID`) REFERENCES `members` (`memberID`)
);

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`fineID`, `borrowingID`, `memberID`, `amount`, `paid_status`) VALUES
(1, 'William', 'Adama', 3, 61),
(2, 'Lee', 'Adama', 3, 30),
(3, 'Laura', 'Roslin', 3, NULL),
(4, 'Kara', 'Thrace', 3, NULL),
(5, 'Gaius', 'Baltar', 3, NULL),
(6, 'Saul', 'Tigh', NULL, 71),
(7, 'Karl', 'Agathon', 1, NULL),
(8, 'Galen', 'Tyrol', 1, 32),
(9, 'Callandra', 'Henderson', NULL, NULL);

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

