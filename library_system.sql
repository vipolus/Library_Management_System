-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2023 at 03:57 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_id`, `User_id`, `last_update`) VALUES
(1, 1, '2023-06-03 20:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `approve`
--

CREATE TABLE `approve` (
  `User_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `approve`
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
(43, '2023-06-03 20:50:58'),
(44, '2023-06-04 05:17:03'),
(45, '2023-06-04 05:21:30'),




-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `Author_id` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Num_of_books_written` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`Author_id`, `First_Name`, `Last_Name`, `Num_of_books_written`, `last_update`) VALUES
(1, 'Thanasis', 'Konstantopoulos', 28, '2023-06-04 11:07:16'),
(2, 'Elenh', 'Adamou', 26, '2023-06-04 11:11:25'),
(3, 'Pontikhs', 'Pontikakhs', 5, '2023-06-03 22:52:04'),
(4, 'Molivhs', 'Molivakhs', 9, '2023-06-04 10:46:58'),
(5, 'Psalidhs', 'Psalidakhs', 6, '2023-06-04 10:21:23'),
(6, 'Potirhs', 'Potirakhs', 15, '2023-06-04 11:09:43'),
(7, 'Mpoukalhs', 'Mpoukalakhs', 10, '2023-06-04 11:10:52'),
(8, 'Pagourhs', 'Pagourakhs', 7, '2023-06-04 11:10:20'),
(9, 'Othonhs', 'Othonakhs', 5, '2023-06-04 11:09:04'),
(10, 'Tetradios', 'Tetradiakhs', 2, '2023-06-04 11:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `book`
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

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Book_id`, `Title`, `Publisher`, `ISBN`, `Number_of_Pages`, `Summary`, `Image`, `Thematic_Category`, `Language`, `Keywords`, `times_taken`, `times_requested`, `reviews`, `last_update`) VALUES
(1, 'In the Name of the Father', 'Samaria Zanetello', '219751597-7', 467, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\\n\\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\\n\\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Image1.png', 'Action,Horror,Thriller', 'English', 'Police,Crime,Blood', 5, 3, 0, '2023-06-04 13:56:09'),
(2, 'Paul', 'Hewie Wolstenholme', '981056758-8', 873, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\\n\\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\\n\\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Image2.png', 'Romance,Adventure', 'English', 'Love,Happy ending', 0, 0, 0, '2023-06-03 22:14:13'),
(3, 'Defiance', 'Jonathon Feirn', '460557377-1', 125, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Image3.png', 'Action,Adventure,Thriller', 'English', 'Fight,Action', 0, 1, 0, '2023-06-04 07:11:39'),
(4, 'Fraternity Vacation', 'Erinn Cattlow', '909986720-4', 654, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Image4.png', 'Comedy', 'English', 'Summer vacation,Relax,Chilling', 0, 0, 0, '2023-06-03 22:16:33'),
(5, 'Road North (Tie pohjoiseen)', 'Karim Parken', '555586917-7', 124, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\\n\\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\\n\\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 'Image5.png', 'Action,War,Adventure', 'English', 'War,Guns,Blood,Field', 1, 2, 0, '2023-06-04 11:40:56'),
(6, 'Star Kid', 'Reba Siviour', '097299215-4', 169, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\\n\\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Image6.png', 'Crime,Action,Horror', 'English', 'Police,Crime,Blood', 0, 3, 0, '2023-06-04 11:23:32'),
(7, 'Double Hour, The (La doppia ora)', 'Sophey Vanelli', '354170217-6', 468, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\\n\\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Image7.png', 'Action,Adventure,Drama', 'English', 'Scary,Drama', 0, 1, 0, '2023-06-04 12:13:24'),
(8, 'Sons of Katie Elder', 'Joannes Soot', '685335171-1', 353, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\\n\\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 'Image8.png', 'Horror,Thriller,Adventure', 'English', 'Jumpscare,Scary,Ghosts', 1, 1, 0, '2023-06-04 12:18:17'),
(9, 'Amateurs, The (Moguls, The)', 'Puff Haisell', '161709515-X', 832, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\\n\\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Image9.png', 'Action,Adventure', 'English', 'Summer', 0, 0, 0, '2023-06-03 22:24:22'),
(10, 'Guns, Girls and Gambling', 'Turner McEntagart', '936770568-9', 568, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\\n\\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\\n\\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Image10.png', 'Drama,Adventure', 'English', 'Aliens,Guns,Girls,Gambling,Money', 1, 0, 0, '2023-06-04 12:25:44'),
(11, 'Destination Moon', 'Devan Glazier', '125557762-2', 452, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\\n\\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\\n\\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Image11.png', 'Fantasy,Action', 'English', 'Aliens,Space,Spacewar', 0, 1, 0, '2023-06-04 12:14:13'),
(12, 'Bats', 'Jonathon De Marchi', '667686461-4', 145, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\\n\\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\\n\\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Image12.png', 'Action,Science Fiction,Fantasy', 'English', 'Zombies,World end', 0, 0, 0, '2023-06-03 22:27:08'),
(13, 'He Walked by Night', 'Gilemette Mawman', '817681565-9', 745, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\\n\\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Image13.png', 'Drama,Action,Fantasy,Romance', 'English', 'Love,Suspense', 0, 0, 0, '2023-06-03 22:28:20'),
(14, 'Tiger of Eschnapur, The (Tiger von Eschnapur, Der)', 'Rich Trayes', '357559471-6', 574, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\\n\\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\\n\\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 'Image14.png', 'Action,Horror,Science Fiction', 'English', 'Scary,Drama,Zombies', 0, 0, 0, '2023-06-03 22:29:24'),
(15, 'Carcasses', 'Shelby Hazlehurst', '528729739-4', 325, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\\n\\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Image15.png', 'Mystery,Action,Adventure,Science Fiction', 'English', 'Aliens,Space,Spaceship,War', 1, 1, 0, '2023-06-04 12:25:35'),
(16, 'Because I Said So', 'Emmye Cubbit', '326750583-6', 1246, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\\n\\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\\n\\nFusce consequat. Nulla nisl. Nunc nisl.', 'Image16.png', 'Horror,Thriller', 'English', 'Fight,Scary', 1, 1, 0, '2023-06-04 12:25:56'),
(17, 'Rembrandt\'s J\'accuse', 'Laney Holleworth', '164725446-9', 1563, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\\n\\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\\n\\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Image17.png', 'Action,Horror,Drama', 'English', 'Zombies,Scary,Blood', 2, 0, 0, '2023-06-04 12:29:17'),
(18, 'Stars Above', 'Rhett Clementson', '384564005-7', 357, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Image18.png', 'Fantasy,Action', 'English', 'Beach,Fantasy,Beasts', 1, 0, 0, '2023-06-04 12:27:19'),
(19, 'Dragon Hunters (Chasseurs de dragons)', 'Jolee Peacop', '51-561-7823', 426, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Image19.png', 'Mystery,Crime', 'English', 'Police,Crime,Blood', 1, 0, 0, '2023-06-04 12:28:56'),
(20, 'Lili\'s Apron', 'Brew Raybould', '365153293-3', 743, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\\n\\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Romance,Adventure', 'Action,Horror', 'English', 'Love,Happy ending', 1, 1, 0, '2023-06-04 12:27:04'),
(21, 'Bummer (Bumer)', 'Analise Hughland', '667266128-X', 357, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\\n\\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\\n\\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'Image21.png', 'War,Crime,Thriller', 'English', 'War,Guns,Blood,Field', 1, 1, 0, '2023-06-04 12:28:18'),
(22, 'Kissing a Fool', 'Alice Heyworth', '803317346-7', 782, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\\n\\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Image22.png', 'Thriller,Adventure', 'English', 'Scary', 1, 1, 0, '2023-06-04 12:27:43'),
(23, 'Opportunists, The', 'Joela Fike', '590459221-3', 842, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Image23.png', 'Mystery,Horror', 'English', 'Fight', 1, 1, 0, '2023-06-04 12:27:24'),
(24, 'Reconstituirea (Reconstruction)', 'Tremayne Hatley', '833107983-3', 742, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\\n\\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\\n\\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Image24.png', 'War,Crime,Thriller', 'English', 'War,Guns,Blood,Field', 1, 1, 0, '2023-06-04 12:28:03'),
(25, 'It\'s a Wonderful Afterlife', 'Hewie Wolstenholme', '555326917-7', 425, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Image25.png', 'Science Fiction,Fantasy,Adventure', 'English', 'Fantasy,Afterlife', 0, 1, 0, '2023-06-04 12:08:00'),
(26, 'DiG!', 'Molli Benford', '710246032-5', 463, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Image27.png', 'Action,Horror,Science Fiction', 'English', 'Moon,Nightfall', 2, 1, 0, '2023-06-04 12:27:55'),
(27, 'Exorcist: The Beginning', 'Gaven Peckham', '205182169-0', 743, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\\n\\nSed ante. Vivamus tortor. Duis mattis egestas metus.\\n\\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Image27.png', 'Science Fiction,Crime', 'English', 'Blood,Guns,Scary', 0, 1, 0, '2023-06-04 12:11:16'),
(28, 'Naked Lunch', 'Rosemarie Harsant', '065317025-4', 1257, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\\n\\nSed ante. Vivamus tortor. Duis mattis egestas metus.\\n\\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Image28.png', 'Romance,Adventure,Comedy', 'English', 'Summer,Love,Funny', 0, 1, 0, '2023-06-04 12:09:56'),
(29, 'Soul Assassin', 'Shea Woofenden', '860422084-4', 853, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\\n\\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 'Image29.png', 'Science Fiction,Action', 'English', 'Fight,Blood', 0, 1, 0, '2023-06-04 12:11:22'),
(30, 'One-Eyed Monster', 'Derrick O\' Dooley', '593139344-7', 748, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\\n\\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Image31.png', 'Action,Horror', 'English', 'Beach,Summer,Horror', 1, 1, 0, '2023-06-04 12:29:02'),
(31, 'Across the Pacific', 'Marabel Allicock', '553724255-9', 475, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Image31.png', 'Romance,Adventure,Comedy', 'English', 'Summer,Love,Funny', 0, 1, 0, '2023-06-04 12:10:57'),
(32, 'New Fist of Fury (Xin jing wu men)', 'Matilda Capozzi', '594979989-5', 535, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Image32.png', 'Science Fiction,Action,Horror', 'English', 'Guns,Monsters,Scary', 1, 2, 0, '2023-06-04 12:28:10'),
(33, 'Beach Blanket Bingo', 'Price Leavy', '828431269-7', 493, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'Image33.png', 'Adventure,Action', 'English', 'Suspence,Fight,Jungle', 3, 2, 0, '2023-06-04 12:33:53'),
(34, 'Secrets of Eden', 'Lisa Goodspeed', '477466474-X', 894, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\\n\\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Image34.png', 'Action,Science Fiction,Mystery', 'English', 'Eden,Mystery', 0, 1, 0, '2023-06-04 12:05:22'),
(35, 'Jumanji', 'Agata Paszek', '994929268-9', 743, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\\n\\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Image35.png', 'Action,Adventure,Fantasy', 'English', 'Jungle,Monsters', 1, 1, 0, '2023-06-04 12:35:22'),
(36, 'Accidental Tourist, The', 'Dex Harradence', '087094577-7', 643, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Image36.png', 'War,Horror,Action,Crime', 'English', 'War,Exotic,Fight,Guns', 2, 0, 0, '2023-06-04 12:34:39'),
(37, 'See You Tomorrow, Everyone', 'Theresa Woodyatt', '419206742-0', 1023, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\\n\\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\\n\\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Image37.png', 'Romance,Adventure,Comedy', 'English', 'Summer,Love,Funny', 1, 1, 0, '2023-06-04 12:33:49'),
(38, 'Shinobi No Mono 4: Siege', 'Juana Jacombs', '695058722-8', 734, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\\n\\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Image38.png', 'War,Horror,Action,Crime', 'English', 'Siege,Castle,Medieval,Fight,Swords', 0, 1, 0, '2023-06-04 12:00:03'),
(39, 'Elfie Hopkins: Cannibal Hunter', 'Arnie Giacovelli', '723249984-1', 793, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\\n\\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\\n\\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Image39.png', 'Thriller,Adventure,Horror', 'English', 'Cannibal,Hunt,Blood', 1, 1, 0, '2023-06-04 12:35:50'),
(40, 'Myth of Fingerprints, The', 'Kristoforo Leaning', '809431114-2', 894, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Image40.png', 'Action,Adventure,Fantasy', 'English', 'Moon,Nightfall', 3, 1, 0, '2023-06-04 12:34:48'),
(41, 'Easy Living', 'Mitchel Eacott', '516640278-2', 732, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\\n\\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Image41.png', 'Comedy', 'English', 'Summer,Funny', 0, 0, 0, '2023-06-04 10:09:54'),
(42, 'History of Hell (Rosas Höllenfahrt)', 'Vladamir Idel', '571735492-4', 467, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'Image42.png', 'Action,Horror,Thriller,Drama', 'English', 'Blood,Guns,Scary', 0, 0, 0, '2023-06-04 10:10:49'),
(43, '51', 'Constantin Llewellyn', '906997059-7', 948, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\\n\\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\\n\\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Image43.png', 'Action,Horror', 'English', 'Road,Dessert', 1, 1, 0, '2023-06-04 12:34:11'),
(44, 'Return to the Blue Lagoon', 'Kelcie Chillingsworth', '239683541-6', 875, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'Image44.png', 'Thriller,Adventure,Horror', 'English', 'Fight,Blood', 1, 1, 0, '2023-06-04 12:34:59'),
(45, 'Grim Reaper', 'Biddy Gokes', '756667386-6', 923, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\\n\\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Image45.png', 'Action,Adventure,Fantasy,Mystery', 'English', 'Fight,Blood,Mystery', 1, 1, 0, '2023-06-04 12:34:52'),
(46, 'Legends of the Canyon', 'Cathlene Haldon', '675766933-1', 743, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\\n\\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\\n\\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Image46.png', 'Fantasy,Science Fiction', 'English', 'Happy ending,Fantasy,Monsters', 0, 0, 0, '2023-06-04 10:14:51'),
(47, 'Red Rock West', 'Cleo De Ruel', '710886244-1', 467, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Image47.png', 'Adventure,Action,Comedy', 'English', 'Funny,Fight,Blood', 1, 2, 0, '2023-06-04 12:33:58'),
(48, 'Under the Bridges (Unter den Brücken)', 'Randell Ziehms', '175700790-3', 364, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\\n\\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Image48.png', 'Horror,Thriller', 'English', 'Fight,Night,Ghosts', 1, 1, 0, '2023-06-04 12:35:30'),
(49, 'Sometimes in April', 'Howard Dinnies', '525204345-0', 945, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Image49.png', 'Romance,Adventure,Comedy', 'English', 'Spring,Love,Funny,Happy Ending', 1, 0, 0, '2023-06-04 12:35:35'),
(50, 'Mighty Aphrodite', 'Beulah Ethelston', '205158615-2', 543, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Image50.png', 'Action,Adventure,Fantasy', 'English', 'Monsters,Fantasy,Gods', 1, 0, 0, '2023-06-04 12:34:23'),
(51, 'Baby Boy', 'Delly Gerleit', '738701854-5', 453, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\\n\\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\\n\\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Image51.png', 'Adventure,Action,Comedy', 'English', 'Funny,Fight', 0, 1, 0, '2023-06-04 11:57:50'),
(52, 'Shrek 2', 'Deerdre Porrett', '985255029-2', 453, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\\n\\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\\n\\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'Image52.png', 'Comedy,Science Fiction,Adventure,Romance', 'English', 'Monsters,Fantasy', 1, 0, 0, '2023-06-04 12:34:34'),
(53, 'Mad Love (Sappho)', 'Koral Hembry', '558265507-7', 325, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\\n\\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Image53.png', 'Romance,Adventure,Comedy', 'English', 'Summer,Love,Funny', 1, 0, 0, '2023-06-04 12:34:04'),
(54, 'Just One of the Guys', 'Paddie Biggerdike', '975866563-4', 567, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\\n\\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Image54.png', 'Science Fiction,Action,Adventure,Mystery', 'English', 'Gods,Olympus,Monsters', 0, 0, 0, '2023-06-04 10:25:27'),
(55, 'Producers, The', 'Lion Yearnes', '653458633-9', 345, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Image55.png', 'Action,Horror', 'English', 'Guns', 0, 0, 0, '2023-06-04 10:26:44'),
(56, 'Hellgate', 'Cecilla Ellaway', '118422678-4', 468, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Image56.png', 'Adventure,Science Fiction,Fantasy', 'English', 'Gods,Hell,', 0, 0, 0, '2023-06-04 10:27:36'),
(57, 'Maîtresse (Mistress)', 'Perla Indge', '548335837-6', 657, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Image57.png', 'Action,Horror,Crime', 'English', 'Zombies,Blood,Fight', 0, 0, 0, '2023-06-04 10:28:18'),
(58, 'Charlie Chan at the Race Track', 'Dante Mendonca', '028692298-3', 534, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Image58.png', 'Comedy,Science Fiction', 'English', 'Funny', 1, 0, 0, '2023-06-04 12:35:07'),
(59, 'I Was Monty\'s Double', 'Erina Gladdifh', '922800976-4', 634, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\\n\\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Image59.png', 'Action,Horror,Thriller', 'English', 'Scary,Horror,Night', 0, 0, 0, '2023-06-04 10:29:58'),
(60, 'Night of the Shooting Stars (Notte di San Lorenzo, La)', 'Indira Pagden', '935115648-6', 738, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\\n\\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Image60.png', 'Thriller,Adventure,Horror', 'English', 'Scary,Horror,Night', 0, 0, 0, '2023-06-04 10:31:06'),
(61, 'Fast and the Furious: Tokyo Drift, The (Fast and the Furious 3, The)', 'Danny Nono', '733376188-6', 432, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Image61.png', 'Action,Adventure', 'English', 'Cars,Race,Fight', 0, 1, 0, '2023-06-04 11:58:24'),
(62, 'Pawn', 'Minerva Fadell', '036712148-4', 644, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Image62.png', 'Action,Horror,Thriller', 'English', 'Guns,Fight,Scary', 1, 0, 0, '2023-06-04 12:35:16'),
(63, 'Showtime', 'Clary Stuckford', '949439265-5', 453, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\\n\\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\\n\\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Image63.png', 'War,Horror,Action,Crime', 'English', 'War,Exotic,Fight,Guns', 0, 0, 0, '2023-06-04 10:34:15'),
(64, 'Kidnap Syndicate', 'Merralee Jurgenson', '340590416-1', 563, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\\n\\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Image64.png', 'Action,Horror,Drama', 'English', 'Drama,Kidnap,Fight', 0, 0, 0, '2023-06-04 10:35:06'),
(65, 'Miss March', 'Carroll Greg', '906863287-6', 433, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\\n\\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 'Image65.png', 'Comedy,Science Fiction,Adventure,Romance', 'English', 'Love,Happy Ending', 0, 0, 0, '2023-06-04 10:35:57'),
(66, 'The Pool Boys', 'Luciano Orhtmann', '119509158-3', 542, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\\n\\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\\n\\nFusce consequat. Nulla nisl. Nunc nisl.', 'Image66.png', 'Adventure,Action,Comedy', 'English', 'Summer,Fight,Suspense', 0, 0, 0, '2023-06-04 10:36:45'),
(67, 'Double Team', 'Sinclair Stilly', '729999740-1', 432, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\\n\\nIn congue. Etiam justo. Etiam pretium iaculis justo.\\n\\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Image67.png', 'Action,Horror,Crime,Mystery', 'English', 'Fight,Blood,Mystery', 0, 0, 0, '2023-06-04 10:37:43'),
(68, 'Zero Day', 'Wallas Gookey', '963122117-2', 534, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\\n\\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\\n\\nFusce consequat. Nulla nisl. Nunc nisl.', 'Image68.png', 'Action,Horror,Thriller,Mystery', 'English', 'Fight,Blood,Mystery', 0, 1, 0, '2023-06-04 12:01:29'),
(69, 'Good Thief, The', 'Jonathan Sallnow', '816817791-6', 432, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\\n\\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Image69.png', 'Action,Adventure,Fantasy,Science Fiction', 'English', 'Fight,Monsters', 1, 0, 0, '2023-06-04 12:35:41'),
(70, 'I Remember Mama', 'Godwin MacCroary', '455820423-X', 567, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Image70.png', 'Mystery,Adventure', 'English', 'Mystery,Suspense', 0, 1, 0, '2023-06-04 11:59:36'),
(71, 'Un Poliziotto Scomodo', 'Cello Gallear', '862399166-4', 435, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'Image71.png', 'Romance,Adventure,Comedy', 'English', 'Summer,Love,Funny', 1, 0, 0, '2023-06-04 12:28:32'),
(72, 'Mother\'s Day', 'Gerti Tenant', '671146167-3', 534, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Image72.png', 'Adventure,Science Fiction,Fantasy', 'English', 'Monsters,Fantasy', 1, 1, 0, '2023-06-04 12:28:46'),
(73, 'Stranded: I\'ve Come from a Plane That Crashed on the Mountains', 'Dulsea Hardbattle', '544557419-9', 645, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\\n\\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\\n\\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 'Image73.png', 'Action,Adventure,Mystery', 'English', 'Stranded,Jungle,Suspense', 1, 0, 0, '2023-06-04 12:27:49'),
(74, 'Far North', 'Sheeree Blaskett', '700689742-4', 435, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\\n\\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Image74.png', 'Action,Adventure,Fantasy', 'English', 'Fight,Monsters', 1, 1, 0, '2023-06-04 12:27:37'),
(75, 'Only God Forgives', 'Bertina Stather', '082881154-7', 293, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Image75.png', 'Thriller,Adventure,Horror', 'English', 'Scary,Horror,Night', 0, 0, 0, '2023-06-04 10:47:39'),
(76, 'Scooby-Doo! The Mystery Begins', 'Clem Beardsall', '668041410-5', 765, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Image76.png', 'Science Fiction,Comedy,Action,Adventure,Mystery', 'English', 'Monsters,Fantasy,Funny', 0, 1, 0, '2023-06-04 12:12:57'),
(77, 'Oh, Sun (Soleil O)', 'Courtney McIlvaney', '558916433-8', 535, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\\n\\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\\n\\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'Image77.png', 'Action,Horror,Thriller', 'English', 'Scary,Horror,Night', 0, 0, 0, '2023-06-04 10:49:07'),
(78, 'Twilight People, The', 'Myrna Stanners', '221231890-1', 645, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'Image78.png', 'Action,Adventure,Fantasy', 'English', 'Vampires,Blood', 1, 0, 0, '2023-06-04 12:29:36'),
(79, 'Behaving Badly', 'Erasmus Deinhardt', '593176837-8', 654, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\\n\\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\\n\\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Image79.png', 'Horror,Thriller', 'English', 'Scary,Horror,Night', 1, 0, 0, '2023-06-04 12:29:43'),
(80, 'Adventures of Sherlock Holmes, The', 'Michel Maestrini', '252530165-X', 756, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'Image80.png', 'Crime,Mystery', 'English', 'Murders,Crime,Blood,Detective', 0, 0, 0, '2023-06-04 10:53:30'),
(81, 'Our Family Wedding', 'Samuele Lendrem', '930603193-9', 645, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\\n\\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Image81.png', 'Action,Horror,Thriller', 'English', 'Fight', 1, 1, 0, '2023-06-04 12:29:10'),
(82, 'Batman Begins', 'Elva Knights', '739313090-4', 423, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\\n\\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\\n\\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Image82.png', 'Mystery,Adventure,Action', 'English', 'Suspence,Fight', 0, 1, 0, '2023-06-04 12:06:53'),
(83, 'Black River (Kuroi kawa)', 'Lind Samuel', '704718912-2', 654, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\\n\\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\\n\\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Image83.png', 'Action,Horror,Crime', 'English', 'Crime,Blood,Fight,Murders', 1, 1, 0, '2023-06-04 12:28:25'),
(84, 'Tracey Fragments', 'Caleb Thirsk', '015466470-7', 345, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\\n\\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\\n\\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Image84.png', 'Comedy,Science Fiction,Adventure,Romance', 'English', 'Summer,Love,Funny', 1, 1, 0, '2023-06-04 12:28:40'),
(85, 'Crossfire', 'Henka Fraser', '442605794-9', 234, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\\n\\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\\n\\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Image85.png', 'War,Horror,Action,Crime', 'English', 'War,Exotic,Fight,Guns', 1, 0, 0, '2023-06-04 12:29:50'),
(86, 'A Smoky Mountain Christmas', 'Duffy Ledur', '382646524-5', 543, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\\n\\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\\n\\nFusce consequat. Nulla nisl. Nunc nisl.', 'Image86.png', 'Romance,Adventure,Comedy', 'English', 'Love,Happy Ending', 0, 0, 0, '2023-06-04 11:00:03'),
(87, 'Junkopia', 'Ham Champain', '323361976-6', 235, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Image87.png', 'Adventure,Action,Comedy', 'English', 'Beach,Summer,Fight', 0, 1, 0, '2023-06-04 12:15:08'),
(88, 'Children of Paradise (Les enfants du paradis)', 'Artus Maroney', '219343036-5', 236, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Image88.png', 'Comedy,Science Fiction,Adventure', 'English', 'Summer,Funny,Monsters', 1, 0, 0, '2023-06-04 12:23:26'),
(89, 'Cat People', 'Odella Veare', '900228435-7', 543, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\\n\\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\\n\\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Image89.png', 'Action,Horror,Crime,War', 'English', 'War,Exotic,Fight,Guns', 1, 0, 0, '2023-06-04 12:23:32'),
(90, 'Camp Rock 2: The Final Jam', 'Elroy Begley', '848269180-5', 534, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\\n\\nIn congue. Etiam justo. Etiam pretium iaculis justo.\\n\\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'Image90.png', 'Comedy,Musical,Romance', 'English', 'Music,Love,Summer Camp', 0, 1, 0, '2023-06-04 12:13:46'),
(91, 'Suzhou River (Suzhou he)', 'Hadlee Oels', '829752994-0', 543, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\\n\\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Image91.png', 'Adventure,Science Fiction,Fantasy,Comedy', 'English', 'Monsters,Fantasy,Funny', 0, 0, 0, '2023-06-04 11:05:41'),
(92, 'Dreams That Money Can Buy', 'Blakeley Dykas', '232342950-7', 753, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\\n\\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\\n\\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Image92.png', 'Adventure,Action,Comedy', 'English', 'Funny,Suspense', 0, 0, 0, '2023-06-04 11:06:30'),
(93, 'Air Up There', 'Linet Kornas', '093166722-4', 645, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\\n\\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Image93.png', 'Comedy,Science Fiction,Adventure,Romance', 'English', 'Summer,Love,Suspense', 0, 1, 0, '2023-06-04 12:14:38'),
(94, 'I, the Worst of All (Yo, la peor de todas)', 'Thomasina Iffland', '138687214-8', 675, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\\n\\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Image94.png', 'Thriller,Adventure,Horror', 'English', 'Scary,Horror,Night', 0, 0, 0, '2023-06-04 11:07:47'),
(95, 'Goats', 'Hardy Clutram', '119599108-8', 765, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\\n\\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\\n\\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Image95.png', 'Comedy,Science Fiction', 'English', 'Animals,Monsters', 0, 0, 0, '2023-06-04 11:08:28'),
(96, 'Why Worry?', 'Cyrille Cowderoy', '176818065-2', 543, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\\n\\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\\n\\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Image96.png', 'War,Horror,Action,Crime', 'English', 'War,Exotic,Fight,Guns', 0, 1, 0, '2023-06-04 12:14:43'),
(97, 'Collection, The', 'Nelson Druitt', '899447007-7', 345, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\\n\\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Image97.png', 'Action,Horror', 'English', 'Fight,Blood,Night,Scary', 1, 0, 0, '2023-06-04 12:23:46'),
(98, 'Playing \'In the Company of Men\' (En jouant \'Dans la compagnie des hommes\')', 'Derrek Tungate', '306339125-5', 564, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Image98.png', 'Action,Horror,Crime,Mystery', 'English', 'Fight,Blood,Mystery', 0, 1, 0, '2023-06-04 12:15:03'),
(99, 'Strings', 'Dennie Cowill', '678397006-X', 564, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'Image99.png', 'Crime,Mystery', 'English', 'Murders,Crime,Blood,Detective', 0, 0, 0, '2023-06-04 11:10:52'),
(100, 'Penelope', 'Gennifer Jamieson', '664750987-9', 645, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\\n\\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\\n\\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Image100.png', 'Science Fiction,Action,Adventure,Mystery,Fantasy', 'English', 'Gods,Olympus,Monsters', 0, 0, 0, '2023-06-04 11:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `Author_id` int(11) NOT NULL,
  `Book_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_author`
--

INSERT INTO `book_author` (`Author_id`, `Book_id`, `last_update`) VALUES
(1, 1, '2023-06-03 22:12:18'),
(2, 2, '2023-06-03 22:14:13'),
(3, 3, '2023-06-03 22:15:35'),
(1, 4, '2023-06-03 22:16:33'),
(2, 5, '2023-06-03 22:17:40'),
(4, 6, '2023-06-03 22:19:49'),
(1, 7, '2023-06-03 22:20:59'),
(5, 8, '2023-06-03 22:22:20'),
(2, 9, '2023-06-03 22:23:28'),
(3, 10, '2023-06-03 22:24:59'),
(2, 11, '2023-06-03 22:25:50'),
(3, 12, '2023-06-03 22:27:08'),
(5, 13, '2023-06-03 22:28:20'),
(1, 14, '2023-06-03 22:29:24'),
(4, 15, '2023-06-03 22:30:24'),
(1, 16, '2023-06-03 22:32:45'),
(1, 17, '2023-06-03 22:39:18'),
(3, 18, '2023-06-03 22:41:52'),
(2, 19, '2023-06-03 22:42:39'),
(4, 20, '2023-06-03 22:43:21'),
(5, 21, '2023-06-03 22:45:32'),
(1, 22, '2023-06-03 22:49:34'),
(2, 23, '2023-06-03 22:50:25'),
(4, 24, '2023-06-03 22:51:10'),
(3, 25, '2023-06-03 22:52:04'),
(6, 26, '2023-06-04 09:43:35'),
(6, 27, '2023-06-04 09:44:37'),
(1, 28, '2023-06-04 09:45:28'),
(2, 29, '2023-06-04 09:46:21'),
(1, 30, '2023-06-04 09:50:23'),
(1, 31, '2023-06-04 09:51:45'),
(6, 32, '2023-06-04 09:52:29'),
(5, 33, '2023-06-04 09:55:01'),
(6, 34, '2023-06-04 10:02:16'),
(2, 35, '2023-06-04 10:03:20'),
(4, 36, '2023-06-04 10:04:30'),
(1, 37, '2023-06-04 10:05:31'),
(2, 37, '2023-06-04 10:05:31'),
(1, 38, '2023-06-04 10:07:13'),
(6, 38, '2023-06-04 10:07:13'),
(5, 39, '2023-06-04 10:08:05'),
(1, 40, '2023-06-04 10:09:11'),
(6, 41, '2023-06-04 10:09:54'),
(1, 42, '2023-06-04 10:10:49'),
(2, 42, '2023-06-04 10:10:49'),
(1, 43, '2023-06-04 10:11:58'),
(4, 43, '2023-06-04 10:11:58'),
(2, 44, '2023-06-04 10:12:50'),
(7, 45, '2023-06-04 10:13:53'),
(7, 46, '2023-06-04 10:14:51'),
(6, 47, '2023-06-04 10:15:44'),
(2, 48, '2023-06-04 10:16:41'),
(1, 49, '2023-06-04 10:17:31'),
(1, 50, '2023-06-04 10:18:22'),
(2, 51, '2023-06-04 10:21:23'),
(5, 51, '2023-06-04 10:21:23'),
(1, 52, '2023-06-04 10:24:08'),
(2, 52, '2023-06-04 10:24:08'),
(6, 53, '2023-06-04 10:24:42'),
(7, 54, '2023-06-04 10:25:27'),
(8, 55, '2023-06-04 10:26:44'),
(8, 56, '2023-06-04 10:27:36'),
(1, 57, '2023-06-04 10:28:18'),
(7, 58, '2023-06-04 10:29:12'),
(1, 59, '2023-06-04 10:29:58'),
(2, 59, '2023-06-04 10:29:58'),
(8, 60, '2023-06-04 10:31:06'),
(1, 61, '2023-06-04 10:32:15'),
(4, 62, '2023-06-04 10:33:00'),
(8, 63, '2023-06-04 10:34:15'),
(2, 64, '2023-06-04 10:35:06'),
(6, 65, '2023-06-04 10:35:57'),
(8, 66, '2023-06-04 10:36:45'),
(4, 67, '2023-06-04 10:37:43'),
(7, 67, '2023-06-04 10:37:43'),
(2, 68, '2023-06-04 10:38:41'),
(7, 68, '2023-06-04 10:38:41'),
(1, 69, '2023-06-04 10:39:24'),
(9, 70, '2023-06-04 10:40:24'),
(6, 71, '2023-06-04 10:43:54'),
(2, 72, '2023-06-04 10:44:46'),
(7, 73, '2023-06-04 10:45:49'),
(1, 74, '2023-06-04 10:46:58'),
(4, 74, '2023-06-04 10:46:58'),
(9, 75, '2023-06-04 10:47:39'),
(2, 76, '2023-06-04 10:48:34'),
(2, 77, '2023-06-04 10:49:07'),
(9, 78, '2023-06-04 10:52:04'),
(7, 79, '2023-06-04 10:52:41'),
(1, 80, '2023-06-04 10:53:30'),
(8, 81, '2023-06-04 10:55:55'),
(7, 82, '2023-06-04 10:56:33'),
(2, 83, '2023-06-04 10:57:26'),
(2, 84, '2023-06-04 10:58:00'),
(1, 85, '2023-06-04 10:58:42'),
(2, 85, '2023-06-04 10:58:42'),
(9, 86, '2023-06-04 11:00:03'),
(6, 87, '2023-06-04 11:00:42'),
(1, 88, '2023-06-04 11:01:30'),
(6, 88, '2023-06-04 11:01:30'),
(1, 89, '2023-06-04 11:02:05'),
(2, 90, '2023-06-04 11:02:51'),
(6, 91, '2023-06-04 11:05:41'),
(10, 92, '2023-06-04 11:06:30'),
(1, 93, '2023-06-04 11:07:16'),
(6, 94, '2023-06-04 11:07:47'),
(2, 95, '2023-06-04 11:08:28'),
(9, 96, '2023-06-04 11:09:04'),
(10, 96, '2023-06-04 11:09:04'),
(6, 97, '2023-06-04 11:09:43'),
(8, 98, '2023-06-04 11:10:20'),
(7, 99, '2023-06-04 11:10:52'),
(2, 100, '2023-06-04 11:11:25');

--
-- Triggers `book_author`
--
DELIMITER $$
CREATE TRIGGER `Num_of_Books_Author` AFTER INSERT ON `book_author` FOR EACH ROW BEGIN
	UPDATE author SET Num_of_books_written=Num_of_books_written+1 WHERE Author_id=NEW.Author_id;
    
   END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `Book_Category_Id` int(11) NOT NULL,
  `Category_id` int(11) NOT NULL,
  `Book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`Book_Category_Id`, `Category_id`, `Book_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 2),
(6, 1, 3),
(7, 5, 3),
(8, 3, 3),
(9, 6, 4),
(10, 1, 5),
(11, 7, 5),
(12, 5, 5),
(13, 8, 6),
(14, 1, 6),
(15, 2, 6),
(16, 1, 7),
(17, 5, 7),
(18, 9, 7),
(19, 2, 8),
(20, 3, 8),
(21, 5, 8),
(22, 1, 9),
(23, 5, 9),
(24, 9, 10),
(25, 5, 10),
(26, 10, 11),
(27, 1, 11),
(28, 1, 12),
(29, 11, 12),
(30, 10, 12),
(31, 9, 13),
(32, 1, 13),
(33, 10, 13),
(34, 4, 13),
(35, 1, 14),
(36, 2, 14),
(37, 11, 14),
(38, 12, 15),
(39, 1, 15),
(40, 5, 15),
(41, 11, 15),
(42, 2, 16),
(43, 3, 16),
(44, 1, 17),
(45, 2, 17),
(46, 9, 17),
(47, 10, 18),
(48, 1, 18),
(49, 12, 19),
(50, 8, 19),
(51, 1, 20),
(52, 2, 20),
(53, 7, 21),
(54, 8, 21),
(55, 3, 21),
(56, 3, 22),
(57, 5, 22),
(58, 12, 23),
(59, 2, 23),
(60, 7, 24),
(61, 8, 24),
(62, 3, 24),
(63, 11, 25),
(64, 10, 25),
(65, 5, 25),
(66, 1, 26),
(67, 2, 26),
(68, 11, 26),
(69, 11, 27),
(70, 8, 27),
(71, 4, 28),
(72, 5, 28),
(73, 6, 28),
(74, 11, 29),
(75, 1, 29),
(76, 1, 30),
(77, 2, 30),
(78, 4, 31),
(79, 5, 31),
(80, 6, 31),
(81, 11, 32),
(82, 1, 32),
(83, 2, 32),
(84, 5, 33),
(85, 1, 33),
(86, 1, 34),
(87, 11, 34),
(88, 12, 34),
(89, 1, 35),
(90, 5, 35),
(91, 10, 35),
(92, 7, 36),
(93, 2, 36),
(94, 1, 36),
(95, 8, 36),
(96, 4, 37),
(97, 5, 37),
(98, 6, 37),
(99, 7, 38),
(100, 2, 38),
(101, 1, 38),
(102, 8, 38),
(103, 3, 39),
(104, 5, 39),
(105, 2, 39),
(106, 1, 40),
(107, 5, 40),
(108, 10, 40),
(109, 6, 41),
(110, 1, 42),
(111, 2, 42),
(112, 3, 42),
(113, 9, 42),
(114, 1, 43),
(115, 2, 43),
(116, 3, 44),
(117, 5, 44),
(118, 2, 44),
(119, 1, 45),
(120, 5, 45),
(121, 10, 45),
(122, 12, 45),
(123, 10, 46),
(124, 11, 46),
(125, 5, 47),
(126, 1, 47),
(127, 6, 47),
(128, 2, 48),
(129, 3, 48),
(130, 4, 49),
(131, 5, 49),
(132, 6, 49),
(133, 1, 50),
(134, 5, 50),
(135, 10, 50),
(136, 5, 51),
(137, 1, 51),
(138, 6, 51),
(139, 6, 52),
(140, 11, 52),
(141, 5, 52),
(142, 4, 52),
(143, 4, 53),
(144, 5, 53),
(145, 6, 53),
(146, 11, 54),
(147, 1, 54),
(148, 5, 54),
(149, 12, 54),
(150, 1, 55),
(151, 2, 55),
(152, 5, 56),
(153, 11, 56),
(154, 10, 56),
(155, 1, 57),
(156, 2, 57),
(157, 8, 57),
(158, 6, 58),
(159, 11, 58),
(160, 1, 59),
(161, 2, 59),
(162, 3, 59),
(163, 3, 60),
(164, 5, 60),
(165, 2, 60),
(166, 1, 61),
(167, 5, 61),
(168, 1, 62),
(169, 2, 62),
(170, 3, 62),
(171, 7, 63),
(172, 2, 63),
(173, 1, 63),
(174, 8, 63),
(175, 1, 64),
(176, 2, 64),
(177, 9, 64),
(178, 6, 65),
(179, 11, 65),
(180, 5, 65),
(181, 4, 65),
(182, 5, 66),
(183, 1, 66),
(184, 6, 66),
(185, 1, 67),
(186, 2, 67),
(187, 8, 67),
(188, 12, 67),
(189, 1, 68),
(190, 2, 68),
(191, 3, 68),
(192, 12, 68),
(193, 1, 69),
(194, 5, 69),
(195, 10, 69),
(196, 11, 69),
(197, 12, 70),
(198, 5, 70),
(199, 4, 71),
(200, 5, 71),
(201, 6, 71),
(202, 5, 72),
(203, 11, 72),
(204, 10, 72),
(205, 1, 73),
(206, 5, 73),
(207, 12, 73),
(208, 1, 74),
(209, 5, 74),
(210, 10, 74),
(211, 3, 75),
(212, 5, 75),
(213, 2, 75),
(214, 11, 76),
(215, 6, 76),
(216, 1, 76),
(217, 5, 76),
(218, 12, 76),
(219, 1, 77),
(220, 2, 77),
(221, 3, 77),
(222, 1, 78),
(223, 5, 78),
(224, 10, 78),
(225, 2, 79),
(226, 3, 79),
(227, 8, 80),
(228, 12, 80),
(229, 1, 81),
(230, 2, 81),
(231, 3, 81),
(232, 12, 82),
(233, 5, 82),
(234, 1, 82),
(235, 1, 83),
(236, 2, 83),
(237, 8, 83),
(238, 6, 84),
(239, 11, 84),
(240, 5, 84),
(241, 4, 84),
(242, 7, 85),
(243, 2, 85),
(244, 1, 85),
(245, 8, 85),
(246, 4, 86),
(247, 5, 86),
(248, 6, 86),
(249, 5, 87),
(250, 1, 87),
(251, 6, 87),
(252, 6, 88),
(253, 11, 88),
(254, 5, 88),
(255, 1, 89),
(256, 2, 89),
(257, 8, 89),
(258, 7, 89),
(259, 6, 90),
(260, 14, 90),
(261, 4, 90),
(262, 5, 91),
(263, 11, 91),
(264, 10, 91),
(265, 6, 91),
(266, 5, 92),
(267, 1, 92),
(268, 6, 92),
(269, 6, 93),
(270, 11, 93),
(271, 5, 93),
(272, 4, 93),
(273, 3, 94),
(274, 5, 94),
(275, 2, 94),
(276, 6, 95),
(277, 11, 95),
(278, 7, 96),
(279, 2, 96),
(280, 1, 96),
(281, 8, 96),
(282, 1, 97),
(283, 2, 97),
(284, 1, 98),
(285, 2, 98),
(286, 8, 98),
(287, 12, 98),
(288, 8, 99),
(289, 12, 99),
(290, 11, 100),
(291, 1, 100),
(292, 5, 100),
(293, 12, 100),
(294, 10, 100);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_id`, `Name`, `last_update`) VALUES
(1, 'Action', '0000-00-00 00:00:00'),
(2, 'Horror', '0000-00-00 00:00:00'),
(3, 'Thriller', '0000-00-00 00:00:00'),
(4, 'Romance', '0000-00-00 00:00:00'),
(5, 'Adventure', '0000-00-00 00:00:00'),
(6, 'Comedy', '0000-00-00 00:00:00'),
(7, 'War', '0000-00-00 00:00:00'),
(8, 'Crime', '0000-00-00 00:00:00'),
(9, 'Drama', '0000-00-00 00:00:00'),
(10, 'Fantasy', '0000-00-00 00:00:00'),
(11, 'Science Fiction', '0000-00-00 00:00:00'),
(12, 'Mystery', '0000-00-00 00:00:00'),
(14, 'Musical', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `copies`
--

CREATE TABLE `copies` (
  `Copies_id` int(11) NOT NULL,
  `Number_of_Available_Copies` int(11) NOT NULL,
  `School_id` int(11) NOT NULL,
  `Book_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `copies`
--

INSERT INTO `copies` (`Copies_id`, `Number_of_Available_Copies`, `School_id`, `Book_id`, `last_update`) VALUES
(1, 10, 2, 1, '2023-06-04 13:56:09'),
(2, 8, 2, 2, '2023-06-04 13:37:24'),
(3, 18, 2, 3, '2023-06-04 13:30:32'),
(4, 11, 2, 4, '2023-06-03 22:16:33'),
(5, 12, 2, 5, '2023-06-04 11:40:56'),
(6, 17, 2, 6, '2023-06-04 07:41:17'),
(7, 5, 2, 7, '2023-06-03 22:20:59'),
(8, 7, 2, 8, '2023-06-04 13:24:59'),
(9, 11, 2, 9, '2023-06-03 22:23:29'),
(10, 13, 2, 10, '2023-06-04 12:25:44'),
(11, 9, 2, 11, '2023-06-03 22:25:50'),
(12, 13, 2, 12, '2023-06-03 22:27:08'),
(13, 8, 2, 13, '2023-06-03 22:28:20'),
(14, 17, 2, 14, '2023-06-03 22:29:24'),
(15, 14, 2, 15, '2023-06-04 12:25:35'),
(16, 13, 2, 16, '2023-06-04 12:25:56'),
(17, 12, 3, 17, '2023-06-04 12:29:17'),
(18, 17, 3, 18, '2023-06-04 12:27:19'),
(19, 18, 3, 19, '2023-06-04 12:28:56'),
(20, 13, 3, 20, '2023-06-04 12:27:04'),
(21, 13, 3, 21, '2023-06-04 12:28:18'),
(22, 13, 3, 22, '2023-06-04 12:27:43'),
(23, 16, 3, 23, '2023-06-04 12:27:24'),
(24, 16, 3, 24, '2023-06-04 12:28:03'),
(25, 13, 3, 25, '2023-06-03 22:52:04'),
(26, 15, 3, 26, '2023-06-04 12:27:55'),
(27, 21, 3, 27, '2023-06-04 09:44:37'),
(28, 15, 3, 28, '2023-06-04 09:45:28'),
(29, 16, 3, 29, '2023-06-04 09:46:21'),
(30, 18, 3, 30, '2023-06-04 12:29:02'),
(31, 18, 3, 31, '2023-06-04 09:51:45'),
(32, 18, 3, 32, '2023-06-04 12:28:10'),
(33, 3, 4, 33, '2023-06-04 12:33:53'),
(34, 11, 4, 34, '2023-06-04 10:02:16'),
(35, 15, 4, 35, '2023-06-04 12:35:22'),
(36, 13, 4, 36, '2023-06-04 12:34:39'),
(37, 12, 4, 37, '2023-06-04 12:33:49'),
(38, 17, 4, 38, '2023-06-04 10:07:13'),
(39, 10, 4, 39, '2023-06-04 12:35:50'),
(40, 15, 4, 40, '2023-06-04 12:34:48'),
(41, 19, 4, 41, '2023-06-04 10:09:54'),
(42, 7, 4, 42, '2023-06-04 10:10:49'),
(43, 12, 4, 43, '2023-06-04 12:34:11'),
(44, 18, 4, 44, '2023-06-04 12:34:59'),
(45, 5, 4, 45, '2023-06-04 12:34:52'),
(46, 13, 4, 46, '2023-06-04 10:14:51'),
(47, 11, 4, 47, '2023-06-04 12:33:58'),
(48, 9, 4, 48, '2023-06-04 12:35:30'),
(49, 14, 4, 49, '2023-06-04 12:35:35'),
(50, 13, 4, 50, '2023-06-04 12:34:23'),
(51, 13, 4, 51, '2023-06-04 10:21:23'),
(52, 21, 4, 52, '2023-06-04 12:34:34'),
(53, 13, 4, 53, '2023-06-04 12:34:04'),
(54, 11, 4, 54, '2023-06-04 10:25:27'),
(55, 3, 4, 55, '2023-06-04 10:26:44'),
(56, 7, 4, 56, '2023-06-04 10:27:36'),
(57, 9, 4, 57, '2023-06-04 10:28:18'),
(58, 12, 4, 58, '2023-06-04 12:35:07'),
(59, 9, 4, 59, '2023-06-04 10:29:58'),
(60, 4, 4, 60, '2023-06-04 10:31:06'),
(61, 13, 4, 61, '2023-06-04 10:32:15'),
(62, 12, 4, 62, '2023-06-04 12:35:16'),
(63, 16, 4, 63, '2023-06-04 10:34:15'),
(64, 11, 4, 64, '2023-06-04 10:35:06'),
(65, 7, 4, 65, '2023-06-04 10:35:57'),
(66, 8, 4, 66, '2023-06-04 10:36:45'),
(67, 6, 4, 67, '2023-06-04 10:37:43'),
(68, 7, 4, 68, '2023-06-04 10:38:41'),
(69, 7, 4, 69, '2023-06-04 12:35:41'),
(70, 7, 4, 70, '2023-06-04 10:40:24'),
(71, 4, 3, 71, '2023-06-04 12:28:32'),
(72, 4, 3, 72, '2023-06-04 12:28:46'),
(73, 7, 3, 73, '2023-06-04 12:27:49'),
(74, 6, 3, 74, '2023-06-04 12:27:37'),
(75, 7, 3, 75, '2023-06-04 10:47:39'),
(76, 8, 3, 76, '2023-06-04 10:48:34'),
(77, 8, 3, 77, '2023-06-04 10:49:07'),
(78, 5, 3, 78, '2023-06-04 12:29:36'),
(79, 8, 3, 79, '2023-06-04 12:29:43'),
(80, 9, 3, 80, '2023-06-04 10:53:30'),
(81, 6, 3, 81, '2023-06-04 12:29:10'),
(82, 8, 3, 82, '2023-06-04 10:56:33'),
(83, 8, 3, 83, '2023-06-04 12:28:25'),
(84, 10, 3, 84, '2023-06-04 12:28:40'),
(85, 13, 3, 85, '2023-06-04 12:29:50'),
(86, 9, 2, 86, '2023-06-04 11:00:03'),
(87, 9, 2, 87, '2023-06-04 11:00:42'),
(88, 6, 2, 88, '2023-06-04 12:23:26'),
(89, 6, 2, 89, '2023-06-04 12:23:32'),
(90, 6, 2, 90, '2023-06-04 11:02:51'),
(91, 8, 2, 91, '2023-06-04 11:05:41'),
(92, 10, 2, 92, '2023-06-04 11:06:30'),
(93, 8, 2, 93, '2023-06-04 11:07:16'),
(94, 9, 2, 94, '2023-06-04 11:07:47'),
(95, 11, 2, 95, '2023-06-04 11:08:28'),
(96, 15, 2, 96, '2023-06-04 11:09:04'),
(97, 14, 2, 97, '2023-06-04 12:23:46'),
(98, 17, 2, 98, '2023-06-04 11:10:20'),
(99, 12, 2, 99, '2023-06-04 11:10:52'),
(100, 13, 2, 100, '2023-06-04 11:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
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
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`Loan_id`, `Library_Operator_id`, `User_id`, `Book_id`, `date_borrowed`, `date_returned`, `fullfilled`, `last_update`) VALUES
(1, 2, 45, 1, '2023-06-04 08:24:57', '0000-00-00 00:00:00', 1, '2023-06-04 07:06:53'),
(2, 2, 45, 1, '2023-06-04 08:25:10', '0000-00-00 00:00:00', 1, '2023-06-04 07:07:03'),
(3, 2, 8, 2, '2023-05-04 08:25:26', '2023-06-04 16:37:24', 1, '2023-06-04 13:37:24'),
(4, 2, 45, 5, '2023-06-04 08:25:34', '0000-00-00 00:00:00', 1, '2023-06-04 07:07:08'),
(5, 2, 5, 1, '2023-06-04 08:36:08', '0000-00-00 00:00:00', 1, '2023-06-04 06:06:30'),
(6, 2, 5, 3, '2023-05-04 08:36:18', '2023-06-04 16:30:12', 1, '2023-06-04 13:30:32'),
(7, 2, 5, 3, '2023-06-04 08:36:23', '0000-00-00 00:00:00', 1, '2023-06-04 06:06:54'),
(8, 2, 5, 6, '2023-06-04 08:37:07', '0000-00-00 00:00:00', 1, '2023-06-04 06:07:02'),
(9, 2, 5, 1, '2023-06-04 08:44:29', '0000-00-00 00:00:00', 1, '2023-06-04 06:07:08'),
(10, 2, 5, 1, '2023-06-04 08:44:55', '0000-00-00 00:00:00', 1, '2023-06-04 06:09:58'),
(11, 2, 5, 1, '2023-06-04 08:45:13', '0000-00-00 00:00:00', 1, '2023-06-04 06:11:16'),
(12, 2, 5, 1, '2023-06-04 08:48:09', '2023-06-04 12:28:59', 1, '2023-06-04 09:28:59'),
(13, 2, 5, 1, '2023-06-04 08:49:50', '2023-06-04 15:18:41', 1, '2023-06-04 12:18:41'),
(14, 2, 5, 1, '2023-06-04 08:50:58', '2023-06-04 15:18:53', 1, '2023-06-04 12:18:53'),
(15, 2, 5, 1, '2023-06-04 08:51:04', '2023-06-04 15:22:47', 1, '2023-06-04 12:22:47'),
(16, 2, 5, 1, '2023-06-04 08:51:37', '2023-06-04 15:22:56', 1, '2023-06-04 12:22:56'),
(17, 2, 5, 1, '2023-06-04 08:52:07', '2023-06-04 15:22:34', 1, '2023-06-04 12:22:34'),
(18, 2, 2, 3, '2023-06-04 10:17:00', '0000-00-00 00:00:00', 0, '2023-06-04 07:17:00'),
(19, 2, 2, 6, '2023-06-04 10:41:17', '0000-00-00 00:00:00', 0, '2023-06-04 07:41:17'),
(20, 2, 8, 1, '2023-06-04 14:30:18', '0000-00-00 00:00:00', 0, '2023-06-04 11:30:18'),
(21, 2, 8, 5, '2023-06-04 14:40:56', '0000-00-00 00:00:00', 0, '2023-06-04 11:40:56'),
(22, 2, 5, 1, '2023-06-04 15:18:10', '2023-06-04 16:23:30', 1, '2023-06-04 13:23:30'),
(23, 2, 5, 8, '2023-06-04 15:18:17', '2023-06-04 16:24:59', 1, '2023-06-04 13:24:59'),
(24, 2, 7, 1, '2023-06-04 15:23:16', '0000-00-00 00:00:00', 0, '2023-06-04 12:23:16'),
(25, 2, 9, 88, '2023-06-04 15:23:26', '0000-00-00 00:00:00', 0, '2023-06-04 12:23:26'),
(26, 2, 10, 89, '2023-06-04 15:23:32', '0000-00-00 00:00:00', 0, '2023-06-04 12:23:32'),
(27, 2, 14, 97, '2023-06-04 15:23:46', '0000-00-00 00:00:00', 0, '2023-06-04 12:23:46'),
(28, 2, 36, 15, '2023-06-04 15:25:35', '0000-00-00 00:00:00', 0, '2023-06-04 12:25:35'),
(29, 2, 14, 10, '2023-06-04 15:25:44', '0000-00-00 00:00:00', 0, '2023-06-04 12:25:44'),
(30, 2, 37, 16, '2023-06-04 15:25:56', '0000-00-00 00:00:00', 0, '2023-06-04 12:25:56'),
(31, 3, 15, 17, '2023-06-04 15:26:58', '0000-00-00 00:00:00', 0, '2023-06-04 12:26:58'),
(32, 3, 16, 20, '2023-06-04 15:27:04', '0000-00-00 00:00:00', 0, '2023-06-04 12:27:04'),
(33, 3, 17, 26, '2023-06-04 15:27:11', '0000-00-00 00:00:00', 0, '2023-06-04 12:27:11'),
(34, 3, 18, 18, '2023-06-04 15:27:19', '0000-00-00 00:00:00', 0, '2023-06-04 12:27:19'),
(35, 3, 15, 23, '2023-06-04 15:27:24', '0000-00-00 00:00:00', 0, '2023-06-04 12:27:24'),
(36, 3, 16, 74, '2023-06-04 15:27:37', '0000-00-00 00:00:00', 0, '2023-06-04 12:27:37'),
(37, 3, 17, 22, '2023-06-04 15:27:43', '0000-00-00 00:00:00', 0, '2023-06-04 12:27:43'),
(38, 3, 18, 73, '2023-06-04 15:27:49', '0000-00-00 00:00:00', 0, '2023-06-04 12:27:49'),
(39, 3, 19, 26, '2023-06-04 15:27:55', '0000-00-00 00:00:00', 0, '2023-06-04 12:27:55'),
(40, 3, 19, 24, '2023-06-04 15:28:03', '0000-00-00 00:00:00', 0, '2023-06-04 12:28:03'),
(41, 3, 20, 32, '2023-06-04 15:28:10', '0000-00-00 00:00:00', 0, '2023-06-04 12:28:10'),
(42, 3, 20, 21, '2023-06-04 15:28:18', '0000-00-00 00:00:00', 0, '2023-06-04 12:28:18'),
(43, 3, 21, 83, '2023-06-04 15:28:25', '0000-00-00 00:00:00', 0, '2023-06-04 12:28:25'),
(44, 3, 21, 71, '2023-06-04 15:28:32', '0000-00-00 00:00:00', 0, '2023-06-04 12:28:32'),
(45, 3, 22, 84, '2023-06-04 15:28:40', '0000-00-00 00:00:00', 0, '2023-06-04 12:28:40'),
(46, 3, 22, 72, '2023-06-04 15:28:46', '0000-00-00 00:00:00', 0, '2023-06-04 12:28:46'),
(47, 3, 23, 19, '2023-06-04 15:28:56', '0000-00-00 00:00:00', 0, '2023-06-04 12:28:56'),
(48, 3, 23, 30, '2023-06-04 15:29:02', '0000-00-00 00:00:00', 0, '2023-06-04 12:29:02'),
(49, 3, 24, 81, '2023-06-04 15:29:10', '0000-00-00 00:00:00', 0, '2023-06-04 12:29:10'),
(50, 3, 24, 17, '2023-06-04 15:29:17', '0000-00-00 00:00:00', 0, '2023-06-04 12:29:17'),
(51, 3, 38, 78, '2023-06-04 15:29:36', '0000-00-00 00:00:00', 0, '2023-06-04 12:29:36'),
(52, 3, 39, 79, '2023-06-04 15:29:43', '0000-00-00 00:00:00', 0, '2023-06-04 12:29:43'),
(53, 3, 40, 85, '2023-06-04 15:29:50', '0000-00-00 00:00:00', 0, '2023-06-04 12:29:50'),
(54, 4, 27, 33, '2023-06-04 15:33:40', '0000-00-00 00:00:00', 0, '2023-06-04 12:33:40'),
(55, 4, 31, 33, '2023-06-04 15:33:44', '0000-00-00 00:00:00', 0, '2023-06-04 12:33:44'),
(56, 4, 34, 37, '2023-06-04 15:33:49', '0000-00-00 00:00:00', 0, '2023-06-04 12:33:49'),
(57, 4, 43, 33, '2023-06-04 15:33:53', '0000-00-00 00:00:00', 0, '2023-06-04 12:33:53'),
(58, 4, 41, 47, '2023-06-04 15:33:58', '0000-00-00 00:00:00', 0, '2023-06-04 12:33:58'),
(59, 4, 34, 53, '2023-06-04 15:34:04', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:04'),
(60, 4, 31, 43, '2023-06-04 15:34:11', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:11'),
(61, 4, 27, 36, '2023-06-04 15:34:16', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:16'),
(62, 4, 30, 50, '2023-06-04 15:34:23', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:23'),
(63, 4, 32, 40, '2023-06-04 15:34:28', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:28'),
(64, 4, 25, 52, '2023-06-04 15:34:34', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:34'),
(65, 4, 25, 36, '2023-06-04 15:34:39', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:39'),
(66, 4, 26, 40, '2023-06-04 15:34:44', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:44'),
(67, 4, 26, 40, '2023-06-04 15:34:48', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:48'),
(68, 4, 28, 45, '2023-06-04 15:34:52', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:52'),
(69, 4, 28, 44, '2023-06-04 15:34:59', '0000-00-00 00:00:00', 0, '2023-06-04 12:34:59'),
(70, 4, 29, 58, '2023-06-04 15:35:07', '0000-00-00 00:00:00', 0, '2023-06-04 12:35:07'),
(71, 4, 29, 62, '2023-06-04 15:35:16', '0000-00-00 00:00:00', 0, '2023-06-04 12:35:16'),
(72, 4, 30, 35, '2023-06-04 15:35:22', '0000-00-00 00:00:00', 0, '2023-06-04 12:35:22'),
(73, 4, 32, 48, '2023-06-04 15:35:30', '0000-00-00 00:00:00', 0, '2023-06-04 12:35:30'),
(74, 4, 33, 49, '2023-06-04 15:35:35', '0000-00-00 00:00:00', 0, '2023-06-04 12:35:35'),
(75, 4, 33, 69, '2023-06-04 15:35:41', '0000-00-00 00:00:00', 0, '2023-06-04 12:35:41'),
(76, 4, 42, 39, '2023-06-04 15:35:50', '0000-00-00 00:00:00', 0, '2023-06-04 12:35:50'),
(77, 2, 5, 1, '2023-06-04 16:23:16', '2023-06-04 16:24:39', 1, '2023-06-04 13:24:39'),
(82, 2, 5, 1, '2023-06-04 16:56:06', '0000-00-00 00:00:00', 0, '2023-06-04 13:56:06'),
(83, 2, 5, 1, '2023-06-04 16:56:09', '0000-00-00 00:00:00', 0, '2023-06-04 13:56:09');

--
-- Triggers `loan`
--
DELIMITER $$
CREATE TRIGGER `Books_total` AFTER INSERT ON `loan` FOR EACH ROW BEGIN  
    UPDATE Book
    SET times_taken = times_taken + 1
    WHERE Book_id = NEW.Book_id;
    END
$$
DELIMITER ;
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
CREATE TRIGGER `loan_created_RES_AP1` AFTER INSERT ON `loan` FOR EACH ROW BEGIN
    UPDATE Reservation
    SET Approved = 1
    WHERE Reservation.Book_id = NEW.Book_id
      AND Reservation.User_id = NEW.User_id;
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
DELIMITER $$
CREATE TRIGGER `school_times_loaned` AFTER INSERT ON `loan` FOR EACH ROW BEGIN
    UPDATE School
    SET times_loaned = times_loaned + 1
    WHERE School_id = (
        SELECT School_id
        FROM User
        WHERE User_id = NEW.User_id
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
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
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`Reservation_id`, `School_id`, `User_id`, `Book_id`, `Approved`, `date_created`, `date_expired`, `last_update`) VALUES
(1, 2, 45, 1, 0, '2023-06-04 08:22:01', '2023-06-11 08:22:01', '2023-06-04 05:22:01'),
(2, 2, 45, 5, 0, '2023-06-04 08:22:31', '2023-06-11 08:22:31', '2023-06-04 05:22:31'),
(5, 2, 2, 6, 1, '2023-06-04 10:41:09', '2023-06-11 10:41:09', '2023-06-04 07:41:17'),
(8, 2, 8, 1, 1, '2023-06-04 14:27:49', '2023-06-11 14:27:49', '2023-06-04 11:30:18'),
(9, 2, 8, 5, 1, '2023-06-04 14:28:18', '2023-06-11 14:28:18', '2023-06-04 11:40:56'),
(10, 4, 26, 33, 0, '2023-06-04 14:56:43', '2023-06-11 14:56:43', '2023-06-04 11:56:43'),
(11, 4, 26, 39, 0, '2023-06-04 14:57:09', '2023-06-11 14:57:09', '2023-06-04 11:57:09'),
(12, 4, 27, 48, 0, '2023-06-04 14:57:45', '2023-06-11 14:57:45', '2023-06-04 11:57:45'),
(13, 4, 27, 51, 0, '2023-06-04 14:57:50', '2023-06-11 14:57:50', '2023-06-04 11:57:50'),
(14, 4, 28, 61, 0, '2023-06-04 14:58:24', '2023-06-11 14:58:24', '2023-06-04 11:58:24'),
(15, 4, 28, 47, 0, '2023-06-04 14:59:00', '2023-06-11 14:59:00', '2023-06-04 11:59:00'),
(16, 4, 29, 35, 0, '2023-06-04 14:59:30', '2023-06-11 14:59:30', '2023-06-04 11:59:30'),
(17, 4, 29, 70, 0, '2023-06-04 14:59:36', '2023-06-11 14:59:36', '2023-06-04 11:59:36'),
(18, 4, 30, 38, 0, '2023-06-04 15:00:03', '2023-06-11 15:00:03', '2023-06-04 12:00:03'),
(19, 4, 30, 45, 0, '2023-06-04 15:00:09', '2023-06-11 15:00:09', '2023-06-04 12:00:09'),
(20, 4, 31, 43, 1, '2023-06-04 15:01:19', '2023-06-11 15:01:19', '2023-06-04 12:34:11'),
(21, 4, 31, 68, 0, '2023-06-04 15:01:29', '2023-06-11 15:01:29', '2023-06-04 12:01:29'),
(22, 4, 25, 37, 0, '2023-06-04 15:02:20', '2023-06-11 15:02:20', '2023-06-04 12:02:20'),
(23, 4, 25, 47, 0, '2023-06-04 15:02:25', '2023-06-11 15:02:25', '2023-06-04 12:02:25'),
(24, 4, 41, 40, 0, '2023-06-04 15:03:39', '2023-06-11 15:03:39', '2023-06-04 12:03:39'),
(25, 4, 42, 44, 0, '2023-06-04 15:04:22', '2023-06-11 15:04:22', '2023-06-04 12:04:22'),
(26, 4, 43, 34, 0, '2023-06-04 15:05:22', '2023-06-11 15:05:22', '2023-06-04 12:05:22'),
(27, 3, 40, 20, 0, '2023-06-04 15:05:46', '2023-06-11 15:05:46', '2023-06-04 12:05:46'),
(28, 3, 39, 32, 0, '2023-06-04 15:06:02', '2023-06-11 15:06:02', '2023-06-04 12:06:02'),
(29, 3, 38, 26, 0, '2023-06-04 15:06:18', '2023-06-11 15:06:18', '2023-06-04 12:06:18'),
(30, 3, 15, 22, 0, '2023-06-04 15:06:46', '2023-06-11 15:06:46', '2023-06-04 12:06:46'),
(31, 3, 15, 82, 0, '2023-06-04 15:06:53', '2023-06-11 15:06:53', '2023-06-04 12:06:53'),
(32, 3, 16, 30, 0, '2023-06-04 15:07:19', '2023-06-11 15:07:19', '2023-06-04 12:07:19'),
(33, 3, 16, 72, 0, '2023-06-04 15:07:25', '2023-06-11 15:07:25', '2023-06-04 12:07:25'),
(34, 3, 17, 23, 0, '2023-06-04 15:07:55', '2023-06-11 15:07:55', '2023-06-04 12:07:55'),
(35, 3, 17, 25, 0, '2023-06-04 15:08:00', '2023-06-11 15:08:00', '2023-06-04 12:08:00'),
(36, 3, 19, 28, 0, '2023-06-04 15:09:56', '2023-06-11 15:09:56', '2023-06-04 12:09:56'),
(37, 3, 19, 32, 0, '2023-06-04 15:10:02', '2023-06-11 15:10:02', '2023-06-04 12:10:02'),
(38, 3, 20, 24, 0, '2023-06-04 15:10:51', '2023-06-11 15:10:51', '2023-06-04 12:10:51'),
(39, 3, 20, 31, 0, '2023-06-04 15:10:57', '2023-06-11 15:10:57', '2023-06-04 12:10:57'),
(40, 3, 21, 27, 0, '2023-06-04 15:11:16', '2023-06-11 15:11:16', '2023-06-04 12:11:16'),
(41, 3, 21, 29, 0, '2023-06-04 15:11:22', '2023-06-11 15:11:22', '2023-06-04 12:11:22'),
(42, 3, 22, 21, 0, '2023-06-04 15:11:51', '2023-06-11 15:11:51', '2023-06-04 12:11:51'),
(43, 3, 22, 83, 0, '2023-06-04 15:11:56', '2023-06-11 15:11:56', '2023-06-04 12:11:56'),
(44, 3, 23, 74, 0, '2023-06-04 15:12:22', '2023-06-11 15:12:22', '2023-06-04 12:12:22'),
(45, 3, 23, 84, 0, '2023-06-04 15:12:27', '2023-06-11 15:12:27', '2023-06-04 12:12:27'),
(46, 3, 24, 81, 1, '2023-06-04 15:12:50', '2023-06-11 15:12:50', '2023-06-04 12:29:10'),
(47, 3, 24, 76, 0, '2023-06-04 15:12:57', '2023-06-11 15:12:57', '2023-06-04 12:12:57'),
(48, 2, 14, 8, 0, '2023-06-04 15:13:20', '2023-06-11 15:13:20', '2023-06-04 12:13:20'),
(49, 2, 14, 7, 0, '2023-06-04 15:13:24', '2023-06-11 15:13:24', '2023-06-04 12:13:24'),
(50, 2, 13, 90, 0, '2023-06-04 15:13:46', '2023-06-11 15:13:46', '2023-06-04 12:13:46'),
(51, 2, 13, 15, 0, '2023-06-04 15:13:52', '2023-06-11 15:13:52', '2023-06-04 12:13:52'),
(52, 2, 12, 11, 0, '2023-06-04 15:14:13', '2023-06-11 15:14:13', '2023-06-04 12:14:13'),
(53, 2, 12, 16, 0, '2023-06-04 15:14:18', '2023-06-11 15:14:18', '2023-06-04 12:14:18'),
(54, 2, 11, 93, 0, '2023-06-04 15:14:38', '2023-06-11 15:14:38', '2023-06-04 12:14:38'),
(55, 2, 11, 96, 0, '2023-06-04 15:14:43', '2023-06-11 15:14:43', '2023-06-04 12:14:43'),
(56, 2, 10, 98, 0, '2023-06-04 15:15:03', '2023-06-11 15:15:03', '2023-06-04 12:15:03'),
(57, 2, 10, 87, 0, '2023-06-04 15:15:08', '2023-06-11 15:15:08', '2023-06-04 12:15:08');

--
-- Triggers `reservation`
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
-- Table structure for table `review`
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

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Review_id`, `Rating`, `Book_id`, `Text`, `User_id`, `Approved`, `last_update`) VALUES
(1, 4, 61, 'very good book! Apropriate for school\r\n', 28, 1, '2023-06-04 12:31:41'),
(2, 1, 45, 'i mean grim reaper?? why?', 30, 1, '2023-06-04 12:31:41'),
(3, 5, 68, 'BLAH BLAH BLAH', 31, 1, '2023-06-04 12:31:41'),
(4, 1, 68, 'fvweewv', 4, 1, '2023-06-04 12:42:03');

-- --------------------------------------------------------

--
-- Table structure for table `school`
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
-- Dumping data for table `school`
--

INSERT INTO `school` (`School_id`, `School_Name`, `Address`, `City`, `Phone_Number`, `Email`, `Full_Name_of_School_Director`, `times_loaned`, `last_update`) VALUES
(1, 'Admin', 'Admin', 'Admin', '21314', 'Admin@Admin', 'vipolus', 0, '2023-06-03 20:10:51'),
(2, '1o Gel Athinas', 'Zwgrafou', 'Athens', '2102731921', '1o_Gel_Athinas', 'Operator_1o', 2, '2023-06-04 13:56:09'),
(3, '2o Gel Athinas', 'Kypselh', 'Athens', '2103940129', '2o_Gel_Athinas@gmail.com', 'Operator_2o', 0, '2023-06-03 20:14:00'),
(4, '3o Gel Athinas', 'Ellhniko', 'Athens', '2103849232', '3o_Gel_Athinas', 'Operator_3o', 0, '2023-06-03 20:14:17');

-- --------------------------------------------------------

--
-- Table structure for table `school_library_operator`
--

CREATE TABLE `school_library_operator` (
  `Library_Operator_id` int(11) NOT NULL,
  `School_id` int(11) NOT NULL,
  `Books_given` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `school_library_operator`
--

INSERT INTO `school_library_operator` (`Library_Operator_id`, `School_id`, `Books_given`, `last_update`) VALUES
(2, 2, 0, '2023-06-03 20:17:01'),
(3, 3, 0, '2023-06-03 20:17:41'),
(4, 4, 0, '2023-06-03 20:18:01'),
(44, 1, 0, '2023-06-04 05:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `user`
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_id`, `School_id`, `Age`, `First_Name`, `Last_Name`, `Email`, `Username`, `Password`, `Type`, `Borrow_Limit`, `last_update`, `Number_of_loans`, `reservations`, `Delayed_Book`, `Approved`, `books_taken_temp`) VALUES
(1, 1, 21, 'vipolus', 'vipolus', 'vipolus@vipolus', 'vipolus', '$2y$10$rWfmA5vIznkvAng3bOI0guGltLF2JdABSmKy3qBtuLTl2gVxzCHMq', 'Admin', 0, '2023-06-03 20:10:51', 0, 0, 0, 1, 0),
(2, 2, 29, 'Operator_1o', 'Operator_1o', 'Operator_1o@gmail.com', 'Operator_1o', '$2y$10$8S62ZxxXIY9Z7nhswcI1p.lXhkCVZYTAATHC13k/q0ITkSVblnt/u', 'Library Operator', 1, '2023-06-04 07:41:17', 2, 1, 0, 1, 2),
(3, 3, 33, 'Operator_2o', 'Operator_2o', 'Operator_2o@gmail.com', 'Operator_2o', '$2y$10$vzZk1bQECSYcnJ4L7jlmD.olUeFGfcgo/ciyTfNBkVtNer9W1mxdK', 'Library Operator', 1, '2023-06-03 20:18:11', 0, 0, 0, 1, 0),
(4, 4, 30, 'Operator_3o', 'Operator_3o', 'Operator_3o@gmail.com', 'Operator_3o', '$2y$10$Hd4bMsALRL9wZ7brpz7/5eRbO1jh74LOe45J8B6.qQfHDgcqxGEFe', 'Library Operator', 1, '2023-06-03 20:18:12', 0, 0, 0, 1, 0),
(5, 2, 21, 'Student_1o_1', 'Student_1o_1', 'Student_1o_1@gmail.com', 'Student_1o_1', '$2y$10$AXuloN.9ex7oiDOchWdYmuxaS9E7AWBKO3IoiOUOKgJcEgDwSVTsK', 'Student', 2, '2023-06-04 13:56:09', 18, -2, 0, 1, 18),
(6, 2, 18, 'Student_1o_2', 'Student_1o_2', 'Student_1o_2@gmail.com', 'Student_1o_2', '$2y$10$jrdNRRMDy2YzEG4N68pc8.NaL3ci8CRzY7B4hr4w70JgEZivLCQ.K', 'Student', 2, '2023-06-03 20:50:04', 0, 0, 0, 1, 0),
(7, 2, 17, 'Student_1o_3', 'Student_1o_3', 'Student_1o_3@gmail.com', 'Student_1o_3', '$2y$10$/SVxVoCXlsCXEMtlzeDQVeeHVeCuc/ED.SKfPMSXFjRdtpY0y4CcG', 'Student', 2, '2023-06-04 12:23:16', 1, -1, 0, 1, 1),
(8, 2, 18, 'Student_1o_4', 'Student_1o_4', 'Student_1o_4@gmail.com', 'Student_1o_4', '$2y$10$2xx629MSgLPQjMJl66GSAuWKFExTuRq5k5FNY.Tq0S8HW7zn0XNYy', 'Student', 2, '2023-06-04 11:40:56', 3, 0, 0, 1, 3),
(9, 2, 18, 'Student_1o_5', 'Student_1o_5', 'Student_1o_5@gmail.com', 'Student_1o_5', '$2y$10$aXWsKdR/8wYI7YIAzeJnXuTGJjQFAZ5zBZIxapHy5GfnHBfSnzWry', 'Student', 2, '2023-06-04 12:23:26', 1, -1, 0, 1, 1),
(10, 2, 18, 'Student_1o_6', 'Student_1o_6', 'Student_1o_6@gmail.com', 'Student_1o_6', '$2y$10$nxk6UT2BxUN3P21VJglQNulkIITYD2Ang4gwS.xhW/GQVhBTMwFTq', 'Student', 2, '2023-06-04 12:23:32', 1, 1, 0, 1, 1),
(11, 2, 17, 'Student_1o_7', 'Student_1o_7', 'Student_1o_7@gmail.com', 'Student_1o_7', '$2y$10$ZNHmnrTsx5dw6/uGrqoMrOIgOx4cJ7X1eZfDD66QzC0IQXop1EHDO', 'Student', 2, '2023-06-04 12:14:43', 0, 2, 0, 1, 0),
(12, 2, 16, 'Student_1o_8', 'Student_1o_8', 'Student_1o_8@gmail.com', 'Student_1o_8', '$2y$10$3j9DZKJCdCVOPPe5njUxe.FR32uhNUhWQMB6228jipcP9GXEtfkj6', 'Student', 2, '2023-06-04 12:14:18', 0, 2, 0, 1, 0),
(13, 2, 17, 'Student_1o_9', 'Student_1o_9', 'Student_1o_9@gmail.com', 'Student_1o_9', '$2y$10$QvLIUP0M6d5oyfRxbT0DhOrMg7elhavWb4VAT03OWzZgm.vniR2N2', 'Student', 2, '2023-06-04 12:13:52', 0, 2, 0, 1, 0),
(14, 2, 18, 'Student_1o_10', 'Student_1o_10', 'Student_1o_10@gmail.com', 'Student_1o_10', '$2y$10$0K5LXhMBzZ0gOsPNw9/mDeAzg8FJ0StqzJV0083MljevAYfepNVEy', 'Student', 2, '2023-06-04 12:25:44', 2, 0, 0, 1, 2),
(15, 3, 18, 'Student_2o_1', 'Student_2o_1', 'Student_2o_1@gmail.com', 'Student_2o_1', '$2y$10$i.FMvhMrVKKroXFF6439YebXYNwy43Azw0d21JulIErJzS7xZoQBO', 'Student', 2, '2023-06-04 12:27:24', 2, 0, 0, 1, 2),
(16, 3, 16, 'Student_2o_2', 'Student_2o_2', 'Student_2o_2@gmail.com', 'Student_2o_2', '$2y$10$FRHRkmxx9/r89SgSrKeRC.p4wOnuQZjucEfU4DH/lAWeYcW7sLPVi', 'Student', 2, '2023-06-04 12:27:37', 2, 0, 0, 1, 2),
(17, 3, 16, 'Student_2o_3', 'Student_2o_3', 'Student_2o_3@gmail.com', 'Student_2o_3', '$2y$10$/xg69Ji10VGwy2HRCgl4bOSdRq7Huhc2XNkgsTP7ZLDmnO4D0m3R2', 'Student', 2, '2023-06-04 12:27:43', 2, 0, 0, 1, 2),
(18, 3, 16, 'Student_2o_4', 'Student_2o_4', 'Student_2o_4@gmail.com', 'Student_2o_4', '$2y$10$nwYDrWV4Fx/ba/XwnFBKjeVDHITTHtLN9A.WozQueDKgYEtBky.ru', 'Student', 2, '2023-06-04 12:27:49', 2, -2, 0, 1, 2),
(19, 3, 16, 'Student_2o_5', 'Student_2o_5', 'Student_2o_5@gmail.com', 'Student_2o_5', '$2y$10$mZz5lrIpxdjnxQLz750HXuwfcLn8n2KFH2OgrVeRP1hkN8RT.NnMq', 'Student', 2, '2023-06-04 12:28:03', 2, 0, 0, 1, 2),
(20, 3, 15, 'Student_2o_6', 'Student_2o_6', 'Student_2o_6@gmail.com', 'Student_2o_6', '$2y$10$mSZpjJCLvWa7oDk4eQV5pum0kufADYutVqnJ0qL6O5p3TFqenTwNa', 'Student', 2, '2023-06-04 12:28:18', 2, 0, 0, 1, 2),
(21, 3, 15, 'Student_2o_7', 'Student_2o_7', 'Student_2o_7@gmail.com', 'Student_2o_7', '$2y$10$L6GcOSB0x5oZNNeCHNKXE.2LxFLCr.9lVHM36HkMNRrrmJDY5pVdO', 'Student', 2, '2023-06-04 12:28:32', 2, 0, 0, 1, 2),
(22, 3, 15, 'Student_2o_8', 'Student_2o_8', 'Student_2o_8@gmail.com', 'Student_2o_8', '$2y$10$LZcS0Zdpjgvv9atca41u5ug0pPa2WKO8gft4FT5VaLHizO9jl.rMi', 'Student', 2, '2023-06-04 12:28:46', 2, 0, 0, 1, 2),
(23, 3, 17, 'Student_2o_9', 'Student_2o_9', 'Student_2o_9@gmail.com', 'Student_2o_9', '$2y$10$v9tPxtDCo5Qd.1AH3PDBv.SnJkdLjqqIYNHGdsb2UCvQf8aDfZtqy', 'Student', 2, '2023-06-04 12:29:02', 2, 0, 0, 1, 2),
(24, 3, 16, 'Student_2o_10', 'Student_2o_10', 'Student_2o_10@gmail.com', 'Student_2o_10', '$2y$10$x9JdbrDHpPHnp96RaAo7cOdhhE8zJ58FLbrUarklSC0aZzGvR.Z4O', 'Student', 2, '2023-06-04 12:29:17', 2, 0, 0, 1, 2),
(25, 4, 16, 'Student_3o_1', 'Student_3o_1', 'Student_3o_1@gmail.com', 'Student_3o_1', '$2y$10$Qu6uEkTtsxVwLvJqXHa2tOcxI5JY7x7gJybsKSIErXI1h105iD8gq', 'Student', 2, '2023-06-04 12:34:39', 2, 0, 0, 1, 2),
(26, 4, 17, 'Student_3o_2', 'Student_3o_2', 'Student_3o_2@gmail.com', 'Student_3o_2', '$2y$10$uDa9Od0CgNl9G.gSFa0bQuhwPu7wgBP.pdNuNqQgwH4mfR7ghC39a', 'Student', 2, '2023-06-04 12:34:48', 2, 0, 0, 1, 2),
(27, 4, 17, 'Student_3o_3', 'Student_3o_3', 'Student_3o_3@gmail.com', 'Student_3o_3', '$2y$10$Yv4pHWe5OzSZUsSTGIl8CexdVMXy1u6OyrMB9Ty3tl8shKokBDdN2', 'Student', 2, '2023-06-04 12:34:16', 2, 0, 0, 1, 2),
(28, 4, 17, 'Student_3o_4', 'Student_3o_4', 'Student_3o_4@gmail.com', 'Student_3o_4', '$2y$10$qeCG4QFngWy9OfUsu4lQvu1zjKdhoDmCZkDNePGMFS352gJhebg52', 'Student', 2, '2023-06-04 12:34:59', 2, 0, 0, 1, 2),
(29, 4, 17, 'Student_3o_5', 'Student_3o_5', 'Student_3o_5@gmail.com', 'Student_3o_5', '$2y$10$CdplVIN1RQ/mPJRZETys9uRnUQggZYzCZhDITp9hzrbHxVgZBvkEi', 'Student', 2, '2023-06-04 12:35:16', 2, 0, 0, 1, 2),
(30, 4, 16, 'Student_3o_6', 'Student_3o_6', 'Student_3o_6@gmail.com', 'Student_3o_6', '$2y$10$PGrGVlxC3ZB3kX.dYwbUQ.9EyMlgVaxu8svcsnd4li7.tUipZwI2m', 'Student', 2, '2023-06-04 12:35:22', 2, 0, 0, 1, 2),
(31, 4, 16, 'Student_3o_7', 'Student_3o_7', 'Student_3o_7@gmail.com', 'Student_3o_7', '$2y$10$FYk5NpwOpzHHxVMZ3BT/xeJs6SPbFe.HDy8ut0OpVGHpZAa7d.gli', 'Student', 2, '2023-06-04 12:34:11', 2, 0, 0, 1, 2),
(32, 4, 16, 'Student_3o_8', 'Student_3o_8', 'Student_3o_8@gmail.com', 'Student_3o_8', '$2y$10$RRG/wqMiQ7JjqUpU2stoiuEeEIiFHqxy8NwO57s58MMFkWoqWzs2K', 'Student', 2, '2023-06-04 12:35:30', 2, -2, 0, 1, 2),
(33, 4, 16, 'Student_3o_9', 'Student_3o_9', 'Student_3o_9@gmail.com', 'Student_3o_9', '$2y$10$nAwFulodd7e8E/BAOJN8J.tMC15RIrIJYTWqf6bYxFKD./1dpzvwK', 'Student', 2, '2023-06-04 12:35:41', 2, -2, 0, 1, 2),
(34, 4, 16, 'Student_3o_10', 'Student_3o_10', 'Student_3o_10@gmail.com', 'Student_3o_10', '$2y$10$fgvzuYRInYtoLG5lF0HvluVTgdwkm1PYnrBrtH9SbGSWWFtuICuGi', 'Student', 2, '2023-06-04 12:34:04', 2, -2, 0, 1, 2),
(35, 2, 27, 'Teacher_1o_1', 'Teacher_1o_1', 'Teacher_1o_1@gmail.com', 'Teacher_1o_1', '$2y$10$PcSScSq6c4iH8JzJmzYjj.7XfZYlx75cMU8nbtoNYVGl.4u9iA90W', 'Teacher', 1, '2023-06-03 20:50:09', 0, 0, 0, 1, 0),
(36, 2, 29, 'Teacher_1o_2', 'Teacher_1o_2', 'Teacher_1o_2@gmail.com', 'Teacher_1o_2', '$2y$10$rozioIloJOJ4KDas8yitmOpqAdvLXurHgC54wucl5qd5kemWVN48O', 'Teacher', 1, '2023-06-04 12:25:35', 1, -1, 0, 1, 1),
(37, 2, 50, 'Teacher_1o_3', 'Teacher_1o_3', 'Teacher_1o_3@gmail.com', 'Teacher_1o_3', '$2y$10$5zO.bFgJDAoMADnlGeEI0OpUuCspf7juoIJQz4mWhdrtcWc1ryTnm', 'Teacher', 1, '2023-06-04 12:25:56', 1, -1, 0, 1, 1),
(38, 3, 51, 'Teacher_2o_1', 'Teacher_2o_1', 'Teacher_2o_1@gmail.com', 'Teacher_2o_1', '$2y$10$wRyz5Vz5V2Qio6JAWTXPPe3dxQ0auXUvhQDJa9btjPvCa8tX5ugvy', 'Teacher', 1, '2023-06-04 12:29:36', 1, 0, 0, 1, 1),
(39, 3, 51, 'Teacher_2o_2', 'Teacher_2o_2', 'Teacher_2o_2@gmail.com', 'Teacher_2o_2', '$2y$10$RIr/XC62lByJHXlYaKrdxeARaVd/W/5Z1P/aBaIX.JPAsnFkhSg6q', 'Teacher', 1, '2023-06-04 12:29:43', 1, 0, 0, 1, 1),
(40, 3, 45, 'Teacher_2o_3', 'Teacher_2o_3', 'Teacher_2o_3@gmail.com', 'Teacher_2o_3', '$2y$10$UaP4B4G7qta.yXYSIeEUZuKKu5bkMUbIf.XRuN9Kh6O0BOFCs6YdO', 'Teacher', 1, '2023-06-04 12:29:50', 1, 0, 0, 1, 1),
(41, 4, 45, 'Teacher_3o_1', 'Teacher_3o_1', 'Teacher_3o_1@gmail.com', 'Teacher_3o_1', '$2y$10$lGo8lwFDfic4LJtZlP72N.2s502aJu/QWdHqe.pXMI6u9WekUGSIK', 'Teacher', 1, '2023-06-04 12:33:58', 1, 0, 0, 1, 1),
(42, 4, 35, 'Teacher_3o_2', 'Teacher_3o_2', 'Teacher_3o_2@gmail.com', 'Teacher_3o_2', '$2y$10$NIJYoRNsHtNTh2D8tfITROAwoYZgHHhl8RUfEBSgyRKM9q/S.mfOC', 'Teacher', 1, '2023-06-04 12:35:50', 1, 0, 0, 1, 1),
(43, 4, 46, 'Teacher_3o_3', 'Teacher_3o_3', 'Teacher_3o_3@gmail.com', 'Teacher_3o_3', '$2y$10$H/7zFy.3DLJR1Z5CPuuWdeOv348eLNqgap0bBH3GL1r5JC1pkhGiK', 'Teacher', 1, '2023-06-04 12:33:53', 1, 0, 0, 1, 1),
(44, 1, -7, 'w', 'w', 'w', 'w', '$2y$10$sIqjbQcfXYxIPYhNa7nMv.KKGkGEEsrrwowDjgPgclpT8RGby1Pgy', 'Admin', 1, '2023-06-04 05:19:03', 0, 0, 0, -1, 0),
(45, 2, -7, 'q', 'q', 'q', 'q', '$2y$10$gJ7OJjkaLYSidmCbGJ3Boe5AlXXZPoK8bYr82VCRnUlXjZFNmKMvG', 'Student', 2, '2023-06-04 07:01:04', 3, -1, 0, 1, 3);

--
-- Triggers `user`
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
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `approve`
--
ALTER TABLE `approve`
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`Author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_id`),
  ADD KEY `book_det` (`Title`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`Book_id`,`Author_id`),
  ADD KEY `Author_id` (`Author_id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`Book_Category_Id`),
  ADD KEY `Category_id` (`Category_id`),
  ADD KEY `Book_id` (`Book_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_id`);

--
-- Indexes for table `copies`
--
ALTER TABLE `copies`
  ADD PRIMARY KEY (`Copies_id`),
  ADD KEY `School_id` (`School_id`),
  ADD KEY `Book_id` (`Book_id`),
  ADD KEY `copies` (`School_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`Loan_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Book_id` (`Book_id`),
  ADD KEY `Library_Operator_id` (`Library_Operator_id`),
  ADD KEY `loan_det` (`User_id`),
  ADD KEY `loan_det2` (`Book_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Reservation_id`),
  ADD KEY `School_id` (`School_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Book_id` (`Book_id`),
  ADD KEY `reserv_det` (`User_id`),
  ADD KEY `reserv_det2` (`Book_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_id`),
  ADD KEY `Book_id` (`Book_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`School_id`);

--
-- Indexes for table `school_library_operator`
--
ALTER TABLE `school_library_operator`
  ADD PRIMARY KEY (`Library_Operator_id`),
  ADD KEY `School_id` (`School_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`,`School_id`),
  ADD KEY `School_id` (`School_id`),
  ADD KEY `user_det` (`School_id`),
  ADD KEY `user_det2` (`First_Name`),
  ADD KEY `user_det3` (`Last_Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `Author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `Book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `Book_Category_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `copies`
--
ALTER TABLE `copies`
  MODIFY `Copies_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `Loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `Reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `School_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `school_library_operator`
--
ALTER TABLE `school_library_operator`
  MODIFY `Library_Operator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `approve`
--
ALTER TABLE `approve`
  ADD CONSTRAINT `approve_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`),
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`Author_id`) REFERENCES `author` (`Author_id`);

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`),
  ADD CONSTRAINT `book_category_ibfk_2` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`);

--
-- Constraints for table `copies`
--
ALTER TABLE `copies`
  ADD CONSTRAINT `copies_ibfk_1` FOREIGN KEY (`School_id`) REFERENCES `school` (`School_id`),
  ADD CONSTRAINT `copies_ibfk_2` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`);

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`),
  ADD CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`Library_Operator_id`) REFERENCES `school_library_operator` (`Library_Operator_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`School_id`) REFERENCES `school` (`School_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `school_library_operator`
--
ALTER TABLE `school_library_operator`
  ADD CONSTRAINT `school_library_operator_ibfk_1` FOREIGN KEY (`School_id`) REFERENCES `school` (`School_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`School_id`) REFERENCES `school` (`School_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
