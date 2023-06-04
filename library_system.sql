-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2023 at 10:30 AM
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
(44, '2023-06-04 05:17:17'),
(45, '2023-06-04 05:21:30'),
(45, '2023-06-04 05:22:01'),
(45, '2023-06-04 05:22:31'),
(45, '2023-06-04 05:24:57'),
(45, '2023-06-04 05:24:57'),
(45, '2023-06-04 05:24:57'),
(45, '2023-06-04 05:25:10'),
(45, '2023-06-04 05:25:10'),
(45, '2023-06-04 05:25:10'),
(8, '2023-06-04 05:25:26'),
(8, '2023-06-04 05:25:26'),
(8, '2023-06-04 05:25:26'),
(45, '2023-06-04 05:25:34'),
(45, '2023-06-04 05:25:34'),
(45, '2023-06-04 05:25:34'),
(5, '2023-06-04 05:36:08'),
(5, '2023-06-04 05:36:08'),
(5, '2023-06-04 05:36:08'),
(5, '2023-06-04 05:36:18'),
(5, '2023-06-04 05:36:18'),
(5, '2023-06-04 05:36:18'),
(5, '2023-06-04 05:36:23'),
(5, '2023-06-04 05:36:23'),
(5, '2023-06-04 05:36:23'),
(5, '2023-06-04 05:37:07'),
(5, '2023-06-04 05:37:07'),
(5, '2023-06-04 05:37:07'),
(5, '2023-06-04 05:44:29'),
(5, '2023-06-04 05:44:29'),
(5, '2023-06-04 05:44:29'),
(5, '2023-06-04 05:44:55'),
(5, '2023-06-04 05:44:55'),
(5, '2023-06-04 05:44:55'),
(5, '2023-06-04 05:45:13'),
(5, '2023-06-04 05:45:13'),
(5, '2023-06-04 05:45:13'),
(5, '2023-06-04 05:48:09'),
(5, '2023-06-04 05:48:09'),
(5, '2023-06-04 05:48:09'),
(5, '2023-06-04 05:49:50'),
(5, '2023-06-04 05:49:50'),
(5, '2023-06-04 05:49:50'),
(5, '2023-06-04 05:50:58'),
(5, '2023-06-04 05:50:58'),
(5, '2023-06-04 05:50:58'),
(5, '2023-06-04 05:51:04'),
(5, '2023-06-04 05:51:04'),
(5, '2023-06-04 05:51:04'),
(5, '2023-06-04 05:51:37'),
(5, '2023-06-04 05:51:37'),
(5, '2023-06-04 05:51:37'),
(5, '2023-06-04 05:52:07'),
(5, '2023-06-04 05:52:07'),
(5, '2023-06-04 05:52:07'),
(45, '2023-06-04 07:00:42'),
(45, '2023-06-04 07:01:04'),
(2, '2023-06-04 07:11:39'),
(2, '2023-06-04 07:11:39'),
(2, '2023-06-04 07:17:00'),
(2, '2023-06-04 07:17:00'),
(2, '2023-06-04 07:17:00'),
(2, '2023-06-04 07:40:58'),
(2, '2023-06-04 07:41:09'),
(2, '2023-06-04 07:41:09'),
(2, '2023-06-04 07:41:17'),
(2, '2023-06-04 07:41:17'),
(2, '2023-06-04 07:41:17');

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
(1, 'Thanasis', 'Konstantopoulos', 7, '2023-06-03 22:49:34'),
(2, 'Elenh', 'Adamou', 6, '2023-06-03 22:50:25'),
(3, 'Pontikhs', 'Pontikakhs', 5, '2023-06-03 22:52:04'),
(4, 'Molivhs', 'Molivakhs', 4, '2023-06-03 22:51:10'),
(5, 'Psalidhs', 'Psalidakhs', 3, '2023-06-03 22:45:32');

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
(1, 'In the Name of the Father', 'Samaria Zanetello', '219751597-7', 467, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\\n\\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\\n\\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Image1.png', 'Action,Horror,Thriller', 'English', 'Police,Crime,Blood', 0, 1, 0, '2023-06-04 05:22:01'),
(2, 'Paul', 'Hewie Wolstenholme', '981056758-8', 873, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\\n\\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\\n\\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Image2.png', 'Romance,Adventure', 'English', 'Love,Happy ending', 0, 0, 0, '2023-06-03 22:14:13'),
(3, 'Defiance', 'Jonathon Feirn', '460557377-1', 125, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Image3.png', 'Action,Adventure,Thriller', 'English', 'Fight,Action', 0, 1, 0, '2023-06-04 07:11:39'),
(4, 'Fraternity Vacation', 'Erinn Cattlow', '909986720-4', 654, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Image4.png', 'Comedy', 'English', 'Summer vacation,Relax,Chilling', 0, 0, 0, '2023-06-03 22:16:33'),
(5, 'Road North (Tie pohjoiseen)', 'Karim Parken', '555586917-7', 124, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\\n\\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\\n\\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 'Image5.png', 'Action,War,Adventure', 'English', 'War,Guns,Blood,Field', 0, 1, 0, '2023-06-04 05:22:31'),
(6, 'Star Kid', 'Reba Siviour', '097299215-4', 169, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\\n\\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Image6.png', 'Crime,Action,Horror', 'English', 'Police,Crime,Blood', 0, 2, 0, '2023-06-04 07:41:09'),
(7, 'Double Hour, The (La doppia ora)', 'Sophey Vanelli', '354170217-6', 468, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\\n\\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Image7.png', 'Action,Adventure,Drama', 'English', 'Scary,Drama', 0, 0, 0, '2023-06-03 22:20:59'),
(8, 'Sons of Katie Elder', 'Joannes Soot', '685335171-1', 353, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\\n\\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 'Image8.png', 'Horror,Thriller,Adventure', 'English', 'Jumpscare,Scary,Ghosts', 0, 0, 0, '2023-06-03 22:24:17'),
(9, 'Amateurs, The (Moguls, The)', 'Puff Haisell', '161709515-X', 832, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\\n\\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Image9.png', 'Action,Adventure', 'English', 'Summer', 0, 0, 0, '2023-06-03 22:24:22'),
(10, 'Guns, Girls and Gambling', 'Turner McEntagart', '936770568-9', 568, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\\n\\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\\n\\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Image10.png', 'Drama,Adventure', 'English', 'Aliens,Guns,Girls,Gambling,Money', 0, 0, 0, '2023-06-03 22:24:59'),
(11, 'Destination Moon', 'Devan Glazier', '125557762-2', 452, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\\n\\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\\n\\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Image11.png', 'Fantasy,Action', 'English', 'Aliens,Space,Spacewar', 0, 0, 0, '2023-06-03 22:25:50'),
(12, 'Bats', 'Jonathon De Marchi', '667686461-4', 145, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\\n\\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\\n\\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'Image12.png', 'Action,Science Fiction,Fantasy', 'English', 'Zombies,World end', 0, 0, 0, '2023-06-03 22:27:08'),
(13, 'He Walked by Night', 'Gilemette Mawman', '817681565-9', 745, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\\n\\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Image13.png', 'Drama,Action,Fantasy,Romance', 'English', 'Love,Suspense', 0, 0, 0, '2023-06-03 22:28:20'),
(14, 'Tiger of Eschnapur, The (Tiger von Eschnapur, Der)', 'Rich Trayes', '357559471-6', 574, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\\n\\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\\n\\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 'Image14.png', 'Action,Horror,Science Fiction', 'English', 'Scary,Drama,Zombies', 0, 0, 0, '2023-06-03 22:29:24'),
(15, 'Carcasses', 'Shelby Hazlehurst', '528729739-4', 325, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\\n\\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Image15.png', 'Mystery,Action,Adventure,Science Fiction', 'English', 'Aliens,Space,Spaceship,War', 0, 0, 0, '2023-06-03 22:30:24'),
(16, 'Because I Said So', 'Emmye Cubbit', '326750583-6', 1246, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\\n\\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\\n\\nFusce consequat. Nulla nisl. Nunc nisl.', 'Image16.png', 'Horror,Thriller', 'English', 'Fight,Scary', 0, 0, 0, '2023-06-03 22:32:45'),
(17, 'Rembrandt\'s J\'accuse', 'Laney Holleworth', '164725446-9', 1563, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\\n\\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\\n\\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'Image17.png', 'Action,Horror,Drama', 'English', 'Zombies,Scary,Blood', 0, 0, 0, '2023-06-03 22:39:18'),
(18, 'Stars Above', 'Rhett Clementson', '384564005-7', 357, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Image18.png', 'Fantasy,Action', 'English', 'Beach,Fantasy,Beasts', 0, 0, 0, '2023-06-03 22:41:52'),
(19, 'Dragon Hunters (Chasseurs de dragons)', 'Jolee Peacop', '51-561-7823', 426, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Image19.png', 'Mystery,Crime', 'English', 'Police,Crime,Blood', 0, 0, 0, '2023-06-03 22:42:39'),
(20, 'Lili\'s Apron', 'Brew Raybould', '365153293-3', 743, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\\n\\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Romance,Adventure', 'Action,Horror', 'English', 'Love,Happy ending', 0, 0, 0, '2023-06-03 22:53:07'),
(21, 'Bummer (Bumer)', 'Analise Hughland', '667266128-X', 357, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\\n\\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\\n\\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'Image21.png', 'War,Crime,Thriller', 'English', 'War,Guns,Blood,Field', 0, 0, 0, '2023-06-03 22:45:32'),
(22, 'Kissing a Fool', 'Alice Heyworth', '803317346-7', 782, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\\n\\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Image22.png', 'Thriller,Adventure', 'English', 'Scary', 0, 0, 0, '2023-06-03 22:49:34'),
(23, 'Opportunists, The', 'Joela Fike', '590459221-3', 842, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'Image23.png', 'Mystery,Horror', 'English', 'Fight', 0, 0, 0, '2023-06-03 22:50:25'),
(24, 'Reconstituirea (Reconstruction)', 'Tremayne Hatley', '833107983-3', 742, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\\n\\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\\n\\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Image24.png', 'War,Crime,Thriller', 'English', 'War,Guns,Blood,Field', 0, 0, 0, '2023-06-03 22:51:10'),
(25, 'It\'s a Wonderful Afterlife', 'Hewie Wolstenholme', '555326917-7', 425, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Image25.png', 'Science Fiction,Fantasy,Adventure', 'English', 'Fantasy,Afterlife', 0, 0, 0, '2023-06-03 22:52:04');

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
(3, 25, '2023-06-03 22:52:04');

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
(65, 5, 25);

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
(12, 'Mystery', '0000-00-00 00:00:00');

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
(1, 8, 2, 1, '2023-06-04 07:07:03'),
(2, 7, 2, 2, '2023-06-04 05:25:26'),
(3, 16, 2, 3, '2023-06-04 07:17:00'),
(4, 11, 2, 4, '2023-06-03 22:16:33'),
(5, 13, 2, 5, '2023-06-04 07:07:08'),
(6, 17, 2, 6, '2023-06-04 07:41:17'),
(7, 5, 2, 7, '2023-06-03 22:20:59'),
(8, 7, 2, 8, '2023-06-03 22:22:20'),
(9, 11, 2, 9, '2023-06-03 22:23:29'),
(10, 14, 2, 10, '2023-06-03 22:24:59'),
(11, 9, 2, 11, '2023-06-03 22:25:50'),
(12, 13, 2, 12, '2023-06-03 22:27:08'),
(13, 8, 2, 13, '2023-06-03 22:28:20'),
(14, 17, 2, 14, '2023-06-03 22:29:24'),
(15, 15, 2, 15, '2023-06-03 22:30:24'),
(16, 14, 2, 16, '2023-06-03 22:32:45'),
(17, 14, 3, 17, '2023-06-03 22:39:18'),
(18, 18, 3, 18, '2023-06-03 22:41:52'),
(19, 19, 3, 19, '2023-06-03 22:42:39'),
(20, 14, 3, 20, '2023-06-03 22:43:21'),
(21, 14, 3, 21, '2023-06-03 22:45:32'),
(22, 14, 3, 22, '2023-06-03 22:49:34'),
(23, 17, 3, 23, '2023-06-03 22:50:25'),
(24, 17, 3, 24, '2023-06-03 22:51:10'),
(25, 13, 3, 25, '2023-06-03 22:52:04');

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
(3, 2, 8, 2, '2023-06-04 08:25:26', '0000-00-00 00:00:00', 0, '2023-06-04 05:25:26'),
(4, 2, 45, 5, '2023-06-04 08:25:34', '0000-00-00 00:00:00', 1, '2023-06-04 07:07:08'),
(5, 2, 5, 1, '2023-06-04 08:36:08', '0000-00-00 00:00:00', 1, '2023-06-04 06:06:30'),
(6, 2, 5, 3, '2023-06-04 08:36:18', '0000-00-00 00:00:00', 1, '2023-06-04 06:06:42'),
(7, 2, 5, 3, '2023-06-04 08:36:23', '0000-00-00 00:00:00', 1, '2023-06-04 06:06:54'),
(8, 2, 5, 6, '2023-06-04 08:37:07', '0000-00-00 00:00:00', 1, '2023-06-04 06:07:02'),
(9, 2, 5, 1, '2023-06-04 08:44:29', '0000-00-00 00:00:00', 1, '2023-06-04 06:07:08'),
(10, 2, 5, 1, '2023-06-04 08:44:55', '0000-00-00 00:00:00', 1, '2023-06-04 06:09:58'),
(11, 2, 5, 1, '2023-06-04 08:45:13', '0000-00-00 00:00:00', 1, '2023-06-04 06:11:16'),
(12, 2, 5, 1, '2023-06-04 08:48:09', '0000-00-00 00:00:00', 0, '2023-06-04 05:48:09'),
(13, 2, 5, 1, '2023-06-04 08:49:50', '0000-00-00 00:00:00', 0, '2023-06-04 05:49:50'),
(14, 2, 5, 1, '2023-06-04 08:50:58', '0000-00-00 00:00:00', 0, '2023-06-04 05:50:58'),
(15, 2, 5, 1, '2023-06-04 08:51:04', '0000-00-00 00:00:00', 0, '2023-06-04 05:51:04'),
(16, 2, 5, 1, '2023-06-04 08:51:37', '0000-00-00 00:00:00', 0, '2023-06-04 05:51:37'),
(17, 2, 5, 1, '2023-06-04 08:52:07', '0000-00-00 00:00:00', 0, '2023-06-04 05:52:07'),
(18, 2, 2, 3, '2023-06-04 10:17:00', '0000-00-00 00:00:00', 0, '2023-06-04 07:17:00'),
(19, 2, 2, 6, '2023-06-04 10:41:17', '0000-00-00 00:00:00', 0, '2023-06-04 07:41:17');

--
-- Triggers `loan`
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
(5, 2, 2, 6, 1, '2023-06-04 10:41:09', '2023-06-11 10:41:09', '2023-06-04 07:41:17');

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
(2, '1o Gel Athinas', 'Zwgrafou', 'Athens', '2102731921', '1o_Gel_Athinas', 'Operator_1o', 0, '2023-06-03 20:13:35'),
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
(5, 2, 21, 'Student_1o_1', 'Student_1o_1', 'Student_1o_1@gmail.com', 'Student_1o_1', '$2y$10$AXuloN.9ex7oiDOchWdYmuxaS9E7AWBKO3IoiOUOKgJcEgDwSVTsK', 'Student', 2, '2023-06-04 05:52:07', 13, -13, 0, 1, 13),
(6, 2, 18, 'Student_1o_2', 'Student_1o_2', 'Student_1o_2@gmail.com', 'Student_1o_2', '$2y$10$jrdNRRMDy2YzEG4N68pc8.NaL3ci8CRzY7B4hr4w70JgEZivLCQ.K', 'Student', 2, '2023-06-03 20:50:04', 0, 0, 0, 1, 0),
(7, 2, 17, 'Student_1o_3', 'Student_1o_3', 'Student_1o_3@gmail.com', 'Student_1o_3', '$2y$10$/SVxVoCXlsCXEMtlzeDQVeeHVeCuc/ED.SKfPMSXFjRdtpY0y4CcG', 'Student', 2, '2023-06-03 20:50:04', 0, 0, 0, 1, 0),
(8, 2, 18, 'Student_1o_4', 'Student_1o_4', 'Student_1o_4@gmail.com', 'Student_1o_4', '$2y$10$2xx629MSgLPQjMJl66GSAuWKFExTuRq5k5FNY.Tq0S8HW7zn0XNYy', 'Student', 2, '2023-06-04 05:25:26', 1, -1, 0, 1, 1),
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
(43, 4, 46, 'Teacher_3o_3', 'Teacher_3o_3', 'Teacher_3o_3@gmail.com', 'Teacher_3o_3', '$2y$10$H/7zFy.3DLJR1Z5CPuuWdeOv348eLNqgap0bBH3GL1r5JC1pkhGiK', 'Teacher', 1, '2023-06-03 20:50:58', 0, 0, 0, 1, 0),
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
  ADD KEY `book_det` (`Book_id`,`Title`);

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
  ADD KEY `Book_id` (`Book_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`Loan_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Book_id` (`Book_id`),
  ADD KEY `Library_Operator_id` (`Library_Operator_id`),
  ADD KEY `loan_det` (`Library_Operator_id`,`User_id`,`Book_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Reservation_id`),
  ADD KEY `School_id` (`School_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Book_id` (`Book_id`),
  ADD KEY `reserv_det` (`School_id`,`User_id`,`Book_id`);

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
  ADD KEY `user_det` (`User_id`,`First_Name`,`Last_Name`,`School_id`);

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
  MODIFY `Author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `Book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `Book_Category_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `copies`
--
ALTER TABLE `copies`
  MODIFY `Copies_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `Loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `Reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_id` int(11) NOT NULL AUTO_INCREMENT;

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
