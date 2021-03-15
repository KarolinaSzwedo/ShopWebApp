-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: auction
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archive` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `seller` varchar(20) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `description` text,
  `price` float DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `image` text,
  `buyer` varchar(20) DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
INSERT INTO `archive` VALUES (1,17,'test300','Laptop','A laptop or laptop computer, is a small, portable personal computer (PC) with a \\\"clamshell\\\" form factor, typically having a thin LCD or LED computer screen mounted on the inside of the upper lid of the clamshell and an alphanumeric keyboard on the inside of the lower lid. The clamshell is opened up to use the computer. Laptops are folded shut for transportation, and thus are suitable for mobile use.',1000,'2021-01-09 00:00:00','laptop.jpg','dk384790','2021-01-24 00:00:00'),(7,34,'testfinal','TV','Television (TV), sometimes shortened to tele or telly, is a telecommunication medium used for transmitting moving images in monochrome (black and white), or in color, and in two or three dimensions and sound. The term can refer to a television set, a television show, or the medium of television transmission. Television is a mass medium for advertising, entertainment, news, and sports.',990,'2021-01-25 00:00:00','TV.jpg','testfinal','2021-01-25 00:00:00'),(8,35,'testfinal12','Radio','Television (TV), sometimes shortened to tele or telly, is a telecommunication medium used for transmitting moving images in monochrome (black and white), or in color, and in two or three dimensions and sound. The term can refer to a television set, a television show, or the medium of television transmission. Television is a mass medium for advertising, entertainment, news, and sports.',44,'2021-01-25 00:00:00','radio.jpg','test300','2021-01-25 00:00:00'),(9,17,'test300','TV','Television (TV), sometimes shortened to tele or telly, is a telecommunication medium used for transmitting moving images in monochrome (black and white), or in color, and in two or three dimensions and sound. The term can refer to a television set, a television show, or the medium of television transmission. Television is a mass medium for advertising, entertainment, news, and sports.',880,'2021-01-25 00:00:00','TV2.jpg','test66','2021-01-25 00:00:00'),(12,18,'test14','Blender','Itâ€™s a cult fave for a reason: Short of cleaning your kitchen there\\\'s nothing the showpiece Vitamix can\\\'t do. With pro-quality precision and control, it can make everything from perfectly smooth nut butters to hearty soups and more. The ultra powerful motor has 10 variable speed settings and its heavy duty base won\\\'t easily move on the counter when in use.',66,'2021-01-25 00:00:00','blender.jpg','test300','2021-01-25 00:00:00'),(14,17,'test300','Headphones','Headphones are a pair of small loudspeaker drivers worn on or around the head over a user\\\'s ears. They are electroacoustic transducers, which convert an electrical signal to a corresponding sound. Headphones let a single user listen to an audio source privately, in contrast to a loudspeaker, which emits sound into the open air for anyone nearby to hear.',22,'2021-01-26 00:00:00','headphones.jpg','test66','2021-01-26 00:00:00'),(16,19,'test66','Lamp','An electric light is a device that produces visible light from electric current. It is the most common form of artificial lighting and is essential to modern society,[1] providing interior lighting for buildings and exterior light for evening and nighttime activities. In technical usage, a replaceable component that produces light from electricity is called a lamp.',10,'2021-01-26 00:00:00','lamp.jpg','test66','2021-01-26 00:00:00');
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `seller` varchar(20) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `description` text,
  `price` float DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (10,16,'test200','Radio receiver','Radio is the technology of signaling and communicating using radio waves.[1][2][3] Radio waves are electromagnetic waves of frequency between 30 hertz (Hz) and 300 gigahertz (GHz). They are generated by an electronic device called a transmitter connected to an antenna which radiates the waves, and received by a radio receiver connected to another antenna. Radio is very widely used in modern technology, in radio communication, radar, radio navigation, remote control, remote sensing and other applications.',50,'2021-01-25 00:00:00','radio.jpg'),(11,18,'test14','Smartphone','A smartphone is a mobile device that combines cellular and mobile computing functions into one unit. They are distinguished from feature phones by their stronger hardware capabilities and extensive mobile operating systems, which facilitate wider software, internet (including web browsing[1] over mobile broadband), and multimedia functionality (including music, video, cameras, and gaming), alongside core phone functions such as voice calls and text messaging.',110,'2021-01-25 00:00:00','phone.jpg'),(13,17,'test300','TV','Television (TV), sometimes shortened to tele or telly, is a telecommunication medium used for transmitting moving images in monochrome (black and white), or in color, and in two or three dimensions and sound. The term can refer to a television set, a television show, or the medium of television transmission. Television is a mass medium for advertising, entertainment, news, and sports.',899,'2021-01-25 00:00:00','TV.jpg'),(15,19,'test66','Fridge','A refrigerator (colloquially fridge) is a home appliance consisting of a thermally insulated compartment and a heat pump (mechanical, electronic or chemical) that transfers heat from its inside to its external environment so that its inside is cooled to a temperature below the room temperature. Refrigeration is an essential food storage technique in developed countries.',250,'2021-01-26 00:00:00','fridge.jpg'),(17,35,'testfinal12','Washing machine','A washing machine (laundry machine, clothes washer, or washer) is a home appliance used to wash laundry. The term is mostly applied to machines that use water as opposed to dry cleaning (which uses alternative cleaning fluids and is performed by specialist businesses) or ultrasonic cleaners. The user adds laundry detergent, which is sold in liquid or powder form, to the wash water.',200,'2021-01-26 00:00:00','washingmachine.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test1','$5$rounds=535000$AJqTJVpKN3c02l0g$GH.WU8pBDlRc5BObpCD86pVx3lsGQhJXgw5wRNBvk6A','test1@gmail.com'),(2,'test2','$5$rounds=535000$ubWZAFMyn6GXsfsd$1f8MOvWIKaZWRSNvSJ8ZePQCAKjxoWoWrcms8Q76dBB','test2@gmail.com'),(3,'test10','$5$rounds=535000$llCS6BDJSfEiaIjP$gmzqdRiXcQNjHaj2Xb3xY8p.7iFPkKLwNX/JPge6Ih7','test10@gmail.com'),(4,'test100','$5$rounds=535000$f1bYoxddOz9Xo/f5$k6v0UfUspnoxb45B3hq5kS/.F6/o/Y3Sq1GhXEvdWDC','test100@gmail.com'),(5,'test199','$5$rounds=535000$lEm2d6YxJTJj7jl0$rzD4/P2cafVPdaF/Gm58/bD49oY.BSslpKKZOGCAUq6','test1000@gmail.com'),(6,'test9999','$5$rounds=535000$L/lg43ElbmwpvpAL$2Lan7jwiKW1E7dcINYVJXzl2/OCZSvmIRAs5m.8C9xB','test9999@gmail.com'),(7,'test99998','$5$rounds=535000$yYhNsLG22Y4jjLJs$iyRGIQ5xHZ/lTC4E0RLnnDnN9LfpFSwg2qWcb67Q6C2','test99998@gmail.com'),(8,'test1990','$5$rounds=535000$tH03AWNF1Sv7GKu4$L9zuTmoWAjarkHQ/Qo4I07G5FuVRDPcOzSfM8z.9Me7','test1990@gmail.com'),(9,'test2000','$5$rounds=535000$1fPLj3GqeEZUTrDi$gB8d.VmlJtxudkKZLAJYFeJx3ivTlHSa4ADRIi8s/7B','test1@gmail.com'),(10,'test1988','$5$rounds=535000$ZtukNLrvJ5BB2eaP$Fg4BKKNGmQUmi5NaIvU/Okq7.nFpsCoiwu9vfO68aYA','test1000@gmail.com'),(11,'test20000','$5$rounds=535000$rlETU99qkWJGfe9M$YLb4NLOKm9eCa/vlku91q/UZqSBZxhdu5LWWGOVMT..','test1990@gmail.com'),(12,'test21111','$5$rounds=535000$kBYq9MLyEJYHgIM9$yKtzHApkbEfPrqFlPrJof7bkp8bBL6TyTnFPnTwCDJ1','23232r@student.uw.edu.pl'),(13,'rz384365','$5$rounds=535000$WrwxTeb3Q9PWZRZq$mrds5alByeFakXmSdeZ2rxAggNXDXaPt8Gb44tf0VRA','rz384365@wne.edu.pl'),(14,'test333','$5$rounds=535000$MZOoIkSfWGmxOx3V$6o.g6mKNHR6gd3U2.uLgIBebcGbWcwQpU563QBGRwB0','sdadsa@2323.pl'),(15,'dk384790','plmko','sdsada@fddsf.pl'),(16,'test200','200','test200@gmail.com'),(17,'test300','test300','test300@gmail.com'),(18,'test14','14','test14@gmail.com'),(19,'test66','66','test66@gmail.com'),(20,'test111','111','test111@gmail.com'),(21,'testx','x','testx@gmail.com'),(22,'testttt','qazpl','qxn16643@eoopy.com'),(23,'test33333','plmko','wwe03346@zwoho.com'),(24,'kkkkkk','plmko','hvo26580@eoopy.com'),(25,'test3333333333','plmko','kijepo8103@izzum.com'),(26,'qqqqqq','mkolp','cryptoalert022@gmail.com'),(27,'kkkkkkkkkkk','mkiujn','ynk83860@yuoia.com'),(28,'aaaaaaaa','plmko','vacov23314@eamarian.com'),(29,'ccccccc','qaz','rwxrrje03jhi@10minut.xyz'),(30,'KFC1','mkoijn','kfc83858@cuoly.com'),(31,'KFC2','plmko','txn72858@zwoho.com'),(32,'kjhg','asdf',' txn72858@zwoho.com'),(33,'bobby','$5$rounds=535000$QNDNKbY4vD3zHSaH$./Satnkg9o4KsTFRxngCZttwOia5047iQjI3vmXvjy2','rgz62425@eoopy.com'),(34,'testfinal','final','sefatey418@loopsnow.com'),(35,'testfinal12','final0','mamisef782@febula.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-27 10:05:27
