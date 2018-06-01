CREATE DATABASE  IF NOT EXISTS `nhahang` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nhahang`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: nhahang
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` text NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `isadmin` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin1','$2b$10$U09M0GFXVGx75O1g3SK38exkUA330BihOP.IRFSdlccHtz8CgXBHq','Le Dinh','Phu','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `CatID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Sách'),(2,'Điện thoại'),(3,'Máy chụp hình'),(4,'Quần áo - Giày dép'),(5,'Máy tính'),(6,'Đồ trang sức'),(7,'Khác');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header`
--

DROP TABLE IF EXISTS `header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fb` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `sdt` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header`
--

LOCK TABLES `header` WRITE;
/*!40000 ALTER TABLE `header` DISABLE KEYS */;
INSERT INTO `header` VALUES (1,'    https://www.facebook.com/phu.ledinh.982  ','    ldphu410@gmail.com    ',' 01683293784','    7:30am - 10:00pm    ');
/*!40000 ALTER TABLE `header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menutrangchu`
--

DROP TABLE IF EXISTS `menutrangchu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menutrangchu` (
  `atr1` varchar(20) DEFAULT NULL,
  `atr2` varchar(20) DEFAULT NULL,
  `atr3` varchar(20) DEFAULT NULL,
  `atr4` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menutrangchu`
--

