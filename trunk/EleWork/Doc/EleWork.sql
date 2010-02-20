-- phpMyAdmin SQL Dump
-- version 2.9.0.3
-- http://www.phpmyadmin.net
-- 
-- ����: localhost
-- ��������: 2008 �� 06 �� 20 �� 15:25
-- �������汾: 4.1.10
-- PHP �汾: 5.0.4
-- 
-- ���ݿ�: `yzapprove`
-- 
---create database elework

---drop database elework
-- --------------------------------------------------------

-- 
-- ��Ľṹ `tbdatumdepartment`
-- 

CREATE TABLE `tbdatumdepartment` (
  `TheCode` varchar(20) NOT NULL default '',
  `TheName` varchar(30) default NULL,
  `RelCode` varchar(20) default NULL,
  `ParentCode` varchar(20) default NULL,
  `Belongcode` varchar(20) default NULL,
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheCode`)
) ;

------ENGINE=MyISAM DEFAULT CHARSET=utf8
--- 
--- �������е����� `tbdatumdepartment`
---

INSERT INTO `tbdatumdepartment` (`TheCode`, `TheName`, `RelCode`, `ParentCode`, `Belongcode`, `Remark`, `TheState`, `IsUse`, `Creater`, `CreateTime`, `Stater`, `StateTime`, `Editer`, `EditeTime`) VALUES 
('001001', '������', '001', '001', '', 'Remark', 0, 0, NULL, '20080529125016', NULL, '20080528211311', NULL, '20080528211311'),
('1002', '�ܾ���', '001', '', NULL, '', 0, 0, '001', '20080608193859', '001', '20080608193859', '001', '20080608193859'),
('1003', '�г���', '001', '', NULL, '02', 0, 0, '001', '20080608193947', '001', '20080608193947', '001', '20080608193947');

-- --------------------------------------------------------

-- 
--- ��Ľṹ `tbdatumemployee`
-- 

CREATE TABLE `tbdatumemployee` (
  `TheCode` varchar(20) NOT NULL default '',
  `TheName` varchar(30) default NULL,
  `Sex` varchar(4) default NULL,
  `Address` varchar(200) NOT NULL default '',
  `EmployeTypeCode` varchar(20) default NULL,
  `CertifyTypeCode` varchar(20) default NULL,
  `CertifyCode` varchar(20) default NULL,
  `OtherRel` varchar(100) default NULL,
  `RelTelphone` varchar(20) default NULL,
  `InDate` varchar(8) default NULL,
  `OutDate` varchar(8) default NULL,
  `DepCode` varchar(20) default NULL,
  `SerialCode` varchar(20) default NULL,
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheCode`)
) ;

-- 
-- �������е����� `tbdatumemployee`
-- 

INSERT INTO `tbdatumemployee` (`TheCode`, `TheName`, `Sex`, `Address`, `EmployeTypeCode`, `CertifyTypeCode`, `CertifyCode`, `OtherRel`, `RelTelphone`, `InDate`, `OutDate`, `DepCode`, `SerialCode`, `Remark`, `TheState`, `IsUse`, `Creater`, `CreateTime`, `Stater`, `StateTime`, `Editer`, `EditeTime`) VALUES 
('001', 'ʩ��', '3', '', '1', '1001', '', '', '13599204724', '20080528', '00000000', '001001', '001', NULL, 0, 0, NULL, '20080528225118', '001', '20080607225134', '001', '20080607225134'),
('002', 'С��', '3', '  453453', '1', '1001', '123456498798', '', '', '20080603', '20080611', '001001', NULL, NULL, 0, 0, '001', '20080604230926', '001', '20080607225148', '001', '20080607225148'),
('003', 'С��', '3', '', '1', '1001', '', '', '', '20080602', '20080603', '', NULL, NULL, 0, 0, '001', '20080607225353', '001', '20080607225711', '001', '20080607225711');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `tbdatumproduct`
-- 

