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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('1','ห้องปฎิบัติการคอมพิวเตอร์');
INSERT INTO `department` (`id`,`department_name`) VALUES
('2','ห้องสมุด');



-- -------------------------------------------
-- TABLE DATA device_type
-- -------------------------------------------
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('1','Computer (PC)');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('2','Printer');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('3','NoteBook');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('4','Scanner');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('5','ระบบสารสนเทศ');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('6','โปรแกรม');
INSERT INTO `device_type` (`id`,`device_type`) VALUES
('7','Server');



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
('2','วีรยุท','UserIT','คอม','','$2y$12$2Dtni20HI2vc8MiBMyNZ2O1gY/nhoyJzdI/BGf01CnaW.c0RLm5Cm','1471323575','1471323575','0');



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