LOCK TABLES `menutrangchu` WRITE;
/*!40000 ALTER TABLE `menutrangchu` DISABLE KEYS */;
INSERT INTO `menutrangchu` VALUES ('All','Breakfast','Lunch','Dinner',1);
/*!40000 ALTER TABLE `menutrangchu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monan`
--

DROP TABLE IF EXISTS `monan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `gia` varchar(45) NOT NULL,
  `nguyenlieu` text NOT NULL,
  `hinhanh` text NOT NULL,
  `gioithieu` text NOT NULL,
  `bua` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monan`
--

LOCK TABLES `monan` WRITE;
/*!40000 ALTER TABLE `monan` DISABLE KEYS */;
INSERT INTO `monan` VALUES (18,'Kenchin-jiru','50000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 kh&uacute;c củ cải 4cm (150g),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1/2 củ c&agrave; rốt (70g),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 củ khoai sọ,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 c&aacute;i nấm shiitake kh&ocirc;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 1/2 b&igrave;a đậu phụ thường (150g)</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 2 th&igrave;a dầu vừng (dầu m&egrave;),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">800ml nước d&ugrave;ng dashi nấu từ c&aacute; ngừ kh&ocirc; b&agrave;o mỏng,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(C&aacute;ch nấu nước d&ugrave;ng dashi),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">100ml nước ng&acirc;m, nấm kh&ocirc; shiitake (nếu kh&ocirc;ng c&oacute;, d&ugrave;ng 100ml nước d&ugrave;ng từ c&aacute; ngừ kh&ocirc; b&agrave;o mỏng)</span></p>','/static/images/8.jpg','Canh kiểu Nhật Bản nấu với nhiều loại rau','trua'),(19,'Iwashi no kabayaki don','100000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 con c&aacute; ch&igrave;nh,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a c&agrave; ph&ecirc; x&igrave; dầu,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">một ch&uacute;t bột khoai t&acirc;y,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh dầu r&aacute;n, m</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">ột v&agrave;i nh&aacute;nh l&aacute; ti&ecirc;u n&uacute;i sansho hoặc bột sansho,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh x&igrave; dầu</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 2 th&igrave;a canh đường,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh nước,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">300 g gạo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">430 ml nước&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(hoặc 600 g cơm trắng)</span></p>','/static/images/9.jpg','Cá chình nướng kiểu kabayaki','toi'),(21,'Aisu kyandee','20000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Để l&agrave;m 3 hương vị kh&aacute;c nhau, bạn cần 3 khay đ&aacute;, mỗi khay c&oacute; k&iacute;ch cỡ 10 x 20 cm, s&acirc;u 3 cm. Lấy đũa gỗ d&ugrave;ng 1 lần để l&agrave;m que kem. Kem sữa: 4 th&igrave;a canh sữa đặc c&oacute; đường, 1 cốc sữa (200ml). Kem dứa: 4 miếng dứa hộp (140g), 2 th&igrave;a canh đường</span></p>','/static/images/10.jpg','Kem que đá','trua'),(22,'Saba no shioyaki','100000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 con c&aacute; saba tươi (d&agrave;i khoảng 30cm).&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 quả sudachi (loại quả giống như chanh cốm ở Việt Nam) cắt l&agrave;m đ&ocirc;i; hoặc 4 miếng cam hay chanh,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 củ gừng (d&agrave;i 4 cm, khoảng 40 gam),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">3 th&igrave;a canh giấm gạo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a rưỡi th&igrave;a canh đường,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&frac14; th&igrave;a c&agrave; ph&ecirc; muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh nước</span></p>','/static/images/11.jpg','Cá basa nướng muối','toi'),(25,'Ichigo Daifuku','40000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">\"Ichigo Daifuku\" l&agrave; loại b&aacute;nh giầy ngọt truyền thống của Nhật Bản, B&aacute;nh h&igrave;nh tr&ograve;n, dễ thương, phần nh&acirc;n c&oacute; một quả d&acirc;y t&acirc;y bọc trong đậu đỏ ng&agrave;o đường. Ch&uacute;ng t&ocirc;i sẽ hướng dẫn c&aacute;c bạn c&aacute;ch dễ d&agrave;ng l&agrave;m b&aacute;nh \"ichigo daifuku\"tại nh&agrave;, bằng c&aacute;ch d&ugrave;ng nồi hấp hoặc l&ograve; vi s&oacute;ng.</span></p>','/static/images/myImage-1526348692064.jpg','Bánh giầy ngọt truyền thống của Nhật Bản','toi'),(26,'Lẩu cá tuyết Tara-chiri','99000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">M&oacute;n lẩu \"chiri\" với c&aacute; tara, tức c&aacute; tuyết, đang v&agrave;o m&ugrave;a. \"Chiri\" l&agrave; m&oacute;n lẩu sử dụng nguy&ecirc;n liệu như c&aacute;, rau, đậu phụ, luộc l&ecirc;n rồi chấm với nước chấm ponzu chua mặn. Ch&uacute;ng t&ocirc;i cũng sẽ giới thiệu văn h&oacute;a \"shime\", tức l&agrave; kết th&uacute;c nồi lẩu bằng c&aacute;ch nấu ch&aacute;o với chỗ nước d&ugrave;ng c&ograve;n lại</span></p>','/static/images/myImage-1526348857008.jpg','Lẩu \"chiri\" với cá tuyết','trua toi'),(27,'Miso-shiru','40000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">Canh tương miso l&agrave; một trong những m&oacute;n ăn cơ bản trong ẩm thực Nhật Bản. Đ&acirc;y l&agrave; m&oacute;n ăn h&agrave;ng ng&agrave;y của c&aacute;c gia đ&igrave;nh Nhật Bản, được nấu với nhiều loại nguy&ecirc;n liệu kh&aacute;c nhau. H&ocirc;m nay, ch&uacute;ng ta c&ugrave;ng sử dụng honbushi, tức c&aacute; ngừ kh&ocirc; l&ecirc;n mốc được b&agrave;o mỏng để nấu nước d&ugrave;ng (nước l&egrave;o) v&agrave; nấu canh miso với khoai t&acirc;y v&agrave; h&agrave;nh t&acirc;y.</span></p>','/static/images/myImage-1526349168727.jpg','Canh tương miso','sang trua toi'),(28,'Surinagashi','35000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">&nbsp;M&oacute;n canh \"surinagashi\", một m&oacute;n canh s&aacute;nh l&agrave;m bằng c&aacute;c loại rau, c&aacute; v&agrave; một số nguy&ecirc;n liệu kh&aacute;c nghiền ra, sau đ&oacute; h&ograve;a với nước d&ugrave;ng. Lần n&agrave;y, ch&uacute;ng t&ocirc;i sử dụng ng&ocirc; v&agrave; c&aacute; tr&aacute;p hồng l&agrave;m nguy&ecirc;n liệu ch&iacute;nh.</span></p>','/static/images/myImage-1526349333465.jpg','Canh surinagashi','sang toi'),(29,'Gà rán Teriyaki','65000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">500 g, tương đương 2 chiếc đ&ugrave;i g&agrave; r&uacute;t xương, c&oacute; da&nbsp;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Bột khoai t&acirc;y, lượng vừa đủ</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh dầu ăn</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">50 ml nước t&aacute;o</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 cộng 1/3 th&igrave;a canh x&igrave;-dầu</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a c&agrave; ph&ecirc; đường</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a c&agrave; ph&ecirc; giấm</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">5 g gừng</span></p>','/static/images/myImage-1526349599170.jpg','Thịt gà rán Teriyaki ít muối','trua toi'),(30,'Mỳ Hippari udon và lẩu Kayaki','89000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">- M&oacute;n mỳ Hippari udon</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Mỳ udon luộc sẵn d&ugrave;ng cho 4 người: 4 g&oacute;i (800 gr),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 hộp c&aacute; saba (200 g) kho nước muối</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 4 c&acirc;y h&agrave;nh hoa (h&agrave;nh l&aacute;)</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 1 nh&aacute;nh gừng</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 1 ch&uacute;t ớt bột</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">- X&igrave; dầu: lượng vừa đủ</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">- M&oacute;n lẩu Kayaki</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 hộp c&aacute; saba (200 g) kho nước muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">4 cốc nước (800 ml),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh x&igrave; dầu,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">150 g rau ch&acirc;n vịt,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">250 g rau cải thảo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(hoặc 400 g c&aacute;c loại rau t&ugrave;y &yacute;),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 nh&aacute;nh gừng</span></p>','/static/images/myImage-1526349738650.jpg','Món ăn truyền thống của Tohoku','trua toi'),(31,'Temakizushi','35000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">Tại Nhật Bản, từ cuối năm đến năm mới l&agrave; thời điểm người ta c&oacute; nhiều dịp để mời bạn b&egrave; tới nh&agrave; hoặc đo&agrave;n tụ với gia đ&igrave;nh để tổ chức li&ecirc;n hoan cuối năm, tổ chức lễ Gi&aacute;ng sinh v&agrave; ch&agrave;o đ&oacute;n Năm mới. M&oacute;n sushi cuộn tay temakizushi l&agrave; m&oacute;n ăn th&iacute;ch hợp với những thời điểm n&agrave;y.</span></p>','/static/images/myImage-1526350122794.jpg','Sushi cuộn tay','sang trua toi'),(32,'Tatsuta-age','30000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">M&oacute;n tatsuta-age, một kiểu tẩm bột r&aacute;n đặc biệt của Nhật Bản. Nguy&ecirc;n liệu được ướp trước với x&igrave; dầu rồi lăn qua bột khoai t&acirc;y, sau đ&oacute; r&aacute;n ngập dầu. Do c&aacute;ch chế biến n&agrave;y, m&oacute;n ăn sau khi r&aacute;n tr&ocirc;ng như được phủ một lớp bột trắng b&ecirc;n ngo&agrave;i. H&ocirc;m nay ch&uacute;ng ta c&ugrave;ng chế biến m&oacute;n tatsuta-age với thịt g&agrave; v&agrave; c&aacute; thu.</span></p>','/static/images/myImage-1526350689564.jpg','Món tẩm bột rán tatsuta-age','toi'),(33,'Chanko-nabe','59000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">Chanko-nabe l&agrave; loại lẩu do c&aacute;c lực sĩ sumo nấu. Thịt, hải sản, rau v&agrave; c&aacute;c nguy&ecirc;n liệu kh&aacute;c được xắt th&agrave;nh những miếng vừa ăn, sau đ&oacute; cho v&agrave;o nồi lẩu lớn nấu với nước d&ugrave;ng thơm ngon. H&ocirc;m nay, ch&uacute;ng ta nấu Chanko-nabe với thịt g&agrave;, rau v&agrave; x&igrave; dầu.</span></p>','/static/images/myImage-1526350848804.jpg','Lẩu Sumo','trua toi');
/*!40000 ALTER TABLE `monan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrderID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  `Total` bigint(20) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `ProID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `FullDes` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `CatID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`ProID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Freshwater Cultured Pearl','Freshwater Cultured Pearl, Citrine, Peridot & Amethyst Bracelet, 7.5\"','<UL>\r\n    <LI>Metal stamp: 14k </LI>\r\n    <LI>Metal: yellow-ld</LI>\r\n    <LI>Material Type: amethyst, citrine, ld, pearl, peridot</LI>\r\n    <LI>Gem Type: citrine, peridot, amethyst</LI>\r\n    <LI>Length: 7.5 inches</LI>\r\n    <LI>Clasp Type: filigree-box</LI>\r\n    <LI>Total metal weight: 0.6 Grams</LI>\r\n</UL>\r\n<STRONG>Pearl Information</STRONG><BR>\r\n<UL>\r\n    <LI>Pearl type: freshwater-cultured</LI>\r\n</UL>\r\n<STRONG>Packaging Information</STRONG><BR>\r\n<UL>\r\n    <LI>Package: Regal Blue Sueded-Cloth Pouch</LI>\r\n</UL>',1500000,6,83),(2,'Pink Sapphire Sterling Silver','14 1/2 Carat Created Pink Sapphire Sterling Silver Bracelet w/ Diamond Accents','<P><STRONG>Jewelry Information</STRONG></P>\r\n<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n</UL>\r\n',300000,6,64),(3,'Torrini KC241','Nhẫn kim cương - vẻ đẹp kiêu sa','<P>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế. Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được.</P>\r\n<UL>\r\n    <LI>Kiểu sản phẩm: Nhẫn nữ</LI>\r\n    <LI>Loại đá: To paz</LI>\r\n    <LI>Chất liệu: kim cương, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Đơn giá: 2,110,250 VND / Chiếc</LI>\r\n</UL>\r\n',1600000000,6,86),(4,'Torrini KC242','tinh xảo và sang trọng','<P>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.<BR>\r\nVới sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị.</P>\r\n<UL>\r\n    <LI>Kiểu sản phẩm: Nhẫn nam</LI>\r\n    <LI>Loại đá: To paz</LI>\r\n    <LI>Chất liệu: Vàng tây 24K, nguyên liệu và công nghệ Italy...</LI>\r\n</UL>\r\n',42000000,6,63),(5,'Nokia 7610','Độ phân giải cao, màn hình màu, chụp ảnh xuất sắc.','<UL>\r\n    <LI>Máy ảnh có độ phân giải 1 megapixel</LI>\r\n    <LI>Màn hình 65.536 màu, rộng 2,1 inch, 176 X 208 pixel với đồ họa sắc nét, độ phân giải cao</LI>\r\n    <LI>Quay phim video lên đến 10 phút với hình ảnh sắc nét hơn</LI>\r\n    <LI>Kinh nghiệm đa phương tiện được tăng cường</LI>\r\n    <LI>Streaming video &amp; âm thanh với RealOne Player (hỗ trợ các dạng thức MP3/AAC).</LI>\r\n    <LI>Nâng cấp cho những đoạn phim cá nhân của bạn bằng các tính năng chỉnh sửa tự động thông minh</LI>\r\n    <LI>In ảnh chất lượng cao từ nhà, văn phòng, kios và qua mạng</LI>\r\n    <LI>Dễ dàng kết nối vớI máy PC để lưu trữ và chia sẻ (bằng cáp USB, PopPort, công nghệ Bluetooth)</LI>\r\n    <LI>48 nhạc chuông đa âm sắc, True tones. Mạng GSM 900 / GSM 1800 / GSM 1900</LI>\r\n    <LI>Kích thước 109 x 53 x 19 mm, 93 cc</LI>\r\n    <LI>Trọng lượng 118 g</LI>\r\n    <LI>Hiển thị: Loại TFT, 65.536 màu</LI>\r\n    <LI>Kích cở: 176 x 208 pixels </LI>\r\n</UL>\r\n',2900000,2,0),(6,'Áo thun nữ','Màu sắc tươi tắn, kiểu dáng trẻ trung','<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n',180000,4,62),(7,'Simen AP75','Thiết kế tinh xảo, hiện đại','<UL>\r\n    <LI>Hình ảnh hoàn hảo, rõ nét ở mọi góc màn hình</LI>\r\n    <LI>Giảm thiểu sự phản chiếu ánh sáng</LI>\r\n    <LI>Menu hiển thị tiếng Việt</LI>\r\n    <LI>Hệ thống hình ảnh thông minh</LI>\r\n    <LI>Âm thanh Hifi Stereo mạnh mẽ</LI>\r\n    <LI>Hệ thống âm lượng thông minh</LI>\r\n    <LI>Bộ nhớ 100 chương trình</LI>\r\n    <LI>Chọn kênh ưa thích</LI>\r\n    <LI>Các kiểu sắp đặt sẵn hình ảnh / âm thanh</LI>\r\n    <LI>Kích thước (rộng x cao x dày): 497 x 458 x 487mm</LI>\r\n    <LI>Trọng lượng: 25kg</LI>\r\n    <LI>Màu: vàng, xanh, bạc </LI>\r\n</UL>\r\n',2800000,2,15),(8,'Áo bé trai','Hóm hỉnh dễ thương','<UL>\r\n    <LI>Quần áo bé trai</LI>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n',270000,4,74),(9,'Bông tai nạm hạt rubby','Trẻ trung và quý phái','<UL>\r\n    <LI>Tên sản phẩm: Bông tai nạm hạt rubby</LI>\r\n    <LI>Đóng nhãn hiệu: Torrini</LI>\r\n    <LI>Nguồn gốc, xuất xứ: Italy</LI>\r\n    <LI>Hình thức thanh toán: L/C T/T M/T CASH</LI>\r\n    <LI>Thời gian giao hàng: trong vòng 3 ngày kể từ ngày mua</LI>\r\n    <LI>Chất lượng/chứng chỉ: od</LI>\r\n</UL>\r\n',2400000,6,43),(10,'Đầm dạ hội ánh kim','Đủ màu sắc - kiểu dáng','<UL>\r\n    <LI>Màu sắc: Khuynh hướng ánh kim có thể thể hiện trên vàng, bạc, đỏ tía, xanh biển, vàng tím, trắng và đen.</LI>\r\n    <LI>Một số biến tấu mang tính vui nhộn là vàng chanh, màu hoa vân anh và ngọc lam; trong đó hoàng kim và nhũ bạc khá phổ biến.</LI>\r\n    <LI>Phong cách: Diềm đăng ten, rủ xuống theo chiều thẳng đứng, nhiều lớp, cổ chẻ sâu, eo chít cao tới ngực... được biến tấu tùy theo mỗi nhà thiết kế.</LI>\r\n</UL>\r\n',2800000,4,80),(11,'Dây chuyền ánh bạc','Kiểu dáng mới lạ','<UL>\r\n    <LI>Chất liệu chính: Bạc</LI>\r\n    <LI>Màu sắc: Bạc</LI>\r\n    <LI>Chất lượng: Mới</LI>\r\n    <LI>Phí vận chuyển: Liên hệ</LI>\r\n    <LI>Giá bán có thể thay đổi tùy theo trọng lượng và giá vàng của từng thời điểm.</LI>\r\n</UL>\r\n',250000,6,88),(12,'Đồ bộ bé gái','Đủ màu sắc - kiểu dáng','<UL>\r\n    <LI>Màu sắc: đỏ tía, xanh biển, vàng tím, trắng và đen.</LI>\r\n    <LI>Xuất xứ: Tp. Hồ Chí Minh</LI>\r\n    <LI>Chất liệu: cotton</LI>\r\n    <LI>Loại hàng: hàng trong nước</LI>\r\n</UL>\r\n',120000,4,61),(13,'Đầm dạ hội Xinh Xinh','Đơn giản nhưng quý phái','<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>\r\n<UL>\r\n    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>\r\n    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>\r\n    <LI>Hãng sản xuất: NEM</LI>\r\n    <LI>Kích cỡ : Tất cả các kích cỡ</LI>\r\n    <LI>Kiểu dáng : Quây/Ống</LI>\r\n    <LI>Chất liệu : Satin</LI>\r\n    <LI>Màu : đen, đỏ</LI>\r\n    <LI>Xuất xứ : Việt Nam</LI>\r\n</UL>\r\n',2600000,4,92),(14,'Đầm dạ hội NEM','Táo bạo và quyến rũ','<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>\r\n<UL>\r\n    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>\r\n    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>\r\n    <LI>Hãng sản xuất: NEM</LI>\r\n    <LI>Kích cỡ : Tất cả các kích cỡ</LI>\r\n    <LI>Kiểu dáng : Quây/Ống</LI>\r\n    <LI>Chất liệu : Satin</LI>\r\n    <LI>Màu : đen, đỏ</LI>\r\n    <LI>Xuất xứ : Việt Nam</LI>\r\n</UL>\r\n',1200000,4,0),(15,'Dây chuyền đá quý','Kết hợp vàng trắng và đá quý','<UL>\r\n    <LI>Kiểu sản phẩm: Dây chuyền</LI>\r\n    <LI>Chất liệu: Vàng trắng 14K và đá quý, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 1.1 Chỉ </LI>\r\n</UL>\r\n',1925000,6,22),(16,'Nokia N72','Sành điệu cùng N72','<UL>\r\n    <LI>Camera mega pixel : 2 mega pixel</LI>\r\n    <LI>Bộ nhớ trong : 16 - 31 mb</LI>\r\n    <LI>Chức năng : quay phim, ghi âm, nghe đài FM</LI>\r\n    <LI>Hỗ trợ: Bluetooth, thẻ nhớ nài, nhạc MP3 &lt;br/&gt;</LI>\r\n    <LI>Trọng lượng (g) : 124g</LI>\r\n    <LI>Kích thước (mm) : 109 x 53 x 21.8 mm</LI>\r\n    <LI>Ngôn ngữ : Có tiếng việt</LI>\r\n    <LI>Hệ điều hành: Symbian OS 8.1</LI>\r\n</UL>\r\n',3200000,2,81),(17,'Mặt dây chuyền Ruby','Toả sáng cùng Ruby','<UL>\r\n    <LI>Kiểu sản phẩm:&nbsp; Mặt dây</LI>\r\n    <LI>Chất liệu: Vàng trắng 14K, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 0.32 Chỉ</LI>\r\n</UL>\r\n',1820000,6,33),(18,'1/2 Carat Pink Sapphire Silver','Created Pink Sapphire','<UL>\r\n    <LI>Brand Name: Ice.com</LI>\r\n    <LI>Material Type: sterling-silver, created-sapphire, diamond</LI>\r\n    <LI>Gem Type: created-sapphire, Diamond</LI>\r\n    <LI>Minimum total gem weight: 14.47 carats</LI>\r\n    <LI>Total metal weight: 15 Grams</LI>\r\n    <LI>Number of stones: 28</LI>\r\n    <LI>Created-sapphire Information</LI>\r\n    <LI>Minimum color: Not Available</LI>\r\n</UL>\r\n',3400000,6,10),(19,'Netaya','Dây chuyền vàng trắng','<UL>\r\n    <LI>Kiểu sản phẩm:&nbsp; Dây chuyền</LI>\r\n    <LI>Chất liệu: Vàng tây 18K, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 1 Chỉ</LI>\r\n</UL>\r\n',1820000,6,17),(20,'Giày nam GN16','Êm - đẹp - bề','<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n    <LI>Giá: 300 000 VNĐ</LI>\r\n</UL>\r\n',540000,4,0),(21,'G3.370A','Đen bóng, sang trọng','<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n',300000,4,74),(22,'Giày nữ GN1','Kiểu dáng thanh thoát','<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n',290000,4,30),(23,'NV002','Kiểu dáng độc đáo','<P><STRONG>Thông tin sản phẩm</STRONG></P>\r\n<UL>\r\n    <LI>Mã sản phẩm: NV002</LI>\r\n    <LI>Trọng lượng: 2 chỉ</LI>\r\n    <LI>Vật liệu chính: Vàng 24K</LI>\r\n</UL>\r\n',3600000,6,5),(24,'NV009','Sáng chói - mới lạ','<P><STRONG>Thông tin sản phẩm</STRONG></P>\r\n<UL>\r\n    <LI>Mã sản phẩm: NV005</LI>\r\n    <LI>Trọng lượng: 1 cây</LI>\r\n    <LI>Vật liệu chính: Vàng 24K</LI>\r\n</UL>\r\n',14900000,6,22),(25,'CK010','Độc đáo, sang trọng','<UL>\r\n    <LI>Kiểu dáng nam tính và độc đáo, những thiết kế dưới đây đáp ứng được mọi yêu cần khó tính nhất của người sở hữu.</LI>\r\n    <LI>Những hạt kim cương sẽ giúp người đeo nó tăng thêm phần sành điệu</LI>\r\n    <LI>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế.</LI>\r\n    <LI>Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được</LI>\r\n</UL>\r\n',2147483647,6,52),(26,'CK009','Nữ tính - đầy quí phái','<UL>\r\n    <LI>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.</LI>\r\n    <LI>Với sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị</LI>\r\n    <LI>Nhà sản xuất: Torrini</LI>\r\n</UL>\r\n<P>Cái này rất phù hợp cho bạn khi tặng nàng</P>\r\n',1850000000,6,11),(27,'CK007','Sự kết hợp khéo léo, độc đáo','<UL>\r\n    <LI>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.</LI>\r\n    <LI>Với sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị</LI>\r\n    <LI>Nhà sản xuất: Torrini</LI>\r\n</UL>\r\n<P>Cái này rất phù hợp cho bạn khi tặng nàng</P>\r\n',2147483647,6,28),(28,'CK005','Tinh xảo - sang trọng','<UL>\r\n    <LI>Kim cương luôn là đồ trang sức thể hiện đẳng cấp của người sử dụng.</LI>\r\n    <LI>Không phải nói nhiều về những kiểu nhẫn dưới đây, chỉ có thể gói gọn trong cụm từ: tinh xảo và sang trọng</LI>\r\n    <LI>Thông tin nhà sản xuất: Torrini</LI>\r\n    <LI>Thông tin chi tiết: Cái này rất phù hợp cho bạn khi tặng nàng</LI>\r\n</UL>\r\n',1800000000,6,29),(29,'NV01TT','Tinh tế đến không ngờ','<UL>\r\n    <LI>Tinh xảo và sang trọng</LI>\r\n    <LI>Thông tin nhà sản xuất: Torrini</LI>\r\n    <LI>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế.</LI>\r\n    <LI>Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được</LI>\r\n</UL>\r\n',500000000,6,49),(30,'Motorola W377','Nữ tính - trẻ trung','<UL>\r\n    <LI>General: 2G Network, GSM 900 / 1800 / 1900</LI>\r\n    <LI>Size:&nbsp; 99 x 45 x 18.6 mm, 73 cc</LI>\r\n    <LI>Weight: 95 g</LI>\r\n    <LI>Display: type TFT, 65K colors</LI>\r\n    <LI>Size: 128 x 160 pixels, 28 x 35 mm</LI>\r\n</UL>\r\n',2400000,2,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `button_content` varchar(255) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (2,' The Fresh And Tasty Burgers','<p>There’s so much fun for you today</p>','Go on','/static/images/myImage-1526351103653.jpg'),(3,'The Taste of Joy','It’s gonna be a lovely day','Try','/static/images/myImage-1526351111843.jpg'),(4,' It’s gonna be a great weekend ','<p>You Deserve a Break Today</p>',' Buy Now','  /static/images/slide04.jpg  ');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` text NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'abc@gmail.com','keuhfZG$7lmhk~m^Iq','',''),(2,'phuld410@gmail.com','123456','Le','Phu'),(3,'ldphu410@gmail.com','123456','Phu','Phu'),(4,'xyz@gmail.com','$2b$10$FbHTl/0ciaaL1B6l.cX/zO2YxcDB4FLQSM/Slnfd5l4MTAbJXYSXm','Nguyen','A'),(5,'ldphu','$2b$10$HFfOZfCHxhAlXjuJteG5IO5Xc6shpRPtBXOF.6L2vG80lr2v1OZl6','Le','Phu'),(25,'test','$2b$10$JfyVoXgU9RPh4L/PgPLcvuQtZN/ILnl6BChu3HPhdyOHZjpaQ5Acy','phu','le'),(26,'test2','$2b$10$9y.qsXpiId.dvAur19KG5ecQybyiP/qtz68.RVzJIXYJtkw55Vw4u','le','phuuuu'),(27,'test3','$2b$10$MSej23mSTl4vs0o4wS75XepKJnVKZQ2lZCWmBtZQEPd.vNBpRT.BG','Le ','Phu'),(28,'ldphu410@gmail.com','$2b$10$UfKRztxPoHDIeD3W6UIwGOJZLkvGWu3VLkeKoAsad5w447H7uRT6u','Le Dinh','Phu');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `f_ID` int(11) NOT NULL AUTO_INCREMENT,
  `f_Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_DOB` date NOT NULL,
  `f_Permission` int(11) NOT NULL,
  PRIMARY KEY (`f_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2018-05-23 13:40:52