CREATE TABLE `tbdatumproduct` (
  `TheCode` varchar(20) NOT NULL default '',
  `TheName` varchar(30) default NULL,
  `ModelCode` varchar(20) default NULL,
  `SpecCode` varchar(20) default NULL,
  `UnitCode` varchar(20) default NULL,
  `ProductTypeCode` varchar(30) default NULL,
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheCode`)
) ;

-- 
-- �������е����� `tbdatumproduct`
-- 

INSERT INTO `tbdatumproduct` (`TheCode`, `TheName`, `SpecCode`, `UnitCode`, `ProductTypeCode`, `Remark`, `TheState`, `IsUse`, `Creater`, `CreateTime`, `Stater`, `StateTime`, `Editer`, `EditeTime`) VALUES 
('1002', '��Ʒ2', '2', '1001', '1002', '', 0, 0, '001', '20080607181930', '001', '20080607181930', '001', '20080607181930'),
('1001', '��Ʒ1', '1', '4', '1001', '', 0, 0, '001', '20080607181907', '001', '20080607181907', '001', '20080607181907');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `tssystemfunction`
-- 

CREATE TABLE `tssystemfunction` (
  `TheCode` varchar(20) NOT NULL default '',
  `TheShortCode` varchar(20) default NULL,
  `TheName` varchar(30) default NULL,
  `ParentCode` varchar(20) default NULL,
  `childflag` varchar(2) default NULL,
  `RefPage` varchar(100) default NULL,
  `Img` varchar(100) default NULL,
  `Remark` varchar(100) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheCode`)
) ;

-- 
-- �������е����� `tssystemfunction`
-- 

INSERT INTO `tssystemfunction` (`TheCode`, `TheShortCode`, `TheName`, `ParentCode`, `childflag`, `RefPage`, `Img`, `Remark`, `TheState`, `IsUse`, `Creater`, `CreateTime`, `Stater`, `StateTime`, `Editer`, `EditeTime`) VALUES 
('1003', 'YzApprove', '���ӹ���(ģ��)', '0', '1', NULL, NULL, 'Remark', 0, 0, NULL, '20080528210456', NULL, '20080528210456', NULL, '20080528210456'),
('1003Rtp', 'RtpYzApprove', '���ӹ���(����)', '0', '1', NULL, NULL, 'Remark', 0, 0, NULL, '20080529123626', NULL, '20080528210456', NULL, '20080528210456'),
('1003990', 'J_Archive', '��������', '1003', '1', NULL, NULL, 'Remark', 0, 0, NULL, '20080528210456', NULL, '20080528210456', NULL, '20080528210456'),
('100399010', 'J_DatumDepart', '���ŵ���', '1003990', '0', 'm_archive/DepartmentManage.faces', NULL, 'Remark', 0, 0, NULL, '20080529132618', NULL, '20080528210456', NULL, '20080528210456'),
('100399020', 'J_DatumEmployee', 'Ա������', '1003990', '0', 'm_archive/EmployeeManage.faces', NULL, 'Remark', 0, 0, NULL, '20080529132618', NULL, '20080528210456', NULL, '20080528210456'),
('100399030', 'J_DatumProduct', '�豸����', '1003990', '0', 'm_archive/DatumProductManage.faces', NULL, 'Remark', 0, 0, NULL, '20080529132618', NULL, '20080528210456', NULL, '20080528210456'),
('100399040', 'J_DatumProduct', '�ͻ�����', '1003990', '0', 'm_archive/DatumCopartner.faces', NULL, 'Remark', 0, 0, NULL, '20080529132618', NULL, '20080528210456', NULL, '20080528210456'),

