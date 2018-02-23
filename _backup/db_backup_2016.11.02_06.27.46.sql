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
('42','ST1-420-01','','','','ST142001 ระบบเว็บไซต์วิทยาลัย BCNYALA','','','','','','','','','','','','','enable','7','18');



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
('7','ระบบสารสนเทศต่างๆ');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('8','โปรแกรมงานต่างๆ');
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
('6','2016-07-01 09:00:00','พัฒนาระบบบริหารงานสารสนเทศพัสดุ งาน IT คอมพิวเตอร์','2016-07-01 09:00:00','','วิเคราะห์ ออกแบบ เขียนโปรแกรม ','0','process','42','8','','3');
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
('85','2016-11-02 10:18:00','(ปรับปรุง) หน้าเว็บวิทยาลัย','2016-11-02 10:28:00','','วิเคราะห์ ออกแบบ ทำใหม่ หน้าแรกเว็บวิทยาลัย','0','process','15','8','42','3');



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
