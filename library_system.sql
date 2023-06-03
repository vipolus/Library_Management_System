-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 03 Ιουν 2023 στις 23:09:06
-- Έκδοση διακομιστή: 10.4.28-MariaDB
-- Έκδοση PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `library_system`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `admin`
--

CREATE TABLE `admin` (
  `Admin_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `admin`
--

INSERT INTO `admin` (`Admin_id`, `User_id`, `last_update`) VALUES
(1, 1, '2023-06-03 20:10:51');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `approve`
--

CREATE TABLE `approve` (
  `User_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `approve`
--

INSERT INTO `approve` (`User_id`, `last_update`) VALUES
(2, '2023-06-03 20:18:10'),
(3, '2023-06-03 20:18:11'),
(4, '2023-06-03 20:18:12'),
(5, '2023-06-03 20:50:03'),
(6, '2023-06-03 20:50:04'),
(7, '2023-06-03 20:50:04'),
(8, '2023-06-03 20:50:05'),
(9, '2023-06-03 20:50:05'),
(10, '2023-06-03 20:50:06'),
(11, '2023-06-03 20:50:06'),
(12, '2023-06-03 20:50:07'),
(13, '2023-06-03 20:50:07'),
(14, '2023-06-03 20:50:08'),
(35, '2023-06-03 20:50:09'),
(36, '2023-06-03 20:50:09'),
(37, '2023-06-03 20:50:10'),
(15, '2023-06-03 20:50:32'),
(16, '2023-06-03 20:50:33'),
(17, '2023-06-03 20:50:33'),
(18, '2023-06-03 20:50:33'),
(19, '2023-06-03 20:50:33'),
(20, '2023-06-03 20:50:34'),
(21, '2023-06-03 20:50:35'),
(22, '2023-06-03 20:50:35'),
(23, '2023-06-03 20:50:36'),
(24, '2023-06-03 20:50:36'),
(38, '2023-06-03 20:50:36'),
(39, '2023-06-03 20:50:37'),
(40, '2023-06-03 20:50:38'),
(25, '2023-06-03 20:50:52'),
(26, '2023-06-03 20:50:53'),
(27, '2023-06-03 20:50:53'),
(28, '2023-06-03 20:50:54'),
(29, '2023-06-03 20:50:54'),
(30, '2023-06-03 20:50:54'),
(31, '2023-06-03 20:50:55'),
(32, '2023-06-03 20:50:55'),
(33, '2023-06-03 20:50:56'),
(34, '2023-06-03 20:50:56'),
(41, '2023-06-03 20:50:57'),
(42, '2023-06-03 20:50:57'),
(43, '2023-06-03 20:50:58');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `author`
--

CREATE TABLE `author` (
  `Author_id` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Num_of_books_written` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book`
--

CREATE TABLE `book` (
  `Book_id` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Publisher` varchar(255) NOT NULL,
  `ISBN` varchar(255) NOT NULL,
  `Number_of_Pages` int(11) NOT NULL,
  `Summary` text NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Thematic_Category` varchar(255) NOT NULL,
  `Language` varchar(255) NOT NULL,
  `Keywords` varchar(255) NOT NULL,
  `times_taken` int(11) NOT NULL,
  `times_requested` int(11) NOT NULL,
  `reviews` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book_author`
--

CREATE TABLE `book_author` (
  `Author_id` int(11) NOT NULL,
  `Book_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Δείκτες `book_author`
--
DELIMITER $$
CREATE TRIGGER `Num_of_Books_Author` AFTER UPDATE ON `book_author` FOR EACH ROW BEGIN
	UPDATE author SET Num_of_books_written=Num_of_books_written+1 WHERE Author_id=NEW.Author_id;
    
   END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book_category`
--

CREATE TABLE `book_category` (
  `Book_Category_Id` int(11) NOT NULL,
  `Category_id` int(11) NOT NULL,
  `Book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `category`
--

CREATE TABLE `category` (
  `Category_id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `copies`
--

CREATE TABLE `copies` (
  `Copies_id` int(11) NOT NULL,
  `Number_of_Available_Copies` int(11) NOT NULL,
  `School_id` int(11) NOT NULL,
  `Book_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `loan`
--

CREATE TABLE `loan` (
  `Loan_id` int(11) NOT NULL,
  `Library_Operator_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Book_id` int(11) NOT NULL,
  `date_borrowed` datetime NOT NULL,
  `date_returned` datetime NOT NULL,
  `fullfilled` tinyint(1) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Δείκτες `loan`
--
DELIMITER $$
CREATE TRIGGER `Number_of_loans` AFTER INSERT ON `loan` FOR EACH ROW BEGIN  
    UPDATE User
    SET Number_of_loans = Number_of_loans + 1
    WHERE User_id = NEW.User_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `books_taken_temp` AFTER INSERT ON `loan` FOR EACH ROW BEGIN  
    UPDATE User
    SET books_taken_temp = books_taken_temp + 1
    WHERE User_id = NEW.User_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `copies_decr` AFTER INSERT ON `loan` FOR EACH ROW BEGIN  
    DECLARE schoolId INT;
        SELECT School_id INTO schoolId FROM User WHERE User_id = NEW.User_id;
        UPDATE Copies
    SET Number_of_Available_Copies = Number_of_Available_Copies - 1
    WHERE Book_id = NEW.Book_id AND School_id = schoolId;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `copies_incr` AFTER UPDATE ON `loan` FOR EACH ROW BEGIN
    IF NEW.fullfilled = '1' THEN
        UPDATE Copies
        SET Number_of_Available_Copies = Number_of_Available_Copies + 1
        WHERE Book_id = NEW.Book_id AND School_id = (
            SELECT School_id FROM User WHERE User_id = NEW.User_id
        );
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `res` AFTER INSERT ON `loan` FOR EACH ROW BEGIN  
    UPDATE User
    SET reservations = reservations - 1
    WHERE User_id = NEW.User_id;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `reservation`
--

CREATE TABLE `reservation` (
  `Reservation_id` int(11) NOT NULL,
  `School_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Book_id` int(11) NOT NULL,
  `Approved` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_expired` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Δείκτες `reservation`
--
DELIMITER $$
CREATE TRIGGER `User_Reservations_increase` AFTER INSERT ON `reservation` FOR EACH ROW BEGIN
    UPDATE User
    SET reservations = reservations + 1
    WHERE User_id = NEW.User_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `review`
--

CREATE TABLE `review` (
  `Review_id` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Book_id` int(11) NOT NULL,
  `Text` text NOT NULL,
  `User_id` int(11) NOT NULL,
  `Approved` tinyint(1) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `school`
--

CREATE TABLE `school` (
  `School_id` int(11) NOT NULL,
  `School_Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Phone_Number` varchar(20) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Full_Name_of_School_Director` varchar(255) NOT NULL,
  `times_loaned` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `school`
--

INSERT INTO `school` (`School_id`, `School_Name`, `Address`, `City`, `Phone_Number`, `Email`, `Full_Name_of_School_Director`, `times_loaned`, `last_update`) VALUES
(1, 'Admin', 'Admin', 'Admin', '21314', 'Admin@Admin', 'vipolus', 0, '2023-06-03 20:10:51'),
(2, '1o Gel Athinas', 'Zwgrafou', 'Athens', '2102731921', '1o_Gel_Athinas', 'Operator_1o', 0, '2023-06-03 20:13:35'),
(3, '2o Gel Athinas', 'Kypselh', 'Athens', '2103940129', '2o_Gel_Athinas@gmail.com', 'Operator_2o', 0, '2023-06-03 20:14:00'),
(4, '3o Gel Athinas', 'Ellhniko', 'Athens', '2103849232', '3o_Gel_Athinas', 'Operator_3o', 0, '2023-06-03 20:14:17');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `school_library_operator`
--

CREATE TABLE `school_library_operator` (
  `Library_Operator_id` int(11) NOT NULL,
  `School_id` int(11) NOT NULL,
  `Books_given` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `school_library_operator`
--

INSERT INTO `school_library_operator` (`Library_Operator_id`, `School_id`, `Books_given`, `last_update`) VALUES
(2, 2, 0, '2023-06-03 20:17:01'),
(3, 3, 0, '2023-06-03 20:17:41'),
(4, 4, 0, '2023-06-03 20:18:01');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user`
--

CREATE TABLE `user` (
  `User_id` int(11) NOT NULL,
  `School_id` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Borrow_Limit` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Number_of_loans` int(11) NOT NULL,
  `reservations` int(11) NOT NULL,
  `Delayed_Book` tinyint(1) NOT NULL,
  `Approved` tinyint(1) NOT NULL,
  `books_taken_temp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `user`
--

INSERT INTO `user` (`User_id`, `School_id`, `Age`, `First_Name`, `Last_Name`, `Email`, `Username`, `Password`, `Type`, `Borrow_Limit`, `last_update`, `Number_of_loans`, `reservations`, `Delayed_Book`, `Approved`, `books_taken_temp`) VALUES
(1, 1, 21, 'vipolus', 'vipolus', 'vipolus@vipolus', 'vipolus', '$2y$10$rWfmA5vIznkvAng3bOI0guGltLF2JdABSmKy3qBtuLTl2gVxzCHMq', 'Admin', 0, '2023-06-03 20:10:51', 0, 0, 0, 1, 0),
(2, 2, 29, 'Operator_1o', 'Operator_1o', 'Operator_1o@gmail.com', 'Operator_1o', '$2y$10$8S62ZxxXIY9Z7nhswcI1p.lXhkCVZYTAATHC13k/q0ITkSVblnt/u', 'Library Operator', 1, '2023-06-03 20:18:10', 0, 0, 0, 1, 0),
(3, 3, 33, 'Operator_2o', 'Operator_2o', 'Operator_2o@gmail.com', 'Operator_2o', '$2y$10$vzZk1bQECSYcnJ4L7jlmD.olUeFGfcgo/ciyTfNBkVtNer9W1mxdK', 'Library Operator', 1, '2023-06-03 20:18:11', 0, 0, 0, 1, 0),
(4, 4, 30, 'Operator_3o', 'Operator_3o', 'Operator_3o@gmail.com', 'Operator_3o', '$2y$10$Hd4bMsALRL9wZ7brpz7/5eRbO1jh74LOe45J8B6.qQfHDgcqxGEFe', 'Library Operator', 1, '2023-06-03 20:18:12', 0, 0, 0, 1, 0),
(5, 2, 21, 'Student_1o_1', 'Student_1o_1', 'Student_1o_1@gmail.com', 'Student_1o_1', '$2y$10$AXuloN.9ex7oiDOchWdYmuxaS9E7AWBKO3IoiOUOKgJcEgDwSVTsK', 'Student', 2, '2023-06-03 20:50:03', 0, 0, 0, 1, 0),
(6, 2, 18, 'Student_1o_2', 'Student_1o_2', 'Student_1o_2@gmail.com', 'Student_1o_2', '$2y$10$jrdNRRMDy2YzEG4N68pc8.NaL3ci8CRzY7B4hr4w70JgEZivLCQ.K', 'Student', 2, '2023-06-03 20:50:04', 0, 0, 0, 1, 0),
(7, 2, 17, 'Student_1o_3', 'Student_1o_3', 'Student_1o_3@gmail.com', 'Student_1o_3', '$2y$10$/SVxVoCXlsCXEMtlzeDQVeeHVeCuc/ED.SKfPMSXFjRdtpY0y4CcG', 'Student', 2, '2023-06-03 20:50:04', 0, 0, 0, 1, 0),
(8, 2, 18, 'Student_1o_4', 'Student_1o_4', 'Student_1o_4@gmail.com', 'Student_1o_4', '$2y$10$2xx629MSgLPQjMJl66GSAuWKFExTuRq5k5FNY.Tq0S8HW7zn0XNYy', 'Student', 2, '2023-06-03 20:50:05', 0, 0, 0, 1, 0),
(9, 2, 18, 'Student_1o_5', 'Student_1o_5', 'Student_1o_5@gmail.com', 'Student_1o_5', '$2y$10$aXWsKdR/8wYI7YIAzeJnXuTGJjQFAZ5zBZIxapHy5GfnHBfSnzWry', 'Student', 2, '2023-06-03 20:50:05', 0, 0, 0, 1, 0),
(10, 2, 18, 'Student_1o_6', 'Student_1o_6', 'Student_1o_6@gmail.com', 'Student_1o_6', '$2y$10$nxk6UT2BxUN3P21VJglQNulkIITYD2Ang4gwS.xhW/GQVhBTMwFTq', 'Student', 2, '2023-06-03 20:50:06', 0, 0, 0, 1, 0),
(11, 2, 17, 'Student_1o_7', 'Student_1o_7', 'Student_1o_7@gmail.com', 'Student_1o_7', '$2y$10$ZNHmnrTsx5dw6/uGrqoMrOIgOx4cJ7X1eZfDD66QzC0IQXop1EHDO', 'Student', 2, '2023-06-03 20:50:06', 0, 0, 0, 1, 0),
(12, 2, 16, 'Student_1o_8', 'Student_1o_8', 'Student_1o_8@gmail.com', 'Student_1o_8', '$2y$10$3j9DZKJCdCVOPPe5njUxe.FR32uhNUhWQMB6228jipcP9GXEtfkj6', 'Student', 2, '2023-06-03 20:50:07', 0, 0, 0, 1, 0),
(13, 2, 17, 'Student_1o_9', 'Student_1o_9', 'Student_1o_9@gmail.com', 'Student_1o_9', '$2y$10$QvLIUP0M6d5oyfRxbT0DhOrMg7elhavWb4VAT03OWzZgm.vniR2N2', 'Student', 2, '2023-06-03 20:50:07', 0, 0, 0, 1, 0),
(14, 2, 18, 'Student_1o_10', 'Student_1o_10', 'Student_1o_10@gmail.com', 'Student_1o_10', '$2y$10$0K5LXhMBzZ0gOsPNw9/mDeAzg8FJ0StqzJV0083MljevAYfepNVEy', 'Student', 2, '2023-06-03 20:50:08', 0, 0, 0, 1, 0),
(15, 3, 18, 'Student_2o_1', 'Student_2o_1', 'Student_2o_1@gmail.com', 'Student_2o_1', '$2y$10$i.FMvhMrVKKroXFF6439YebXYNwy43Azw0d21JulIErJzS7xZoQBO', 'Student', 2, '2023-06-03 20:50:32', 0, 0, 0, 1, 0),
(16, 3, 16, 'Student_2o_2', 'Student_2o_2', 'Student_2o_2@gmail.com', 'Student_2o_2', '$2y$10$FRHRkmxx9/r89SgSrKeRC.p4wOnuQZjucEfU4DH/lAWeYcW7sLPVi', 'Student', 2, '2023-06-03 20:50:33', 0, 0, 0, 1, 0),
(17, 3, 16, 'Student_2o_3', 'Student_2o_3', 'Student_2o_3@gmail.com', 'Student_2o_3', '$2y$10$/xg69Ji10VGwy2HRCgl4bOSdRq7Huhc2XNkgsTP7ZLDmnO4D0m3R2', 'Student', 2, '2023-06-03 20:50:33', 0, 0, 0, 1, 0),
(18, 3, 16, 'Student_2o_4', 'Student_2o_4', 'Student_2o_4@gmail.com', 'Student_2o_4', '$2y$10$nwYDrWV4Fx/ba/XwnFBKjeVDHITTHtLN9A.WozQueDKgYEtBky.ru', 'Student', 2, '2023-06-03 20:50:33', 0, 0, 0, 1, 0),
(19, 3, 16, 'Student_2o_5', 'Student_2o_5', 'Student_2o_5@gmail.com', 'Student_2o_5', '$2y$10$mZz5lrIpxdjnxQLz750HXuwfcLn8n2KFH2OgrVeRP1hkN8RT.NnMq', 'Student', 2, '2023-06-03 20:50:33', 0, 0, 0, 1, 0),
(20, 3, 15, 'Student_2o_6', 'Student_2o_6', 'Student_2o_6@gmail.com', 'Student_2o_6', '$2y$10$mSZpjJCLvWa7oDk4eQV5pum0kufADYutVqnJ0qL6O5p3TFqenTwNa', 'Student', 2, '2023-06-03 20:50:34', 0, 0, 0, 1, 0),
(21, 3, 15, 'Student_2o_7', 'Student_2o_7', 'Student_2o_7@gmail.com', 'Student_2o_7', '$2y$10$L6GcOSB0x5oZNNeCHNKXE.2LxFLCr.9lVHM36HkMNRrrmJDY5pVdO', 'Student', 2, '2023-06-03 20:50:35', 0, 0, 0, 1, 0),
(22, 3, 15, 'Student_2o_8', 'Student_2o_8', 'Student_2o_8@gmail.com', 'Student_2o_8', '$2y$10$LZcS0Zdpjgvv9atca41u5ug0pPa2WKO8gft4FT5VaLHizO9jl.rMi', 'Student', 2, '2023-06-03 20:50:35', 0, 0, 0, 1, 0),
(23, 3, 17, 'Student_2o_9', 'Student_2o_9', 'Student_2o_9@gmail.com', 'Student_2o_9', '$2y$10$v9tPxtDCo5Qd.1AH3PDBv.SnJkdLjqqIYNHGdsb2UCvQf8aDfZtqy', 'Student', 2, '2023-06-03 20:50:36', 0, 0, 0, 1, 0),
(24, 3, 16, 'Student_2o_10', 'Student_2o_10', 'Student_2o_10@gmail.com', 'Student_2o_10', '$2y$10$x9JdbrDHpPHnp96RaAo7cOdhhE8zJ58FLbrUarklSC0aZzGvR.Z4O', 'Student', 2, '2023-06-03 20:50:36', 0, 0, 0, 1, 0),
(25, 4, 16, 'Student_3o_1', 'Student_3o_1', 'Student_3o_1@gmail.com', 'Student_3o_1', '$2y$10$Qu6uEkTtsxVwLvJqXHa2tOcxI5JY7x7gJybsKSIErXI1h105iD8gq', 'Student', 2, '2023-06-03 20:50:52', 0, 0, 0, 1, 0),
(26, 4, 17, 'Student_3o_2', 'Student_3o_2', 'Student_3o_2@gmail.com', 'Student_3o_2', '$2y$10$uDa9Od0CgNl9G.gSFa0bQuhwPu7wgBP.pdNuNqQgwH4mfR7ghC39a', 'Student', 2, '2023-06-03 20:50:53', 0, 0, 0, 1, 0),
(27, 4, 17, 'Student_3o_3', 'Student_3o_3', 'Student_3o_3@gmail.com', 'Student_3o_3', '$2y$10$Yv4pHWe5OzSZUsSTGIl8CexdVMXy1u6OyrMB9Ty3tl8shKokBDdN2', 'Student', 2, '2023-06-03 20:50:53', 0, 0, 0, 1, 0),
(28, 4, 17, 'Student_3o_4', 'Student_3o_4', 'Student_3o_4@gmail.com', 'Student_3o_4', '$2y$10$qeCG4QFngWy9OfUsu4lQvu1zjKdhoDmCZkDNePGMFS352gJhebg52', 'Student', 2, '2023-06-03 20:50:54', 0, 0, 0, 1, 0),
(29, 4, 17, 'Student_3o_5', 'Student_3o_5', 'Student_3o_5@gmail.com', 'Student_3o_5', '$2y$10$CdplVIN1RQ/mPJRZETys9uRnUQggZYzCZhDITp9hzrbHxVgZBvkEi', 'Student', 2, '2023-06-03 20:50:54', 0, 0, 0, 1, 0),
(30, 4, 16, 'Student_3o_6', 'Student_3o_6', 'Student_3o_6@gmail.com', 'Student_3o_6', '$2y$10$PGrGVlxC3ZB3kX.dYwbUQ.9EyMlgVaxu8svcsnd4li7.tUipZwI2m', 'Student', 2, '2023-06-03 20:50:54', 0, 0, 0, 1, 0),
(31, 4, 16, 'Student_3o_7', 'Student_3o_7', 'Student_3o_7@gmail.com', 'Student_3o_7', '$2y$10$FYk5NpwOpzHHxVMZ3BT/xeJs6SPbFe.HDy8ut0OpVGHpZAa7d.gli', 'Student', 2, '2023-06-03 20:50:55', 0, 0, 0, 1, 0),
(32, 4, 16, 'Student_3o_8', 'Student_3o_8', 'Student_3o_8@gmail.com', 'Student_3o_8', '$2y$10$RRG/wqMiQ7JjqUpU2stoiuEeEIiFHqxy8NwO57s58MMFkWoqWzs2K', 'Student', 2, '2023-06-03 20:50:55', 0, 0, 0, 1, 0),
(33, 4, 16, 'Student_3o_9', 'Student_3o_9', 'Student_3o_9@gmail.com', 'Student_3o_9', '$2y$10$nAwFulodd7e8E/BAOJN8J.tMC15RIrIJYTWqf6bYxFKD./1dpzvwK', 'Student', 2, '2023-06-03 20:50:56', 0, 0, 0, 1, 0),
(34, 4, 16, 'Student_3o_10', 'Student_3o_10', 'Student_3o_10@gmail.com', 'Student_3o_10', '$2y$10$fgvzuYRInYtoLG5lF0HvluVTgdwkm1PYnrBrtH9SbGSWWFtuICuGi', 'Student', 2, '2023-06-03 20:50:56', 0, 0, 0, 1, 0),
(35, 2, 27, 'Teacher_1o_1', 'Teacher_1o_1', 'Teacher_1o_1@gmail.com', 'Teacher_1o_1', '$2y$10$PcSScSq6c4iH8JzJmzYjj.7XfZYlx75cMU8nbtoNYVGl.4u9iA90W', 'Teacher', 1, '2023-06-03 20:50:09', 0, 0, 0, 1, 0),
(36, 2, 29, 'Teacher_1o_2', 'Teacher_1o_2', 'Teacher_1o_2@gmail.com', 'Teacher_1o_2', '$2y$10$rozioIloJOJ4KDas8yitmOpqAdvLXurHgC54wucl5qd5kemWVN48O', 'Teacher', 1, '2023-06-03 20:50:09', 0, 0, 0, 1, 0),
(37, 2, 50, 'Teacher_1o_3', 'Teacher_1o_3', 'Teacher_1o_3@gmail.com', 'Teacher_1o_3', '$2y$10$5zO.bFgJDAoMADnlGeEI0OpUuCspf7juoIJQz4mWhdrtcWc1ryTnm', 'Teacher', 1, '2023-06-03 20:50:10', 0, 0, 0, 1, 0),
(38, 3, 51, 'Teacher_2o_1', 'Teacher_2o_1', 'Teacher_2o_1@gmail.com', 'Teacher_2o_1', '$2y$10$wRyz5Vz5V2Qio6JAWTXPPe3dxQ0auXUvhQDJa9btjPvCa8tX5ugvy', 'Teacher', 1, '2023-06-03 20:50:36', 0, 0, 0, 1, 0),
(39, 3, 51, 'Teacher_2o_2', 'Teacher_2o_2', 'Teacher_2o_2@gmail.com', 'Teacher_2o_2', '$2y$10$RIr/XC62lByJHXlYaKrdxeARaVd/W/5Z1P/aBaIX.JPAsnFkhSg6q', 'Teacher', 1, '2023-06-03 20:50:37', 0, 0, 0, 1, 0),
(40, 3, 45, 'Teacher_2o_3', 'Teacher_2o_3', 'Teacher_2o_3@gmail.com', 'Teacher_2o_3', '$2y$10$UaP4B4G7qta.yXYSIeEUZuKKu5bkMUbIf.XRuN9Kh6O0BOFCs6YdO', 'Teacher', 1, '2023-06-03 20:50:38', 0, 0, 0, 1, 0),
(41, 4, 45, 'Teacher_3o_1', 'Teacher_3o_1', 'Teacher_3o_1@gmail.com', 'Teacher_3o_1', '$2y$10$lGo8lwFDfic4LJtZlP72N.2s502aJu/QWdHqe.pXMI6u9WekUGSIK', 'Teacher', 1, '2023-06-03 20:50:57', 0, 0, 0, 1, 0),
(42, 4, 35, 'Teacher_3o_2', 'Teacher_3o_2', 'Teacher_3o_2@gmail.com', 'Teacher_3o_2', '$2y$10$NIJYoRNsHtNTh2D8tfITROAwoYZgHHhl8RUfEBSgyRKM9q/S.mfOC', 'Teacher', 1, '2023-06-03 20:50:57', 0, 0, 0, 1, 0),
(43, 4, 46, 'Teacher_3o_3', 'Teacher_3o_3', 'Teacher_3o_3@gmail.com', 'Teacher_3o_3', '$2y$10$H/7zFy.3DLJR1Z5CPuuWdeOv348eLNqgap0bBH3GL1r5JC1pkhGiK', 'Teacher', 1, '2023-06-03 20:50:58', 0, 0, 0, 1, 0);

--
-- Δείκτες `user`
--
DELIMITER $$
CREATE TRIGGER `Approve_History` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
    IF NEW.Approved = '1' THEN
        INSERT INTO `Approve` (User_id) VALUES (NEW.User_id);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Lib_Op` AFTER INSERT ON `user` FOR EACH ROW IF NEW.Type = 'Library Operator' THEN
                            INSERT INTO School_Library_Operator (Library_operator_id,School_id) VALUES (NEW.User_id,NEW.School_id);
                        END IF
$$
DELIMITER ;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Ευρετήρια για πίνακα `approve`
--
ALTER TABLE `approve`
  ADD KEY `User_id` (`User_id`);

--
-- Ευρετήρια για πίνακα `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`Author_id`);

--
-- Ευρετήρια για πίνακα `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_id`);

--
-- Ευρετήρια για πίνακα `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`Book_id`,`Author_id`),
  ADD KEY `Author_id` (`Author_id`);

--
-- Ευρετήρια για πίνακα `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`Book_Category_Id`),
  ADD KEY `Category_id` (`Category_id`),
  ADD KEY `Book_id` (`Book_id`);

--
-- Ευρετήρια για πίνακα `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_id`);

--
-- Ευρετήρια για πίνακα `copies`
--
ALTER TABLE `copies`
  ADD PRIMARY KEY (`Copies_id`),
  ADD KEY `School_id` (`School_id`),
  ADD KEY `Book_id` (`Book_id`);

--
-- Ευρετήρια για πίνακα `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`Loan_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Book_id` (`Book_id`),
  ADD KEY `Library_Operator_id` (`Library_Operator_id`);

--
-- Ευρετήρια για πίνακα `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Reservation_id`),
  ADD KEY `School_id` (`School_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Book_id` (`Book_id`);

--
-- Ευρετήρια για πίνακα `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_id`),
  ADD KEY `Book_id` (`Book_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Ευρετήρια για πίνακα `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`School_id`);

--
-- Ευρετήρια για πίνακα `school_library_operator`
--
ALTER TABLE `school_library_operator`
  ADD PRIMARY KEY (`Library_Operator_id`),
  ADD KEY `School_id` (`School_id`);

--
-- Ευρετήρια για πίνακα `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`,`School_id`),
  ADD KEY `School_id` (`School_id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT για πίνακα `author`
--
ALTER TABLE `author`
  MODIFY `Author_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `book`
--
ALTER TABLE `book`
  MODIFY `Book_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `book_category`
--
ALTER TABLE `book_category`
  MODIFY `Book_Category_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `category`
--
ALTER TABLE `category`
  MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `copies`
--
ALTER TABLE `copies`
  MODIFY `Copies_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `loan`
--
ALTER TABLE `loan`
  MODIFY `Loan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `reservation`
--
ALTER TABLE `reservation`
  MODIFY `Reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `review`
--
ALTER TABLE `review`
  MODIFY `Review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `school`
--
ALTER TABLE `school`
  MODIFY `School_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT για πίνακα `school_library_operator`
--
ALTER TABLE `school_library_operator`
  MODIFY `Library_Operator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT για πίνακα `user`
--
ALTER TABLE `user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Περιορισμοί για πίνακα `approve`
--
ALTER TABLE `approve`
  ADD CONSTRAINT `approve_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Περιορισμοί για πίνακα `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`),
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`Author_id`) REFERENCES `author` (`Author_id`);

--
-- Περιορισμοί για πίνακα `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`),
  ADD CONSTRAINT `book_category_ibfk_2` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`);

--
-- Περιορισμοί για πίνακα `copies`
--
ALTER TABLE `copies`
  ADD CONSTRAINT `copies_ibfk_1` FOREIGN KEY (`School_id`) REFERENCES `school` (`School_id`),
  ADD CONSTRAINT `copies_ibfk_2` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`);

--
-- Περιορισμοί για πίνακα `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`),
  ADD CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`Library_Operator_id`) REFERENCES `school_library_operator` (`Library_Operator_id`);

--
-- Περιορισμοί για πίνακα `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`School_id`) REFERENCES `school` (`School_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`);

--
-- Περιορισμοί για πίνακα `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Περιορισμοί για πίνακα `school_library_operator`
--
ALTER TABLE `school_library_operator`
  ADD CONSTRAINT `school_library_operator_ibfk_1` FOREIGN KEY (`School_id`) REFERENCES `school` (`School_id`);

--
-- Περιορισμοί για πίνακα `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`School_id`) REFERENCES `school` (`School_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
