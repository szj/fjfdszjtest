�ڶ�����Ϣ��ORDER_INFO�����м���λ���ƣ�balcony_name��  vachar��20��
			ORDER_INFO	����״̬	PAY_STATUS  vachar 1

sys_attribute_value �� �м�����   14  4  ����  4   87
staff_info�� accounts_password  varchar  40
staff_info�� accounts_per       varchar   2

ORDER_LIST   modify_staff_name  varchar  50
COUPON       CP_STATUS   varchar  2
order_book_info BOOK_NAME  varchar  30  ��Ȩ������

/*
MySQL Data Transfer
Source Host: 192.168.1.102
Source Database: deoa
Target Host: 192.168.1.102
Target Database: deoa
Date: 2009-6-23 9:44:22
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for kai_accounts
-- ----------------------------
DROP TABLE IF EXISTS `kai_accounts`;
CREATE TABLE `kai_accounts` (
  `id` int(10) NOT NULL,
  `kai_account` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `kai_accounts` VALUES ('1', '0');
