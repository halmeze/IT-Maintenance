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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

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
INSERT INTO `department` (`id`,`department_name`) VALUES
('20','ห้องเรียน นศ.');
INSERT INTO `department` (`id`,`department_name`) VALUES
('21','ห้องปฎิบัติการภาษา');
INSERT INTO `department` (`id`,`department_name`) VALUES
('22','ห้องปฎิบัติการพยาบาล');
INSERT INTO `department` (`id`,`department_name`) VALUES
('23','ห้องสมุด');
INSERT INTO `department` (`id`,`department_name`) VALUES
('24','ห้องปฎิบัติการคอมพิวเตอร์');
INSERT INTO `department` (`id`,`department_name`) VALUES
('25','ห้องเครื่องแม่ข่าย(Server)');
INSERT INTO `department` (`id`,`department_name`) VALUES
('26','ห้อง Conforence');
INSERT INTO `department` (`id`,`department_name`) VALUES
('27','ห้องประชุม');
INSERT INTO `department` (`id`,`department_name`) VALUES
('28','บุคลากรสายอาจารย์');
INSERT INTO `department` (`id`,`department_name`) VALUES
('29','บุคลากรสายสนับสนุน');
INSERT INTO `department` (`id`,`department_name`) VALUES
('30','นักศึกษา');