('1003998', 'J_Subject', '�����ֵ�', '1003', '1', NULL, NULL, 'Remark', 0, 0, NULL, '20080528210456', NULL, '20080528210456', NULL, '20080528210456'),
('1003998001', 'YzApprove_SubjectApp', 'Ѳ��ά��', '1003998', '0', 'm_subject/uiPatrolReport.faces', NULL, 'Remark', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('1003998010', 'YzApprove_SubjectApp', '�����ֵ�', '1003998', '0', 'm_subject/subjectframe.faces', NULL, 'Remark', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('1003998990', 'YzApprove_SubjectApp', '�����ֵ�', '1003998', '0', 'm_subject/subjectframe.faces', NULL, 'Remark', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('1003998999', 'YzApprove_SubjectApp', 'ϵͳ�ֵ�', '1003998', '0', 'm_subject/subjectframe.faces', NULL, 'Remark', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),

('1003999', 'J_System', 'ϵͳ����', '1003', '1', NULL, NULL, 'Remark', 0, 0, NULL, '20080528210456', NULL, '20080528210456', NULL, '20080528210456'),
('1003999003', 'J_SystemGroupUser', '�û�����', '1003999', '0', 'm_system/GroupUserManage.faces', NULL, 'Remark', 0, 0, NULL, '20080529132618', NULL, '20080529130409', NULL, '20080529130409'),
('1003999002', 'J_SystemGroup', '��ɫ����', '1003999', '0', 'm_system/GroupManage.faces', NULL, 'Remark', 0, 0, NULL, '20080529132618', NULL, '20080529130409', NULL, '20080529130409'),
('1003999001', 'J_SystemFunction', '��������', '1003999', '0', 'm_system/FunctionManage.faces', NULL, 'Remark', 0, 0, NULL, '20080529132618', NULL, '20080529130409', NULL, '20080529130409'),
('1003999010', 'J_SystemFlow', '��������', '1003999', '0', 'm_system/FlowManage.faces', NULL, 'Remark', 0, 0, NULL, '20080529132618', NULL, '20080529130607', NULL, '20080529130607'),
('1003999020', 'J_SystemFlow', '�������', '1003999', '0', 'm_system/rptManage.faces', NULL, 'Remark', 0, 0, NULL, '20080529132618', NULL, '20080529130607', NULL, '20080529130607'),
('1003999990', 'J_SystemFlow', '��־����', '1003999', '0', 'm_system/logManage.faces', NULL, 'Remark', 0, 0, NULL, '20080529132618', NULL, '20080529130710', NULL, '20080529130710'),
('1003999999', 'J_SystemFlow', '�޸�����', '1003999', '', 'm_system/modifyPwd.faces', '', 'Remark', 0, 0, NULL, '20080529132618', '001', '20080606123110', '001', '20080606123110'),

('1003010', 'YzApprove_Apply', '��������', '1003', '1', NULL, NULL, 'Remark', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('1003010010', 'YzApprove_StorageApp', '�绰����', '1003010', '0', 'm_elework/uieleworkTel.faces', NULL, 'Remark', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('1003010020', 'YzApprove_StorageApp', '���ά��', '1003010', '0', 'm_elework/uieleworkoutrepair.faces', NULL, 'Remark', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('1003010030', 'YzApproveRtp_Storage', '�ڲ�ά��', '1003010', '0', 'm_elework/uieleworkrepair.faces', '', '', 0, 0, '001', '20080606090337', '001', '20080606090337', '001', '20080606090337'),
('1003010040', 'YzApproveRtp_Storage', 'Ѳ��Ǽ�', '1003010', '0', 'm_elework/uieleworkpatrol.faces', '', '', 0, 0, '001', '20080606091024', '001', '20080606091024', '001', '20080606091024'),
('1003010050', 'YzApprove_StorageApp', '����ά��', '1003010', '0', 'm_elework/uieleworkproject.faces', '', '', 0, 0, '001', '20080606091428', '001', '20080606091428', '001', '20080606091428'),

('1003020', 'YzApprove_Apply', '���Ϲ���', '1003', '1', NULL, NULL, 'Remark', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('1003020010', 'YzApprove_StorageApp', '���Ϸֲ�', '1003020', '0', 'm_Storage/uiStorage.faces', NULL, 'Remark', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('1003020020', 'YzApprove_StorageApp', '������ת', '1003020', '0', 'm_Storage/uiStorageList.faces', NULL, 'Remark', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);


--------------------------------------------------------

-- 
-- ��Ľṹ `tssystemgroup`
-- 

CREATE TABLE `tssystemgroup` (
  `TheCode` varchar(20) NOT NULL default '',
  `TheName` varchar(30) default NULL,
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheCode`)
) ;

-- 
-- �������е����� `tssystemgroup`
-- 

INSERT INTO `tssystemgroup` (`TheCode`, `TheName`, `Remark`, `TheState`, `IsUse`, `Creater`, `CreateTime`, `Stater`, `StateTime`, `Editer`, `EditeTime`) VALUES 
('001', '����Ա', '����Ա', 0, 0, '001', '20080601204029', 'fjfdszj', '20080601204029', 'fjfdszj', '20080601204029'),
('002', '����', '', 0, 0, '001', '20080607180953', '001', '20080607180953', '001', '20080607180953'),
('003', '����', '123', 0, 0, '001', '20080607203716', '001', '20080607203716', '001', '20080607203716'),
('004', 'ְԱ', '', 0, 0, '001', '20080607200203', '001', '20080607200203', '001', '20080607200203'),
('006', '�г���', '', 0, 0, '001', '20080608231053', '001', '20080608231053', '001', '20080608231053'),
('100', '����', '����ʹ��', 0, 0, '001', '20080619092357', '001', '20080619092357', '001', '20080619092357');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `tssystemgrouppower`
-- 

CREATE TABLE `tssystemgrouppower` (
  `TheCode` varchar(20) NOT NULL default '',
  `FunCode` varchar(20) NOT NULL default '',
  `FunisShow` tinyint(1) NOT NULL default '1',
  `PowerValue` varchar(20) default NULL,
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheCode`,`FunCode`)
) ;


INSERT INTO `tssystemgrouppower` (`TheCode`, `FunCode`, `FunisShow`, `PowerValue`, `Remark`, `TheState`, `IsUse`, `Creater`, `CreateTime`, `Stater`, `StateTime`, `Editer`, `EditeTime`) VALUES 
('001', '1003', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003Rtp', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003990', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '100399010', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '100399020', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '100399030', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003998', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003998010', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003998990', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003998999', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003999', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003999001', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003999002', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003999003', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('002', '1003010052', 1, '111111', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003999010', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003999020', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003999990', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003999999', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003010', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003010010', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
('001', '1003010020', 1, '111100', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- 
-- �������е����� `tssystemgrouppower`
-- 
-- --------------------------------------------------------

-- 
-- ��Ľṹ `tssystemgroupuser`
-- 

CREATE TABLE `tssystemgroupuser` (
  `TheCode` varchar(20) NOT NULL default '',
  `TheName` varchar(30) default NULL,
  `GroupCode` varchar(20) default NULL,
  `EmployeCode` varchar(20) default NULL,
  `PassWd` varchar(100) default NULL,
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheCode`)
) ;

-- 
-- �������е����� `tssystemgroupuser`
-- 

INSERT INTO `tssystemgroupuser` (`TheCode`, `TheName`, `GroupCode`, `EmployeCode`, `PassWd`, `Remark`, `TheState`, `IsUse`, `Creater`, `CreateTime`, `Stater`, `StateTime`, `Editer`, `EditeTime`) VALUES 
('001', 'fjfdszj', '001', '001', '123@123', NULL, 0, 0, NULL, '20080528215019', NULL, '20080528215019', NULL, '20080528215019'),
('002', '����', '100', '001', '111111', '', 0, 0, '001', '20080530143355', '001', '20080619092942', '001', '20080619092942'),
('003', 'root', '002', '001', '111111', '', 0, 0, '001', '20080530143620', '001', '20080619120126', '001', '20080619120126'),
('ds', 'ds', '001', '', '111111', 'sdddds', 0, 0, '001', '20080620123226', '001', '20080620123226', '001', '20080620123226');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `tssystemrecord`
-- 

CREATE TABLE `tssystemrecord` (
  `TheCode` varchar(20) NOT NULL default '',
  `TheName` varchar(30) default NULL,
  `SubjectSort` varchar(20) NOT NULL default '',
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  `flag` varchar(20) default NULL,
  PRIMARY KEY  (`TheCode`,`SubjectSort`)
);

-- 
-- �������е����� `tssystemrecord`
-- 

INSERT INTO `tssystemrecord` (`TheCode`, `TheName`, `SubjectSort`, `Remark`, `TheState`, `IsUse`, `Creater`, `CreateTime`, `Stater`, `StateTime`, `Editer`, `EditeTime`, `flag`) VALUES 
('1001', '���', '1001998990', 'SpecCode', 0, 0, '', '', '001', '20080607153343', '001', '20080607153343', 'SpecCode'),
('1002', '������λ', '1001998990', 'UnitCode��ע', 0, 0, '', '', '001', '20080604171634', '001', '20080604171634', 'UnitCode'),
('1003', '�Ա�', '1001998990', 'sexremark', 0, 0, '', '', '001', '20080604221537', '001', '20080604221537', 'Sex'),
('1004', '֤������', '1001998990', 'CertifyTypeCode', 0, 0, '', '', '001', '20080604225859', '001', '20080604225859', 'CertifyTypeCode'),
('1005', '����', '1001998990', 'EmployeTypeCode', 0, 0, '', '', '001', '20080604172516', '001', '20080604172516', 'EmployeTypeCode'),
('001', '�����Ŀ1', '1001998010', '', 0, 0, '001', '20080603231340', '001', '20080607201256', '001', '20080607201256', ''),
('1001', '001', '1001998010', '', 0, 0, '001', '20080607201340', '001', '20080607201340', '001', '20080607201340', '001'),
('001', '�����Ŀ1', '1001998999', '', 0, 0, '001', '20080603231420', '001', '20080607201256', '001', '20080607201256', ''),
('002', '����', '1001998999', '', 0, 0, '001', '20080603231429', '001', '20080607175212', '001', '20080607175212', ''),
('1400', '100', '1001998999', '', 0, 0, '001', '20080603231904', '001', '20080603231904', '001', '20080603231904', '100'),
('1006', '��Ʒ���', '1001998990', 'ProductTypeCode', 0, 0, '001', '20080604171749', '001', '20080604171749', '001', '20080604171749', 'ProductTypeCode');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `tssystemsubjectrecord`
-- 

CREATE TABLE `tssystemsubjectrecord` (
  `RowNo` int(4) NOT NULL default '0',
  `TheName` varchar(30) default NULL,
  `SubjectSort` varchar(20) NOT NULL default '',
  `TheCode` varchar(20) NOT NULL default '',
  `RemarkItem` varchar(20) NOT NULL default '',
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`RowNo`,`SubjectSort`,`TheCode`)
) ;

-- 
-- �������е����� `tssystemsubjectrecord`
-- 

INSERT INTO `tssystemsubjectrecord` (`RowNo`, `TheName`, `SubjectSort`, `TheCode`, `RemarkItem`, `TheState`, `IsUse`, `Creater`, `CreateTime`, `Stater`, `StateTime`, `Editer`, `EditeTime`) VALUES 
(1003, '��', '1001998990', '1002', '', 0, 0, '001', '20080604171537', '001', '20080604171537', '001', '20080604171537'),
(1002, '֧', '1001998990', '1002', '', 0, 0, '001', '20080604171525', '001', '20080604171525', '001', '20080604171525'),
(1001, '��', '1001998990', '1002', '', 0, 0, '001', '20080604171511', '001', '20080604171511', '001', '20080604171511'),
(100, '46456', '1001998999', '1400', '', 0, 0, '001', '20080603231916', 'fjfdszj', 'fjfdszj', '20080603231935', '20080603231935'),
(3, '��', '1001998990', '1003', '', 0, 0, '001', '20080603222051', 'fjfdszj', 'fjfdszj', '20080604221315', '20080604221315'),
(1, '50��100', '1001998990', '1001', '50��100', 0, 0, '001', '20080603222015', 'fjfdszj', 'fjfdszj', '20080604171836', '20080604171836'),
(4, '��', '1001998990', '1002', '', 0, 0, '001', '20080604171550', '001', '20080604171550', '001', '20080604171550'),
(4, '100��500', '1001998990', '1001', '100��500���', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '001', '1001998010', '1001', '001', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '20��100', '1001998990', '1001', '20��100���', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(1001, '�ֻ�', '1001998990', '1006', '', 0, 0, '001', '20080604172015', '001', '20080604172015', '001', '20080604172015'),
(1002, '���', '1001998990', '1006', '', 0, 0, '001', '20080604172032', '001', '20080604172032', '001', '20080604172032'),
(1003, '�绰��', '1001998990', '1006', '', 0, 0, '001', '20080604172052', '001', '20080604172052', '001', '20080604172052'),
(1004, '��', '1001998990', '1006', '', 0, 0, '001', '20080604172130', '001', '20080604172130', '001', '20080604172130'),
(1005, '����', '1001998990', '1006', '', 0, 0, '001', '20080604172140', '001', '20080604172140', '001', '20080604172140'),
(1001, '���֤', '1001998990', '1004', '', 0, 0, '001', '20080604172317', '001', '20080604172317', '001', '20080604172317'),
(1002, '����֤', '1001998990', '1004', '', 0, 0, '001', '20080604172327', '001', '20080604172327', '001', '20080604172327'),
(1003, '����֤', '1001998990', '1004', '', 0, 0, '001', '20080604172409', '001', '20080604172409', '001', '20080604172409'),
(2, 'Ů', '1001998990', '1003', '', 0, 0, '001', '20080604221326', '001', '20080604221326', '001', '20080604221326'),
(1, '��ʽ��', '1001998990', '1005', '', 0, 0, '001', '20080604221415', '001', '20080604221415', '001', '20080604221415'),
(2, '��ʱ��', '1001998990', '1005', '', 0, 0, '001', '20080604221445', '001', '20080604221445', '001', '20080604221445'),
(3, '�ӵ㹤', '1001998990', '1005', '', 0, 0, '001', '20080604221458', '001', '20080604221458', '001', '20080604221458'),
(6, '002', '1001998010', '1001', '002', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '003', '1001998010', '1001', '002', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);



-- 
-- ��Ľṹ `tssystemgroupuser`
-- ������λ��Ϣ

CREATE TABLE `tbDatumCopartner` (
  `TheCode` varchar(20) NOT NULL default '',
  `TheName` varchar(30) default NULL,
  `TheShortName` varchar(20) default NULL,
  `CopartnerType` varchar(20) default NULL,  
  `RelFax` varchar(20) default NULL,
  `RelTelephone` varchar(20) default NULL,
  `RelCode` varchar(20) default NULL,
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheCode`)
) ;



-------------------------------------------------------------------------
-- 
-- ��Ľṹ `tbEleworkOutRepair`
-- 
---���ά�޵�
CREATE TABLE `tbEleworkOutRepair` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `TheDate` varchar(8) default NULL,
  `RelTelephone` varchar(20) default NULL,
  `RelCode` varchar(20) default NULL,
  `ClientCode` varchar(8) default NULL,
  `FaxCode` varchar(200) default NULL,
  `WorkArray` varchar(200) default NULL,
  `IsFinally`  tinyint(1) NOT NULL default '1',
  `NoticeDate` varchar(8) default NULL,
  `TrafficeDate` varchar(8) default NULL,
  `AskDate` varchar(8) default NULL,
  `TrafficeFee` decimal(12,2) default '0.00',
  `StartDate` varchar(8) default NULL,
  `FinDate` varchar(8) default NULL,
  `ClientSign` varchar(20) default NULL,
  `CheckSign` varchar(20) default NULL,
  `EngineSign` varchar(8) default NULL,
  `ClientAttitud` varchar(200) default NULL,
  `TransferSort` varchar(20) default NULL,
  `BillSortCode` varchar(20) default NULL,
  `UseState` int(4) NOT NULL default '0',
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`)
) ;

-- --------------------------------------------------------

-- 
-- ��Ľṹ `tbEleworkOutRepairItem`
-- �ӱ�---���ά�޵�

CREATE TABLE `tbEleworkOutRepairItem` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `RowNo` int(4) NOT NULL default '0',
  `ListNo` varchar(20) default NULL,
  `ProductCode` varchar(20) default NULL,
  `ProductSort` varchar(20) default NULL,
  `Quedesc` varchar(200) default NULL,
  `Taskdesc` varchar(200) default NULL,
  `Remark` varchar(20) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`,`RowNo`)
) ;

---------------------------------------------
-- ��Ľṹ `tbEleworkOutRepairItemDetail`
-- �ӱ�---���ά�޵�
CREATE TABLE `tbEleworkOutRepairItemDetail` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `RowNo` int(4) NOT NULL default '0',
  `DetailNo` int(4) NOT NULL default '0',
  `FitCode` varchar(20) default NULL,
  `FitName` varchar(20) default NULL,
  `Number` int(4) NOT NULL default '0',
  `Price` decimal(12,2) default '0.00',
  `TotalMoney` decimal(12,2) default '0.00',
  `Remark` varchar(200) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`,`RowNo`)
) ;


-------------------------------------------------------------------------
-- 
-- ��Ľṹ `tbEleworkOutRepair`
-- 
---ά�޵�
CREATE TABLE `tbEleworkRepair` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `TheDate` varchar(8) default NULL,
  `RelTelephone` varchar(20) default NULL,
  `RelCode` varchar(20) default NULL,
  `ClientCode` varchar(8) default NULL,
  `ClientAdd` varchar(200) default NULL,
  `ServiceSortCode` varchar(200) default NULL,
  `IsFinally`  tinyint(1) NOT NULL default '1',
  `InHandOver` varchar(20) default NULL,
  `InSelfSign` varchar(20) default NULL,
  `OutHandOver` varchar(20) default NULL,
  `OutSelfSign` varchar(20) default NULL,
  `FinDate` varchar(8) default NULL,
  `ClientSign` varchar(20) default NULL,
  `CheckSign` varchar(20) default NULL,
  `EngineSign` varchar(8) default NULL,
  `ClientAttitud` varchar(200) default NULL,
  `TransferSort` varchar(20) default NULL,
  `BillSortCode` varchar(20) default NULL,
  `UseState` int(4) NOT NULL default '0',
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`)
)  ;

-- --------------------------------------------------------

-- 
-- ��Ľṹ `tbEleworkOutRepairItem`
-- �ӱ�

CREATE TABLE `tbEleworkRepairItem` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `RowNo` int(4) NOT NULL default '0',
  `ListNo` varchar(20) default NULL,
  `ProductCode` varchar(20) default NULL,
  `ProductSort` varchar(20) default NULL,
  `InDate` varchar(8) default NULL,
  `IsKeep` tinyint(1) NOT NULL default '1',
  `IsReject` tinyint(1) NOT NULL default '1',
  `Quedesc` varchar(200) default NULL,
  `Configdesc` varchar(200) default NULL,   
  `Appeardesc` varchar(200) default NULL,
  `Operdesc` varchar(200) default NULL,
  `Taskdesc` varchar(200) default NULL,
  `Remark` varchar(20) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`,`RowNo`)
)  ;


CREATE TABLE `tbEleworkRepairItemDetail` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `RowNo` int(4) NOT NULL default '0',
  `DetailNo` int(4) NOT NULL default '0',
  `FitCode` varchar(20) default NULL,
  `FitName` varchar(20) default NULL,
  `Number` int(4) NOT NULL default '0',
  `Price` decimal(12,2) default '0.00',
  `TotalMoney` decimal(12,2) default '0.00',
  `Remark` varchar(200) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`,`RowNo`)
)  ;


-------------------------------------------------------------------------
-- 
-- ��Ľṹ `tbEleworkOutRepair`
-- 
---Ѳ�쵥
CREATE TABLE `tbEleworkPatrol` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `TheDate` varchar(8) default NULL,
 
  `ClientCode` varchar(8) default NULL,
  `PatrolDate` varchar(200) default NULL,
  `IsFinally`  tinyint(1) NOT NULL default '1',
  `FinDate` varchar(8) default NULL,
  `CheckSign` varchar(20) default NULL,
  `EngineSign` varchar(8) default NULL,
  `ClientSign` varchar(20) default NULL,
  `ClientAttitud` varchar(200) default NULL,
  `TransferSort` varchar(20) default NULL,
  `BillSortCode` varchar(20) default NULL,
  `UseState` int(4) NOT NULL default '0',
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`)
) ;

-- --------------------------------------------------------

-- 
-- ��Ľṹ `tbEleworkOutRepairItem`
-- �ӱ�---Ѳ�쵥

CREATE TABLE `tbEleworkPatrolItem` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `RowNo` int(4) NOT NULL default '0',
  `ProjectCode` varchar(20) default NULL,
  `PatrolCode` varchar(20) default NULL,
  `IsNormal` varchar(20) default NULL,
  `Abnordesc` varchar(200) default NULL,
  `Remark` varchar(20) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`,`RowNo`)
) ;


-------------------------------------------------------------------------
-- 
-- ��Ľṹ `tbEleworkOutRepair`
-- 
---Ѳ�쵥
CREATE TABLE `tbStorage` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `TheDate` varchar(8) default NULL,
  `ClientCode` varchar(8) default NULL,
  `StorageCode` varchar(20) default NULL,
  `PlaceCode` varchar(20) default NULL,
  `Number`  int default NULL,
  `UseState` int(4) NOT NULL default '0',
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`)
) ;

-- --------------------------------------------------------

-- 
-- ��Ľṹ `tbEleworkOutRepairItem`
-- �ӱ�---Ѳ�쵥

CREATE TABLE `tbStorageItem` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `RowNo` int(4) NOT NULL default '0',
  `ListNo` varchar(20) default NULL,
  `ProductCode` varchar(20) default NULL,
  `productTypecode` varchar(20) default NULL,
  `AssentsCode` varchar(20) default NULL,
  `Remark` varchar(20) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`,`RowNo`)
) ;


