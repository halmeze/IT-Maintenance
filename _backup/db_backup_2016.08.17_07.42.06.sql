-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `department`
-- -------------------------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อหน่วยงาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `device`
-- -------------------------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE IF NOT EXISTS `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) DEFAULT NULL,
  `serial_no` varchar(50) DEFAULT NULL,
  `device_brand` varchar(255) DEFAULT NULL,
  `device_model` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อเครื่อง',
  `memory` varchar(50) DEFAULT NULL,
  `cpu` varchar(100) DEFAULT NULL,
  `harddisk` varchar(100) DEFAULT NULL,
  `monitor` varchar(100) DEFAULT NULL,
  `other_detail` varchar(255) DEFAULT NULL,
  `device_ip` varchar(100) DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `device_price` double(22,2) DEFAULT NULL,
  `device_docs` varchar(50) DEFAULT NULL,
  `vender` varchar(255) DEFAULT NULL,
  `warranty` varchar(255) DEFAULT NULL,
  `device_status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `device_type_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `device_type`
-- -------------------------------------------
DROP TABLE IF EXISTS `device_type`;
CREATE TABLE IF NOT EXISTS `device_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_type` varchar(45) DEFAULT NULL COMMENT 'หมวดหมู่อุปกรณ์',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `employee`
-- -------------------------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(45) DEFAULT NULL,
  `user_position` varchar(100) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `job`
-- -------------------------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_date` datetime DEFAULT NULL COMMENT 'วันที่แจ้ง',
  `job_detail` varchar(1000) DEFAULT NULL COMMENT 'ปัญหา/อาการเสีย',
  `job_start_date` datetime DEFAULT NULL COMMENT 'วันที่ดำเนินการซ่อม',
  `job_success_date` datetime DEFAULT NULL COMMENT 'วันที่เสร็จ',
  `job_how_to_fix` varchar(1000) DEFAULT NULL COMMENT 'สาเหตุ/วิธีการซ่อม',
  `price` int(11) DEFAULT NULL,
  `job_status` varchar(45) DEFAULT NULL COMMENT 'สถานะการซ่อม',
  `job_employee_id` int(11) NOT NULL,
  `job_type_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `job_type`
-- -------------------------------------------
DROP TABLE IF EXISTS `job_type`;
CREATE TABLE IF NOT EXISTS `job_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type_name` varchar(45) DEFAULT NULL COMMENT 'ประเภทงานซ่อม',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `migration`
-- -------------------------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `user`
-- -------------------------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password_hash` varchar(60) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `version`
-- -------------------------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE IF NOT EXISTS `version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(10) NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE DATA department
-- -------------------------------------------
INSERT INTO `department` (`id`,`department_name`) VALUES
('1','ผู้อำนวยการวิทยาลัย');
INSERT INTO `department` (`id`,`department_name`) VALUES
('2','สำนักอำนวยการ');
INSERT INTO `department` (`id`,`department_name`) VALUES
('3','รองผู้อำนวยการฝ่ายวิชาการ');
INSERT INTO `department` (`id`,`department_name`) VALUES
('4','งานพัฒนาหลักสูตรและการเรียนการสอน');
INSERT INTO `department` (`id`,`department_name`) VALUES
('5','งานทะเบียนสถิติประมวลผลและทุนการศึกษา');
INSERT INTO `department` (`id`,`department_name`) VALUES
('6','ภาควิชาพื้นฐานการพยาบาลการพยาบาลเด็กผู้ใหญ่ผู้สูงอายุและการบริหารการพยาบาล');
INSERT INTO `department` (`id`,`department_name`) VALUES
('7','ภาควิชาการพยาบาลจิตเวชชุมชนการศึกษาทั่วไป');
INSERT INTO `department` (`id`,`department_name`) VALUES
('8','ภาควิชาการพยาบาลมารดาทารกและการผดุงครรภ์');
INSERT INTO `department` (`id`,`department_name`) VALUES
('9','รองผู้อำนวยการฝ่ายวิจัย');
INSERT INTO `department` (`id`,`department_name`) VALUES
('10','งานวิจัยและนวัตกรรม');
INSERT INTO `department` (`id`,`department_name`) VALUES
('11','งานบริหารทรัพยากรบุคคลและการจัดการความรู้');
INSERT INTO `department` (`id`,`department_name`) VALUES
('12','รองผู้อำนวยการฝ่ายบริการวิชาการและกิจการนักศึกษา');
INSERT INTO `department` (`id`,`department_name`) VALUES
('13','งานบริการวิชาการ ประชาสัมพันธ์ และวิเทศสัมพันธ์');
INSERT INTO `department` (`id`,`department_name`) VALUES
('14','งานพัฒนานักศึกษาสวัสดิการและทำนุบำรุงศิลปวัฒนธรรม');
INSERT INTO `department` (`id`,`department_name`) VALUES
('15','งานวิทยบริการทางการศึกษา');
INSERT INTO `department` (`id`,`department_name`) VALUES
('16','รองผู้อำนวยการฝ่ายแผนและพัฒนาคุณภาพ');
INSERT INTO `department` (`id`,`department_name`) VALUES
('17','งานแผนและประกันคุณภาพ');
INSERT INTO `department` (`id`,`department_name`) VALUES
('18','งานเทคโนโลยีสารสนเทศ');
INSERT INTO `department` (`id`,`department_name`) VALUES
('19','อื่นๆ');



-- -------------------------------------------
-- TABLE DATA device_type
-- -------------------------------------------
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('1','Personal computer(PC)');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('2','Printer');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('3','NoteBook');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('4','Scanner');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('5','Server');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('6','โปรแกรมงานต่างๆ');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('7','ระบบสารสนเทศต่างๆ');



-- -------------------------------------------
-- TABLE DATA employee
-- -------------------------------------------
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('1','นางสาวนิมัศตูรา แว','ผู้อำนวยการวิทยาลัยพยาบาลบรมราชชนนี ยะลา','1');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('2','นางปรียนุช ชัยกองเกียรติ','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','9');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('3','นางสาวอัจฉรา มุสิกวัณณ์','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','12');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('4','นางสาวจงกรม ทองจันทร์','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','16');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('5','นางสาวมาริสา หะสาเมาะ','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','14');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('6','นางพวงผกา ดำรงเสรี','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('7','นางวราภรณ์ ศิวดำรงพงศ์','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','19');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('8','นางเปรมฤดี ดำรักษ์','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('9','นางกฤษณา เฉลียวศักดิ์','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('10','นางสาวดวงใจ เปลี่ยนบำรุง','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','3');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('11','นางเปี่ยมสุข สมบัติสุข','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','8');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('12','นางสาวจิตตินันท์ พงสุวรรณ','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('13','นางเขมพัทธ์ ขจรกิตติยา','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('14','นางวิไล อุดมพิทยาสรรพ์','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('15','นายชัยณรงค์ อาจอาสา','วิทยาจารย์ชำนาญการพิเศษ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('16','นางสาวผุสนีย์ แก้วมณีย์','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('17','นางสาวบูรณ์คณัส จันทรศิริพุทธ','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','8');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('18','นางโศรยา นิฮะ','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('19','นางพิชญ์ชญานิษฐ์ เรืองเริงกุลฤทธิ์','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('20','นางสาวนุศรา ดาวโรจน์','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('21','นางสุชาดา เจะดอเลาะ','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('22','นางสาวสิรินภร ศุกรวรรณ','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','8');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('23','นายอนุชิต คลังมั่น','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('24','นายเรวัตร คงผาสุข','วิทยาจารย์ชำนาญการพิเศษ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('25','นางสาวพิมพ์ณัฐชา สุไลมาน','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','8');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('26','นางสาวพัชรินทร์ คมขำ','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('27','นางมยุรี ยีปาโล๊ะ','พยาบาลวิชาชีพชำนาญการ (ด้านการสอน)','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('28','นางสาวกมลวรรณ โพธิ์วิทยาการ','พยาบาลวิชาชีพชำนาญการ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('29','นางสาวสาธิมาน มากชูชิต','พยาบาลวิชาชีพชำนาญการ (ด้านการสอน)','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('30','นางสาวภาซีน่า บุญลาภ','พยาบาลวิชาชีพชำนาญการ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('31','นางสาวยุซรอ เล๊าะแม','พยาบาลวิชาชีพชำนาญการ (ด้านการสอน)','8');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('32','นางสาวชนิกานต์ สมจารี','พยาบาลวิชาชีพชำนาญการ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('33','นางสาวศุภวรรณ สีแสงแก้ว','พยาบาลวิชาชีพชำนาญการ (ด้านการสอน)','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('34','นางสาวนูรซาฮีดา เจ๊ะมามะ','พยาบาลวิชาชีพปฏิบัติการ','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('35','นางสาววานีตา สาเมาะ','พยาบาลวิชาชีพปฏิบัติการ','7');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('36','นายคอลิด ครุนันท์','พยาบาลวิชาชีพปฏิบัติการ','6');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('37','นางนวรัตน์ ไวชมภู','พยาบาลวิชาชีพชำนาญการ (ด้านการสอน)','8');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('38','นางสาวรุ่งรัชนี ชำนิธุระการ','นักจัดการงานทั่วไปปฏิบัติการ','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('39','นางอาดีละห์ ลาเต๊ะ','เจ้าพนักงานการเงินและบัญชีชำนาญงาน','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('40','นางสาวสุวรรณดี ขุนทาวดี','เจ้าพนักงานธุรการชำนาญงาน','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('41','นางธมนวรรณ รัตนสิทธิ์','นักจัดการงานทั่วไป','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('42','นายฮอลมีซี หะยีแวจิ','นักวิชาการคอมพิวเตอร์','18');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('43','นายสำราญ เหลี่ยมสุวรรณ','นักวิชาการโสตทัศนศึกษา','18');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('44','นางสาวสาวิตรี เล๊ะนุ๊','นักวิชาการพัสดุ','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('45','นางสาวอุทัยวรรณ หนูจันทร์','นักวิชาการพัสดุ','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('46','นางสาวไซนี หะยีตาเห','นักทรัพยากรบุคคล','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('47','นายธวัชชัย ทับทิมทอง','นักวิเคราะห์นโยบายและแผน','17');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('48','นางสาวสมสวาท รัศมีวงศ์','อาจารย์ปกครอง','19');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('49','นางสาวมัสก๊ะ ดอปอ','เจ้าพนักงานธุรการ','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('50','นางสาวอุษา ดอนแก้ว','พนักงานพิมพ์','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('51','นางสาวฮัซวานี บือแนสะเตง','บรรณารักษ์','15');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('52','นางสาวรอมือละห์ กะลูแป','เจ้าหน้าที่ห้องสมุด','15');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('53','นายเฉลิมชัย รัชกุล','พนักงานขับรถยนต์','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('54','นายสมเดช ขาเร็ง','พนักงานขับรถยนต์','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('55','นางสุธัญญา เพชรห้วยลึก','แม่บ้าน','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('56','นางสาวสุวรรณี พุทธแสง','พนักงานสถานที่','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('57','นางพนมพร แก้วคงบุญ','พนักงานสถานที่','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('58','นางวีณา สุวรรณสะอาด','พนักงานสถานที่','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('59','นางสาวไพงาม ยอดยิ่ง','พนักงานสถานที่','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('60','นางสาวราฮานี แวลาเต๊ะ','พนักงานสถานที่','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('61','นางผอบ จันทวงศ์','พนักงานสถานที่','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('62','นางสาวรอกายะห์ มะลี','พนักงานสถานที่','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('63','นางเบญจวรรณ สายชล','พนักงานสถานที่','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('64','นายยะห์ยา มะแซ','ช่างซ่อมบำรุง','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('65','นายมาหะมะการิม อีซอ','คนสวน','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('66','นางแรมจันทร์ ด้วงคำสี','พนักงานสถานที่','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('67','นางสาวนิตยา คุณะดิลก','นักวิชาการเงินและบัญชี','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('68','นางสาวนิรอซมี สาและ','นักวิชาการสถิติ','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('69','นางสาวคอปือเซาะ มะตาบู','พนักงานสถานที่','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('70','นางสาวเสาวลักษณ์ เอียดจุ้ย','นักวิชาการเงินและบัญชี','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('71','นางสาวแวแอเสาะ เจ๊ะนะ','พนักงานทั่วไป','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('72','นางสาวฟารีดะฮ์ กาเราะ','บรรณารักษ์','15');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('73','นายวีรวุฒิ มาลา','พนักงานขับรถยนต์','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('74','นายวีรยุทธ กายฤทธ','เจ้าพนักงานเครื่องคอมพิวเตอร์','18');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('75','นางสาวนูร์ยีฮัน ดือราซอ','เจ้าพนักงานธุรการ','2');



-- -------------------------------------------
-- TABLE DATA job_type
-- -------------------------------------------
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('1','แก้ไขปัญหาด้าน Software');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('2','แก้ไขปัญหาด้าน Hardware');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('3','แก้ไขปัญหาด้านระบบเครือข่าย');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('4','ซ่อมบำรุงอุปกรณ์ต่อพ่วง Hardware');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('5','ประชุม/อบรม/สัมนา');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('6','จัดทำเอกสาร');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('7','งานอื่น ๆ ที่ได้รับมอบหมาย');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('8','ปรับปรุง/พัฒนา');



-- -------------------------------------------
-- TABLE DATA migration
-- -------------------------------------------
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m000000_000000_base','1447299401');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140209_132017_init','1447299406');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140403_174025_create_account_table','1447299407');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140504_113157_update_tables','1447299412');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140504_130429_create_token_table','1447299413');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140830_171933_fix_ip_field','1447299414');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140830_172703_change_account_table_name','1447299414');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m141222_110026_update_ip_field','1447299414');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m141222_135246_alter_username_length','1447299415');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m150614_103145_update_social_account_table','1447299417');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m150623_212711_fix_username_notnull','1447299418');



-- -------------------------------------------
-- TABLE DATA user
-- -------------------------------------------
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`email`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('1','ผู้ดูแลระบบ','admin','ผู้ดูแลระบบ','halmeezee@gmail.com','$2y$12$3xWS89XqIQZLiUvAZcpwpuiGwsAMOipaQy3hFKrmj44IwnNxv6cPm','1447299648','1471322903','1');
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`email`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('2','นายวีรยุทธ กายฤทธ','UserIT','เจ้าหน้าที่คอมพิวเตอร์','','$2y$12$mM9JTvWSjiTDZadia/DaLOXJGXR3b7JD.hTrRWpv0rwsvjN7f4ec2','1471323575','1471417372','0');
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`email`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('3','user it','it1','ช่าง','','$2y$12$Taun0FixuV4lTPLwQv1cBOso8wC3pg98h7j5ZkRmZktGhXwM8mS1m','1471416784','1471416784','0');



-- -------------------------------------------
-- TABLE DATA version
-- -------------------------------------------
INSERT INTO `version` (`id`,`version`,`update_date`) VALUES
('1','2.5','2016-07-30 02:15:27');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