-- -------------------------------------------
-- TABLE DATA device
-- -------------------------------------------
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('1','PC1-010-02','','MSI','Boston','PC101002 (ธมนวรรณ)',' DDR2  1024 Mbytes','intel Core-2 Duo E4600 2.4GHz','160G','HP W17E','หมายเลขครุภัณฑ์ ()','','','','10000.00','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('2','PC1-410-02','01','','','PC141002 (ธวัชชัย)','','','','','เลขครุภัณฑ์()','','','','15000.00','','','','enable','1','17');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('3','PC1-001-01','','','','PC100101 (ผ.อ.นิมัศตูรา)','','','','','','','','','','','','','enable','1','1');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('4','PC1-100-01','','','','PC110001 (อ.ดวงใจ)','','','','','','','','','','','','','enable','1','3');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('5','PC1-200-01','','','','PC120001 (อ.ปรียนุช)','','','','','','','','','','','','','enable','1','9');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('6','PC1-300-01','','','','PC130001 (อ.อัจฉรา)','','','','','','','','','','','','','enable','1','12');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('8','PC1-400-01','','','','PC140001 (อ.จงกรม)','','','','','','','','','','','','','enable','1','16');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('9','PC1-000-01','','','','PC100001(รุ่งรัชนี)','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('10','PC1-040-01','','','','PC104001(มัสก๊ะ)','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('11','PC1-040-02','','','','PC104002(สุไรยา)','','','','','','','2016-01-01','2016-01-01','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('12','PC1-040-03','','','','PC104003(นูร์ยีฮัน)','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('15','PC1-060-02','','','','PC106002(ยานพาหนะ(02))','','','','','','','2016-01-01','2016-01-01','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('16','PC1-060-01','','','','PC106001(ยานพาหนะ(01))','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('17','PC1-010-01','','','','PC101001(อาดีละห์)','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('18','PC1-010-03','','','','PC101003(นิตยา)','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('19','PC1-010-04','','','','PC101004(กัลยกร)','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('20','PC1-020-01','','','','PC102001(สาวิตรี)','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('21','PC1-020-02','','','','PC102001(อุทัยวรรณ)','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('22','PC1-030-01','','','','PC103001(สุวรรณดี)','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('23','PC1-030-02','','','','PC103002(ไซนี)','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('24','PC1-060-01','','','','PC106001(สุธัญญา )','','','','','','','','','','','','','enable','1','2');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('25','PC1-120-01','','','','PC112001(นิรอซมี)','','','','','','','2016-01-01','2016-01-01','','','','','enable','1','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('26','PC1-120-02','','','','PC112002(อุษา)','','','','','','','','','','','','','enable','1','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('27','PC1-120-03','','','','PC112003(กมลวรรณ)','','','','','','','','','','','','','enable','1','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('28','PC1-320-01','','','','PC132001(มาริสา)','','','','','','','','','','','','','enable','1','14');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('29','PC1-320-02','','','','PC132002(วราภรณ์)','','','','','','','','','','','','','enable','1','14');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('30','PC1-420-01','','','','PC142001(ชัยณรงค์)','','','','','','','','','','','','','enable','1','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('31','PC1-420-02','','','','PC142001(ฮอลมีซี)','','','','','','','','','','','','','enable','1','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('32','PC1-420-03','','','','PC142001(สำราญ)','','','','','','','','','','','','','enable','1','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('33','PC1-420-04','','','','PC142001(วีรยุทธ)','','','','','','','','','','','','','enable','1','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('34','PC1-120-04','','','','PC112004(ตรวจข้อสอบ)','','','','','','','2016-01-01','2016-01-01','','','','','enable','1','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('35','PC1-120-05','','','','PC112005(พิมพ์ข้อสอบ)','','','','','','','','','','','','','enable','1','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('36','PC1-410-01','','','','PC141001(เรวัตร)','','','','','','','','','','','','','enable','1','17');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('37','PC1-410-03','','','','PC141003(งานแผนสำรอง01)','','','','','','','','','','','','','enable','1','17');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('38','PC1-330-01','','','','PC133001(ยืม_คืน)','','','','','','','','','','','','','enable','1','15');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('39','PC1-330-02','','','','PC133002(งานพิมพ์)','','','','','','','','','','','','','enable','1','15');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('40','PC1-140-00','','','','PC114000(ภาคจิตเวชฯ)','','','','','','','','','','','','','enable','1','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('41','PC1-150-00','','','','PC115000(ภาคผู้ใหญ่ฯ)','','','','','','','','','','','','','enable','1','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('42','ST1-420-01','','','','ST142001 เว็บไซต์วิทยาลัยฯ BCNYALA','','','','','','','','','','','','','enable','7','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('43','NB1-420-01','','','','NB142001(Aser)','','','','','','','2014-01-01','2016-01-01','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('44','NB1-420-02','','','','NB142002(IBM Lenovo  No 2)','','','','','','','2014-01-02','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('45','NB1-420-03','','','','NB142003(NEC  No 3)','','','','','','','2014-01-03','2016-10-07','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('46','NB1-420-04','','','','NB142004(NEC  No 4)','','','','','','','2014-01-04','2016-10-07','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('47','NB1-420-05','','','','NB142005(Compaq  No 5)','','','','','','','2014-01-05','2016-10-07','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('48','NB1-420-06','','','','NB142006(Compaq  No 6)','','','','','','','2014-01-06','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('49','NB1-420-07','','','','NB142007(Compaq  No 7)','','','','','','','2014-01-07','2016-10-07','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('50','NB1-420-08','','','','NB142008(Compaq  No 8)','','','','','','','2014-01-08','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('51','NB1-420-09','','','','NB142009(Compaq  No 9)','','','','','','','2014-01-09','2016-10-07','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('52','NB1-420-10','','','','NB142010(Dell  No 10)','','','','','','','2014-01-10','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('53','NB1-420-11','','','','NB142011(Dell  No 11)','','','','','','','2014-01-11','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('54','NB1-420-12','','','','NB142012(Dell  No 12)','','','','','','','2014-01-12','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('55','NB1-420-13','','','','NB142013(Dell  No 13)','','','','','','','2014-01-13','2016-01-01','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('56','NB1-420-14','','','','NB142014(Dell  No 14)','','','','','','','2014-01-14','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('57','NB1-420-15','','','','NB142015(Sony No 15)','','','','','','','2014-01-15','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('58','NB1-420-16','','','','NB142016(Lenovo No 16)','','','','','','','2014-01-16','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('59','NB1-420-17','','','','NB142017(Asus)','','','','','','','2014-01-17','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('60','NB1-420-18','','','','NB142018(Asus)','','','','','','','2014-01-18','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('61','NB1-420-19','','','','NB142019(Asus)','','','','','','','2014-01-19','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('62','NB1-420-20','','','','NB142020(Asus)','','','','','','','2014-01-20','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('63','NB1-420-21','','','','NB142021(Asus)','','','','','','','2014-01-21','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('64','NB1-420-22','','','','NB142022(Asus)','','','','','','','2014-01-22','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('65','NB1-420-23','','','','NB142023(?)','','','','','','','2014-01-23','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('66','PC1-421-01','HF-PRO-FX-6350-H97','SVOA','Professional S018','PC142101','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-01','2016-01-01','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('67','PC1-421-02','HF-PRO-FX-6350-H98','SVOA','Professional S019','PC142102','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-02','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('68','PC1-421-03','HF-PRO-FX-6350-H99','SVOA','Professional S020','PC142103','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-03','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('69','PC1-421-04','HF-PRO-FX-6350-H100','SVOA','Professional S021','PC142104','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-04','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('70','PC1-421-05','HF-PRO-FX-6350-H101','SVOA','Professional S022','PC142105','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-05','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('71','PC1-421-06','HF-PRO-FX-6350-H102','SVOA','Professional S023','PC142106','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-06','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('72','PC1-421-07','HF-PRO-FX-6350-H103','SVOA','Professional S024','PC142107','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-07','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('73','PC1-421-08','HF-PRO-FX-6350-H104','SVOA','Professional S025','PC142108','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-08','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('74','PC1-421-09','HF-PRO-FX-6350-H105','SVOA','Professional S026','PC142109','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-09','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('75','PC1-421-10','HF-PRO-FX-6350-H106','SVOA','Professional S027','PC142110','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-10','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('76','PC1-421-11','HF-PRO-FX-6350-H107','SVOA','Professional S028','PC142111','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-11','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('77','PC1-421-12','HF-PRO-FX-6350-H108','SVOA','Professional S029','PC142112','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-12','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('78','PC1-421-13','HF-PRO-FX-6350-H109','SVOA','Professional S030','PC142113','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-13','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('79','PC1-421-14','HF-PRO-FX-6350-H110','SVOA','Professional S031','PC142114','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-14','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('80','PC1-421-15','HF-PRO-FX-6350-H111','SVOA','Professional S032','PC142115','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-15','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('81','PC1-421-16','HF-PRO-FX-6350-H112','SVOA','Professional S033','PC142116','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-16','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('82','PC1-421-17','HF-PRO-FX-6350-H113','SVOA','Professional S034','PC142117','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-17','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('83','PC1-421-18','HF-PRO-FX-6350-H114','SVOA','Professional S035','PC142118','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-18','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('84','PC1-421-19','HF-PRO-FX-6350-H115','SVOA','Professional S036','PC142119','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-19','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('85','PC1-421-20','HF-PRO-FX-6350-H116','SVOA','Professional S037','PC142120','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-20','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('86','PC1-421-21','HF-PRO-FX-6350-H117','SVOA','Professional S038','PC142121','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-21','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('87','PC1-421-22','HF-PRO-FX-6350-H118','SVOA','Professional S039','PC142122','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-22','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('88','PC1-421-23','HF-PRO-FX-6350-H119','SVOA','Professional S040','PC142123','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-23','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('89','PC1-421-24','HF-PRO-FX-6350-H120','SVOA','Professional S041','PC142124','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-24','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('90','PC1-421-25','HF-PRO-FX-6350-H121','SVOA','Professional S042','PC142125','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-25','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('91','PC1-421-26','HF-PRO-FX-6350-H122','SVOA','Professional S043','PC142126','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-26','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('92','PC1-421-27','HF-PRO-FX-6350-H123','SVOA','Professional S044','PC142127','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-27','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('93','PC1-421-28','HF-PRO-FX-6350-H124','SVOA','Professional S045','PC142128','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-28','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('94','PC1-421-29','HF-PRO-FX-6350-H125','SVOA','Professional S046','PC142129','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-29','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('95','PC1-421-30','HF-PRO-FX-6350-H126','SVOA','Professional S047','PC142130','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-30','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('96','PC1-421-31','HF-PRO-FX-6350-H127','SVOA','Professional S048','PC142131','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','2015-05-31','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('97','PC1-421-32','HF-PRO-FX-6350-H128','SVOA','Professional S049','PC142132','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','0000-00-00','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('98','PC1-421-33','HF-PRO-FX-6350-H129','SVOA','Professional S050','PC142133','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','0000-00-00','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('99','PC1-421-34','HF-PRO-FX-6350-H130','SVOA','Professional S051','PC142134','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','0000-00-00','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('100','PC1-421-35','HF-PRO-FX-6350-H131','SVOA','Professional S052','PC142135','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','0000-00-00','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('101','PC1-421-36','HF-PRO-FX-6350-H132','SVOA','Professional S053','PC142136','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','0000-00-00','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('102','PC1-421-37','HF-PRO-FX-6350-H133','SVOA','Professional S054','PC142137','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','0000-00-00','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('103','PC1-421-38','HF-PRO-FX-6350-H134','SVOA','Professional S055','PC142138','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','0000-00-00','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('104','PC1-421-39','HF-PRO-FX-6350-H135','SVOA','Professional S056','PC142139','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','0000-00-00','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('105','PC1-421-40','HF-PRO-FX-6350-H136','SVOA','Professional S057','PC142140','DDR3 4GB (1600MHz)','AMD CPU FX-6350 SIX-CORE 3.9 GHz','HDD 1TB/7200rpm 64MB sata 6 Gb/s','','มี CARD จอ','','0000-00-00','','','','','3','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('106','MT6110','','','','ห้องประชุมดอกบัว','','','','','เครื่องเสียงและโปรเจคเตอร์','','','','','','','','enable','9','27');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('107','MT6302','','','','ห้องประชุมจงจิต','','','','','เครื่องเสียงและโปรเจคเตอร์
','','','','','','','','enable','9','27');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('108','MT6303','','','','ห้องประชุมชิดกานต์ เจริญ','','','','','เครื่องเสียงและโปรเจคเตอร์
','','','','','','','','enable','9','27');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('109','MT6602','','','','ห้องประชุมจินดา','','','','','เครื่องเสียงและโปรเจคเตอร์
','','','','','','','','enable','9','27');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('110','ST6205','','','','ห้องปฏิบัติการคอมพิวเตอร์','','','','','เครื่องเสียงและโปรเจคเตอร์
','','','','','','','','enable','9','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('111','MT9201','','','','ห้องประชุมอุบลรัตน์','','','','','เครื่องเสียงและโปรเจคเตอร์
','','','','','','','','enable','9','27');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('112','ST9401','','','','ห้องเรียน ชั้น 4  ปี 2 ติด รพ.  ','','','','','เครื่องเสียงและโปรเจคเตอร์
','','','','','','','','enable','9','20');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('113','ST9403','','','','ห้องเรียน ชั้น 4  ปี 4 ติด วพบ.  ','','','','','เครื่องเสียงและโปรเจคเตอร์
','','','','','','','','enable','9','20');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('114','ST9505','','','','ห้องเรียน ชั้น 5  ปี 1 ติด วพบ.','','','','','เครื่องเสียงและโปรเจคเตอร์
','','','','','','','','enable','9','20');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('115','ST9304','','','','ห้องเรียน ชั้น 6  ปี 3 ติด วพบ.  ','','','','','เครื่องเสียงและโปรเจคเตอร์
','','','','','','','','enable','9','20');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('116','MT9904','','','','ห้อง ห้องประชุม นิมัศตูรา แว','','','','','เครื่องเสียงและโปรเจคเตอร์
','','','','','','','','enable','9','27');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('117','CF9702','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','2016-01-01','2016-01-01','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('118','CF9703','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('119','CF9704','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('120','CF9801','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('121','CF9802','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('122','CF9803','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('123','CF9804','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('124','CF9805','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('125','CF9806','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('126','CF9807','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('127','CF9808','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('128','CF9809','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('129','CF9810','','','','ห้อง Conforence','','','','','TV LED และ สายสัญญาณ','','','','','','','','enable','9','26');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('130','PC2-421-01','','','','PC242101','1 G','','','','เครื่อง MAC','','2016-01-01','2016-01-01','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('131','PC2-421-02','','','','PC242102','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('132','PC2-421-03','','','','PC242103','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('133','PC2-421-04','','','','PC242104','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('134','PC2-421-05','','','','PC242105','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('135','PC2-421-06','','','','PC242106','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('136','PC2-421-07','','','','PC242107','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('137','PC2-421-08','','','','PC242108','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('138','PC2-421-09','','','','PC242109','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('139','PC2-421-10','','','','PC242110','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('140','PC2-421-11','','','','PC242111','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('141','PC2-421-12','','','','PC242112','1 G','','','','เครื่อง MAC','','','','','','','','enable','1','24');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('142','AV-V06201','',' reze','','เครื่องฉายทึบแสง visurizer','','','','','6730-010-0003/ว.6','','2016-01-01','2016-01-01','40000.00','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('143','AV-V06202','',' reze','','เครื่องฉายทึบแสง visurizer','','','','','6730-010-0003/ว.7','','','','40000.00','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('144','AV-V06203','',' vertax','D-1320','เครื่องฉายทึบแสง visurizer','','','','','6730-010-0003/ว.8','','0000-00-00','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('145','AV-A06201','','DECCON','PWS-230','เครื่องเสียงเคลื่อนที่ + ไมค์ลอย','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('146','AV-A06202','','DECCON','PWS-230','เครื่องเสียงเคลื่อนที่ + ไมค์ลอย','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('147','AV-CG6201','','FUJIFILM','S4300','กล้องถ่ายภาพ digital FUJI','','','','','6710-004-0003-/ว5','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('148','AV-CG6202','','FUJIFILM','S4300','กล้องถ่ายภาพ digital FUJI','','','','','6710-004-0003-/ว6','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('149','AV-VG6201','','SONY','HDR-PJ50E','กล้องถ่ายวีดีโอ','','','','','6710-004-0001-/ว4','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('150','AV-PO6201','','sanyo',' Plc xw60','เครื่องฉายโปรเจคเตอร์ ','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('151','AV-PO6202','','sanyo',' Plc xw61','เครื่องฉายโปรเจคเตอร์ ','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('152','AV-V06201','',' reze','','เครื่องฉายทึบแสง visurizer','','','','','6730-010-0003/ว.6','','2016-01-01','2016-01-01','40000.00','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('153','AV-V06202','',' reze','','เครื่องฉายทึบแสง visurizer','','','','','6730-010-0003/ว.7','','','','40000.00','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('154','AV-V06203','',' vertax','D-1320','เครื่องฉายทึบแสง visurizer','','','','','6730-010-0003/ว.8','','0000-00-00','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('155','AV-A06201','','DECCON','PWS-230','เครื่องเสียงเคลื่อนที่ + ไมค์ลอย','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('156','AV-A06202','','DECCON','PWS-230','เครื่องเสียงเคลื่อนที่ + ไมค์ลอย','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('157','AV-CG6201','','FUJIFILM','S4300','กล้องถ่ายภาพ digital FUJI','','','','','6710-004-0003-/ว5','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('158','AV-CG6202','','FUJIFILM','S4300','กล้องถ่ายภาพ digital FUJI','','','','','6710-004-0003-/ว6','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('159','AV-VG6201','','SONY','HDR-PJ50E','กล้องถ่ายวีดีโอ','','','','','6710-004-0001-/ว4','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('160','AV-PO6201','','sanyo',' Plc xw60','เครื่องฉายโปรเจคเตอร์ ','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('161','AV-PO6202','','sanyo',' Plc xw61','เครื่องฉายโปรเจคเตอร์ ','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('162','AV-V06201','',' reze','','เครื่องฉายทึบแสง visurizer','','','','','6730-010-0003/ว.6','','2016-01-01','2016-01-01','40000.00','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('163','AV-V06202','',' reze','','เครื่องฉายทึบแสง visurizer','','','','','6730-010-0003/ว.7','','','','40000.00','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('164','AV-V06203','',' vertax','D-1320','เครื่องฉายทึบแสง visurizer','','','','','6730-010-0003/ว.8','','0000-00-00','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('165','AV-A06201','','DECCON','PWS-230','เครื่องเสียงเคลื่อนที่ + ไมค์ลอย','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('166','AV-A06202','','DECCON','PWS-230','เครื่องเสียงเคลื่อนที่ + ไมค์ลอย','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('167','AV-CG6201','','FUJIFILM','S4300','กล้องถ่ายภาพ digital FUJI','','','','','6710-004-0003-/ว5','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('168','AV-CG6202','','FUJIFILM','S4300','กล้องถ่ายภาพ digital FUJI','','','','','6710-004-0003-/ว6','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('169','AV-VG6201','','SONY','HDR-PJ50E','กล้องถ่ายวีดีโอ','','','','','6710-004-0001-/ว4','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('170','AV-PO6201','','sanyo',' Plc xw60','เครื่องฉายโปรเจคเตอร์ ','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('171','AV-PO6202','','sanyo',' Plc xw61','เครื่องฉายโปรเจคเตอร์ ','','','','','','','','','','','','','enable','9','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('172','TC','','','','ผู้รับบริการบุคลากรสายอาจารย์','','','','','','','','','','','','','enable','3','28');



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
('6','Network');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('7','ระบบสารสนเทศ');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('8','โปรแกรมงาน');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('9','โสตทัศนูปกรณ์');



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
('7','นางวราภรณ์ ศิวดำรงพงศ์','พยาบาลวิชาชีพชำนาญการพิเศษ (ด้านการสอน)','14');
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
('15','นายชัยณรงค์ อาจอาสา','วิทยาจารย์ชำนาญการพิเศษ (ด้านการสอน)','18');
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
('24','นายเรวัตร คงผาสุข','วิทยาจารย์ชำนาญการพิเศษ (ด้านการสอน)','17');
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
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('76','นางกมลวรรณ เมฆสุวรรณ','งานทะเบียนสถิติประมวลผลและทุนการศึกษา','5');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('77','นางสาวกัลยกร เอียดจุ้ย','การเงินและบัญชี','2');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('78','นางสาวสุไรยา สาแม','เจ้าพนักงานธุรการ','2');



-- -------------------------------------------
-- TABLE DATA job
-- -------------------------------------------
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('1','2016-08-17 09:42:00','(ขนย้ายคอมพิวเตอร์ 5 เครื่อง) ห้องสมุดปรับปรุงใหม่','2016-08-17 10:43:00','2016-08-17 11:44:00','','0','success','51','8','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('2','2016-08-16 09:00:00','เครื่องและอินเตอร์เน็ตช้า','2016-08-19 13:00:00','2016-08-19 15:57:00','ลง OS ใหม่ รวมทั้ง โปรแกรมใช้งานต่างๆ','300','success','47','1','2','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('3','2016-08-18 09:53:00','ระะบบ Admission','2016-08-18 10:00:00','2016-08-18 10:15:00','(ระะบบ Admission) บันทึก นศ.มารายงานตัว 2 คน','0','success','68','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('4','2016-08-18 13:24:00','เนื่องจาห้องสมุดย้ายห้องทำงาน เน็ตใช้ไม่ได้','2016-08-18 14:00:00','2016-08-18 15:26:00','เดินสาย Network ใหม่','0','success','51','3','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('5','2016-08-18 13:29:00','เนื่องจากห้องสมุดย้ายห้องทำงาน เน็ตใช้ไม่ได้','2016-08-18 14:00:00','2016-08-18 15:30:00','เดินสาย Network ใหม่	','300','success','51','3','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('6','2016-07-01 09:00:00','พัฒนาระบบบริหารงานสารสนเทศพัสดุ งาน IT คอมพิวเตอร์','2016-07-01 09:00:00','2016-09-29 13:00:00','วิเคราะห์ ออกแบบ เขียนโปรแกรม ','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('7','2016-08-26 09:20:43','(ประชาสัมพันธ์) งานบริการวิชาการ','2016-08-26 09:21:00','2016-08-26 13:54:00','(ประชาสัมพันธ์ขึ้นเว็บ www.bcnyala.ac.th)','0','success','13','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('8','2016-08-25 09:28:00','(ประชาสัมพันธ์) งานบริการวิชาการ','2016-08-29 14:16:00','2016-08-29 14:53:00','(ประชาสัมพันธ์ขึ้นเว็บ www.bcnyala.ac.th)','0','success','3','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('9','2016-08-25 13:31:00','ระะบบ Admission','2016-08-25 13:31:00','2016-08-25 15:40:00','(ระะบบ Admission) ตรวจ/บันทึก นศ.มารายงานตัว 1 คน','0','success','68','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('10','2016-08-26 10:02:00','ระะบบ Admission','2016-08-26 14:02:00','2016-08-26 15:15:00','(ระะบบ Admission) ตรวจ/บันทึก นศ.มารายงานตัว 1 คน','0','success','68','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('12','2016-08-24 00:00:00','Windows มีปัญหา ไม่สามารถใช้งาน ได้อย่างสมบูณ','2016-08-24 10:32:00','2016-08-25 00:00:00','ลงWindows  ใหม่ เเละอัพเดท โปรเเกรม ใหม่','300','success','67','1','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('13','2016-08-29 10:00:00','สวิตตัวหน้าเสีย','2016-08-29 15:00:00','2016-08-29 00:00:00','เปลี่ยนสวิต ตัวหน้า ปุ่มเพาเวอร์','100','success','60','2','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('14','2016-08-29 13:46:00','ระะบบ Admission','2016-08-29 13:47:00','2016-08-29 13:55:00','(ระะบบ Admission) ตรวจ/บันทึก นศ.มารายงานตัว 1 คน
นางสาววรพิชชา อินทอง  592107587','0','success','68','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('15','2016-08-26 09:15:00','(ระบบอินเตอร์เน็ต) ช้า','2016-08-29 08:15:00','2016-08-29 16:15:00','(ระบบอินเตอร์เน็ต) ช่างผู้รับเหมาติดตั้ง WIFI ใหม่/วิเคาระห์ปัญหา','0','success','15','3','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('16','2016-08-30 09:13:23','(ระบบทะเบียน) รายชื่อปี1 มาไม่ครบในระบบทะเบียน','2016-08-30 09:14:00','2016-08-30 11:22:00','ติดต่อ สบช','0','success','68','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('17','2016-08-30 08:18:00','(ระบบอินเตอร์เน็ต) ช้า','2016-08-30 08:25:00','2016-08-30 14:27:00','(ระบบอินเตอร์เน็ต) สายเช่า CAT ช้า
UNINET ดี','0','success','15','3','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('18','2016-08-30 14:32:00','พัฒนาระบบบริหารงานสารสนเทศพัสดุ งาน IT คอมพิวเตอร์','2016-08-30 14:33:00','2016-08-30 16:23:00','ลงข้อมูลทะเบียนคอมในระบบ','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('19','2016-08-31 08:30:00','(ระบบอินเตอร์เน็ต)/session รบกวน','2016-08-31 08:45:00','2016-08-31 15:13:00','Access Point เก่า POE รบกวน','0','success','15','3','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('20','2016-09-02 08:15:00','AP ','2016-09-02 08:15:00','2016-09-02 16:30:00','อบรม AP','0','success','15','5','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('21','2016-09-01 08:00:00','วันไห้วครู','2016-09-01 08:15:00','2016-09-01 10:00:00','ควบคุม / ดูแล','0','success','43','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('22','2016-09-01 10:00:00','AP','2016-09-01 10:00:00','2016-09-01 16:30:00','อบรม AP','0','success','15','5','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('23','2016-09-05 08:30:00','อบรม นวัตกรรม','2016-09-05 08:30:00','2016-09-05 16:00:00','อบรม นวัตกรรม','0','success','33','5','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('24','2016-09-06 08:00:00','หุ่น SIM อ.ปัด  สอนโดยใช้หุ่น','2016-09-06 08:15:00','2016-09-06 11:28:00','ควบคุม / ดูแล','0','success','26','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('25','2016-09-06 13:32:00','(เว็บไซต์วิทยาลัย)','2016-09-06 13:50:00','','(เว็บไซต์วิทยาลัย) หน้าบริการวิชาการ 1 /ไฟล์
หน้าแรกส่วนอาจารย์ 1 /ไฟล์','0','success','13','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('26','2016-09-06 10:10:00','เครื่อง Mac เกิดปัญหา ตอนใช้งาน ทำให้ เครื่องค้างบ่อยๆ
โปรเเกรมใช้งานไม่ได้','2016-09-06 10:30:00','2016-09-06 11:30:00','ทำการตรวจเช็ค เเละอัพเดทโปรเเกรมใหม่ เเละ Windows ใหม่','300','success','38','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('27','2016-09-05 09:00:00','เครื่องคอมพิวเตอร์  PC ยี่ห้อ  SVOA ไม่สมารถใช้งานโปรเเกรมบางตัวได้ เเละอินเตอร์เน็ต บางเครื่องเล่นอินเตอร์ไม่ได้','2016-09-06 09:00:00','2016-09-06 15:30:00','ทำการอัพเดทโปรเเกรมใหม่ทั้งหมด 51 เครื่อง 
เเละทำการเช็คอินเตอร์ ทั้งหมด ว่าใช้งานได้ไหม ','300','success','15','1','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('28','2016-09-04 16:00:00','ตัวกระจายสัญญาณ WI-FI มีปัญหา ตึกอำนวยการ ชั้นที่5 ไม่สามารถใช้งานได้','2016-09-04 16:00:00','2016-09-04 17:00:00','ทำเปลี่ยนตัวอุปกรณ์ กระจายสัญญาณ WI-FIตัวใหม่เข้ามาเเทน ','200','success','15','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('29','2016-09-07 08:30:00','ถ่ายโอนไฟล์ VDO ที่ถ่าย การเซ็ต อุปกรณ์ AP','2016-09-07 08:30:00','2016-09-08 16:09:00','ถ่ายโอนไฟล์ VDO ที่ถ่าย การเซ็ต อุปกรณ์ AP','0','success','15','6','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('30','2016-09-07 11:09:00','(เว็บวิทยาลัย)','2016-09-07 13:09:00','2016-09-07 13:30:00','(เว็บวิทยาลัย) ปรับปรุงหน้างานพัฒนาหลักสูตรและการเรียนการสอน  ','0','success','26','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('31','2016-09-07 14:00:00','(ระบบสารสารเทศพัสดุไอที)','2016-09-07 14:00:00','2016-09-08 15:45:00','(ระบบสารสารเทศพัสดุไอที) เพิ่มข้อมูลทะเบียนอุปกรณ์ในระบบ','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('32','2016-09-08 08:17:00','เรื่อง นักศึกษาชั้นปีที่ 2 รับหมวก','2016-09-08 09:00:00','2016-09-08 10:30:00','ประชุมเรื่อง นักศึกษาชั้นปีที่ 2 รับหมวก','0','success','35','5','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('33','2016-09-08 13:45:00','(โปรแกรม GF) การเงิน','2016-09-08 14:05:00','2016-09-08 15:20:00','โปร ERROR / ลงใหม่','0','success','39','1','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('34','2016-09-14 14:00:00','(พีธีรับหมวกและเข็มวิทยฐานะ)','2016-09-15 08:00:00','2016-09-15 11:00:00','(พีธีรับหมวกและเข็มวิทยฐานะ) ถ่ายรูป ถ่ายวีดีโอ','0','success','15','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('35','2016-09-19 13:20:00','(เว็บ BCNYALA) เมนูผิด สบช','2016-09-20 08:29:00','2016-09-20 09:15:00','แก้ไข และ อัพเดช','0','success','15','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('36','2016-09-19 10:27:31','(เว็บ BCNYALA) ปรับปรุงหน้าเว็บ ภาค','2016-09-20 10:00:00','2016-09-20 10:31:00','แก้ไข และ อัพเดช','0','success','9','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('37','2016-09-20 13:18:00','(สำรวจเครื่องคอม OS Mac)','2016-09-20 13:30:00','2016-09-20 15:45:00','เช็คจำนวนเครื่อง MacOS','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('38','2016-09-21 09:00:00','(ระบบสารสนเทศพัสดุ ไอที)','2016-09-21 09:17:00','2016-09-21 11:21:00','พัฒนา เพิ่มข้อมูลในระบบ','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('39','2016-09-22 08:00:00','(งานเอกสาร) โอนถ่ายวีดีโอ บันทึกงาน Cisco','2016-09-22 08:16:00','2016-09-22 11:16:00','แปลงไฟล์','0','success','42','6','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('40','2016-09-22 09:00:00','(เว็บ BCNYALA)','2016-09-22 13:13:00','2016-09-22 13:22:00','ปรับปรุงหน้าเว็บ ภาควิชาพื้นฐานการพยาบาลการพยาบาลเด็ก ผู้ใหญ่ ผู้สูงอาย','0','success','9','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('41','2016-09-23 08:15:00','(ระบบสารสนเทศพัสดุไอที) การเพิ่มข้อมูลต่างๆในระบบ','2016-09-23 08:30:00','2016-09-23 11:20:00','พัฒนา','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('42','2016-09-23 10:42:22','ปรับปรุง (เครื่องคอม (PC))','2016-09-27 09:03:00','2016-09-27 11:40:00','
ปรับปรุง Drivv c ลง Windows,Office,โปรแกรมใช้งานทั่วไป/โปรแกรมweb online (GF Mis) ,จ่ายตรงเงินเดือน,โปรแกรมภาษีหักณ ที่จ่าย','400','success','39','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('43','2016-09-23 11:00:00','(เน็ตช้า)','','2016-09-23 11:20:00','อัพเดช Chrom ใหม่่','0','success','50','1','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('44','2016-09-23 13:18:00','(เว็บ BCNYALA) หน้าหลักวันมหิดล','2016-09-23 13:20:00','2016-09-23 14:19:00','ปรับปรุง','0','success','9','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('45','2016-09-23 14:20:00','(ระบบสารสนเทศพัสดุไอที) การเพิ่มข้อมูลต่างๆในระบบ','2016-09-23 14:20:00','2016-09-23 16:05:00','','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('46','2016-09-26 13:30:00','(ประชุมเตรียมงาน วันพยาบาล 21 ตค.59)','2016-09-26 13:35:00','2016-09-26 15:05:00','(ประชุมเตรียมงาน วันพยาบาล 21 ตค.59)','0','success','4','5','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('47','2016-09-27 13:58:00','ปรินไม่ได้ (ลง Driver Printer) ','2016-09-27 14:05:00','2016-09-27 14:26:00','(ลง Driver Printer)','0','success','39','1','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('48','2016-09-27 15:08:00','ปรินไม่ได้ (ติดตั้ง Driver Printer )','2016-09-27 15:10:00','2016-09-27 15:35:00','ติดตั้ง Driver Printer','0','success','55','1','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('49','2016-09-28 09:04:00','(ระบบสารสนเทศพัสดุไอที) การเพิ่มข้อมูลต่างๆในระบบ','2016-09-28 09:05:00','2016-09-28 11:53:00','การเพิ่มข้อมูลต่างๆในระบบ(ข้อมูลทะเบียนคอมPC,ข้อมูลประเภทงาน,) มีต่อ','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('50','2016-09-28 13:10:00','(ระบบสารสนเทศพัสดุไอที) การเพิ่มข้อมูลต่างๆในระบบ','2016-09-28 13:11:00','2016-09-28 15:39:00','การเพิ่มข้อมูลต่างๆในระบบ(ข้อมูลทะเบียนคอมPC,ข้อมูลประเภทงาน,)','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('51','2016-09-29 08:28:00','(ระบบทะเบียน) ตั้งค่าระบบประเมินการเรียนการสอน','2016-09-29 08:31:00','2016-09-29 10:39:00','ตั้งค่ารายวิชากับผู้สอนผู้ประสานแต่ละรายวิชา','0','success','68','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('52','2016-09-29 13:12:00','(ระบบสารสนเทศพัสดุไอที) การเพิ่มข้อมูลต่างๆในระบบ','2016-09-29 13:17:00','2016-09-29 15:25:00','การเพิ่มข้อมูลต่างๆในระบบ(ข้อมูลทะเบียนคอมPC,ข้อมูลประเภทงาน,)','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('53','2016-09-29 16:00:07','เว็บงานทะเบียน ในส่วนข้อมูลนักศึกษา ในความดูแลยังมีรายชื่อเฉพาะนศ. ปี ๔ และปี๓ ','2016-10-03 08:43:00','','ได้แจ้งให้งานทะเบียนรับทราบ','0','success','9','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('54','2016-10-03 08:30:00','(สำรวจ) เครื่อง Mac','2016-10-03 08:33:00','2016-10-03 11:40:00','(สำรวจ) เครื่อง Mac (ลงในระบบสารสนเทศแจ้งซ่อม)','0','success','15','6','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('55','2016-10-03 11:05:00','เครื่องค้าง เเละ ไม่สามารถ อ่าน ฮาร์ดิสพกพาได้','2016-10-03 13:30:00','2016-10-03 15:50:00','ทำการลง ระบบปฎิบัติการใหม่ 
เเละ อัพเดทโปรเเกรม ที่ใช้งาน ','300','success','38','4','9','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('56','2016-10-03 14:20:38','(ฺเว็บวิทยาลัย BCNYALA)','2016-10-03 14:25:38','2016-10-03 14:43:38','ปรับปรุงหน้าแรก(หน้าเว็บของวิทยาลัยเอง)','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('57','2016-10-04 08:39:00','(ระบบสารสนเทศพัสดุไอที) การเพิ่มข้อมูลต่างๆในระบบ (ต่อ)','2016-10-04 08:41:00','2016-10-04 11:48:00','การเพิ่มข้อมูลต่างๆในระบบ(ข้อมูลทะเบียนคอมPC,ข้อมูลประเภทงาน,)','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('58','2016-10-04 13:05:00','(สำรวจ) เครื่อง Mac (ต่อ)','2016-10-04 13:10:00','2016-10-04 15:10:00','(สำรวจ) เครื่อง Mac (ลงในระบบสารสนเทศแจ้งซ่อม)','0','success','42','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('59','2016-10-06 08:11:00','(์NoteBook) ปรินไม่ได้','2016-10-06 08:15:00','2016-10-06 08:31:00','ลงไดร์เวอร์ปรินเตอร์','100','success','38','1','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('60','2016-10-06 08:36:00','ประชาสัมพันธ์','2016-10-06 08:40:00','2016-10-06 09:05:00','แก้ไขหน้าเว็บ ','100','success','2','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('61','2016-10-05 08:11:00','(ระบบสารสนเทศพัสดุไอที) เครื่อง Mac','2016-10-05 08:16:00','2016-10-05 11:18:00','สำรวจ เครื่อง Mac','0','success','15','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('62','2016-10-05 15:10:00','ทำบันทึกข้อความส่งคืนครุภัณฑ์ให้พัสดุ','2016-10-05 15:15:00','2016-10-05 16:15:00','ทำบันทึกข้อความส่งคืนครุภัณฑ์ให้พัสดุ','0','success','15','6','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('63','2016-10-06 14:01:00','(สรุปโครงการ) ระบบสารสนเทศพัสดุไอที(แจ้งซ่อม)','2016-10-06 14:05:00','2016-10-06 14:28:00','(สรุปโครงการ) ระบบสารสนเทศพัสดุไอที(แจ้งซ่อม)','0','success','47','6','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('64','2016-10-07 13:48:00','(TokenKey) ระบบจ่ายตรงเงินเดือน และ GF Mis','2016-10-07 13:48:00','2016-10-07 14:23:00','(TokenKey) ระบบจ่ายตรงเงินเดือน และ GF Mis
ลง ไดรเวอร์ ใหม่','0','success','39','1','17','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('65','2016-10-07 08:12:00','ตรวจสอบสถานที่ตั้งเครื่อง Mac ทั้ง 54 เครื่อง','2016-10-07 08:14:00','2016-10-07 11:42:00','ตรวจสอบสถานที่ตั้งเครื่อง Mac ทั้ง 54 เครื่อง
','0','success','4','6','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('66','2016-10-06 10:00:00','(หุ่น SIM)Export VDO ที่บันทึก ออกส่งให่ อาจารย์','2016-10-07 09:05:00','2016-10-07 11:15:00','ได้นำ VDO ออกจาก เครื่องบันทึก VDO แล้ว และ ได้ทำการตรวจสอบ VDO  ครับ','0','success','19','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('68','2016-10-11 09:30:11','(หุ้น Sim)ช่างมาตรวจเช็ค แล้วถาม เรื่อง นำ VDO ออกจากเครื่องบันทึก','2016-10-11 09:32:00','2016-10-11 14:15:00','','0','success','57','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('69','2016-10-10 09:50:00','(เสนอโครงการ) ระบบสารสนเทศพัสดุไอที','2016-10-10 10:00:00','2016-10-10 11:00:00','','0','success','4','5','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('70','2016-10-13 09:05:00','ซับไฟล์ เกิดอาการ พัง ','2016-10-13 09:38:00','2016-10-13 15:50:00','เปลี่ยน เพเวอร์ซับไฟล์ ใหม่ ','350','success','68','2','25','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('71','2016-10-14 11:19:23','ปรับหน้าเว็บ','2016-10-14 11:19:23','2016-10-14 11:40:23','','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('73','2016-10-19 10:24:06','(ขึ้นประชาสัมพันธ์) วันพยาบาล 21 ต.ค.59','2016-10-19 10:25:00','2016-10-19 10:58:00','ปรับปรุงหน้าเว็บ','0','success','13','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('74','2016-10-19 08:17:00','(ระบบแจ้งซ่อม) วิเคราะห์ ออกแบบ ระบบและกลไก การแจ้งซ่อม งานเทคโนโลยีสารสนเทศ','2016-10-19 08:20:00','2016-10-19 14:10:00','วิเคราะห์ ออกแบบ ระบบและกลไก ส่งหัวหน้างาน','0','success','15','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('75','2016-10-20 09:05:00','(ปรับปรุงเว็บหน้าแรก)','2016-10-20 09:06:00','2016-10-20 10:06:00','(ปรับปรุงเว็บหน้าแรก)','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('76','2016-10-20 10:06:00','(ปรับปรุงหน้าเว็บ) ฝ่ายวิชาการ งานพัฒนาหลักสูตรและการเรียนการสอน        ','2016-10-21 14:05:00','2016-10-21 14:45:00','เพิ่มข้อมูล 19 ไฟล์','0','success','26','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('77','2016-10-20 10:21:00','(ปรับปรุงหน้าเว็บ) ฝ่ายวิชาการ งานพัฒนาหลักสูตรและการเรียนการสอน','2016-10-21 13:20:00','2016-10-21 13:51:00','ประชาสัมพันธ์เพิ่ม 1 ไฟล์','0','success','18','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('79','2016-10-27 08:45:00','(ปรับปรุงหน้าเว็บ) เพิ่มเมนู Log out from Authen','2016-10-27 09:45:00','2016-10-27 10:21:00','ทำ link เพิ่ม','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('80','2016-10-27 14:48:00','(เว็บวิทยาลัย วพบ.ยะลา) แก้ไขประชาสัมพันธ์ 1 ไฟล์','2016-10-27 14:50:00','2016-10-27 15:05:00','แก้ไขไฟล์','0','success','35','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('81','2016-10-27 14:49:57','(เว็บวิทยาลัย วพบ.ยะลา) แก้ไขประชาสัมพันธ์ ฝ่ายบริการ งานหลักสูตร 1 ไฟล์','2016-10-27 15:10:00','2016-10-27 15:25:00','ลบไฟล์ออก','0','success','34','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('82','2016-10-28 08:20:00','(์NoteBook) ลง Office ใหม่','2016-10-28 09:54:00','2016-10-28 10:54:00','ลง Office 2013 ใหม่ เดิม 2010','0','success','17','1','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('83','2016-11-01 08:24:00','(โปรแกรม GIRO) นำเข้าข้อมูลไม่ได้','2016-11-01 08:40:00','2016-11-01 09:42:00','ลงโปรแกรมใหม่ ลองนำเข้าข้อมูลด้วยไฟล์ใหม่','0','success','39','1','17','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('84','2016-11-01 14:00:00','(์Internet) ในห้องสมุดใช้งานไม่ได้','2016-11-01 14:17:00','2016-11-01 14:45:00','Network switch Error (ปิดเปิดใหม่)','0','success','52','3','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('85','2016-11-02 10:18:00','(ปรับปรุง) หน้าเว็บวิทยาลัย','2016-11-02 10:28:00','2016-11-02 14:28:00','วิเคราะห์ ออกแบบ ทำใหม่ หน้าแรกเว็บวิทยาลัย','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('86','2016-11-02 14:17:06','(เข้าระบบ Open pi ไม่ได้)','2016-11-02 14:41:00','2016-11-02 15:20:06','โปรแกรม Error','0','success','40','1','16','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('87','2016-11-03 08:38:00','(ยืม โน้ตบุ๊ค)ห้องประชุมดอกบัว  2016-11-03 09:00','2016-11-03 08:45:00','2016-11-03 09:00:00','ดำเนินการแล้ว','0','success','50','9','50','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('88','2016-11-04 08:17:00','(Open pi)(อนุมัติไปราชการ บันทึกแล้วระบบให้ LogInใหม่)','2016-11-04 08:25:00','2016-11-04 09:31:00','ทดสอบ การบันทึก สรุป สาเหตูมาจาก ระบบ','0','success','54','1','16','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('89','2016-11-04 09:03:00','(เพิ่ม)ติดตั้งเครื่อง Scanner เพิ่ม','2016-11-04 10:37:00','2016-11-04 11:17:00','ดำเนินการเรียบร้อย','0','success','75','4','12','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('90','2016-11-04 13:39:00','(เว็บ BCNYALA) ประชาสัมพันธ์หน้าหลักเว็บวิทยาลัย ในส่วนของนักศึกษา','2016-11-04 13:48:00','2016-11-04 14:28:00','ประชาสัมพันธ์ 3 เรื่อง','0','success','68','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('92','2016-11-07 08:14:00','(พัฒนา)แก้ไขหน้าเว็บ หน้าหลัก รูปแบบใหม่','2016-11-08 08:29:00','2016-11-08 09:21:00','ทำเมนูเข้าระบบแจ้งซ่อมฯ ที่หน้าหลักของเว็บวิทยาลัยฯ','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('93','2016-11-07 10:00:00','(ปรับปรุง) สายแลนห้องผู้อำนวยการวิทยาลัยฯ','2016-11-07 13:45:00','2016-11-07 15:20:00','เดินสายแลน เพิ่มเติม เปลี่ยน Switch Network','0','success','15','3','3','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('94','2016-11-07 14:03:00','(โปรแกรมใช้งานเฉพาะ) งานการเงิน','2016-11-07 15:27:00','2016-11-07 16:05:00','ทดสอบการ LOG IN เข้าโปรแกรม การเงิน','0','success','15','1','17','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('95','2016-11-08 09:24:00','ขอความอนุเคราะห์งานโสตทัศนศึกษาถ่ายรูปนักศึกษาชั้นปีที่ 1 ปีการศึกษา 2559 จำนวน 70 คน 
ในวันพฤหัสบดี ที่ 10 พ.ย. 2559 เวลา 13.30 น.
(ขนาด 100*115 pixels เป็นไฟล์ .jpg)','','','ถ่ายภาพเสร็จแล้ว  ขนาดของภาพ 100*115','0','success','68','7','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('96','2016-11-03 11:00:00','(ขอใช้อุปกรณ์โสตในห้องประชุมชั้น 6) วันที่ 3-11-59','2016-11-03 11:00:00','2016-11-03 16:00:00','','0','success','35','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('97','2016-11-08 08:10:00','โปรเเกรม ไม่ซับฟอต กับ วินโด ','2016-11-08 11:00:00','2016-11-08 15:00:00','ทำการลง วินโด ใหม่ เเละ อัพเดทโปรเเกรม','300','success','39','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('99','2016-11-14 09:10:00','เครื่องสสเกนเนอร์ ไม่สามารถ ใช้งานได้ ','2016-11-14 09:20:00','2016-11-14 11:13:00','ลงโปรเเกรมใหม่ เเละอัพเดท','200','success','49','4','10','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('100','2016-11-04 08:30:00','เครื่องมีฝุ่นเยอะ ทำให้เครื่องคอมพิวเตอร์ ทำงาน ช้า ','2016-11-11 09:00:00','2016-11-11 15:30:00','ทำความสะอาดเครื่องคอมพิวเตอร์ ทั้งหมด 40 เครื่อง 
ในห้องปฎิบัติการคอมพิวเตอร์ ','200','success','15','2','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('101','2016-11-15 08:18:00','(ประชาสัมพันธ์) เว็บวิทยาลัยฯ 2 ไฟล์ ขึ้น หน้าหลัก ส่วนทั่วไป','2016-11-15 08:25:00','2016-11-15 08:55:00','ปรับปรุง ขึ้นประชาสัมพันธ์เพิ่ม','100','success','44','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('102','2016-11-15 09:22:00','(ประชาสัมพันธ์) เว็บวิทยาลัย หน้าหลัก  ขึ้นคำขวัญในการพัฒนาองค์กรคุณธรรม','2016-11-15 09:25:00','2016-11-15 09:48:00','ทำเป็นไฟล์รูป ขึ้นประชามฃสัมพันธ์ 1 รูป','150','success','2','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('103','2016-11-14 15:28:00','(ขอยืมเครื่องฉายทึบแสงและ Notebook) ใช้ในการประชุมทบทวนแผนกลยุทธ์และประชุมแผนปฏิบัติการ สถานที่ ห้องประชุมชิดกานต์ เจริญ 2016-11-18 13:00','2016-11-18 10:00:00','2016-11-22 16:00:00','รอดำเนินการ','0','success','47','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('104','2016-11-16 09:50:55','(ขอยืมเครื่องฉายทึบแสงและ Notebook) ใช้ในการประชุมทบทวนการจัดทำคู่มือฝึกงานภาคปฏิบัติ สถานที่ ห้องประชุมดอกบัว ในวันที่ 2 ธันวาคม 2559 เวลา 13.15 น.','2016-12-02 13:00:00','','รอดำเนินการ','0','wait','17','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('105','2016-11-16 09:01:00','(ปรับปรุง) หน้าเว็บวิทยาลัย','2016-11-16 09:06:00','','วิเคราะห์ ออกแบบ ทำใหม่ หน้าหลักเว็บวิทยาลัย','0','process','15','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('106','2016-11-17 09:00:00','ขอยืมเครื่องเสียงเคลื่อนที่+ไมค์ลอย+ไมค์สายยาว5เมตร กิจกรรมการสอนสุขภาพเด็กปฐมวัย ที่โรงเรียนนิคมพัฒนา','2016-11-17 15:00:00','2016-11-18 16:00:00','ส่งอุปกรณ์ให้ผู้ยืมแล้วและได้ทำการตรวจเช็คอุปกรณ์โสตฯ 2016-11-17 11.00 น.','0','success','27','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('107','2016-11-17 13:00:00','ขอใช้อุปกรณ์โสตฯ นำเสนอผลงานการวิจัย ของนักศึกษาปี3 ห้องประชุมจิดา2016-11-17 13:00:00-2016-11-17 16:00','','2016-11-17 16:00:00','ดำเนินการแล้ว','0','success','14','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('108','2016-11-17 11:10:00','ตัวสเเกนไวรัส เกิดปัญหา ไม่สามารถ สเเกรนไวรัส ได้
ทำให้ เครื่องช้า','2016-11-17 14:30:00','2016-11-17 15:30:00','ทำการลบตัวสเเกรนไวรัส เเล้วลงตัวสเเกรนไวรัส ใหม่ ','100','success','30','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('109','2016-11-18 10:00:00','ขอใช้อุปกรณ์โสตฯ ประชุมหัวหน้าภาค ที่ห้องประชุม จงจิต 2016-11-18 10:00- 2016-11-18 12:00:00','2016-11-18 10:00:00','2016-11-18 12:00:00','ขอใช้อุปกรณ์โสตฯเครื่องเสียงไมค์ประชุม','0','success','26','5','107','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('110','2016-11-18 10:00:00','ขอให้อุปกรณ์โสตฯ ทีวี ELD ที่ห้อง 98012016-11-18 10:00:00-2016-11-18 12:00','2016-11-18 12:00:00','2016-11-18 09:00:00','','0','success','37','5','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('112','2016-11-17 13:00:00','ขอใช้อุปกรณ์โสตฯ ทีวี LED conforence ที่ห้อง 8012016-11-17 13:00-2016-11-17 16:00','2016-11-17 16:00:00','2016-11-17 12:00:00','','0','success','2','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('113','2016-11-17 13:00:00','ขอใช้อุปกรณ์โสตฯ ทีวี LED conforence ที่ห้อง 8012016-11-17 13:00-2016-11-17 16:00','2016-11-17 16:00:00','2016-11-17 16:00:00','','0','success','2','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('114','2016-11-17 13:00:00','ขอใช้อุกรณ์โสตฯ ทีวี LED conforence ที่ห้อง 802 2016-11-17 13:00 -2016-11-17 18:00','2016-11-17 18:00:00','2016-11-17 13:00:00','','0','success','23','5','121','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('115','2016-11-14 18:00:00','สัมภาษณ์นักศึกษา ที่ห้องประชุมจงจิต 2016-11-14 18:00','','','','0','success','27','5','107','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('116','2016-11-14 16:00:00','กิจกรรมการสวดมนต์ร่วมกันในวันลอยกระทง 2016-11-14 16:00','','','','0','success','14','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('117','2016-11-14 16:00:00','กิจกรรมการสวดมนต์ร่วมกันในวันลอยกระทง 2016-11-14 16:00','','','','0','success','14','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('118','2016-11-14 16:00:00','ชอใช้อุปกรณ์โสตทัศนูปกรณ์ ทีวี LED  PBL  Adout 3 ที่ห้อง 9803 2016-11-14 16:00','','','','0','success','19','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('119','2016-11-11 13:00:00','ขอใช้อุปกรรณ์โสตฯ ประชุมคณะกรรมการบริหารหลักสูตร ที่ห้องประชุมจงจิต  2016-11-11 13:00','','','','0','success','26','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('120','2016-11-18 15:00:00','เครื่องไม่สามารถ ไลน์เเผผ่นได้ ','2016-11-18 15:05:00','2016-11-18 15:20:00','ทำการย้ายเครื่องไลน์เเผ่น ไปยัง เครื่องอืน','0','success','56','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('121','2016-11-18 13:25:00','(ระบบซ่อมบำรง ยืม  คืน ไอที่ออนไลย์) เพิ่มรายช่ือห้องประชุม ห้องเรียน ห้อง Conforence','2016-11-18 13:31:00','2016-11-18 15:25:00','(ระบบซ่อมบำรง ยืม  คืน ไอที่ออนไลย์) เพิ่มข้อมูลในฐานโปรแกรม','300','success','43','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('122','2016-11-21 10:30:00','คอมพิวเตอร์ ไม่สามารถสั่งปริ้นงาน ทั้งหมด 5 เครื่อง','2016-11-21 10:35:00','2016-11-21 11:00:00','ทำงานลง ไดเวอร์ ปริ้นเตอร์ ใหม่ เเละอัพเดทโปรเเกรม','100','success','51','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('123','2016-11-21 14:17:27','ขอส่งไฟล์ขึ้นเว็บวิทยาลัยในฝ่ายวิชาการ งานพัฒนาหลักสูตรและการเรียนการสอน เรื่องแบบฟอร์มทวนสอบ','2016-11-22 08:21:00','2016-11-22 09:02:00','ขึ้นประชาสัมพันธ์','0','success','34','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('124','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:00:00','2016-11-22 11:30:00','ทำการเเกะ เครื่องคอมพิวเตอร์ มา ทำความสะอาด 
เช่น เเรม การ์ดจอ เเละ เช็ค บอด   
ส่วน อินเตอร์เน็ต ทำการไล่สาย ใหม่ มามีปัญหา ตรงจุดไหน ','300','success','15','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('125','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:00:00','2016-11-22 09:30:00','ทำรับเปลี่ยนสายใหม่ เเละ เข้าหัวเเลน ใหม่','100','success','15','4','130','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('126','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:30:00','2016-11-22 09:50:00','ทำการปรับเปลี่ยนสายใหม่ เเละ เข้าหัวเเลน ใหม้','10','success','15','4','131','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('127','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:30:00','2016-11-22 09:50:00','ทำการปรับเปลี่ยนสายใหม่ เเละ เข้าหัวเเลนใหม่','100','success','15','4','132','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('128','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:30:00','2016-11-22 10:00:00','ทำการปรับเปลี่ยนสายเเลนใหม่ เเละ เข้าหัวเเลนใหม่','100','success','15','4','133','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('129','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:30:00','2016-11-22 10:10:00','ทำการปรับเปลี่ยนสายเเลนใหม่ เเละ เข้าหัวเเลนใหม่','100','success','15','4','134','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('130','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:30:00','2016-11-22 10:20:00','ทำการปรับเปลี่ยนสายเเลนใหม่ เเละ เข้าหัวเเลนใหม่ ','100','success','15','4','71','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('131','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:30:00','2016-11-22 10:30:00','','100','success','15','4','136','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('132','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:30:00','2016-11-22 10:40:00','ทำการปรับเปลี่ยนสายเเลนใหม่ เเละเข้าหัวเเลนใหม่','100','success','15','4','137','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('133','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:30:00','2016-11-22 10:50:00','ทำการปรับเปลี่ยนสายเเลนใหม่ เเละ เข้าหัวเเลนใหม่ ','100','success','15','4','138','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('134','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:30:00','2016-11-22 11:00:00','ทำการปรับเปลี่ยนสายเเลนใหม่ เเละ เข้าหัวเเลนใหม่','100','success','15','4','138','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('135','2016-11-22 13:31:00','ขอใช้ Projector ห้องประชุมดอกบัว
2016-11-23 13:30  Notebook  เอามาเอง','2016-11-23 13:34:00','2016-11-23 16:00:00','','0','success','33','5','38','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('136','2016-11-23 10:05:00','ตรวจเช็ค ตัวกระจายสัญาณ WI-FI  ทั้งหมด 25 ตัว 
ว่า มีปัญหา หรือไม่ ','2016-11-23 10:10:00','2016-11-23 11:10:00','ตรวจเช็ค ตัวกระจายสัญาณ WI-FI  ทั้งหมด 25 ตัว 
ว่า มีปัญหา หรือไม่  ถ้าไม่เกิดปัญหา จะมีสัญาณ ไฟ กระพริบ 2สี เช่น สีเขียว เเละ สีน้ำเงิน เเสดงว่าปกติ               เเต่ ถ้า ขึ้น ไฟสีเเดงขึ้นมาเเสดง ว่าเกิดปัญหา กับ ตัว นั้น','0','success','15','2','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('137','2016-11-25 11:00:00','ขอใช้อุปกรร์โสตฯ เครื่องเสียง ไมค์ลอย โปรเจคเตอร์
โครงการเด็กรุ่นใหม่ต้องก้าวไกล ห่างไกลยาเสพติด
2016-11-26 08:00 -16.00 น.','2016-11-25 15:00:00','2016-11-26 16:00:00','ดำเนินการแล้วติดตั้งเสร็จ วันที่ 25 พย. 2559  13.00น.','0','success','33','5','109','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('138','2016-11-25 09:00:00','ขอยืมเครื่องเสียงเคลื่อนที่ โดยมีนักศึกษาปี1นายมูฮัมหมัด มะดีเย๊าะ เป็นผู้ดูแล 2016-11-26 13:00-16.00 น.','2016-11-25 12:00:00','2016-11-26 16:00:00','ดำเนินการแล้วและติดตั้งเสร็จ 25 พย.2559  14.00 น.','0','success','33','9','109','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('139','2016-11-28 08:10:00','อินเตอร์ เกิดการล่าช้า ในบางที','2016-11-28 08:10:00','2016-11-28 08:20:00','ทำงานตรวจเช็ค สัญญาณ ตัใหม่ เพือให้สัญญาณเเรง ขึ้น ','','success','1','3','3','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('140','2016-11-28 13:00:00','ขอให้อุปกรณ์โสตฯ เครื่องเสียง โดยมีนายมูฮัมหมัด  มะดีเยาะ เป็นผู้ดูแล 2016-11-28 13:00-16.00 น. วิชาพละศึกษา อาจารย์จากวิทยาลัยพละศึกษา','2016-11-28 13:00:00','2016-11-28 13:00:00','ได้ดำเนินการติดตั้งแล้ว','0','success','24','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('141','2016-10-12 13:00:00','ขอใช้อุปกรณ์โสตฯ เครื่องฉายทึบแสง ทีห้องประชุมอุบลรัตน์ 2016-10-12 13:00 -16.00 น. ','','2016-10-12 13:00:00','ดำเนินการติดตั้งตรวจเช็คอุปกรณ์โสต เรียบร้อย 12.50 น.','0','success','9','5','111','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('142','2016-10-18 08:00:00','อุปกรณ์พร้อมการใช้งาน','','2016-10-18 00:00:00','สามารถใช้งานใช้ปกติ','0','success','10','5','124','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('143','2016-11-17 08:00:00','ขอให้อุปกรณ์โสตฯ เครื่องฉายทึบแสง คอมพิวเตอร์2016-11-17- 18  08:00-16.00 น. ประชุมเชิงปฏิบัติการพัฒนาศักยภาพด้านวิจัย','2016-11-17 08:00:00','2016-11-16 15:00:00','ดำเนินการติดตั้งอุปกรรณ์โสตฯเรียบร้อย 
2016-11-16 15:00','0','success','22','5','108','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('144','2016-10-17 08:00:00','ขอใช้อุปกรณ์โสตฯ 2016-11-17-19 08:00-16.00 น.  จัดทำ มคอ.','2016-11-16 08:00:00','2016-11-16 15:00:00','ติดตั้งตรวจสอบอุปกรณ์เรียบร้อย 2016-11-16 15:00 ','0','success','26','5','106','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('145','2016-10-19 08:00:00','นำเสนอโปรแกรมห้อง Lab 2016-10-19 08:00-15.30 น.','','2016-11-19 12:40:00','ดำเนินการเสร็จเรียบร้อย  2016-11-19 12:40','0','success','44','9','111','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('146','2016-10-20 10:00:00','เตรียมความพร้อม นักศึกษา 2016-10-20 10:00-16.00 น.','2016-10-20 11:00:00','0000-00-00 00:00:00','ดำเนินการเสร็จ 2016-11-20 11:200','0','success','33','5','116','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('147','2016-10-14 08:00:00','ขอใช้อุปกรณ์โสตฯ 2016-10-14-20  08:00-16.00 น.','2016-10-14 08:00:00','2016-10-14 08:00:00','ตรวจสอบแล้วปกติ ใช้งานได้','0','success','8','5','121','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('148','2016-10-22 08:00:00','2016-10-22 09:00-11.00 น.','2016-10-20 08:00:00','','อุปกรณ์พร้อม','0','success','6','5','114','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('149','2016-10-20 13:00:00','ขอใช้อุปกรณ์โสตฯ 2016-10-20 13:00-16.00 PBL','2016-10-20 13:00:00','2016-10-20 12:00:00','อุปกรณ์โสตพร้อม','0','success','6','5','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('150','2016-11-20 08:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforence ห้อง 9803  9804 9806 9807 -9808 -9809 -9810  PBL','2016-10-20 11:00:00','2016-10-20 11:00:00','อุกรณ์โสตพร้อม','0','success','6','5','124','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('151','2016-10-03 13:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforence จำนวน  6 ห้อง 9802 9805 9806 9807 9808
2016-10-03 13:00 - 165.00 น.และ 08.00น .-10.00 น','2016-10-03 12:00:00','2016-10-03 00:00:00','อุปกณณ์โสตฯพร้อมใช้งาน ดำเนินการแล้ว','0','success','32','5','127','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('152','2016-10-02 08:00:00','ขอใช้อุปกรณ์โสตฯ นอกเวลา PBL
2016-10-02 19:00-20.30 น.','2016-10-02 08:00:00','2016-10-02 08:00:00','อุปกรณ์โสตฯพร้อม','0','success','5','5','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('153','2016-10-12 08:00:00','ขอใช้อุปกรณ์โสตฯ นอกเวลา 2016-10-12 16.30-18.00 น. PBL','2016-10-12 08:00:00','2016-10-12 14:00:00','อุปกรณ์โสตฯพร้อม','0','success','5','9','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('154','2016-10-25 08:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforrence 9704
Lab วิจัย 2016-10-25 08:00-16.00 น.','2016-10-25 08:00:00','2016-10-25 08:00:00','อุปกรณ์โสตฯพร้อม','0','success','10','5','119','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('155','2016-10-26 11:00:00','ขอใช้อุปกรณ์โสตฯ งานวิจัย พยาบาล  ห้อง conforence ห้อง 9804  2016-10-26 13:00-17.00 น.','2016-11-26 12:00:00','2016-11-26 00:00:00','อุปกรณ์โสตฯพร้อม','0','success','13','5','127','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('156','2016-10-04 08:00:00','ขอใช้อุปกรณ์โสตฯ  016-10-04 08:00-17.30 น.','2016-10-04 09:00:00','','อุปกณณ์โสตฯพร้อม','0','success','6','5','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('157','2016-10-05 00:00:00','ขอใช้อุปกรณ์โสตฯ  2016-10-05 08:00 -17.30 น. ','2016-10-05 00:00:00','2016-11-05 08:00:00','อุปกรณ์โสตฯ พร้อม','0','success','6','5','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('158','2016-10-05 08:00:00','ขอใช้อุปกรร์โสตฯ ห้อง conforence ห้อง 9802 2016-10-05 13:00-16.00 น.','2016-10-05 13:00:00','2016-10-05 12:00:00','อุปกรณ์โสตฯพร้อม','0','success','10','5','121','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('159','2016-10-07 08:00:00','ขอใช้อุปกรณ์โสตฯ เครื่องคอมพิวเตอร์ 2016-10-07 13:00-16.00 น.','2016-10-07 11:00:00','2016-10-07 12:00:00','ดำเนินการเสร็จเรียร้อย 2016-10-07 11:00','0','success','30','5','106','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('160','2016-10-05 12:00:00','ขอใช้อุปกรร์โสตฯ นอกเวลา  2016-10-05 16.30 น.-18.00 น.','2016-10-05 13:00:00','2016-10-05 13:00:00','อุปกรณ์โสตฯพร้อม','0','success','22','5','125','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('161','2016-10-13 08:00:00','ขอใช้เครื่องเสียง ประชุมสโมสานักศึกษา
2016-10-13 12:00-16.00 น.','2016-10-13 08:00:00','2016-11-29 11:00:00','อุปกรณ์พร้อม','0','success','5','5','107','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('162','2016-10-27 08:00:00','ขอใช้อุปกรร์เครื่องเสียง นอกเวลา 2016-10-27 19:00- 21.00 น. ประชุมนักศึกษาสัมภาษณ์','2016-11-27 12:00:00','2016-10-27 00:00:00','อุปกรณ์พร้อม','0','success','27','5','107','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('163','2016-10-11 08:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforence ห้อง 98012016-10-11 08:00-12.00 น.','2016-10-11 11:00:00','2016-10-11 11:00:00','อุปกรณ์โสตฯพร้อม','0','success','6','5','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('164','2016-10-11 08:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforence ห้อง 9802','2016-10-11 08:00:00','2016-10-11 08:00:00','อุปกรณ์โสตฯพร้อม','0','success','19','5','121','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('165','2016-10-10 08:00:00','ขอใช้อุปกรณ์ โสตฯ Notebook  ประชุมคณะกรรมการบริหาร 2016-10-10 13:00-16.00 น.','2016-10-10 10:00:00','2016-10-10 11:00:00','ติดตั้งอุปกรร์โสตพร้อม   2016-10-10 11:00','0','success','16','5','106','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('166','2016-10-27 08:00:00','ขอใช้อุปกรร์โสตฯ แหล่งฝึก 2016-10-03 13:30-16.00 น.','2016-10-27 00:00:00','2016-10-27 12:00:00','อุปกรร์โสตฯพร้อม','0','success','30','5','111','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('167','2016-10-10 08:00:00','ขอใช้อุปกรณ์โสตฯ Note book  2016-10-10 08:00-12.00 น. คณะกรรมการบริหารหลักสูตร','0000-00-00 00:00:00','2016-10-10 08:00:00','ติดตั้งอุปกรณ์โสตฯ เรียบร้อย','0','success','26','5','106','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('168','2016-10-13 08:00:00','ขอใช้อุปกรณ์โสตฯ Note book  2016-10-13 08:00-12.00 น.','2016-10-13 08:00:00','2016-10-13 08:00:00','ติดตั้งอุปกรณ์โสตฯพร้อม','0','success','26','5','106','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('169','2016-10-10 08:00:00','ขอใช้อุอุปกรณ์โสตฯ Note book 
2016-10-10 10:00-12.00 น. นำเสนอโครงการพัฒนาระบบสารสนเทศ','2016-10-10 09:00:00','2016-10-10 09:00:00','ติดตั้งอุปกรณ์โสตฯ พร้อม ','0','success','42','9','106','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('170','2016-10-10 08:00:00','ขอใช้อุอุปกรณ์โสตฯ Note book 
2016-10-10 10:00-12.00 น. นำเสนอโครงการพัฒนาระบบสารสนเทศ','2016-10-10 09:00:00','2016-10-10 09:00:00','ติดตั้งอุปกรณ์โสตฯ พร้อม ','0','success','42','9','106','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('171','2016-10-05 08:00:00','ขอใช้อุปกรณ์โสตฯ 2016-10-05 13:00-16.00 น.','2016-10-05 00:00:00','2016-10-05 10:00:00','อุปกรณ์โสตฯพร้อม','0','success','13','9','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('172','2016-10-07 08:00:00','ขอใช้อุปกณร์โสตฯ  เตรียมรับอินโดนีเซียมาดูงาน 2016-10-07 09:00-11.00 น.','2016-10-07 08:00:00','2016-10-07 08:00:00','อุปกรณ์โสตฯพร้อม','0','success','12','5','111','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('173','2016-11-29 08:00:00','คอมพิวเตอร์ เกิดอาการค้าง เเละไม่สามารถ','2016-11-29 08:05:00','2016-11-29 08:15:00','ทำความสะอาดเครื่องคอมพิวเตอร์ เเละเป๋าฝุ่น ใหม่ 
เเละตรวจบอร์ด อาร์ดิส เเละเเรม ว่า ชำรุด หรือเปล่า','200','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('174','2016-11-29 13:10:00','เครื่อง ไม่สามารถ ใช้งานได้ เนื่อง พอต USB มี ปัญหา ','2016-11-29 13:15:00','2016-11-29 13:30:00','ทำการลง ไดเวอร์ ปริ้นเตอร์ เเละ ย้ายเสียบพอต USB ใหม่ ','100','success','8','4','172','2');



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
('4','ซ่อมบำรุงอุปกรณ์ต่อพ่วง Hardware,Software');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('5','ประชุม/อบรม/สัมนา');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('6','จัดทำเอกสาร');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('7','งานอื่น ๆ ที่ได้รับมอบหมาย');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('8','ปรับปรุง/พัฒนา');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('9','ยืม รายการอุปกรณ์');
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('10','คืน รายการอุปกรณ์');



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
('3','นายฮอลมีซี หะยีแวจิ','ITz','นักวิชาการคอมพิวเตอร์','','$2y$12$wMaXAdjuTreGOPmbIXsbrOK1YOQ0VYSLP46rJNl6.BQSGby3std6a','1471416784','1471487306','0');
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`email`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('4','user','user','user','','$2y$12$mwJo1n/II6PNtkG8qK9R5e7vLx4oiILPitUyOpFymqR2wtougvbKS','1475041800','1475041800','0');
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`email`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('5','นายชัยณรงค์ อาจอาสา','mit','หัวหน้างานเทคโนโลยีสารสนเทศ','','$2y$12$kut2iDmEV7rKyaAnoqpGIeG1RmrEfRx9TJOyRDo9RjvheOYWPNZOu','1475727424','1475727514','0');
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`email`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('6','นายสำราญ เหลี่ยมสุวรรณ','AVE','นักวิชาการโสตทัศนศึกษา','','$2y$12$pqwCitF4MD3ZwN1yoZxISer00L44t57UIhBUT6eT8Y0k9BWtjecAS','1477627290','1477627290','0');



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