-------------------------------------------------------------------------
-- 
-- ��Ľṹ `tbEleworkOutRepair`
-- 
---Ѳ�쵥
CREATE TABLE `tbPatrolReport` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `TheDate` varchar(8) default NULL,
  `ProjectCode` varchar(20) default NULL,
  `ProjectName` varchar(30) default NULL,
  `UseState` int(4) NOT NULL default '0',
  `Remark` varchar(20) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`)
)  ;

-- --------------------------------------------------------

-- 
-- ��Ľṹ `tbEleworkOutRepairItem`
-- �ӱ�---Ѳ�쵥

CREATE TABLE `tbPatrolReportItem` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `BillNo` varchar(20) NOT NULL default '',
  `RowNo` int(4) NOT NULL default '0',
  `PatrolCode` varchar(20) default NULL,
  `ReportContent` varchar(20) default NULL,
  `RowTheState` tinyint(1) NOT NULL default '1',
  `Remark` varchar(20) default NULL,
  PRIMARY KEY  (`TheSeqn`,`BillNo`,`RowNo`)
) ;







-- --------------------------------------------------------

-- 
-- ��Ľṹ `tbstorageflowlog`
-- 

CREATE TABLE `tbStorageList` (
  `TheSeqn` int(12) unsigned NOT NULL auto_increment,
  `ListNo` varchar(20) NOT NULL default '',
  `SerialNO` int(4) NOT NULL default '0',
  `BillNo` varchar(20) NOT NULL default '',
  `BillSort` varchar(20) default NULL,
  `RepaireCode` varchar(20) default NULL,
  `RepaireDate` varchar(8) default NULL,
  `TheState` int(4) NOT NULL default '0',
  `IsUse` int(4) NOT NULL default '0',
  `Creater` varchar(20) default NULL,
  `CreateTime` varchar(14) default NULL,
  `Stater` varchar(20) default NULL,
  `StateTime` varchar(14) default NULL,
  `Editer` varchar(20) default NULL,
  `EditeTime` varchar(14) default NULL,
  PRIMARY KEY  (`TheSeqn`,`ListNo`,`SerialNO`)
) ;