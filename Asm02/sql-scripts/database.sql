-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: prj321x_asm02_database
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applypost`
--

DROP TABLE IF EXISTS `applypost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applypost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` varchar(255) DEFAULT NULL,
  `recruitment_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `name_cv` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_id` (`recruitment_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `applypost_ibfk_1` FOREIGN KEY (`recruitment_id`) REFERENCES `recruitment` (`id`),
  CONSTRAINT `applypost_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applypost`
--

LOCK TABLES `applypost` WRITE;
/*!40000 ALTER TABLE `applypost` DISABLE KEYS */;
INSERT INTO `applypost` VALUES (2,'2024-04-12',3,1,'check.pdf',0,''),(3,'2024-04-12',4,1,'check.pdf',0,'Hi');
/*!40000 ALTER TABLE `applypost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `number_choose` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'JAVA',2),(2,'ASP.NET',1),(3,'NODEJS',1),(4,'PHP',0),(5,'PYTHON',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `description` text,
  `email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name_company` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Hanoi, VN','<p>FPT Software Company Limited, or simply FPT Software, is a global IT services provider headquartered in Hanoi, Vietnam, being the core subsidiary of the FPT Corporation. It is considered one of the biggest software services companies in Vietnam, with US$1.87 billion in revenue and more than 48,000 core employees.</p>','fpt-soft@mail.com','http://localhost:8080/Asm02/resources/uploads/FPT_Software_Logo.png','FPT Software','+8411223344',0,2),(2,'Hochiminh, VN','<h4>Welcome to VTC Game!</h4>','vtc@mail.com','http://localhost:8080/Asm02/resources/uploads/vtc-logo.png','VTC Mobile','+841234567',0,3);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv`
--

DROP TABLE IF EXISTS `cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv`
--

LOCK TABLES `cv` WRITE;
/*!40000 ALTER TABLE `cv` DISABLE KEYS */;
INSERT INTO `cv` VALUES (2,'check.pdf',1);
/*!40000 ALTER TABLE `cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_company`
--

DROP TABLE IF EXISTS `follow_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `follow_company_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `follow_company_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_company`
--

LOCK TABLES `follow_company` WRITE;
/*!40000 ALTER TABLE `follow_company` DISABLE KEYS */;
INSERT INTO `follow_company` VALUES (1,1,1);
/*!40000 ALTER TABLE `follow_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruitment`
--

DROP TABLE IF EXISTS `recruitment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `description` text,
  `experience` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `xh` int DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `view` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `recruitment_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `recruitment_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment`
--

LOCK TABLES `recruitment` WRITE;
/*!40000 ALTER TABLE `recruitment` DISABLE KEYS */;
INSERT INTO `recruitment` VALUES (1,'Hanoi, VN','2024-04-11','<p>FPT Software\'s AI Center is seeking a Fullstack Developer to join our AI4Code Team. As a Fullstack Developer, you will be responsible for creating clean and reliable interfaces and backend systems for our products.</p>','Không yêu cầu kinh nghiệm',30,NULL,'12.000.000',0,'Fullstack Developer (TypeScript & NodeJS)','Full time',0,3,1,'2024-05-10'),(2,'Hanoi, VN','2024-04-11','<p>&nbsp;Joining to Software Build web application.<br>&nbsp;Design &amp; develop REST APIs, Services, Databases</p>','2 years',2,NULL,'20.000.000',0,'Java Developer','Full time',0,1,1,'2024-05-02'),(3,'Hanoi, VN','2024-04-11','<p>About us<br>A subsidiary of the FPT Group, FPT Software is known as a leading global information technology service provider headquartered in Vietnam. With over 30,000 employees working in 83 offices across 30 countries on five continents, FPT Software consistently delivers the best solutions to more than 1000 clients, including 100 Fortune 500 companies. Placing human resources as the cornerstone of its achievements, employee experience is our top priority in continually creating an innovative, open, and enjoyable work environment for every member.<br>In 2023, FPT Software officially made its mark on the global billion-dollar company list. This is evidence of the talent and efforts of multiple generations of employees at FPT Software.<br>Why not explore your potential and embark on a brilliant journey with us?</p><p>Job Brief<br>&nbsp;FPT Software is looking for talented candidates for Full-Stack Java Developer position with at least 2 years experience. The customer is the leading technology service provider in the Asia-Pacific region, signed a cooperation agreement to develop a technology center strategic technology in Vietnam. With 12,000 highly qualified employees in more than 60 fields, they provide end-to-end technology services with capabilities in digital transformation, cloud computing, as well as core services for applications and infrastructure, engineering, and network security.<br>&nbsp;Join us on this new exciting journey and be part of a world class team that creates a lasting impact while nurturing your professional growth.</p><p>Responsibilities<br>Implementing all the processes and activities related to software development which can be deploying them to the development, client or production environment, including but not limited to following responsibilities:<br>&nbsp;Execute a full software development life cycle (SDLC) in the software development projects<br>&nbsp;Make object-oriented Design and Analysis (OOA and OOD) for the software products<br>&nbsp;Design, code and debug applications in various software languages and relational database platforms<br>&nbsp;Software analysis, code analysis, requirements analysis, software review, identification of code metrics<br>&nbsp;Implement localization or globalization of a part or whole components of the software product<br>&nbsp;Troubleshoot, debug, fixing bugs, and upgrade existing components or whole systems<br>&nbsp;Apply an automated build process by delivering all the software products through the CI/CD pipeline as well as DevOps Tools<br>&nbsp;Provide ongoing maintenance, support, and enhancements in existing systems and platforms<br>&nbsp;Provide the guidance of the policies, best practices, standards, and conventions to the team members<br>&nbsp;Report on the status of code, bugs, issues, deployment, and maintenance management of the software products<br>&nbsp;Learn more about Problems and solutions, limitations of current solutions, business perspectives for new solutions</p>','1 year',2,NULL,'20.000.000',0,'Full-Stack Java Developer - Salary Up To $2800','Full time',0,1,1,'2024-05-10'),(4,'Danang, VN','2024-04-12','<p><br>• Development of innovative applications, from prototyping to implementation of new products<br>• Further development of our software products for the capital markets business<br>• Analyzing complex requirements and developing solutions in collaboration with highly motivated colleagues inside and outside our cross-functional scrum teams<br>• Evaluation and introduction of new technologies and concepts such as .NET Core and the latest cloud technologies<br>• Clarification of technical issues and creation of IT concepts - with and for our customers</p>','3 năm',5,NULL,'15.000.000',0,'Senior Developer (C#/.NET)','Full time',0,2,1,'2024-05-12'),(5,'Hà Nội: Tầng 11, tòa nhà VTC Online - Số 18 Tam Trinh, Phường Minh Khai, Hai Bà Trưng, Hà Nội, Hai Bà Trưng','2024-04-12','<p>- Thiết kế bộ nhận diện thương hiệu cho game: Logo, Poster, App Icon, Screenshots, Covers,....<br>- Thiết kế các sản phẩm phục vụ cho các hoạt động quảng bá sản phẩm: Banners, Posters, Game Backgrounds, Landing pages,...<br>- Phối hợp chặt chẽ cùng các team nội bộ để đảm bảo tiến độ và chất lượng của sản phẩm thiết kế.<br>- Đề xuất, xây dựng các ý tưởng mới áp dụng vào trong game</p>','2 năm',12,NULL,'Thoả thuận',0,'Nhân Viên Thiết Kế Đồ Họa','Full time',0,5,2,'2024-05-06');
/*!40000 ALTER TABLE `recruitment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'USER'),(2,'HR');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `save_job`
--

DROP TABLE IF EXISTS `save_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `save_job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recruitment_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_id` (`recruitment_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `save_job_ibfk_1` FOREIGN KEY (`recruitment_id`) REFERENCES `recruitment` (`id`),
  CONSTRAINT `save_job_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `save_job`
--

LOCK TABLES `save_job` WRITE;
/*!40000 ALTER TABLE `save_job` DISABLE KEYS */;
INSERT INTO `save_job` VALUES (2,4,1),(3,3,1);
/*!40000 ALTER TABLE `save_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `cv_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `cv_id` (`cv_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`cv_id`) REFERENCES `cv` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tokyo,JP','<p>hi</p>','son@mail.com','BUI TRI SON','http://localhost:8080/Asm02/resources/uploads/FPT_Software_Logo.png','$2a$10$4XLyZD.xKxoVvSWMKwD4L.NucDrPZnPpsQM3Ryz/8xJxFlr5tjL.u','+08019811223',1,1,2),(2,'ThanhHoa, VN','<p>hi</p>','bui@mail.com','BUI SON','http://localhost:8080/Asm02/resources/uploads/IMG_1733.jpeg','$2a$10$z57hnBztvZT9b8/EMuRnyOLfc.kOAoS3i4czrp1TVV5VwXyE//fbq','+8411992233',1,2,NULL),(3,NULL,NULL,'vtc@mail.com','VTC Recruiter','http://localhost:8080/Asm02/resources/uploads/vtc-logo.png','$2a$10$yo2xzl30BggYBsH/pIpzyePiQaTF.E5TL1rSEmnxJ1UmIuKkSDZnq',NULL,1,2,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-12 10:13:05
