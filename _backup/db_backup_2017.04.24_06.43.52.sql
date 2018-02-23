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
('45','NB1-420-03 ( เลิกใช้งาน)','','','','NB142003(NEC  No 3)','','','','','','','2014-01-03','2016-10-07','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('46','NB1-420-04 (เลิกใช้งาน)','','','','NB142004(NEC  No 4)','','','','','','','2014-01-04','2016-10-07','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('47','NB1-420-05 (เลิกใช้งาน)','','','','NB142005(Compaq  No 5)','','','','','','','2014-01-05','2016-10-07','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('48','NB1-420-06','','','','NB142006(Compaq  No 6)','','','','','','','2014-01-06','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('49','NB1-420-07 (เลิกใช้งาน)','','','','NB142007(Compaq  No 7)','','','','','','','2014-01-07','2016-10-07','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('50','NB1-420-08','','','','NB142008(Compaq  No 8)','','','','','','','2014-01-08','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('51','NB1-420-09 (เลิกใช้งาน)','','','','NB142009(Compaq  No 9)','','','','','','','2014-01-09','2016-10-07','','','','','disable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('52','NB1-420-10 (เสีย)','','','','NB142010(Dell  No 10) (เสีย)','','','','','เสีย','','2014-01-10','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('53','NB1-420-11','','','','NB142011(Dell  No 11)','','','','','','','2014-01-11','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('54','NB1-420-12','','','','NB142012(Dell  No 12)','','','','','','','2014-01-12','','','','','','enable','3','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('55','NB1-420-13 (เลิกใช้งาน)','','','','NB142013(Dell  No 13)','','','','','','','2014-01-13','2016-01-01','','','','','disable','3','18');
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
('172','NB TC','NB TC','','','NB TC ผู้รับบริการบุคลากรสายอาจารย์','','','','','Notebook Techer','','','','','','','','enable','3','28');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('173','ST2-420-01','','','','ST242001 ระบบทะเบียน','','','','','','','','','','','','','enable','7','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('174','AP1-420-01','FCW2028N59L','Cisco','AP2702i','AP142001 หน้าห้องธุรการ','','','','','หน้าห้องธุรการ','192.168.99.21','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('175','AP1-420-02','FCW2028N5JG','Cisco','AP2702i','AP142002 โรงอาหารอาจารย์','','','','','โรงอาหารอาจารย์','192.168.99.22','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('176','AP1-420-03','FCW2028N5HB','Cisco','AP2702i','AP142003 ห้องคอมพิวเตอร์','','','','','ห้องคอมพิวเตอร์','192.168.99.23','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('177','AP1-420-04','FCW2028N4CA','Cisco','AP2702i','AP142004 หน้าห้องอาจารย์','','','','','หน้าห้องอาจารย์','192.168.99.24','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('178','AP1-420-05','FCW2028N4D6','Cisco','AP2702i','AP142005 ห้องประชุม1','','','','','ห้องประชุม1','192.168.99.25','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('179','AP1-420-06','FGL2028XDS8','Cisco','AP1702i','AP142006 ห้องประชุม2','','','','','ห้องประชุม2','192.168.99.26','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('180','AP1-420-07','FGL2028XDS9','Cisco','AP1702i','AP142007 ห้องอาจารย์','','','','','ห้องอาจารย์','192.168.99.27','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('181','AP1-420-08','FGL2028XDSB','Cisco','AP1702i','AP142008 ห้องสมุด','','','','','ห้องสมุด','192.168.99.28','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('182','AP1-420-09','FGL2028XDSC','Cisco','AP1702i','AP142009 ห้องสมุด','','','','','ห้องสมุด','192.168.99.29','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('183','AP1-420-10','FGL2028XDDB','Cisco','AP1702i','AP142010 ทางเดินนอกห้อง','','','','','ทางเดินนอกห้อง','192.168.99.30','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('184','AP1-420-11','FCW2028N4DU','Cisco','AP2702i','AP142011 ห้องประชุม','','','','','ห้องประชุม','192.168.99.31','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('185','AP1-420-12','FGL1924X7A2','Cisco','AP1702i','AP142012 ห้องอาจารย์','','','','','ห้องอาจารย์','192.168.99.32','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('186','AP1-420-13','FCW2028N4M2','Cisco','AP2702i','AP142013 โรงอาหารใหญ่','','','','','โรงอาหารใหญ่','192.168.99.33','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('187','AP1-420-14','FGL2028XDSN','Cisco','AP1702i','AP142014 ทางเดินข้างนอก','','','','','ทางเดินข้างนอก','192.168.99.34','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('188','AP1-420-15','FCW2028N4KM','Cisco','AP2702i','AP142015 ห้องเรียน','','','','','ห้องเรียน','192.168.99.35','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('189','AP1-420-16','FCW2028N3Y7','Cisco','AP2702i','AP142016 ห้องเรียน1','','','','','ห้องเรียน1','192.168.99.36','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('190','AP1-420-17','FCW2028N5G4','Cisco','AP2702i','AP142017 ห้องเรียน2','','','','','ห้องเรียน2','192.168.99.37','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('191','AP1-420-18','FCW2028N58P','Cisco','AP2702i','AP142018 ห้องเรียน','','','','','ห้องเรียน','192.168.99.38','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('192','AP1-420-19','FCW2028N5JK','Cisco','AP2702i','AP142019 ห้องเรียน','','','','','ห้องเรียน','192.168.99.39','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('193','AP1-420-20','FGL2028XDSR','Cisco','AP1702i','AP142020 ทางเดินห้องประชุม','','','','','ทางเดินห้องประชุม','192.168.99.40','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('194','AP1-420-21','FCW2028N5JF','Cisco','AP2702i','AP142021 ทางเดินห้องประชุม','','','','','ทางเดินห้องประชุม','192.168.99.41','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('195','AP1-420-22','FCW2028N5JL','Cisco','AP2702i','AP142022 ห้องประชุม','','','','','ห้องประชุม','192.168.99.42','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('196','AP1-420-23','FGL2028XDSH','Cisco','AP1702i','AP142023 ทางเดิน','','','','','ทางเดิน','192.168.99.43','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('197','AP1-420-24','FGL2028XDSG','Cisco','AP1702i','AP142024 ทางเดิน','','','','','ทางเดิน','192.168.99.44','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('198','AP1-420-25','FCW2028N4CH','Cisco','AP2702i','AP142025 ดาดฟ้า','','','','','ดาดฟ้า','192.168.99.45','2016-01-01','','','','','','enable','10','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('199','ST1-420-02','','','','ST142002 ระบบแจ้งซ่อม/งานบริการฝ่ายไอที','','','','','','','','','','','','','enable','7','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('200','ST2-420-02','','','','ST242001 ระบบ Admission','','','','','','','','','','','','','enable','7','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('201','ST2-420-03','','','','ST242001 ระบบ Authen','','','','','','','','','','','','','enable','7','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('202','PT2-001-01','นางสาวนิมัศตูรา แว','','','(PT200101)นางสาวนิมัศตูรา แว','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','1');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('203','PT1-100-02','นางสาวดวงใจ เปลี่ยนบำรุง','','','(PT110002)นางสาวดวงใจ เปลี่ยนบำรุง','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','3');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('204','PT1-130-03','นางพวงผกา ดำรงเสรี','','','(PT113003)นางพวงผกา ดำรงเสรี','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('205','PT1-130-04','นางกฤษณา เฉลียวศักดิ์','','','(PT113004)นางกฤษณา เฉลียวศักดิ์','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('206','PT1-130-05','นางสาวจิตตินันท์ พงสุวรรณ','','','(PT113005)นางสาวจิตตินันท์ พงสุวรรณ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('207','PT1-130-06','นางเขมพัทธ์ ขจรกิตติยา','','','(PT113006)นางเขมพัทธ์ ขจรกิตติยา','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('208','PT1-130-07','นางวิไล อุดมพิทยาสรรพ์','','','(PT113007)นางวิไล อุดมพิทยาสรรพ์','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('209','PT1-130-08','นางพิชญ์ชญานิษฐ์ เรืองเริงกุลฤทธิ์','','','(PT113008)นางพิชญ์ชญานิษฐ์ เรืองเริงกุลฤทธิ์','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('210','PT1-130-09','นางสาวนุศรา ดาวโรจน์','','','(PT113009)นางสาวนุศรา ดาวโรจน์','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('211','PT1-130-10','นางมยุรี ยีปาโล๊ะ','','','(PT113010)นางมยุรี ยีปาโล๊ะ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('212','PT1-130-11','นางสาวสาธิมาน มากชูชิต','','','(PT113011)นางสาวสาธิมาน มากชูชิต','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('213','PT1-130-12','นางสาวนูรซาฮีดา เจ๊ะมามะ','','','(PT113012)นางสาวนูรซาฮีดา เจ๊ะมามะ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('214','PT1-130-13','นายคอลิด ครุนันท์','','','(PT113013)นายคอลิด ครุนันท์','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','6');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('215','PT1-140-14','นางเปรมฤดี ดำรักษ์','','','(PT114014)นางเปรมฤดี ดำรักษ์','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('216','PT1-140-15','นางสาวผุสนีย์ แก้วมณีย์','','','(PT114015)นางสาวผุสนีย์ แก้วมณีย์','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('217','PT1-140-16','นางโศรยา นิฮะ','','','(PT114016)นางโศรยา นิฮะ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('218','PT1-140-17','นางสุชาดา เจะดอเลาะ','','','(PT114017)นางสุชาดา เจะดอเลาะ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('219','PT1-140-18','นายอนุชิต คลังมั่น','','','(PT114018)นายอนุชิต คลังมั่น','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('220','PT1-140-19','นางสาวพัชรินทร์ คมขำ','','','(PT114019)นางสาวพัชรินทร์ คมขำ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('221','PT1-140-20','นางสาวภาซีน่า บุญลาภ','','','(PT114020)นางสาวภาซีน่า บุญลาภ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('222','PT1-140-21','นางสาวชนิกานต์ สมจารี','','','(PT114021)นางสาวชนิกานต์ สมจารี','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('223','PT1-140-22','นางสาวศุภวรรณ สีแสงแก้ว','','','(PT114022)นางสาวศุภวรรณ สีแสงแก้ว','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('224','PT1-140-23','นางสาววานีตา สาเมาะ','','','(PT114023)นางสาววานีตา สาเมาะ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('225','PT1-150-24','นางเปี่ยมสุข สมบัติสุข','','','(PT115024)นางเปี่ยมสุข สมบัติสุข','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','8');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('226','PT1-150-25','นางสาวบูรณ์คณัส จันทรศิริพุทธ','','','(PT115025)นางสาวบูรณ์คณัส จันทรศิริพุทธ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','8');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('227','PT1-150-26','นางสาวสิรินภร ศุกรวรรณ','','','(PT115026)นางสาวสิรินภร ศุกรวรรณ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','8');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('228','PT1-150-27','นางสาวพิมพ์ณัฐชา สุไลมาน','','','(PT115027)นางสาวพิมพ์ณัฐชา สุไลมาน','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','8');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('229','PT1-150-28','นางสาวกมลวรรณ โพธิ์วิทยาการ','','','(PT115028)นางสาวกมลวรรณ โพธิ์วิทยาการ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','7');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('230','PT1-150-29','นางสาวยุซรอ เล๊าะแม','','','(PT115029)นางสาวยุซรอ เล๊าะแม','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','8');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('231','PT1-150-30','นางนวรัตน์ ไวชมภู','','','(PT115030)นางนวรัตน์ ไวชมภู','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','8');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('232','PT1-200-31','นางปรียนุช ชัยกองเกียรติ','','','(PT120031)นางปรียนุช ชัยกองเกียรติ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','9');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('233','PT1-300-32','นางสาวอัจฉรา มุสิกวัณณ์','','','(PT130032)นางสาวอัจฉรา มุสิกวัณณ์','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','12');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('234','PT1-320-33','นางสาวมาริสา หะสาเมาะ','','','(PT132033)นางสาวมาริสา หะสาเมาะ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','14');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('235','PT1-320-34','นางวราภรณ์ ศิวดำรงพงศ์','','','(PT132034)นางวราภรณ์ ศิวดำรงพงศ์','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','14');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('236','PT1-400-35','นางสาวจงกรม ทองจันทร์','','','(PT140035)นางสาวจงกรม ทองจันทร์','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','16');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('237','PT2-410-36','เครื่องกลาง ประจำห้องงานแผนฯ','','','(PT241036)เครื่องกลาง ประจำห้องงานแผนฯ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','17');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('238','PT2-420-37','เครื่องกลาง ประจำห้องงานเทคโนฯ','','','(PT242037)เครื่องกลาง ประจำห้องงานเทคโนฯ','','','','','','','2016-01-01','2018-01-01','','','','','enable','2','18');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('239','PT2-120-38','เครื่องกลาง ประจำห้องงานทะเบียน','','','(PT212038)เครื่องกลาง ประจำห้องงานทะเบียน','','','','','','','','','','','','','enable','2','5');
INSERT INTO `device` (`id`,`device_id`,`serial_no`,`device_brand`,`device_model`,`device_name`,`memory`,`cpu`,`harddisk`,`monitor`,`other_detail`,`device_ip`,`date_use`,`date_expire`,`device_price`,`device_docs`,`vender`,`warranty`,`device_status`,`device_type_id`,`department_id`) VALUES
('240','PT2-000-39','เครื่องกลาง ประจำห้องงานธุรการ','','','(PT200039)เครื่องกลาง ประจำห้องงานธุรการ','','','','','','','','','','','','','enable','2','2');



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
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('10','Access Point');



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
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('79','นักศึกษาชั้นปีที่ 1','นักศึกษา','30');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('80','นักศึกษาชั้นปีที่ 2','นักศึกษา','30');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('81','นักศึกษาชั้นปีที่ 3','นักศึกษา','30');
INSERT INTO `employee` (`id`,`user_fullname`,`user_position`,`department_id`) VALUES
('82','นักศึกษาชั้นปีที่ 4','นักศึกษา','30');



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
ในห้องปฎิบัติการคอมพิวเตอร์ ','200','success','15','2','67','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('101','2016-11-15 08:18:00','(ประชาสัมพันธ์) เว็บวิทยาลัยฯ 2 ไฟล์ ขึ้น หน้าหลัก ส่วนทั่วไป','2016-11-15 08:25:00','2016-11-15 08:55:00','ปรับปรุง ขึ้นประชาสัมพันธ์เพิ่ม','100','success','44','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('102','2016-11-15 09:22:00','(ประชาสัมพันธ์) เว็บวิทยาลัย หน้าหลัก  ขึ้นคำขวัญในการพัฒนาองค์กรคุณธรรม','2016-11-15 09:25:00','2016-11-15 09:48:00','ทำเป็นไฟล์รูป ขึ้นประชามฃสัมพันธ์ 1 รูป','150','success','2','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('103','2016-11-14 15:28:00','(ขอยืมเครื่องฉายทึบแสงและ Notebook) ใช้ในการประชุมทบทวนแผนกลยุทธ์และประชุมแผนปฏิบัติการ สถานที่ ห้องประชุมชิดกานต์ เจริญ 2016-11-18 13:00','2016-11-18 10:00:00','2016-11-22 16:00:00','รอดำเนินการ','0','success','47','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('104','2016-11-16 09:50:55','(ขอยืมเครื่องฉายทึบแสงและ Notebook) ใช้ในการประชุมทบทวนการจัดทำคู่มือฝึกงานภาคปฏิบัติ สถานที่ ห้องประชุมดอกบัว ในวันที่ 2 ธันวาคม 2559 เวลา 13.15 น.','2016-12-02 13:00:00','2016-12-02 00:00:00','ดำเนินการแล้ว','0','success','17','5','106','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('105','2016-11-16 09:01:00','(ปรับปรุง) หน้าเว็บวิทยาลัย','2016-11-16 09:06:00','','วิเคราะห์ ออกแบบ ทำใหม่ หน้าหลักเว็บวิทยาลัย','0','success','15','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('106','2016-11-17 09:00:00','ขอยืมเครื่องเสียงเคลื่อนที่+ไมค์ลอย+ไมค์สายยาว5เมตร กิจกรรมการสอนสุขภาพเด็กปฐมวัย ที่โรงเรียนนิคมพัฒนา','2016-11-17 15:00:00','2016-11-18 16:00:00','ส่งอุปกรณ์ให้ผู้ยืมแล้วและได้ทำการตรวจเช็คอุปกรณ์โสตฯ 2016-11-17 11.00 น.','0','success','27','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('107','2016-11-17 13:00:00','ขอใช้อุปกรณ์โสตฯ นำเสนอผลงานการวิจัย ของนักศึกษาปี3 ห้องประชุมจิดา2016-11-17 13:00:00-2016-11-17 16:00','','2016-11-17 16:00:00','ดำเนินการแล้ว','0','success','14','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('108','2016-11-17 11:10:00','ตัวสเเกนไวรัส เกิดปัญหา ไม่สามารถ สเเกรนไวรัส ได้
ทำให้ เครื่องช้า','2016-11-17 14:30:00','2016-11-17 15:30:00','ทำการลบตัวสเเกรนไวรัส เเล้วลงตัวสเเกรนไวรัส ใหม่ ','100','success','30','4','172','2');
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
('120','2016-11-18 15:00:00','เครื่องไม่สามารถ ไลน์เเผผ่นได้ ','2016-11-18 15:05:00','2016-11-18 15:20:00','ทำการย้ายเครื่องไลน์เเผ่น ไปยัง เครื่องอืน','0','success','56','4','22','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('121','2016-11-18 13:25:00','(ระบบซ่อมบำรง ยืม  คืน ไอที่ออนไลย์) เพิ่มรายช่ือห้องประชุม ห้องเรียน ห้อง Conforence','2016-11-18 13:31:00','2016-11-18 15:25:00','(ระบบซ่อมบำรง ยืม  คืน ไอที่ออนไลย์) เพิ่มข้อมูลในฐานโปรแกรม','300','success','43','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('122','2016-11-21 10:30:00','คอมพิวเตอร์ ไม่สามารถสั่งปริ้นงาน ทั้งหมด 5 เครื่อง','2016-11-21 10:35:00','2016-11-21 11:00:00','ทำงานลง ไดเวอร์ ปริ้นเตอร์ ใหม่ เเละอัพเดทโปรเเกรม','100','success','51','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('123','2016-11-21 14:17:27','ขอส่งไฟล์ขึ้นเว็บวิทยาลัยในฝ่ายวิชาการ งานพัฒนาหลักสูตรและการเรียนการสอน เรื่องแบบฟอร์มทวนสอบ','2016-11-22 08:21:00','2016-11-22 09:02:00','ขึ้นประชาสัมพันธ์','0','success','34','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('124','2016-11-22 08:30:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด เเละ บางเครื่อง ไม่สามารถ ใช้งานอินเตอร์เน็ต ได้ ','2016-11-22 09:00:00','2016-11-22 11:30:00','ทำการเเกะ เครื่องคอมพิวเตอร์ มา ทำความสะอาด 
เช่น เเรม การ์ดจอ เเละ เช็ค บอด   
ส่วน อินเตอร์เน็ต ทำการไล่สาย ใหม่ มามีปัญหา ตรงจุดไหน ','300','success','15','4','102','2');
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
ว่า มีปัญหา หรือไม่  ถ้าไม่เกิดปัญหา จะมีสัญาณ ไฟ กระพริบ 2สี เช่น สีเขียว เเละ สีน้ำเงิน เเสดงว่าปกติ               เเต่ ถ้า ขึ้น ไฟสีเเดงขึ้นมาเเสดง ว่าเกิดปัญหา กับ ตัว นั้น','0','success','15','2','81','2');
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
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('175','2016-12-01 09:39:14','ประชุมเชิงปฏิบัติการพัฒนาอาจารย์ในการประเมินทักษะด้วย OSCE
ห้องประชุมชิดกานต์ เจริญชั้น ๓ ตึกอำนวยการ
ระหว่างวันที่ ๗-๙ ธันวาคม ๕๙
อุปกรณ์
คอมพิวเตอร์
เครื่องเสียง+ไมค์ลอย ๒ ตัว
เครื่องฉายทึบแสง
ป้ายต้อนรับ วิทยากร','2016-12-06 04:00:00','','ดำเนินการgiup[ihvp','0','success','18','5','108','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('176','2016-12-01 09:35:00','(ระบบทะเบียน) ตั้งตารางสอนเพิ่มไม่ได้','2016-12-01 09:41:00','2016-12-01 10:12:00','ปรับสิทธิในระบบทะเบียน','0','success','68','1','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('177','2016-12-01 08:30:00','เครื่องปริ้น ไดร์เวอร์ หาย เเละ ตัวสเเกน ไวรัส ไม่ทำงาน ','2016-12-01 08:40:00','2016-12-01 09:00:00','ทำการลง ไดร์เวอร์ ปริ้นเตอร์ ใหม่ เเละ ลงตัวสเเกน ไวรัส ใหม่ ','100','success','4','4','8','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('178','2016-12-01 14:30:00','เครื่อง MAC OS มีปัญหา ฟอน ตัวใหญ่ เกิน มาตรฐาน ','2016-12-01 14:40:00','2016-12-01 14:50:00','ทำการเพิ่มฟอน ใหม่ เข้าไป ในเครื่อง MAX OS ใหม่ เพือให้ ฟอนมีขนาด มาตราฐาน ','100','success','73','4','16','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('179','2016-12-02 09:10:00','เครื่อง ปริ้น  ไม่ สามารถ ใช้งาน ได้  เเละ เครื่อง เกิดความล่าช้าในการทำงาน ','2016-12-02 09:20:00','2016-12-02 10:00:00','ทำการอัพเดท โปรเเกรม เครื่องปริ้นเตอร์ ใหม่ เเละ ทำการสเเกน ไวรัส ใหม่ ','100','success','51','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('180','2016-12-02 13:30:00','อินเตอร์เน็ต   ไม่สามารถ ใช้งาน ได้   ','2016-12-02 13:35:00','2016-12-02 13:40:00','ทำการเช็ค สายเเลนมา เกิดปัญหา สายเสียบ ไม่สุด หรือเปล่า เเล้วทำงาน เสียบใหม่ อินเตอร์เน็ต สามาร ใช้งานได้ ','0','success','74','4','92','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('181','2016-12-02 13:30:00','เครื่อง PC เปิด ไม่ติด ไม่ขึ้น หน้าจอ อะไร เลย ','2016-12-02 13:35:00','2016-12-02 13:50:00','ทำการ ถอด อุปกรณ์ ภายใน บอร์ด เช่น อุปกรณ์ RAM  การ์ดจอ ออก มาขัด  ','100','success','74','4','82','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('182','2016-12-02 13:30:00','เครื่อง PC เปิด หน้าติด เเต่ ไม่ขึ้น ภาพ ออก จอมินิเตอร์ ','2016-12-02 13:35:00','2016-12-02 14:00:00','ทำการตรวจสอบ อุปกรณ์ สายต่อ พวง มา เกิด อาการ สาย หลวม หรือเปล่า ','0','success','74','4','78','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('183','2016-12-06 02:51:51','ขอใช้เครื่องฉายทึบแสง Notebook และไมค์ลอย ในการประชุมโครงการเปิดโลกทัศน์พัฒนาศักยภาพอาจารย์มืออาชีพ : การจัดการเรียนการสอนในศตวรรษที่ ๒๑ สถานที่ ห้องชิดกานต์ เจริญ  ในวันที่ ุ6 ธันวาคม 2559 เวลา 8.30 - 16.00 น.','2016-12-06 08:27:00','2016-12-06 08:00:00','ดำเนินการติดตั้งเรียบร้อย','0','success','17','5','108','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('184','2016-12-06 08:20:00','-','2016-12-06 08:30:00','2016-12-06 08:35:00','เอา ไป ติดตั้ง ห้องประชุม ','0','success','17','7','56','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('185','2016-12-06 13:10:00',' ตรวจเช็ค ประจำ สัปดาห์ ','2016-12-06 13:15:00','2016-12-06 15:00:00','ใช้งานได้ ปกติ ทั้งคอมพิวเตอร์ เเละ เครื่องปริ้น 
คอมพิวเตอร์ ทั้งหมด  8เครื่อง   
เครื่องปริ้น  2 เครื่อง 
เครื่องสเเกน 1 เครื่อง ','0','success','72','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('186','2016-12-08 14:00:00','ตรวจเช็ค เครื่องคอมพิวเตอร์ ในห้องปฤิบัติการคอมพิวเตอร์ 
ว่ามี ไหน เกิดอาการเสีย หรือ เปิดไม่ติบาง  

ทั้งหมด 50เครื่อง','2016-12-08 14:10:00','2016-12-08 15:30:00','ตรวจเช็ค เครื่องคอมพิวเตอร์ ในห้องปฤิบัติการคอมพิวเตอร์ 
ว่ามี ไหน เกิดอาการเสีย หรือ เปิดไม่ติบาง 
ทั้งหมด 50เครื่อง','0','success','74','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('187','2016-12-07 08:37:00','(เว็บไซต์) ปรับปรุง banner บนเว็บไซต์ส่วนหน้าหลัก','2016-12-07 08:39:00','2016-12-07 13:45:00','เพิ่มรูปใหม่ ใน banner','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('188','2016-12-08 08:35:00','(เว็บไซต์) ทำการเพิ่ม สไลด์รูปในหน้าเว็บไซต์ ในส่วนหน้าหลัก','2016-12-08 08:40:00','2016-12-08 14:15:00','ทำการรวมรูป เป็น สไลด์ภาพในหน้าเว็บไซต์ ในส่วนหน้าหลัก','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('189','2016-12-09 09:05:00','(โปรแกรมจ่ายตรง) ','2016-12-09 09:07:00','2016-12-09 10:18:00','ทำการเช็ค TOKENKEY และ Driver ทั้งเครื่องของอาดีละห์ สาวิตรีและขวัญ','0','success','39','1','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('190','2016-12-09 09:05:00','(หุ้น SIM)','2016-12-09 13:20:00','2016-12-09 16:01:00','','0','success','29','1','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('191','2016-12-09 10:06:33','(ประชาสัมพันธ์)','2016-12-09 16:09:33','2016-12-09 16:25:00','เพิ่มข่าวประชาสัมพันธ์ 1 ไฟล์','0','success','18','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('192','2016-12-09 09:00:00','เครื่องเปิด ติด ภาพไม่ขึ้น จอ มอนิเตอร์ ','2016-12-09 09:05:00','2016-12-09 09:40:00','ทำการ ตรวจเช็คการ์ดจอ ว่าเสียหรือเปล่า เเละ ทำการเปลี่ยน ใหม่ ','100','success','39','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('193','2016-12-09 14:00:00','-','0000-00-00 00:00:00','2016-12-09 14:30:00','ทำการติดตั้ง เครื่องปริ้น ใหม่ เเละ อัพเดท โปรเเกรม ใหม่','0','success','36','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('194','2016-12-13 08:16:00','ขอใช้อุปกรณ์โสตฯ เครื่องฉายทึบแสง เครื่องคอมพิวเตอร์
ยรรยายเรื่องการสอบของนักศึกษาพยาบาลปี 3-4  OSCE  2016-12-13 08:16-12.00 น.','2016-12-09 08:22:00','2016-12-13 08:00:00','ดำเนินการแล้ว','0','success','10','7','108','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('195','2016-12-14 10:00:00','ขอใช้อุปกรณ์โสตฯ ต้อนรับนักศึกษาจากประเทศอินโดนีเซีย
2016-12-19 08:00-16.00 น.','2016-12-16 09:00:00','2016-12-22 00:00:00','กำลังดำเนินการแล้วครับ','0','success','3','5','116','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('196','2016-12-13 08:30:00','เครื่อง Mac เกิดปัญหา ไม่สามารถ เปิด ใช้ งานได้  เเละเครื่องค้าง ','2016-12-13 08:35:00','2016-12-13 09:00:00','ทำการเปลี่ยนเครื่อง Mac ใหม่ เเละ ทำการลงโปรเเกรม ใหม่ เครื่องปริ้น เเละ โปรเเกรมใช้งานต่างๆ ','100','success','73','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('197','2016-12-14 10:00:00','ขอใช้อุปกรณ์โสตฯ สรุปการเยี่ยมเยียนดูงาน ของนักศึกษาจากประเทศอินโดเนียเซีย 2016-12-22  08:00-12.00 น.','2016-12-21 09:00:00','2016-12-22 10:00:00','กำลังดำเนินการแล้วครับ','0','success','3','5','116','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('198','2016-12-14 10:00:00','ขอใช้อุปกรณ์โสตฯ งานเลี้ยง ของนักศึกษาจากประเทศอินโดเนียเซีย 2016-12-22 18:00 -21.00 น.','2016-12-22 10:00:00','2016-12-22 00:00:00','ดำเนินการแล้วครับ','0','success','3','9','109','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('199','2016-12-13 10:38:00','ขอใช้อุปกรณ์โสตฯ ประชุมคณะกรรมการ PA 2016-12-13 13:00-16.00 น .','2016-12-13 10:40:00','2016-12-13 10:40:00','กำลังดำเนินการ','0','success','2','5','108','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('200','2016-12-13 11:40:00','ไม่มี','2016-12-13 11:45:00','2016-12-13 11:55:00','ติดตั้งคอมพิวเตอร์ สำหรับประชุม ','0','success','2','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('201','2016-12-14 08:00:00','ไม่มี','2016-12-14 00:00:00','2016-12-14 12:00:00','ถ่าย วิดิโอ นักศึกษา การอบรมเบื้องต้น ','0','success','10','7','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('202','2016-12-14 13:00:00','เครื่องปริ้นเตอร์ ไม่สามารถ ใช้งานได้ 
เครื่องค้าง  ไม่เห็น พอตร์ USB ','2016-12-14 13:05:00','2016-12-14 13:30:00','ทำการลบ ไดเวอร์ ปริ้นเตอร์  เเละ ทำการโหลดโปรเเกรม เพือมาลงใหม่ เเละ เปลี่ยน พอต มาเสียบ อีก ด้านนึง','0','success','3','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('203','2016-12-14 08:00:00','(ใช้หุ้น SIM)','2016-12-15 08:05:00','2016-12-15 16:21:00','อำนวยความสะดวกการใช้หุ้น SIM ใช้สอบ นศ.ปี 3','0','success','29','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('204','2016-12-13 08:25:00','(หุ้น SIM)','2016-12-13 09:05:00','2016-12-13 11:05:00','ตรวจเช็ค เตรียมอุปกรณ์ในการใช้งาน','0','success','29','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('205','2016-12-13 13:15:00','(หุ้น SIM)','2016-12-13 15:00:00','2016-12-13 16:00:00','อาจารย์ นัดตรวจความพร้อม','0','success','29','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('206','2016-12-15 14:28:49','(ระบบทะเบียน) ลืมรหัสผ่าน 2 คน 591301001,591301060','2016-12-15 14:30:00','2016-12-15 14:45:00','ทำการสร้างรหัสผ่านใหม่','0','success','79','1','173','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('207','2016-12-15 14:40:00','(ระบบทะเบียน) ลืมรหัสผ่าน 1 คน 591301007','2016-12-15 14:45:00','2016-12-15 14:53:00','ทำการสร้างรหัสผ่านใหม่','0','success','79','1','173','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('208','2016-12-19 10:26:21','(โปรแกรมจ่ายตรง) ไม่สามารถเข้าได้','2016-12-19 13:27:00','2016-12-19 15:40:00','(โปรแกรมจ่ายตรง) ลง OS ใหม่ และ Driver TokenKey','0','success','39','1','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('209','2016-12-20 08:10:00','(ฺBCNYALA)รายการข่าวประชาสัมพันธ์ หน้าหลัก','2016-12-20 08:35:00','2016-12-20 11:40:00','ย่อรวมเป็น  TABS','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('210','2016-12-20 11:38:00','เพิ่มรายการประชาสัมพันธ์ ใหม่ในงานแผน 5 ไฟล์','2016-12-20 13:38:00','2016-12-20 14:13:00','เพิ่มรายการประชาสัมพันธ์','0','success','47','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('211','2016-12-21 08:17:00','(ฺBCNYALA)เพิ่มเมนูเข้าระบบสารสนเทศต่างๆ ที่หน้าแรกของเว็บ BCNYALA','2016-12-21 09:15:00','2016-12-21 13:54:00','ปรับปรุงเพิ่มเมนูเข้าระบบสารสนเทศต่างๆ หน้าแรก','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('212','2016-12-22 10:47:31','เข้า Internet ไม่ได้  ปริ้นงานไม่ได้','2016-12-22 10:50:00','2016-12-22 11:50:00','อินเตอร์เน็ต','0','success','41','1','1','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('213','2016-12-26 10:57:36','ขอใช้เครื่องฉายทึบแสง ห้องประชุมอุบลรัตน์ ชั้น ๒ อาคาร ๙ ชั้น
วันที่ ๒๖ ธค.๕๙ เวลา ๑๓.๓๐ - ๑๖.๐๐ น.','2016-12-26 12:44:00','2016-12-26 13:00:00','ดำเนินการแล้ว','0','success','9','5','170','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('214','2016-12-23 13:00:00','-','','2016-12-23 13:10:00','ติดตั้งเครื่องฉาย ทึบ เเสง ','0','success','9','4','171','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('215','2016-12-23 13:00:00','ขอใช้อุปกรณ์โสตฯเครื่องฉายทึบแสง 2016-12-23 14:00:00 ห้องประชุมอุบลรัตน์','2016-12-23 13:00:00','2016-12-23 13:00:00','','0','success','9','5','152','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('216','2016-12-23 08:30:00','เข้า ระบบ ออเท็น  ไม่ได้  รายชือไม่ถูกต้อง ','2016-12-23 08:35:00','2016-12-23 08:45:00','ใส่ รหัส ผ่านใหม่ ให้ตรง กับ รายชือ ','0','success','3','1','60','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('217','2016-12-23 08:30:00','เข้า ออเท็น หน้า เว็ป ไม่ได้ ชือ หรือ รหัส ผ่านผิด 
ไม่ถูกต้อง ','','2016-12-23 08:45:00','ทำการใส่รหัสผ่านใหม่  ให้ตรงตามรายชือ ที่ให้ มา ','0','success','30','1','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('218','2016-12-23 10:00:00','เข้า ออเท็น ไม่ได้ รายชือ รหัสผ่านไม่ถูก ','','2016-12-23 10:15:00','ทำการใส่รหัสผ่านใหม่  ให้ตรง กับ รายชือ ที่ มอบให้ ','0','success','8','1','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('219','2016-12-26 01:35:00','ยืมคอมพิวเตอร์,เครื่องฉายทึบแสง 2016-12-26 01:35:00','2016-12-27 12:00:00','','ดำเนินการเสร็จเรียบร้อย','0','success','31','5','170','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('220','2016-12-26 09:46:00','ขอใช้อุปกรณ์โสตฯ 2016-12-26 10:00 - 12.00 น.
ประชุมภาค ห้องประชุม อุบลรัตน์','2016-12-26 08:48:00','2016-12-26 08:49:00','ดำเนินการเรียบร้อยแล้ว','0','success','9','5','151','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('221','2016-12-28 09:37:46','คอมพิวเตอร์ห้อง ๙๔๐๑ ไม่รองรับการเปิดดู Youtube แบบเต็มจอ','','','ตั้งค่าหน้าจอ Notebook 1280*768  หรือ น้อยกว่าก็ได้ ครับ 800*600 ภาพจะได้เต็มพอดี','0','success','9','9','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('222','2016-12-28 09:59:05','ขอเครื่องฉายทึบแสง 2016-12-28 13:59:05-16.00 น.','2016-12-28 11:54:00','2016-12-28 11:54:00','ดำเนินการแล้ว','0','success','2','5','162','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('223','2016-12-28 10:51:00','ยืมอุปกรณ์โสตเครื่องฉายทึบแสง2016-12-28 13:00-16.00 น.','2016-12-28 11:52:00','2016-12-28 11:53:00','ดำเนินการแล้ว','0','success','8','9','153','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('224','2016-12-28 11:55:00','ขอใช้เครื่องฉายโปรเจคเตอร์ 2016-12-28 13:30-16.00 น.
ณ.ห้องประชุมดอกบัว','2016-12-28 11:58:00','2016-12-28 11:58:00','ดำเนินการติดตั้งแล้ว','0','success','2','9','170','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('225','2016-12-29 08:35:00','(เว็บวิทยาลัย) ปรับปรุงแก้ไขหน้าแรกเพิ่มเติม','2016-12-29 08:45:00','2016-12-29 14:55:00','ปรับปรุงแก้ไขหน้าแรกเพิ่มเติม ตกแต่งไฟล์รูป เพิ่มไฟล์รูป เพิ่มเอฟเฟค','0','success','15','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('226','2016-12-30 09:29:00','ขอใช้ ทีวี led   2016-12-30 12.00 น.-18.00น.ที่ห้อง conforence  9801กับ 9705','2016-12-30 10:00:00','2016-12-30 12:00:00','','0','success','19','9','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('227','2016-12-30 09:28:30','ขอใช้อุปกรณ์โสตฯ ทีวี Led ที่ห้อง 2016-12-30 09:13:30-18.00 น.  conforence  9806','2016-12-30 12:00:00','2016-12-30 12:00:00','','0','success','6','5','125','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('228','2016-12-30 09:32:01','ขอใช้อุปกรณ์โสตฯ ทีวี Led ที่ห้อง 2016-12-30 09:13:30-8.00 น.  conforence  9801','2016-12-30 11:00:00','2016-12-30 12:00:00','','0','success','11','5','120','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('229','2017-01-05 11:34:37','ขอใช้เครื่องฉายทึบแสงและคอมพิวเตอร์ ในวันที่ ๑๓ มกราคม ๒๕๖๐ เวลา 13 -16.00 น. ณ.ห้องประชุมจงจิตต์ (ประชุมอาจารย์)','','','ติดตั้งเรียบร้อยแล้วครับ','0','success','31','5','53','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('230','2017-01-09 09:00:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด','2017-01-09 09:05:00','2017-01-09 09:30:00','ทำการ ถอดอุปกรณ์ มาเช็ค เช่น เเรม ออกมาขัด ','100','success','1','4','3','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('231','2017-01-09 10:00:00','-','2017-01-09 10:05:00','2017-01-09 10:10:00','ทำการลง โปรเเกรม สเเกน ไวรัส ตัวใหม่ ','100','success','46','1','23','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('232','2017-01-09 10:10:00','-','2017-01-09 10:15:00','2017-01-09 10:20:00','ลงโปรเเกรม สเเกรน ไวรัส ใหม่','100','success','45','1','21','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('233','2017-01-09 10:30:00','-','2017-01-09 10:35:00','2017-01-09 10:50:00','ลงโปรเเกรม สเเกรน ไวรัส  ใหม่ ','100','success','44','1','20','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('234','2017-01-10 13:58:25','ขอยืมเครื่องโน้ตบุ๊คของวิทยาลัย เพื่อใช้ในการจัดทำหลักสูตร','2017-01-10 10:00:00','','ดำเนินการเรียบร้อย','0','success','34','5','53','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('235','2017-01-10 17:13:17','ขอใช้วันที่ ๑๑ มค ๖๐ เวลา ๑๓:๐๐-๑๖:๐๐น. ห้องเรียนปี ๑ (ห้อง ๙๕๐๔ อาคาร ๙ ชั้น)','','2017-01-11 16:30:00','-','0','success','12','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('236','2017-01-10 17:16:26','ขอใช้เครื่องฉายทึบแสง วันที่ ๑๑ มค ๖๐ เวลา ๑๓:๐๐-๑๖:๐๐น. ณ ห้องเรียนปี ๑ (ห้อง ๙๕๐๔ อาคาร ๙ ชั้น)','2017-01-10 10:00:00','2017-01-10 11:00:00','ดำเนินการแล้ว','0','success','12','9','144','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('237','2017-01-12 16:38:10','ด่วน!!!!!','2017-01-13 09:10:00','2017-01-13 09:20:00','เเก้ไข ปริ้นเตอร์ ให้เรียบร้อย เเล้ว คับ','0','success','1','2','3','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('238','2017-01-11 08:00:00','ประชุม จี้เเจ้ง เรื่อง ไป OD ','','2017-01-11 16:00:00','ประชุม จี้เเจ้ง เรื่อง ไป OD ','0','success','74','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('239','2017-01-12 08:00:00','ประชุม จี้เเจ้ง เรื่อง ไป OD ','','2017-01-12 16:00:00','ประชุม จี้เเจ้ง เรื่อง ไป OD ','0','success','74','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('240','2017-01-13 09:38:00','ขอยืม Notebook 2017-01-13 09:38 -16.00 น. ห้องประชุมดอกบัว
','2017-01-13 09:00:00','','ดำเนินการติดตั้งแล้ว','0','success','13','5','106','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('241','2017-01-13 08:20:00','เข้า ออเท็น  ไม่ได้ ','2017-01-13 08:30:00','2017-01-13 08:40:00','ตั้งค่า หน้า เว็ปไซน์ ให้เป็น หน้า  ออเท็น ','0','success','49','1','10','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('242','2017-01-19 09:59:25','ขอยืมใช้คอมพิวเตอร์จำนวน 1 เครื่องเพื่อดำเนินการจัดประชุมโครงการพัฒนาศักยภาพบุคลากรด้านการดำเนินงานการบริหารความเสี่ยงขององค์กร ในวันที่ 23 มกราคม 2560  2017-01-23 09:.00-16.00 น.','2017-01-23 09:00:00','','ได้ดำเนินการแล้ว','0','success','28','5','107','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('243','2017-01-23 09:08:44','ขอยืม notebook, projector, microphone 3 , เครื่องเสียง, ในวันที่ 26 มค. 60 เวลา 13.00 ถึง16.00 น ห้องประชุมชั้น 6','2017-01-26 08:42:00','2017-01-26 08:41:00','ดำเนินการเรียบร้อย','0','success','33','5','53','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('244','2017-01-23 14:47:40','ขอลงแบบฟอร์มมคอ.5 ในเวบวิทยาลัย ฝ่ายวิชาการ งานพัฒนาหลักสูตร เอกสารส่งไปให้ในเมลแบซีแล้วน่ะค่ะ','2017-01-24 09:45:00','','เพิ่ม ประชาสัมพันธ์','0','success','34','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('245','2017-01-24 10:05:47','ปรินเตอร์','2017-01-24 10:05:47','2017-01-24 10:20:47','Add Driver Printer ใหม่','0','success','49','1','10','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('246','2017-01-24 10:20:00','Anti virus','2017-01-24 10:20:00','2017-01-24 10:30:00','โชว หน้าต่าง Error','0','success','46','1','23','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('247','2017-01-24 10:31:00','เข้าเน็ตไม่ได้','2017-01-24 10:31:00','2017-01-24 10:45:00','Set Program ให้ Authen','0','success','44','1','20','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('248','2017-01-23 08:30:00','เครื่องคอมพิวเตอร์ ไม่สามารถ ปริ้นงานได้  เเละ อินเตอร์เน็ต ไม่สามารถใช้งานได้ ','2017-01-24 08:35:00','2017-01-24 09:00:00','ทำการลง ไดเวอร์ ปริ้นเตอร์ใหม่ เเละ ทำการ อัพเดท ฌปรเเกรม ท่องเว็ป ใหม่ ','100','success','1','4','3','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('249','2017-01-23 09:30:00','อินเตอร์เน็ต ใช้งานไม่ได้ เเละ เครื่องปริ้น ไม่สามารถ ปริ้น งานได้ ','2017-01-23 09:35:00','2017-01-23 10:05:00','ทำการลง ไดเวอร์ ปริ้นเตอร์ ใหม่ เเละ รีสตาท เครื่องใหม่ ','100','success','49','4','10','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('250','2017-01-24 08:00:00','อินเตอร์เน็ตใช้งานไม่ได้ ไม่สามารถ ใช้ดาวโหลดงานได้ เอกสารต่างๆ ได้ ','2017-01-24 08:05:00','2017-01-24 08:30:00','ทำการปิดตัวสเเกรนไวรัส เเละอัพเดทโปรเเกรม ท่องเว็ปไซน์ ใหม่ ','100','success','1','4','3','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('251','2017-01-24 09:00:00','-','2017-01-24 09:05:00','2017-01-24 09:20:00','ลง เอ็นตี้ไวรัส ใหม่  Kaspersky ','100','success','2','1','5','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('252','2017-01-24 09:30:00','-','2017-01-24 09:35:00','2017-01-24 09:45:00','ลง เอ็นตี้ไวรัส ใหม่  Kaspersky ','100','success','3','1','59','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('253','2017-01-24 09:50:00','-','2017-01-24 09:55:00','2017-01-24 10:10:00','ลง เอ็นตี้ไวรัส ใหม่  Kaspersky ','100','success','10','1','4','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('254','2017-01-27 10:35:38','ประชาสัมพันธ์หน้าเว็บ วิทยาลัย หลักสูตรเวช','2017-01-27 10:59:00','','เพิ่ม ประชาสัมพันธ์หน้าเว็บ วิทยาลัย หลักสูตรเวช 4 ไฟล์','0','success','35','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('255','2017-01-31 10:00:00','ขอใช้อุปกรณ์โสตฯ เพื่อประชาสัมพันธ์ ในวันที่ 4 ก.พ. 2560 เวลา 08.00-12.00
ขอใช้ไมค์ 1 ตัว
คอมพิวเตอร์โน๊ตบุ๊ค 1 เครื่อง
วิทยุสื่อสาร 2 ตัว
','2017-02-01 08:00:00','2017-02-01 08:00:00','ดำเนินการแล้วเสร็จ','0','success','35','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('256','2017-01-31 08:00:00','เครื่องปริ้นเตอร์ ไม่สามารถ ใช้งานได้ ','2017-01-31 08:05:00','2017-01-31 08:30:00','ลง ไดเวอร์ ปริ้นเตอร์ ใหม่ ','0','success','1','4','3','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('257','2017-01-31 09:00:00','เครื่องปริ้นเตอร์ ตลับหมึกหมด ','2017-01-31 09:10:00','2017-01-31 09:20:00','เปลี่ยนตลับหมึก ใหม่ หมด ','100','success','2','4','5','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('258','2017-01-31 14:09:00','เครื่องคอมพิวเตอร์  เปิดไม่ติด ไม่เเสดง ภาพ ออกมา','2017-01-31 14:10:00','2017-01-31 15:30:00','ส่ง ร้าน เคลม เพราะ อุปกรณ์ บางตัว เสีย เช่น การ์ดจอเเสดงผล เสีย ','300','success','80','4','93','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('259','2017-01-31 14:09:00','เครื่องคอมพิวเตอร์  เปิดไม่ติด ไม่เเสดง ภาพ ออกมา','2017-01-31 14:10:00','2017-01-31 15:30:00','ส่ง ร้าน เคลม เพราะ อุปกรณ์ บางตัว เสีย เช่น การ์ดจอเเสดงผล เสีย ','300','success','80','4','93','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('260','2017-01-31 14:09:00','เครื่องคอมพิวเตอร์  เปิดไม่ติด ไม่เเสดง ภาพ ออกมา','2017-01-31 14:10:00','2017-01-31 15:30:00','ส่ง ร้าน เคลม เพราะ อุปกรณ์ บางตัว เสีย เช่น การ์ดจอเเสดงผล เสีย ','300','success','80','4','93','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('261','2017-01-31 14:09:00','เครื่องคอมพิวเตอร์  เปิดไม่ติด ไม่เเสดง ภาพ ออกมา','2017-01-31 14:10:00','2017-01-31 15:30:00','ส่ง ร้าน เคลม เพราะ อุปกรณ์ บางตัว เสีย เช่น การ์ดจอเเสดงผล เสีย ','300','success','80','4','90','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('262','2017-01-31 14:09:00','เครื่องคอมพิวเตอร์  เปิดไม่ติด ไม่เเสดง ภาพ ออกมา','2017-01-31 14:10:00','2017-01-31 15:30:00','ส่ง ร้าน เคลม เพราะ อุปกรณ์ บางตัว เสีย เช่น การ์ดจอเเสดงผล เสีย ','300','success','80','4','90','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('263','2017-01-31 09:00:00','ปรินไม่ได้','2017-01-31 09:00:00','2017-01-31 09:15:00','ลง Diver ใหม่','0','success','39','1','17','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('264','2017-01-31 09:20:00','เล่นอินเตอร์ไม่ได้','2017-01-31 09:20:00','2017-01-31 09:45:00','Authen ไม่ผ่าน','0','success','45','1','21','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('265','2017-01-31 13:07:00','แก้ไข ไฟล์ประชาสัมพันธ์ 4 ไฟล์','2017-01-31 13:07:00','2017-01-31 13:40:00','เรียบร้อย ','0','success','35','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('266','2017-01-31 14:00:00','เพิ่มไฟล์ประชาสัมพันธ์ 3 ไฟล์','2017-01-31 14:00:00','2017-01-31 14:30:00','เรียบร้อย','0','success','33','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('267','2017-01-31 14:35:00','เพิ่มไฟล์ประชาสัมพันธ์ 2 ไฟล์','2017-01-31 14:35:00','2017-01-31 14:55:00','เรียบร้อย','0','success','47','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('268','2017-02-01 14:10:00','โปรแกรมสรรพากร','2017-02-01 14:10:00','','ติดตั้งใหม่ และ ทดสอบ ลงข้อมูลเป็นปัจจุบัน','0','success','39','1','17','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('269','2017-02-01 13:29:00','Winspeed','2017-02-01 13:29:00','2017-02-01 13:45:00','ลงข้อมูลใหม่ในโปรแกรม Winspeed','0','success','67','1','18','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('270','2017-02-01 13:45:00','เข้า Internet ไม่ได้','2017-02-01 13:45:00','2017-02-01 14:01:00','ติด Authen ','0','success','77','1','19','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('271','2017-02-02 08:05:00','Neotbook  เข้าใช้งานไม่ได้ ไม่สามารภ เข้า วินโด ได้ ','2017-02-02 08:10:00','2017-02-02 09:30:00','ทำการ อัพเดท วินโดใหม่ ','200','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('272','2017-02-03 08:30:00','ทำลงวินโดใหม่ เเละ อัเดท โปรเเกรม ต่างๆ ใหม่','2017-02-03 08:40:00','2017-02-03 11:45:00','Windows มีปัญหา ไม่สามารถ ใช้งานได้ ','300','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('273','2017-02-03 13:00:00','-','2017-02-03 13:10:00','2017-02-03 15:30:00','ทำการติดตั้ง Notebook เเละ เครื่องปริ้นเตอร์ เผือใช้ในการรับ สมัคร เด็ก เข้าเรียน','200','success','43','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('274','2017-02-06 08:10:00','-','2017-02-06 08:15:00','2017-02-06 08:20:00','ตรวจเช็ค การทำงาน ของเครื่องปริ้น เเละระบบ อินเตอร์เน็ต ','0','success','1','4','3','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('275','2017-02-06 08:40:00','เครื่องปริ้น เเละ อินเตอร์เน็ต ไม่สามารถ ใช้ งานได้','2017-02-06 09:00:00','2017-02-06 09:30:00','ทำการ ค้นหาไดเวอร์ เครื่องปริ้น เเละ เปิดปิดระบบ ออเท็ฯ ใหม่','100','success','49','4','10','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('276','2017-02-06 08:15:00','ระบบ http://admission.pi.in.th/admission/ ','2017-02-06 08:15:00','2017-02-06 10:45:00','admission บันทึกข้อมูลผู้ผ่านการสัมภาษณ์ 37 คน','0','success','15','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('277','2017-02-07 08:20:00','ประชาสัมพันธ์','2017-02-07 08:20:00','2017-02-07 09:00:00','เพิ่มไฟล์ประชาสัมพันธ์ 2 ไฟล์','0','success','40','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('278','2017-02-07 08:05:00','ระบบ ออเท็น ใช้งานไม่ได้ เเละ เครื่องปริ้น ไม่สามารถ ใช้งานได้ ','2017-02-07 08:10:00','2017-02-07 08:15:00','ทำการ เปิด ปิด ระบบ ออเท็น ใหม่ เเละ ทำการลงเครื่องปริ้นใหม่ ','100','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('279','2017-02-07 10:56:00','เพิ่มประชาสัมพันธ์','2017-02-07 10:55:00','2017-02-07 11:20:00','เพิ่มประชาสัมพันธ์ 2 ไฟล์','0','success','68','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('280','2017-02-07 10:20:00','ย้ายสายเเลน ใหม่ ','2017-02-07 10:25:00','2017-02-07 10:50:00','-','200','success','55','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('281','2017-02-09 08:30:00','เครื่อง pc เปิดไม่ติด เเละ Noetbook ไม่สามารถ ใช้งาน อินเตอร์เน็ตได้ ','2017-02-09 08:35:00','2017-02-09 10:12:00','ทำการตรวจเช็ค อุปกรณ์ ต่างๆ ใน ตัวคอมพิวเอตร์ PC 
เเละทำการตรวจเช็ค ระบบ All then ว่า เกิดผิดพลาดอะไรบาง ','300','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('282','2017-02-02 08:00:00','วันเสาร์ที่ ๒๕ กุมภาพันธ์ ๒๕๖๐ เวลา ๘.๐๐ - ๑๒.๐๐ น ได้จัดการสอบ ความรอบรู้ภาษาอังกฤษ (ทักษะการพูด อ่าน เขียน ฟัง) ของ นศ. ทุกชั้นปี
จึงขอแจ้งเจ้าหน้าที่เตรียมความพร้อมทางด้าน โสตทัศนูปกรณ์ ประจำห้องสอบแต่ละห้องดังนี้
๑. ห้องประชุมดอกแก้ว ผู้เข้าสอบจำนวน ๑๓๑ คน ประกอบด้วยนศ. ชั้นปี ๑,๔ และ อาจารย์ ๒ ท่าน
๒. ห้องเรียน ชัน ๔ ฝั่งลานวัฒนธรรม นศ.ชั้นปี ที่ ๒
๓.ห้องเรียน ชัน ๖ ฝั่งลานวัฒนธรรม นศ.ชั้นปี ที่ ๓
ทางอาจารย์โศรยา ขอทดสอบการใช้เครื่องเสียงในการเปิด CD ของห้องสอบทุกห้องในวันที่ ๒๔ ก.พ. ๖๐ เวลา ๑๖.๐๐ น.','2017-02-02 08:00:00','2017-02-02 08:00:00','ดำเนินการแล้ว','0','success','18','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('283','2017-02-02 13:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforrenec  ห้อง ๗๐๔ 2017-02-02 13:00-116.00 น.','2017-02-02 13:00:00','','ดำเนนการแล้ว','0','success','37','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('284','2017-02-02 11:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforrenec  ห้อง ๗๐๔ 2017-02-02 13:00 - 16.00 น.','2017-02-02 11:00:00','2017-02-02 11:00:00','ดำเนินการแล้ว','0','success','37','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('285','2017-02-02 09:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforrenec  ห้อง ๗๐๔ 2017-02-02 13:00 - 16.00 น.','2017-02-02 09:00:00','2017-02-22 13:00:00','ดำเนินการแล้ว','0','success','37','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('286','2017-02-02 11:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforrenec  ห้อง ๗๐๔ 2017-02-02 13:00 - 15.00 น.','2017-02-02 11:00:00','2017-02-02 11:00:00','ดำเนินการแล้ว','0','success','37','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('288','2017-02-02 10:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforence 704  2017-02-02 13:00-16.00  น.','2017-02-02 12:00:00','2017-02-02 12:00:00','ดำเนินการแล้ว','0','success','37','9','119','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('289','2017-02-03 09:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง confrorence ห้อง702  2017-02-03 12:00- 17.00 น.','2017-02-03 13:00:00','2017-02-03 13:00:00','ดำเนินการแล้ว','0','success','79','9','117','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('290','2017-02-02 10:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforence 9704
2017-02-02 113:00-16.00 น.','2017-02-03 13:00:00','2017-02-03 13:00:00','ดำเนินการแล้ว','0','success','37','9','119','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('291','2017-02-15 08:30:00','-','2017-02-15 08:35:00','2017-02-15 09:00:00','ติดตั้งเครื่องปริ้นใหม่','0','success','49','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('292','2017-02-15 11:00:00','-','2017-02-15 11:05:00','2017-02-15 11:35:00','รับ เครื่องคอม  ที่ส่งซ่อม จากที่ร้าน เพือ มาตรวจเช็ค 
ข้อผิดพลาด','0','success','74','2','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('293','2017-02-02 10:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforence 9702
2017-02-02 113:00-16.00 น.','2017-02-02 10:00:00','2017-02-02 12:00:00','ดำเนินการแล้ว','0','success','37','9','117','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('294','2017-02-03 09:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforence 9703
2017-02-02 113:00-17.00 น.','2017-02-03 13:00:00','2017-02-03 12:00:00','ดำเนินการแล้ว','0','success','81','9','118','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('295','2017-02-03 08:00:00','ขอใช้อุปกรณ์โสตฯ ห้อง conforence 9802
2017-02-02 113:00-16.00 น.','2017-02-03 11:00:00','2017-02-03 12:00:00','ดำเนินการแล้ว','0','success','27','9','121','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('296','2017-02-14 14:13:00','ประชาสัมพันธ์','2017-02-14 14:13:00','2017-02-14 14:33:00','เพิ่มประชาสัมพันธ์ 4 ไฟล์ ในงานหลักสูตร','0','success','34','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('297','2017-02-17 10:40:00','ประชาสัมพันธ์','2017-02-17 10:40:00','2017-02-17 10:51:00','เพิ่มประชาสัมพันธ์ 1 ไฟล์','0','success','46','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('298','2017-02-17 10:00:00','admission บันทึก ผลตรวจร่างกาย  13 คน','2017-02-17 10:01:00','2017-02-17 10:30:00','admission บันทึก ผลตรวจร่างกาย  13 คน','0','success','4','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('299','2017-02-17 09:23:00','Authen login ไม่ได้','2017-02-17 09:23:00','2017-02-17 09:43:00','ลืมรหัส','0','success','82','8','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('300','2017-02-17 11:02:00','สิทธฺิทะเบียน','2017-02-17 11:02:00','2017-02-17 11:16:00','เปิดสิทธิ','0','success','18','8','173','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('301','2017-02-16 08:30:00','เครื่อง คอมพิวเตอร์ เกิดปัญหา ไม่สามารถ ใช้งาน พอต USB ได้ ทำการ ซ่อม เเละ เเก้ไข ','2017-02-16 08:35:00','2017-02-16 14:30:00','ทำการลง ไดร์เวอใหม่ เเละ ทำการ อัพเดท โปรเเกรม ต่างๆ ใหม่ ทั้งหมด','300','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('302','2017-02-17 08:10:00','เครื่อง ปริ้นเตอร์ ไม่สามารถ ปริ้นได้ เเละ เข้าระบบ ออเท็น ไม่ได้ ','2017-02-17 08:15:00','2017-02-17 09:10:00','ทำการ อัพเดท โปรเเกรม ใหม่ เเละ ลงไดร์เวอร์ ใหม่ ','100','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('303','2017-02-17 14:30:00','เข้า ระบบ ออเท็น ไม่ได้ ','2017-02-17 14:35:00','2017-02-17 14:40:00','เปลี่ยน ตัวเชื่อมต่อ สัญาณ WI-FI ใหม่   เเละ ทำการเข้าระบบ อีกครั้ง','100','success','18','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('304','2017-02-20 08:30:00','-','2017-02-20 08:35:00','2017-02-13 09:00:00','จัดอบรม สมนา อาจารย์','0','success','52','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('305','2017-02-20 13:05:00','เครื่อง MAC พขร .  มีปัญหา ไม่สามารถ ใช้งานได้ ','2017-02-20 13:10:00','2017-02-20 15:50:00','ทำการลง ระบบ ปฎิบัติการใหม่ เเละ โปรเเกรมต่างๆ เพิ่มเติม','300','success','54','4','105','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('306','2017-02-20 13:00:00','-','2017-02-20 13:05:00','2017-02-20 16:00:00','-','0','success','52','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('307','2017-02-21 08:35:00','Authren ไม่สามารถใช้งานการเข้าระบบ ได้ ','2017-02-21 08:40:00','2017-02-21 09:30:00','ทำคอนเน็ก WI-FI สัญาณตัวอืน เเละ ทำการ ตั้งค่าใน ตัวสเเกนไวรัส ใหม่ ','100','success','16','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('308','2017-02-21 09:50:00','เครื่อง Mac ไม่สามารถใช้งาน ได้ บางโปรเเกรม ไม่สามารถใช้งานได้ ','2017-02-21 09:55:00','2017-02-21 10:55:00','ทำการลง ระบบ (os) ใหม่ เเละอัพเดทโปรเเกรมใหม่ทั้งหมด','300','success','74','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('309','2017-02-21 10:23:12','ขอใช้คอมพิวเตอร์เพื่อประชุมอาจารย์ ประจำเดือนกุมภาพันธ์ ในวันที่21 ก.พ.60 เวลา 13.00-16.00น.','2017-02-21 09:00:00','2017-02-21 10:00:00','ดำเนินการแล้วเสร็จ','0','success','30','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('310','2017-02-21 11:19:11','ประกาศเรื่อง รายชื่อผู้มีสิทธิเข้ารับการประเมินความรู้ความสามารถ ทักษะ และสมรรถนะ ','2017-02-21 13:32:00','2017-02-21 13:42:00','ประชาสัมพันธ์ 1 ไฟล์','0','success','46','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('311','2017-02-20 10:33:00','Authen ลืมรหัส','2017-02-20 10:33:00','2017-02-20 10:43:00','Authen ลืมรหัส 1 คน ','0','success','80','7','201','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('312','2017-02-20 15:33:00','ประชาสัมพันธ์ รายชื่อ นศ. มาเรียน ณ วพบ.ยะลา','2017-02-20 15:33:00','2017-02-20 15:43:00','ประชาสัมพันธ์ รายชื่อ นศ. มาเรียน ณ วพบ.ยะลา 1 ไฟล์','0','success','38','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('313','2017-02-20 08:45:00','ระบบ Admission ดึงรายชื่อจากระบบ ','2017-02-20 08:45:00','2017-02-20 09:05:00','ระบบ Admission ดึงรายชื่อจากระบบ ส่งงานที่รับผิดชอบต่อ ','0','success','42','7','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('314','2017-02-03 09:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 802
2017-02-03 12:00 - 18.00 น.','2017-02-03 09:00:00','2017-02-03 09:00:00','ดำเนนการแล้ว','0','success','27','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('315','2017-02-03 11:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 805
2017-02-03 12:00 - 18.00 น.','2017-02-03 10:00:00','2017-02-22 11:00:00','ดำเนนการแล้ว','0','success','30','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('316','2017-02-03 08:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 803
2017-02-03 12:00 - 18.00 น.','2017-02-03 08:00:00','2017-02-03 08:00:00','ดำเนนการแล้ว','0','success','36','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('317','2017-02-03 09:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 805
2017-02-03 13:00 - 18.00 น.','2017-02-03 09:00:00','2017-02-03 09:00:00','ดำเนนการแล้ว','0','success','31','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('318','2017-02-08 13:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง เรียน ชั้น 2
2017-02-03 19:00 - 20.00 น. ','2017-02-08 13:00:00','2017-02-08 13:00:00','ดำเนนการแล้ว','0','success','23','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('319','2017-02-08 13:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง เรียน ชั้น 2
2017-02-03 19:00 - 20.00 น. ','2017-02-08 13:00:00','2017-02-08 13:00:00','ดำเนนการแล้ว','0','success','23','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('320','2017-02-07 13:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้องประชุม อุบลรัตน์ 
2017-02-03 13:00 - 15.00 น.','2017-02-07 13:00:00','2017-02-07 13:00:00','ดำเนนการแล้ว','0','success','6','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('321','2017-02-09 09:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้องประชุมอุบลรัตน์ 
2017-02-03 13:00 - 15.00 น.','2017-02-09 09:00:00','2017-02-09 09:00:00','ดำเนนการแล้ว','0','success','6','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('322','2017-02-09 10:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 801
2017-02-03 08:00 - 12.00 น.','2017-02-10 09:00:00','2017-02-09 09:00:00','ดำเนนการแล้ว','0','success','11','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('323','2017-02-09 09:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 802
2017-02-03 13:00 - 18.00 น.','2017-02-09 09:00:00','2017-02-09 09:00:00','ดำเนนการแล้ว','0','success','27','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('324','2017-02-09 10:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 808
2017-02-03 13:00 - 16.00 น.','2017-02-09 10:00:00','2017-02-09 10:00:00','ดำเนนการแล้ว','0','success','13','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('325','2017-02-09 09:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 805
2017-02-03 13:00 - 18.00 น.','2017-02-09 09:00:00','2017-02-09 09:00:00','ดำเนนการแล้ว','0','success','18','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('326','2017-02-22 13:31:00','เพิมประชาสัมพันธ์','2017-02-22 13:31:00','2017-02-22 13:47:00','เพิมประชาสัมพันธ์ 1 ไฟล์ หน้าเว็บ งานแผนฯ','0','success','47','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('327','2017-02-09 10:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 805
2017-02-03 15:00 - 18.00 น.','2017-02-09 10:00:00','2017-02-09 10:00:00','ดำเนนการแล้ว','0','success','31','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('328','2017-02-09 10:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 805
2017-02-03 15:00 - 18.00 น.','2017-02-09 10:00:00','2017-02-09 10:00:00','ดำเนนการแล้ว','0','success','31','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('329','2017-02-16 09:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง ดอกบัว
2017-02-03 13:00 - 17.00 น.','2017-02-16 08:00:00','2017-02-16 10:00:00','ดำเนนการแล้ว','0','success','18','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('330','2017-02-10 09:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 805
2017-02-03 15:00 - 16.00 น.','2017-02-10 09:00:00','2017-02-10 09:00:00','ดำเนนการแล้ว','0','success','13','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('331','2017-02-10 08:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 803
2017-02-03 1300 - 16.00 น.','2017-02-08 08:00:00','2017-02-08 08:00:00','ดำเนนการแล้ว','0','success','29','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('332','2017-02-10 10:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 805
2017-02-03 13:00 - 16.00 น.','2017-02-10 08:00:00','2017-02-22 09:00:00','ดำเนนการแล้ว','0','success','12','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('333','2017-02-10 09:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง conforence 805
2017-02-03 16:00 - 18.00 น.','2017-02-10 09:00:00','2017-02-10 10:00:00','ดำเนนการแล้ว','0','success','37','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('334','2017-02-10 10:00:00','ขอใช้อุปกรณ์โสตทัศนูปกรณ์ ห้อง ประชุมดอกบัว 
2017-02-03 13:00 - 16.00 น.','2017-02-10 10:00:00','2017-02-10 10:00:00','ดำเนนการแล้ว','0','success','13','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('335','2017-02-23 10:00:00','ขอใช้อุปกรณ์โสตฯ ห้องประชุมจงจิต
2017-02-23 13:00-16.00 น.','2017-02-23 11:00:00','2017-02-23 12:00:00','ดำเนินการเสร็จเรียบร้อย','0','success','14','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('336','2017-02-23 14:32:00','แขวนแบบฟอร์มตอบรับการเป็นวิทยากร ไว้ในงานการเงิน หน้าเว็บของวพบ.ยะลา','2017-02-23 14:32:00','2017-02-23 14:42:00','เมล์รับไฟล์ (halmeezee@gmail.com) ที่ส่งประชาสัมพันธ์','0','success','67','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('337','2017-02-23 13:35:00','Admission การจ่ายเงิน รอบ1 โค้วต้าพื้นที่','2017-02-23 13:36:00','2017-02-23 14:20:00','Admission การจ่ายเงิน รอบ1 โค้วต้าพื้นที่ บันทึก 29/33 คน','0','success','39','7','200','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('339','2017-02-24 08:55:00','Admission ยืนยัน 32/33  คน ระบบคัดตรงพื้นที่','2017-02-24 08:55:00','2017-02-24 09:49:00','Admission ยืนยัน 32/33  คน ระบบคัดตรงพื้นที่','0','success','39','7','200','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('340','2017-02-24 13:31:00','Admission รายงานผลการจ่ายเงิน','2017-02-24 13:31:00','2017-02-24 13:43:00','Admission รายงานผลการจ่ายเงิน','0','success','15','7','200','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('341','2017-02-27 12:25:02','วันที่ 28 กุมภาพันธ์ 2560 ขอเจ้าหน้าที่ บีนทึกวิดิโอ การแนะนำการใช้หุ่นมารดา และเด็กทารกจำลองขั้นสูง ตั้งแต่เวลา 9.00 - 16.00 น. ณ ห้อง sim man  ','2017-02-27 09:00:00','2017-02-27 09:00:00','ดำเนินการเสร็จเรียบร้อย','0','success','17','7','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('342','2017-02-27 08:00:00','-','','2017-02-27 16:00:00','ถ่าย วิดีโอ ตอนประชุมงาน','0','success','10','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('343','2017-02-28 08:00:00','-','','2017-02-28 16:00:00','ถ่าย วิดีโอ ตอนประชุม ','0','success','10','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('344','2017-03-01 08:30:00','idm ไม่สามารถ ดาวโหลด ข้อมูล ได้ เเละ Word ไม่สามารถ เปิด ไฟล์ งานได้ ','2017-03-01 08:40:00','2017-03-01 11:50:00','ทำการ อัพเดท โปรเเกรม ใหม่ ทั้งหมด ','200','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('345','2017-03-01 13:10:00','เครื่องปริ้นเตอร์ ไม่สามารถ ใช้งานได้ ','2017-03-01 13:20:00','2017-03-01 13:50:00','ทำการลง โปรเเกรม ปริ้นเตอร์ ใม่','100','success','51','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('346','2017-03-02 08:30:00','วินโด โน็ตบุค  ไม่สามารถ ใช้งาน ได้  เกิด อาการค้าง เเละ จอ ฟ้า ','2017-03-02 08:40:00','2017-03-02 11:30:00','ทำการลง ระบบ OS ใหม่ เเละ อัพเดท โปรเเกรม ใหม่ ทั้งหมด ','300','success','74','4','56','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('347','2017-03-06 13:30:00','เครื่องสเเกน ไม่สามารถ ใช้งานได้ ','2017-03-06 13:35:00','2017-03-06 14:00:00','ทำการตรวจเช็ค เครื่องสเเกน เเละ อัพเดทโปรเเกรม เครื่องสเเกนใหม่ ทั้งหมด ','100','success','49','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('348','2017-03-06 08:35:00','พิมพ์รายชื่อ จากระบบ Admission คัดตรงจากพื้นที่ เพิ่มเติม','2017-03-06 08:35:00','2017-03-06 08:45:00','พิมพ์รายชื่อ จากระบบ Admission คัดตรงจากพื้นที่ เพิ่มเติม รอบ 2','0','success','4','7','200','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('349','2017-03-06 14:08:00','ประกาศรายชื่อ จากระบบ Admission คัดตรงจากพื้นที่ เพิ่มเติม รอบ 2','2017-03-06 14:08:00','2017-03-06 14:18:00','ประกาศ รายชื่อ จากระบบ Admission คัดตรงจากพื้นที่ เพิ่มเติม รอบ 2','0','success','38','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('350','2017-03-06 13:10:00','ประชาสัมพันธ์ หน้าเว็บ กำหนดการสอบ สบช. มอ.','2017-03-06 13:15:00','2017-03-06 13:35:00','ประชาสัมพันธ์ หน้าเว็บ กำหนดการสอบ สบช. มอ.','0','success','18','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('351','2017-03-07 08:30:00','-','','2017-03-07 16:00:00','จัดประชุม อาจาร ','0','success','74','5','56','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('352','2017-03-07 09:30:00','โปรเเกรม IDM ไมสามารภ ดาวโหลด ไฟล์งานได้ ','2017-03-07 09:35:00','2017-03-07 10:00:00','ทำการถอดโปรเเกรม ออก เเละ อัพเดทโปรเเกรมใหม่ ','100','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('353','2017-03-08 09:10:00','เครื่องค้าง ไม่สามารถ เข้าใช้งานได้ ','2017-03-08 09:15:00','2017-03-08 11:30:00','ทำตรวจสอบ ระบบ OS ใหม่ เเละ ลงโปรเเกรมใหม่ ','300','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('354','2017-03-09 09:00:00','ระบบ OS เครื่องMac มีปัญหา ไม่สามารถ ใช้งานได้ ','2017-03-09 09:05:00','2017-03-09 11:20:00','ทำการลง ระบบปฏิบัติการ ใหม่ เเละ โปรเเกรม ใหม่ 

จำนวน 2 เครื่อง ','600','success','74','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('355','2017-03-09 13:10:00','เครื่อง โน็ตบุ็ค มีปัญหา ไม่สามารถ ใช้งานได้ ในการดาวโหลด ','2017-03-09 13:15:00','2017-03-09 13:30:00','ทำการ ลง ซีเรียส ใหม่ เพือ ต่ออายุ ในารทำงาน ','100','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('356','2017-03-09 14:10:00','เครื่องตรวจข้อสอบมีปัญหา เเละไมาสามารถ ใช้งานอินเตอร์เน็ต ได้ ','2017-03-09 14:15:00','2017-03-09 15:00:00','ทำการลงได้เวอร์ เครื่องตรวจข้อสอบใหม่ เเละ อัพเดทตัว เบาร์เซอร์ ใหม่ ','100','success','68','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('357','2017-03-10 08:59:00','ไปดูห้องหุ่น เพือขนย้าย ที่นอน เเละ เปลี่ยนสถานที่
','2017-03-10 09:05:00','2017-03-10 09:30:00','-','0','success','74','8','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('358','2017-03-10 09:35:00','เครื่องโน็ตบุค ไม่สามารถ เข้าใช้งานได้ เเละ เครื่องปริ้น ไม่สามารถ ใช้งาน ได้ ','2017-03-10 09:40:00','2017-03-10 10:10:00','ทำการตรวจเช็ค ไดเวอร์ เเละ โปรเเกรม ที่ใช้งาน ','200','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('359','2017-03-13 13:50:00','ประชาสัมพันธ์ เรื่อง ขออนุญาติให้บัณฑิตที่จบการศึกษา ในปีการศึกษา 2558 เข้ารับพระราชทานปริญญาบัตรและประกาศนียบัตร','2017-03-13 13:55:00','2017-03-13 14:04:00','เพิ่มประชาสัมพันธ์ 1 ไฟล์','0','success','31','11','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('360','2017-03-13 13:30:00','ประชาสัมพันธ์ ประกาศ รายชื่อนักศึกษาใหม่ ในระบบคัดตรงจากพื้นที่ (รอบ 2) ปีการศึกษา 2560 ณ วิทยาลัยพยาบาลบรมราชชนนี ยะลา  ','2017-03-13 13:35:00','2017-03-13 13:45:00','เพิ่มประชาสัมพันธ์ 1ไฟล์','0','success','38','11','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('361','2017-03-14 09:00:50','ขอใช้ห้องประชุมจินดา ถิระพันธ์ วันที่ ๑๖ และ ๒๓ มีนาคม ๒๕๖๐ เวลา ๑๓.๐๐ ถึง ๑๖.๐๐ และวันที่ ๒๔ มีนาคม ๒๕๖๐ เวลา ๑๗.๐๐ ถึง ๑๘.๐๐ น
ขอใช้ ืnot book 1 ตัว เครื่องเสียง ไมลลอย 2 ตัว โปรเจคเตอร์ กล้องถ่ายรูป 1 ส่วนวันที่ ๒๔ ใช้แค่ไมล์ลอย 2 ตัวคะ','2017-03-14 09:00:00','2017-03-14 13:00:00','ดำเนินการเสร็จเรียบร้อยแล้ว','0','success','33','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('362','2017-03-07 10:00:00','ขอใช้อุปกรณ์โสตฯ note book  2017-03-07 14:00 เป็นต้นไป ประชุมเรื่องขั้นขึ้นเงินเดือน ห้องประชุมดอกบัว','2017-03-07 09:00:00','2017-03-07 09:00:00','ดำเนินการเสร็จเรียบร้อย','0','success','40','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('363','2017-03-09 09:00:00','ขับรถแทน ยะยา เนื่องจากไม่มี พขร.ขับรถอยู่
ขับแทน','2017-03-09 00:00:00','2017-03-09 00:00:00','ดำเนินการเสร็จเรียบร้อย','0','success','43','7','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('364','2017-03-06 08:00:00','ขอใช้อุกรณ์โสตฯ ในห้อง confonrence 9702
2017-03-06 13.:00-16.00 น.','2017-03-06 08:00:00','2017-03-08 08:00:00','ดำเนินการเสร็จเรียบร้อย','0','success','27','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('365','2017-03-06 08:00:00','ขอใช้อุกรณ์โสตฯ ในห้อง ประชุมจงจิต
2017-03-06 13.:00-16.00 น.','2017-03-08 08:00:00','2017-03-08 08:00:00','ดำเนินการเสร็จเรียบร้อย','0','success','13','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('366','2017-03-09 10:00:00','ขอใช้อุกรณ์โสตฯ ในห้อง ดอกแก้ว
2017-03-06 08.:00-16.00 น.','2017-03-09 09:00:00','2017-03-09 09:00:00','ดำเนินการเสร็จเรียบร้อย','0','success','18','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('367','2017-03-13 08:30:00','','','2017-03-13 16:00:00','จัเตรียมอุปกรณ์ เเละ เดินสายเเลน ','0','success','74','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('368','2017-03-14 08:00:00','-','','2017-03-14 16:00:00','ควบคุมเครื่องเสียง เเละ ถ่ายภาพ ','0','success','74','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('369','2017-03-15 09:00:00','เครื่องสเเกน เเละ เครื่องปริ้นเตอร์ ปริ้นไม่ออก ','2017-03-15 09:15:00','2017-03-15 10:00:00','ทำการตรวจเช็ค ไดเวอร์ เเละ สายเชือมต่อ ว่า ใช้งานได้ไหม ','100','success','49','4','10','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('370','2017-03-15 13:00:00','เพาว์เวอร์ซัฟไพ ไม่สามารถ ใช้งานได้ ','2017-03-15 13:05:00','2017-03-15 13:30:00','ทำการเปลี่ยนเพาเวอร์ซัฟไพ ใหม่  ใหม่ ','200','success','24','4','36','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('371','2017-03-15 13:20:00','ฝ่ายบริการวิชาการ และกิจการนักศึกษา/งานพัฒนานักศึกษาและทำนุบำรุงศิลปวัฒนธรรม  ','2017-03-15 13:25:00','2017-03-15 13:45:00','ทำ LINK งานใหม่','0','success','36','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('372','2017-03-15 13:45:00','ประชาสัมพันธ์ เรื่อง ตารางกิจกรรมนักศึกษา/กิจกรรมเสริมหลักสูตร ปีการศึกษา ๒๕๕๙ ','2017-03-15 13:50:00','2017-03-15 14:05:00','ประชาสัมพันธ์ 1 ไฟล์','0','success','36','11','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('373','2017-03-16 09:00:00','-','2017-03-16 09:15:00','2017-03-16 09:30:00','จัดเตรียม โน็ตบุ๊ค เพือการประชุม ','0','success','40','5','56','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('374','2017-03-16 09:40:00','-','2017-03-09 09:45:00','2017-03-16 10:00:00','ติดป้ายวายนิล  ในการจัดอบรม ','0','success','35','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('375','2017-03-20 08:00:00','จอภาพในห้องเรียน ไม่สามารถ ใช้งานได้ ','2017-03-20 08:05:00','2017-03-20 08:30:00','ทำการ ปรับเเต่ง ตรงที่ม้วนผ้า ขึน ใหม่ ','100','success','15','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('376','2017-03-20 09:05:42','ขอใช้เครื่องฉายทึบแสง ณ ห้องประชุมอุบลรัตน์ ฯ (ห้องประชุมชั้น ๒ อาคาร ๙ ชั้น )2017-03-20 เวลา ๑๓.๐๐ น.','','','','0','success','9','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('377','2017-03-20 13:30:00','ขอใช้เครื่องฉายทึบแสง ณ ห้องประชุม อุบลรัตน์ (ชั้น ๒ อาคาร ๙ ชั้น)2017-03-23  เวลา ๑๓.๓๐ น.','','','','0','success','9','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('378','2017-03-21 08:00:00','-','','2017-03-21 12:00:00','จัดเตรียม หุ่นซิม เพือ ให้เด็ก ทดสอบ ','0','success','13','5','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('379','2017-03-21 13:05:00','-','','2017-03-21 13:20:00','ติดตั้งโน็ตบุค เเละ เครื่องฉายทึบเเสง ในห้องประชุม ดอก ','0','success','18','5','53','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('380','2017-03-21 13:30:00','เครื่องปริ้นๆม่สามารถ ปริ้นงานได้ เเละ ดาวโหลด งานไม่ได้ ','2017-03-21 13:35:00','2017-03-21 13:50:00','ทำการลง ไดร์เวอร์ เเละ อัพเดทโปรเเกรมใหม่ ','0','success','55','4','24','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('381','2017-03-23 08:00:00','เครื่องไม่สามารถ ปริ้นงานได้ เเละ ดาวโหลดไม่ได้ ','2017-03-23 08:05:00','2017-03-23 08:20:00','ทำการตรวจเช็คสายต่อพวงเเละ ไดเวอร์ เเละ อัพเดท โปรเเกรมใหม่ ','0','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('382','2017-03-23 09:05:00','เครื่องไม่สามารถ ออก อินเตอร์ ได้ เเละ เครื่องปริ้นไม่สามารถ ใช้งานได้ ','2017-03-23 09:10:00','2017-03-23 09:30:00','ทำการตรวจเช็ค สายต่อพวง เเละ สายอินเตอร์ ','0','success','52','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('383','2017-03-21 08:00:00','ขอใช้อุปกรณ์โสตฯ จัดนิทรรศการและนำเสนอโครงการจริยธรรม 2017-03-21 12:00-16.00น.
ณ โรงอาหารเก่า','2017-03-21 11:00:00','2017-03-21 12:00:00','ดำเนินการติดตั้งเสร็จเรียบร้อย','0','success','36','9','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('384','2017-03-30 10:01:16','ต้องการเครื่อง Notebook จำนวน 1 เครื่อง และ printer Inkjet คุณภาพสูง ','','','','0','process','1','3','3','1');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('385','2017-04-04 08:00:00','อินเตอร์เน็ตเข้าไม่ในห้องเรียน ชัน4','2017-04-04 08:15:00','2017-04-04 08:30:00','ตรวจสอบสายเเลน ว่าเกิดปัญหา ลวม ไหม เเละ โปรเเกรม มีปัญหา ไหม ','0','success','9','4','172','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('386','2017-04-04 08:15:00','ทำแบบประเมิน การใช้อินเตอร์เน็ต และ การใช้ระบบแจ้งซ่อม','2017-04-04 08:35:00','2017-04-04 10:15:00','','0','success','4','6','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('387','2017-03-20 08:00:00','ประชุม 21 - 24 มี.ค.60','2017-03-21 08:00:00','2017-03-24 20:30:00','ประชุม 21 - 24 มี.ค.60
ที่ วพบ สงขลา','0','success','15','5','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('388','2017-04-05 13:08:00','ปรับ หน้าเว็บ เพิ่ม ประกาศ 2 รายการ','2017-04-05 13:10:00','2017-04-05 15:08:00','ปรับ หน้าเว็บ เพิ่ม ประกาศ 2 รายการ','0','success','42','11','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('389','2017-04-10 08:20:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด ','2017-04-10 08:30:00','2017-04-10 08:45:00','ทำตรวจเช็ค เพาเวอร์ซัฟไฟ เเละ สายไฟ ','100','success','41','4','1','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('390','2017-04-10 08:45:00','เครื่องเสียงไม่สามารถใช้งานได้ ','2017-04-10 08:50:00','2017-04-10 08:55:00','ทำตรวจเช็คเครื่องเสียง เเละไมล์ ','100','success','81','7','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('391','2017-04-10 08:16:03','ผล ประเมิน','2017-04-10 08:17:03','2017-04-10 09:25:00','ความพึงพอใจการใชบริการ ด้านเทคโนโลยีสารสนเทศ  (การตอบกลับ)','0','success','4','6','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('392','2017-04-11 08:25:28','ปรับปรุง หน้าเว็บ','2017-04-11 08:45:00','2017-04-11 09:19:00','ถอนประชาสัมพันธ์ ออก 3 ไฟล์','0','success','42','8','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('393','2017-04-11 08:30:00','เครื่องคอมพิวเตอร์ ไม่สามารถ เปิดโปรเเกรมได้ ','2017-04-11 08:35:00','2017-04-11 08:15:00','ทำการอัพเดทโปรเเกรมใหม่ ','100','success','49','1','10','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('394','2017-04-11 09:00:00','เเรม ร้อง เครื่องเปิดไม่ปิด ','2017-04-11 09:05:00','2017-04-11 09:30:00','ทำการขัดเเรม ใหม่ ','100','success','46','2','23','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('395','2017-04-11 10:00:00','ใช้งานเพือการประชุมจัดอบรม ','2017-04-11 10:05:00','2017-04-11 10:15:00','-','0','success','29','9','53','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('396','2017-04-11 10:22:27','ขอใช้คอมพิวเตอร์ห้องประชุมชั้น 3 ','','','(ในช่องปัญหา) การแจ้งใช้ กรุณาแจ้ง ให้ครบนะครับ วัน เวลา สถานที่ใช้ อุปกรณ์ที่ต้องการ (ในช่องปัญหา) หรือ ให้ งาน IT ทำอะไรเพิ่มเติม พิมพ์เพิ่มเติมได้ ในช่องปัญหา
แจ้งก่อน สัก 1 - 2 วัน หรือ ก่อนหลายวันก็ได้ครับ 
ส่วน รายการนี้ จะแก้ไม่ได้แล้ว กรุณาแจ้งใหม่ครับ   เพื่อการบริการที่ดี และ เพื่อภายหน้าพัฒนาระบบเพิ่มเติม ขอบคุณครับ','0','success','30','7','','1');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('397','2017-04-12 11:20:49','ขอรบกวนช่วยลงไฟล์เอกสารในเว็บไซต์วิทยาลัย ฝ่ายวิชาการ งานพัฒนาหลักสูตรฯ เอกสารจะส่งไปในเมลแบซีค่ะ','2017-04-18 09:05:00','2017-04-18 09:40:00','เพิ่มไฟล์ประชาสัมพันธ์ 4 ไฟล์','0','success','34','11','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('398','2017-04-18 09:48:00','เข้าเน็ตไม่ได้','2017-04-18 09:52:00','2017-04-18 10:10:00','ลองเปลี่ยน ตัว connect wifi','0','success','25','1','172','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('399','2017-04-18 10:10:00','ประชาสัมพันธ์','2017-04-18 10:10:00','2017-04-18 10:25:00','เพิ่ม 1 ไฟล์','0','success','41','11','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('400','2017-04-18 08:30:00','เครื่องโน็ตบุค ค้าง  เเละ ใช้งานอินเตอร์ไม่ได้ ','2017-04-19 08:45:00','2017-04-18 10:00:00','ทำการตรวจเช็คโปรเเกรม เเละ วินโด เเละเเก้ไข','200','success','3','4','6','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('401','2017-04-18 13:15:00','โปรเเกรม สเเกรน ไม่สามารถใช้งานได้ ','2017-04-18 13:25:00','2017-04-18 13:40:00','ทำการลงโปรเเกรมสเเกน ใหม่ ','100','success','49','1','10','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('402','2017-04-19 09:15:27','ขอเจ้าหน้าที่ อัดวิดิโอ และถ่ายภาพ ในการติวนักศึกษาพยาบาลศาสตร์ปี 4  รายวิชาการพยาบาลผู้สูงอายุ  โดย ดร รจนา วิริยะสมบัติ  จากวิทยาลัยพยาบาลบรมราชชนนี  สงขลา ในวันเสาร์ ที่ 22 เมษายน 2560 
 เวลา 9.00 -12.00 น  ห้องเรียนชั้น 4  ','','','','0','wait','14','5','','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('403','2017-04-20 08:30:00','เครื่องคอมไม่มีฟอน ที่จำใช้ทำงาน เเบบลวดลาย ','2017-04-20 08:45:00','2017-04-20 09:00:00','ทำการดาวโหลด ฟอน มาใส่ ','100','success','64','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('404','2017-04-20 13:05:00','เครื่องคอมพิวเตอร์ เปิดไม่ติด ','2017-04-20 13:10:00','2017-04-20 13:30:00','ทำการตรวจเช็ค สายไฟ เเละ เครื่องคอมพิวเตอร์ ','300','success','40','4','','2');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('405','2017-04-20 14:40:40','ขอใช้อุปกรณ์สื่อโสตในการประกอบการจัดประชุมหลักสูตรเฉพาะทางการพยาบาลผู้ป่วยวิกฤต รุ่นที่ 2 
ตั้งแต่วันที่ 1 พฤษภาคม ถึงวันที่ 16 มิถุนายน 2560 ตั้งแต่เวลา 08.00-16.30 น. โดยอุปกรณ์ดังกล่าวเตรียมใช้ที่ห้องประชุมชิดกานต์ ซึ่งขอใช้อุปกรณ์ดังนี้
1. คอมพิวเตอร์โน๊ตบุค+โปรเจ็คเตอร์ 1 เครื่องสำหรับบรรยาย
2. เครื่องฉายทึบแสง 1 
3. ไมโครโฟน ตั้งโต๊ะบรรยาย 1 ตัว ไมลอย 2 ตัว  
4. ขอเจ้าหน้าที่ประจำห้อง
หมายเหตุ วันที่ 1 พฤษภาคม พิธีเปิด ช่วงเช้า 
','','','','0','wait','20','5','210','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('406','2017-04-20 15:01:32','ขอใช้อุปกรณ์สื่อโสตในกิจกรรมสัมมนาในหลักสูตรเฉพาะทางการพยาบาลผู้ป่วยวิกฤต รุ่นที่ 2 
ในวันที่ 21 สิงหาคม  2560 ตั้งแต่เวลา 08.00-16.30 น. โดยอุปกรณ์ดังกล่าวเตรียมใช้ที่ห้องประชุมชิดกานต์ ซึ่งขอใช้อุปกรณ์ดังนี้
1. คอมพิวเตอร์โน๊ตบุค+โปรเจ็คเตอร์ 1 เครื่องสำหรับบรรยาย
2. เครื่องฉายทึบแสง 1 
3. ไมโครโฟน ตั้งโต๊ะบรรยาย 1 ตัว ไมลอย 2 ตัว  
4. ขอเจ้าหน้าที่ประจำห้อง','','','','0','wait','20','5','210','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('407','2017-04-20 15:07:19','ขอใช้อุปกรณ์สื่อโสตในพิธีมอบวุฒิบัตรหลักสูตรเฉพาะทางการพยาบาลผู้ป่วยวิกฤต รุ่นที่ 2 
ตั้งแต่วันที่ 22 สิงหาคม ถึงวันที่ 23 สิงหาคม 2560 ตั้งแต่เวลา 08.00-16.30 น. โดยอุปกรณ์ดังกล่าวเตรียมใช้ที่ห้องประชุมนิมัศตูรา แว ซึ่งขอใช้อุปกรณ์ดังนี้
1. คอมพิวเตอร์โน๊ตบุค+โปรเจ็คเตอร์ 1 เครื่อง
3. ไมโครโฟน ตั้งโต๊ะประธาน 1 ตัว ผู้กล่าวรายงาน 1 ตัว  
4. ขอเจ้าหน้าที่ประจำห้อง
ซ้อมวันที่ 22 รับจริงวันที่ 23 สิงหาคม 2560 ','','','','0','wait','20','5','210','6');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('408','2017-04-19 09:00:00','ประชุม คณะกรรมการปัจฉิมนิเทศและพิธีสำเร็จการศึกษา ปกศ.2559','2017-04-19 13:30:00','2017-04-19 16:00:00','เข้าร่วมประชุม','0','success','31','5','','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('409','2017-04-21 09:29:00','ประชาสัมพันธ์  รายชื่อผู้ผ่านการคัดเลือกเข้ารับการอบรมหลักสูตรการพยาบาลเฉพาะทาง
สาขาการพยาบาลผู้ป่วยวิกฤต(ผู้ใหญ่และผู้สูงอายุ) รุ่นที่ 2 ประจำปี 2560
(1 พฤษภาคม - 23 สิงหาคม 2560)','2017-04-21 09:40:00','2017-04-21 10:15:00','เพิ่ม 1 ไฟล์ ประชาสัมพันธ์ เรื่อง รายชื่อผู้ผ่านการคัดเลือกเข้ารับการอบรมหลักสูตรการพยาบาลเฉพาะทาง
สาขาการพยาบาลผู้ป่วยวิกฤต(ผู้ใหญ่และผู้สูงอายุ) รุ่นที่ 2 ประจำปี 2560
(1 พฤษภาคม - 23 สิงหาคม 2560)','0','success','19','11','42','3');
INSERT INTO `job` (`id`,`job_date`,`job_detail`,`job_start_date`,`job_success_date`,`job_how_to_fix`,`price`,`job_status`,`job_employee_id`,`job_type_id`,`device_id`,`user_id`) VALUES
('413','2017-04-24 08:30:00','-','','2017-04-24 16:00:00','ใช้ประชุม สำมนา ','0','success','13','5','53','2');



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
INSERT INTO `job_type` (`id`,`job_type_name`) VALUES
('11','ประสัมพันธ์ในเว็บวิทยาลัย');



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
('2','นายวีรยุทธ กายฤทธ','UserIT','เจ้าหน้าที่คอมพิวเตอร์','','$2y$12$sGWTLd2aFIvfFXDlFMk1GeN40gZmXGvoRD.A6z34kHaPnyn4RQ9na','1471323575','1488350186','0');
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`email`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('3','นายฮอลมีซี หะยีแวจิ','ITz','นักวิชาการคอมพิวเตอร์','','$2y$12$wMaXAdjuTreGOPmbIXsbrOK1YOQ0VYSLP46rJNl6.BQSGby3std6a','1471416784','1471487306','0');
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`email`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('4','นางสาวจงกรม ทองจันทร์','mmit','รองผู้อำนวยการฝ่ายแผนและพัฒนาคุณภาพ','','$2y$12$erdrfAFuyc8hTWcHq1/SX.tHSjz/5ihYL.J67mzsrWfbPzE7iYkHq','1475041800','1491878791','0');
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`email`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('5','นายชัยณรงค์ อาจอาสา','mit','หัวหน้างานเทคโนโลยีสารสนเทศ','','$2y$12$kut2iDmEV7rKyaAnoqpGIeG1RmrEfRx9TJOyRDo9RjvheOYWPNZOu','1475727424','1475727514','0');
INSERT INTO `user` (`id`,`fullname`,`username`,`position`,`email`,`password_hash`,`created_at`,`updated_at`,`role`) VALUES
('6','นายสำราญ เหลี่ยมสุวรรณ','AVE','นักวิชาการโสตทัศนศึกษา','','$2y$12$Coe/t4ctmCMkuMkxdlrbquSZ8wwe.wtlsT3L6t6vvm.o0C0K3f9ZK','1477627290','1490862752','0');



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
