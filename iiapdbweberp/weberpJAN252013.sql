-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 23, 2013 at 02:29 PM
-- Server version: 5.5.29
-- PHP Version: 5.3.10-1ubuntu3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `weberpold`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountgroups`
--

CREATE TABLE IF NOT EXISTS `accountgroups` (
  `groupname` char(30) NOT NULL DEFAULT '',
  `sectioninaccounts` int(11) NOT NULL DEFAULT '0',
  `pandl` tinyint(4) NOT NULL DEFAULT '1',
  `sequenceintb` smallint(6) NOT NULL DEFAULT '0',
  `parentgroupname` varchar(30) NOT NULL,
  PRIMARY KEY (`groupname`),
  KEY `SequenceInTB` (`sequenceintb`),
  KEY `sectioninaccounts` (`sectioninaccounts`),
  KEY `parentgroupname` (`parentgroupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accountgroups`
--

INSERT INTO `accountgroups` (`groupname`, `sectioninaccounts`, `pandl`, `sequenceintb`, `parentgroupname`) VALUES
('Accounts Payable', 101, 0, 1800, ''),
('Accounts Receivable', 10, 0, 1200, ''),
('Accumulated Depreciation', 70, 0, 1600, ''),
('Advances to Affiliates', 10, 0, 1011, ''),
('BBQs', 5, 1, 6000, 'Promotions'),
('Cash', 10, 0, 1100, ''),
('Cost of Goods Sold', 2, 1, 5000, ''),
('Cost of Sales', 2, 1, 2400, ''),
('Current Assets', 20, 0, 1000, ''),
('Equity', 50, 0, 3000, ''),
('Equity-does not close', 111, 0, 200, ''),
('Equity-gets closed', 112, 0, 2200, ''),
('Equity-Retained Earnings', 111, 0, 2100, ''),
('Expenses', 80, 1, 2500, ''),
('Fixed Assets', 10, 0, 1500, ''),
('Giveaways', 5, 1, 6000, 'Promotions'),
('Income', 1, 0, 2300, ''),
('Income Tax', 5, 1, 9000, ''),
('Inventory', 10, 0, 1300, ''),
('Liabilities', 30, 0, 2000, ''),
('Marketing Expenses', 5, 1, 6000, ''),
('Operating Expenses', 5, 1, 7000, ''),
('Other Assets', 90, 0, 1700, ''),
('Other Current Assets', 60, 0, 1400, ''),
('Other Current Liabilities', 101, 0, 1900, ''),
('Other Revenue and Expenses', 5, 1, 8000, ''),
('Outward Freight', 2, 1, 5000, 'Cost of Goods Sold'),
('Promotions', 5, 1, 6000, 'Marketing Expenses'),
('Revenue', 1, 1, 4000, ''),
('Sales', 1, 1, 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `accountsection`
--

CREATE TABLE IF NOT EXISTS `accountsection` (
  `sectionid` int(11) NOT NULL DEFAULT '0',
  `sectionname` text NOT NULL,
  PRIMARY KEY (`sectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accountsection`
--

INSERT INTO `accountsection` (`sectionid`, `sectionname`) VALUES
(1, 'Income'),
(2, 'Cost Of Sales'),
(5, 'Overheads'),
(10, 'Current Assets'),
(20, 'Amounts Receivable'),
(30, 'Amounts Payable'),
(50, 'Financed By'),
(60, 'Other Current Assets'),
(70, 'Fixed Assets'),
(80, 'Expenses'),
(90, 'Other Assets'),
(100, 'Assets'),
(101, 'Current Liabilties'),
(110, 'Other Current Liabilities'),
(111, 'Equity'),
(112, 'Beginning Balance Equity');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE IF NOT EXISTS `areas` (
  `areacode` char(3) NOT NULL,
  `areadescription` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`areacode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assetmanager`
--

CREATE TABLE IF NOT EXISTS `assetmanager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `location` varchar(15) NOT NULL DEFAULT '',
  `cost` double NOT NULL DEFAULT '0',
  `depn` double NOT NULL DEFAULT '0',
  `datepurchased` date NOT NULL DEFAULT '0000-00-00',
  `disposalvalue` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `audittrail`
--

CREATE TABLE IF NOT EXISTS `audittrail` (
  `transactiondate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userid` varchar(20) NOT NULL DEFAULT '',
  `querystring` text,
  KEY `UserID` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audittrail`
--

INSERT INTO `audittrail` (`transactiondate`, `userid`, `querystring`) VALUES
('2013-01-17 19:52:47', 'admin', 'UPDATE config\n				SET confvalue=''2013-01-17''\n				WHERE confname=''DB_Maintenance_LastRun'''),
('2013-01-17 19:52:47', 'admin', 'DELETE FROM audittrail\n						WHERE  transactiondate &lt;= ''2012-12-17'''),
('2013-01-21 11:14:39', 'admin', 'UPDATE www_users SET lastvisitdate=''2013-01-21 11:14:39''\n							WHERE www_users.userid=''admin'''),
('2013-01-22 16:09:25', 'admin', 'INSERT INTO accountsection (sectionid,\n											sectionname\n										) VALUES (\n											60,\n											''Other Current Assets'')'),
('2013-01-22 16:20:12', 'admin', 'INSERT INTO accountsection (sectionid,\n											sectionname\n										) VALUES (\n											70,\n											''Fixed Assets'')'),
('2013-01-22 16:20:29', 'admin', 'INSERT INTO accountsection (sectionid,\n											sectionname\n										) VALUES (\n											80,\n											''Expenses'')'),
('2013-01-22 16:20:39', 'admin', 'INSERT INTO accountsection (sectionid,\n											sectionname\n										) VALUES (\n											90,\n											''Other Assets'')'),
('2013-01-22 16:20:48', 'admin', 'INSERT INTO accountsection (sectionid,\n											sectionname\n										) VALUES (\n											100,\n											''Assets'')'),
('2013-01-22 16:21:04', 'admin', 'INSERT INTO accountsection (sectionid,\n											sectionname\n										) VALUES (\n											101,\n											''Current Liabilties'')'),
('2013-01-22 16:21:35', 'admin', 'INSERT INTO accountsection (sectionid,\n											sectionname\n										) VALUES (\n											110,\n											''Other Current Liabilities'')'),
('2013-01-22 16:21:43', 'admin', 'INSERT INTO accountsection (sectionid,\n											sectionname\n										) VALUES (\n											111,\n											''Equity'')'),
('2013-01-22 16:21:56', 'admin', 'INSERT INTO accountsection (sectionid,\n											sectionname\n										) VALUES (\n											112,\n											''Beginning Balance Equity'')'),
('2013-01-22 16:29:07', 'admin', 'INSERT INTO tags values(NULL, ''CIA Review'')'),
('2013-01-22 16:29:22', 'admin', 'INSERT INTO tags values(NULL, ''Public run seminar'')'),
('2013-01-22 16:29:30', 'admin', 'INSERT INTO tags values(NULL, ''In house seminar'')'),
('2013-01-22 16:30:36', 'admin', 'INSERT INTO tags values(NULL, ''Certification - CIA P1'')'),
('2013-01-22 16:30:43', 'admin', 'INSERT INTO tags values(NULL, ''Certification - CIA P2'')'),
('2013-01-22 16:30:50', 'admin', 'INSERT INTO tags values(NULL, ''Certification - CIA P3'')'),
('2013-01-22 16:30:56', 'admin', 'INSERT INTO tags values(NULL, ''Certification - CIA P4'')'),
('2013-01-22 16:31:06', 'admin', 'INSERT INTO tags values(NULL, ''Certification - CIA P4c'')'),
('2013-01-22 16:31:19', 'admin', 'INSERT INTO tags values(NULL, ''Certification - Reg. fees'')'),
('2013-01-22 16:31:30', 'admin', 'INSERT INTO tags values(NULL, ''Certification - CRMA'')'),
('2013-01-22 16:31:39', 'admin', 'INSERT INTO tags values(NULL, ''Certification - CCSA'')'),
('2013-01-22 16:31:47', 'admin', 'INSERT INTO tags values(NULL, ''Certification - CFSA'')'),
('2013-01-22 16:31:52', 'admin', 'INSERT INTO tags values(NULL, ''Membership'')'),
('2013-01-22 16:31:59', 'admin', 'INSERT INTO tags values(NULL, ''Jounal'')'),
('2013-01-22 16:32:11', 'admin', 'UPDATE tags SET tagdescription=''Journal'' \n		WHERE tagref=''14'''),
('2013-01-22 16:32:23', 'admin', 'INSERT INTO tags values(NULL, ''Books'')'),
('2013-01-22 16:32:32', 'admin', 'INSERT INTO tags values(NULL, ''Annual Convention'')'),
('2013-01-22 16:32:37', 'admin', 'INSERT INTO tags values(NULL, ''Internal Affairs'')'),
('2013-01-22 16:32:44', 'admin', 'INSERT INTO tags values(NULL, ''Tripartite'')'),
('2013-01-22 16:34:42', 'admin', 'UPDATE accountgroups SET groupname=''Fixed Assets'',\n										sectioninaccounts=''10'',\n										pandl=''0'',\n										sequenceintb=''1500'',\n										parentgroupname=''''\n									WHERE groupname = ''Fixed Assets'''),
('2013-01-22 16:35:27', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Equity-does not close'',\n											''111'',\n											''200'',\n											''0'',\n											'''')'),
('2013-01-22 16:37:03', 'admin', 'UPDATE accountsection SET sectionname=''Current Assets''\n				WHERE sectionid = 10'),
('2013-01-22 16:37:56', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Advances to Affiliates'',\n											''10'',\n											''1011'',\n											''0'',\n											'''')'),
('2013-01-22 16:38:46', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Cash'',\n											''10'',\n											''1100'',\n											''0'',\n											'''')'),
('2013-01-22 16:39:13', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Accounts Receivable'',\n											''10'',\n											''1200'',\n											''0'',\n											'''')'),
('2013-01-22 16:45:03', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Inventory'',\n											''10'',\n											''1300'',\n											''0'',\n											'''')'),
('2013-01-22 16:45:46', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Other Current Assets'',\n											''60'',\n											''1400'',\n											''0'',\n											'''')'),
('2013-01-22 16:46:31', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Accumulated Depreciation'',\n											''70'',\n											''1600'',\n											''0'',\n											'''')'),
('2013-01-22 16:47:02', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Other Assets'',\n											''90'',\n											''1700'',\n											''0'',\n											'''')'),
('2013-01-22 16:48:17', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Expenses'',\n											''80'',\n											''2500'',\n											''1'',\n											'''')'),
('2013-01-22 16:48:23', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Accounts Payable'',\n											''101'',\n											''1800'',\n											''0'',\n											'''')'),
('2013-01-22 16:49:24', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Other Current Liabilities'',\n											''101'',\n											''1900'',\n											''0'',\n											'''')'),
('2013-01-22 16:49:26', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Cost of Sales'',\n											''2'',\n											''2400'',\n											''1'',\n											'''')'),
('2013-01-22 16:50:10', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Equity-Retained Earnings'',\n											''111'',\n											''2100'',\n											''0'',\n											'''')'),
('2013-01-22 16:50:41', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Equity-gets closed'',\n											''112'',\n											''2200'',\n											''0'',\n											'''')'),
('2013-01-22 16:51:08', 'admin', 'INSERT INTO accountgroups ( groupname,\n											sectioninaccounts,\n											sequenceintb,\n											pandl,\n											parentgroupname\n										) VALUES (\n											''Income'',\n											''1'',\n											''2300'',\n											''0'',\n											'''')'),
('2013-01-22 16:53:26', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1002'',\n							''CASH ON HAND'',\n							''Cash'')'),
('2013-01-22 16:54:26', 'admin', 'UPDATE chartmaster SET accountname=''CASH ON HAND'',\n						group_=''Cash''\n				WHERE accountcode =''1002'''),
('2013-01-22 16:54:38', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1002'''),
('2013-01-22 16:54:38', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1002'''),
('2013-01-22 16:54:54', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1001'',\n							''CASH ON HAND'',\n							''Cash'')'),
('2013-01-22 16:55:05', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1002'',\n							''PETTY CASH FUND'',\n							''Cash'')'),
('2013-01-22 16:59:27', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''8001'',\n							''INCOME TAX EXPENSE'',\n							''Expenses'')'),
('2013-01-22 17:00:24', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1010'''),
('2013-01-22 17:00:24', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1010'''),
('2013-01-22 17:01:44', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1010'',\n							''CIB-BPI PESO ACCT#3561-0030-08'',\n							''Cash'')'),
('2013-01-22 17:06:02', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1011'',\n							''CIB-BPI USD$Accnt#3564-0058-26'',\n							''Cash'')'),
('2013-01-22 17:07:52', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1012'',\n							''CIB-BPI USD$Accnt#0454-0137-78'',\n							''Cash'')'),
('2013-01-22 17:08:28', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1020'''),
('2013-01-22 17:08:28', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1020'''),
('2013-01-22 17:08:49', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1020'',\n							''CIB-CBC PESOACCNT#124-042011-9'',\n							''Cash'')'),
('2013-01-22 17:09:14', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1025'',\n							''CIB-CBC CONVENTION #042841-2	'',\n							''Cash'')'),
('2013-01-22 17:09:29', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''8000'',\n							''Sundry/Suspense Acct'',\n							''Expenses'')'),
('2013-01-22 17:11:04', 'admin', 'UPDATE bankaccounts SET bankaccountname=''Cheque Account'',\n											bankaccountcode=''12445'',\n											bankaccountnumber=''124455667789'',\n											bankaddress=''123 Straight Street'',\n											currcode =''AUD'',\n											invoice =''1''\n				WHERE accountcode = ''1030'''),
('2013-01-22 17:14:46', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7020'''),
('2013-01-22 17:14:46', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7020'''),
('2013-01-22 17:15:30', 'admin', 'UPDATE companies SET coyname=''Institute of Internal Auditors PH'',\n									companynumber = '''',\n									gstno=''not entered yet'',\n									regoffice1=''Unit 702 139 Corporate Center'',\n									regoffice2=''Valero St.'',\n									regoffice3=''Salcedo Village'',\n									regoffice4=''Makati City'',\n									regoffice5=''1227'',\n									regoffice6=''Philippines'',\n									telephone=''+63 2 940 9551'',\n									fax=''+63 2 325 0414'',\n									email=''weberp@weberpdemo.com'',\n									currencydefault=''AUD'',\n									debtorsact=''1100'',\n									pytdiscountact=''4900'',\n									creditorsact=''2100'',\n									payrollact=''2400'',\n									grnact=''2150'',\n									exchangediffact=''4200'',\n									purchasesexchangediffact=''5200'',\n									retainedearnings=''3500'',\n									gllink_debtors=''1'',\n									gllink_creditors=''1'',\n									gllink_stock=''1'',\n									freightact=''5600''\n								WHERE coycode=1'),
('2013-01-22 17:15:30', 'admin', 'UPDATE currencies SET rate=rate/1'),
('2013-01-22 17:15:47', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''7020'',\n							''Loss on inventory obsolence'',\n							''Expenses'')'),
('2013-01-22 17:18:12', 'admin', 'INSERT INTO currencies (currency,\n										currabrev,\n										country,\n										hundredsname,\n										decimalplaces,\n										rate)\n								VALUES (''Peso'',\n										''PHP'',\n										''Philippines'',\n										''centavo'',\n										''2'',\n										''40.58'')'),
('2013-01-22 17:19:15', 'admin', 'UPDATE companies SET coyname=''Institute of Internal Auditors PH'',\n									companynumber = '''',\n									gstno=''not entered yet'',\n									regoffice1=''Unit 702 139 Corporate Center'',\n									regoffice2=''Valero St.'',\n									regoffice3=''Salcedo Village'',\n									regoffice4=''Makati City'',\n									regoffice5=''1227'',\n									regoffice6=''Philippines'',\n									telephone=''+63 2 940 9551'',\n									fax=''+63 2 325 0414'',\n									email=''weberp@weberpdemo.com'',\n									currencydefault=''PHP'',\n									debtorsact=''1100'',\n									pytdiscountact=''4900'',\n									creditorsact=''2100'',\n									payrollact=''2400'',\n									grnact=''2150'',\n									exchangediffact=''4200'',\n									purchasesexchangediffact=''5200'',\n									retainedearnings=''3500'',\n									gllink_debtors=''1'',\n									gllink_creditors=''1'',\n									gllink_stock=''1'',\n									freightact=''5600''\n								WHERE coycode=1'),
('2013-01-22 17:19:15', 'admin', 'UPDATE currencies SET rate=rate/40.58'),
('2013-01-22 17:21:39', 'admin', 'UPDATE config SET confvalue = ''m/d/Y'' WHERE confname = ''DefaultDateFormat'''),
('2013-01-22 17:21:39', 'admin', 'UPDATE config SET confvalue = '''' WHERE confname = ''DefaultPriceList'''),
('2013-01-22 17:21:39', 'admin', 'UPDATE config SET confvalue = ''12'' WHERE confname = ''YearEnd'''),
('2013-01-22 17:21:39', 'admin', 'UPDATE config SET confvalue = ''0'' WHERE confname = ''CheckCreditLimits'''),
('2013-01-22 17:21:39', 'admin', 'UPDATE config SET confvalue = '''' WHERE confname = ''ProhibitPostingsBefore'''),
('2013-01-22 17:21:39', 'admin', 'UPDATE config SET confvalue = ''0'' WHERE confname = ''WeightedAverageCosting'''),
('2013-01-22 17:21:39', 'admin', 'UPDATE config SET confvalue=''1'' WHERE confname=''LogSeverity'''),
('2013-01-22 17:23:03', 'admin', 'INSERT INTO bankaccounts (accountcode,\n										bankaccountname,\n										bankaccountcode,\n										bankaccountnumber,\n										bankaddress,\n										currcode,\n										invoice)\n								VALUES (''1010'',\n									''CIB-BPI PESO ACCT#3561-0030-08'',\n									'''',\n									''3561-0030-08	'',\n									'''',\n									''PHP'',\n									''0'' )'),
('2013-01-22 17:23:46', 'admin', 'INSERT INTO bankaccounts (accountcode,\n										bankaccountname,\n										bankaccountcode,\n										bankaccountnumber,\n										bankaddress,\n										currcode,\n										invoice)\n								VALUES (''1011'',\n									''CIB-BPI USD$Accnt#3564-0058-26'',\n									'''',\n									''3564-0058-26'',\n									'''',\n									''PHP'',\n									''0'' )'),
('2013-01-22 17:24:25', 'admin', 'INSERT INTO bankaccounts (accountcode,\n										bankaccountname,\n										bankaccountcode,\n										bankaccountnumber,\n										bankaddress,\n										currcode,\n										invoice)\n								VALUES (''1012'',\n									''CIB-BPI USD$Accnt#0454-0137-78    '',\n									'''',\n									''0454-0137-78'',\n									'''',\n									''PHP'',\n									''0'' )'),
('2013-01-22 17:25:05', 'admin', 'INSERT INTO bankaccounts (accountcode,\n										bankaccountname,\n										bankaccountcode,\n										bankaccountnumber,\n										bankaddress,\n										currcode,\n										invoice)\n								VALUES (''1020'',\n									''CIB-CBC PESOACCNT#124-042011-9'',\n									'''',\n									''124-042011-9'',\n									'''',\n									''PHP'',\n									''0'' )'),
('2013-01-22 17:25:52', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''7001'',\n							''Forex Gain (Loss) - Realized'',\n							''Expenses'')'),
('2013-01-22 17:25:54', 'admin', 'UPDATE bankaccounts SET bankaccountname=''CIB-BPI PESO ACCT#3561-0030-08'',\n											bankaccountcode='''',\n											bankaccountnumber=''3561-0030-08	'',\n											bankaddress='''',\n											currcode =''PHP'',\n											invoice =''2''\n				WHERE accountcode = ''1010'''),
('2013-01-22 17:26:00', 'admin', 'DELETE FROM bankaccounts WHERE accountcode=''1030'''),
('2013-01-22 17:26:06', 'admin', 'DELETE FROM bankaccounts WHERE accountcode=''1040'''),
('2013-01-22 17:26:46', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1030'''),
('2013-01-22 17:26:46', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1030'''),
('2013-01-22 17:26:56', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1040'''),
('2013-01-22 17:26:56', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1040'''),
('2013-01-22 17:27:02', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''7000'',\n							''Forex Gain (Loss) - Unrealized'',\n							''Expenses'')'),
('2013-01-22 17:27:26', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1030'',\n							''CIB-BDO PESOACCNT#691-00217-45'',\n							''Cash'')'),
('2013-01-22 17:27:51', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1031'',\n							''CIB-BDO TRIPARTITE691-00279-80'',\n							''Cash'')'),
('2013-01-22 17:28:30', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6999'',\n							''VAT/input tax on EXEMPT activi'',\n							''Sales'')'),
('2013-01-22 17:29:35', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1050'''),
('2013-01-22 17:29:35', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1050'''),
('2013-01-22 17:29:46', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1060'''),
('2013-01-22 17:29:46', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1060'''),
('2013-01-22 17:30:00', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1070'''),
('2013-01-22 17:30:00', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1070'''),
('2013-01-22 17:30:10', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1080'''),
('2013-01-22 17:30:10', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1080'''),
('2013-01-22 17:30:18', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1090'''),
('2013-01-22 17:30:18', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1090'''),
('2013-01-22 17:30:21', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7640'''),
('2013-01-22 17:30:21', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7640'''),
('2013-01-22 17:30:59', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1081'',\n							''CIB-CBC TIME DEP PESO'',\n							''Cash'')'),
('2013-01-22 17:31:03', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6998'',\n							''Miscellaneous Expenses'',\n							''Expenses'')'),
('2013-01-22 17:31:21', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1082'',\n							''CIB-CBC TIME DEPUSD$'',\n							''Cash'')'),
('2013-01-22 17:31:39', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1083'',\n							''CIB-BPI TIME DEP USD$'',\n							''Cash'')'),
('2013-01-22 17:31:53', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1084'',\n							''CIB-BPI TIME DEP Php'',\n							''Sales'')'),
('2013-01-22 17:32:17', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1085'',\n							''CIB-BDO PLACEMENT IMA03'',\n							''Cash'')'),
('2013-01-22 17:32:27', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6997'',\n							''Donations and Contributions'',\n							''Expenses'')'),
('2013-01-22 17:33:56', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1098'',\n							''IIA INC. FUNDS - HELD IN TRUST'',\n							''Cash'')'),
('2013-01-22 17:34:20', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1099'',\n							''Reserved for SINKING FUND'',\n							''Cash'')'),
('2013-01-22 17:35:23', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6950'',\n							''Bank &amp; other Charges'',\n							''Expenses'')'),
('2013-01-22 17:36:52', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''5600'''),
('2013-01-22 17:36:52', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''5600'''),
('2013-01-22 17:39:08', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6900'''),
('2013-01-22 17:39:08', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6900'''),
('2013-01-22 17:39:45', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6900'',\n							''Freight Charges'',\n							''Expenses'')'),
('2013-01-22 17:40:07', 'admin', 'UPDATE companies SET coyname=''Institute of Internal Auditors PH'',\n									companynumber = '''',\n									gstno=''not entered yet'',\n									regoffice1=''Unit 702 139 Corporate Center'',\n									regoffice2=''Valero St.'',\n									regoffice3=''Salcedo Village'',\n									regoffice4=''Makati City'',\n									regoffice5=''1227'',\n									regoffice6=''Philippines'',\n									telephone=''+63 2 940 9551'',\n									fax=''+63 2 325 0414'',\n									email=''weberp@weberpdemo.com'',\n									currencydefault=''PHP'',\n									debtorsact=''1002'',\n									pytdiscountact=''1'',\n									creditorsact=''2100'',\n									payrollact=''1030'',\n									grnact=''1031'',\n									exchangediffact=''1'',\n									purchasesexchangediffact=''1'',\n									retainedearnings=''1031'',\n									gllink_debtors=''1'',\n									gllink_creditors=''1'',\n									gllink_stock=''1'',\n									freightact=''1''\n								WHERE coycode=1'),
('2013-01-22 17:40:07', 'admin', 'UPDATE currencies SET rate=rate/1'),
('2013-01-22 17:40:35', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1100'''),
('2013-01-22 17:40:36', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1100'''),
('2013-01-22 17:40:44', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1150'''),
('2013-01-22 17:40:44', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1150'''),
('2013-01-22 17:40:53', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1200'''),
('2013-01-22 17:40:53', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1200'''),
('2013-01-22 17:41:02', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1250'''),
('2013-01-22 17:41:02', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1250'''),
('2013-01-22 17:41:09', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1300'''),
('2013-01-22 17:41:09', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1300'''),
('2013-01-22 17:41:10', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6801'',\n							''Provisions for Bad debts'',\n							''Expenses'')'),
('2013-01-22 17:41:17', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1350'''),
('2013-01-22 17:41:17', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1350'''),
('2013-01-22 17:41:23', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1400'''),
('2013-01-22 17:41:23', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1400'''),
('2013-01-22 17:41:30', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1420'''),
('2013-01-22 17:41:30', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1420'''),
('2013-01-22 17:41:36', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1440'''),
('2013-01-22 17:41:36', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1440'''),
('2013-01-22 17:41:43', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1460'''),
('2013-01-22 17:41:43', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1460'''),
('2013-01-22 17:41:47', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6800'''),
('2013-01-22 17:41:47', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6800'''),
('2013-01-22 17:42:03', 'admin', 'UPDATE chartmaster SET accountname=''CIB-BPI TIME DEP Php'',\n						group_=''Cash''\n				WHERE accountcode =''1084'''),
('2013-01-22 17:42:34', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6800'',\n							''Depreciation and amortization'',\n							''Expenses'')'),
('2013-01-22 17:42:37', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1100'',\n							''RECEIVABLE -MEMBERSHIP'',\n							''Accounts Receivable'')'),
('2013-01-22 17:42:53', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1101'',\n							''RECEIVABLE -CIA REVIEW'',\n							''Accounts Receivable'')'),
('2013-01-22 17:43:10', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1105'',\n							''RECEIVABLES - CIA EXAM'',\n							''Accounts Receivable'')'),
('2013-01-22 17:43:24', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1110'',\n							''RECEIVABLE-IN HOUSE CIA REVIEW'',\n							''Accounts Receivable'')'),
('2013-01-22 17:43:38', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1111'',\n							''RECEIVABLE-IN HOUSE SEMINAR'',\n							''Accounts Receivable'')'),
('2013-01-22 17:43:53', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6700'''),
('2013-01-22 17:43:53', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6700'''),
('2013-01-22 17:43:59', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1115'',\n							''RECEIVABLE-PUBLIC SEMINARS'',\n							''Accounts Receivable'')'),
('2013-01-22 17:44:19', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1120'',\n							''RECEIVABLE- CONVENTION'',\n							''Accounts Receivable'')'),
('2013-01-22 17:44:33', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1121'',\n							''RECEIVABLE - TRIPARTITE'',\n							''Accounts Receivable'')'),
('2013-01-22 17:44:49', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1150'',\n							''RECEIVABLES- OTHERS'',\n							''Accounts Receivable'')'),
('2013-01-22 17:44:50', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6700'',\n							''Repair and Maintenance'',\n							''Expenses'')'),
('2013-01-22 17:45:11', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1199'',\n							''Allowance for Doubtful Account'',\n							''Accounts Receivable'')'),
('2013-01-22 17:45:51', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6600'''),
('2013-01-22 17:45:52', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6600'''),
('2013-01-22 17:45:57', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1200'',\n							''Inventory- ISPPIA / PPF'',\n							''Inventory'')'),
('2013-01-22 17:46:09', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1201'',\n							''Inventory- IA JOURNAL'',\n							''Inventory'')'),
('2013-01-22 17:46:20', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1202'',\n							''Inventory - Review materials'',\n							''Inventory'')'),
('2013-01-22 17:46:32', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1203'',\n							''Inventory - GLEIMS Print'',\n							''Inventory'')'),
('2013-01-22 17:46:45', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1204'',\n							''Inventory - Wiley Books'',\n							''Inventory'')'),
('2013-01-22 17:46:48', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6600'',\n							''Taxes, Licenses &amp; Registration'',\n							''Expenses'')'),
('2013-01-22 17:46:59', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1290'',\n							''Inventory - Office Supplies'',\n							''Inventory'')'),
('2013-01-22 17:47:23', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1291'',\n							''INVENTORY - OTHER MDSE'',\n							''Inventory'')'),
('2013-01-22 17:47:43', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1299'',\n							''Allow. for Inventory Obsolescence'',\n							''Inventory'')'),
('2013-01-22 17:49:51', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1300'',\n							''DUE FROM - IIA INC'',\n							''Other Current Assets'')'),
('2013-01-22 17:50:04', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1301'',\n							''DUE FROM- IIA MALAYSIA'',\n							''Other Current Assets'')'),
('2013-01-22 17:51:07', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1311'',\n							''DUE FROM - AFFILIATES CEBU'',\n							''Other Current Assets'')'),
('2013-01-22 17:53:11', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6503'',\n							''Reproduction/printing/Photocopy'',\n							''Expenses'')'),
('2013-01-22 17:53:31', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1312'',\n							''DUE FROM - AFFILIATES DAVAO'',\n							''Other Current Assets'')'),
('2013-01-22 17:53:48', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1313'',\n							''DUE FR - ACIIA/ASIAN CAE FORUM'',\n							''Other Current Assets'')'),
('2013-01-22 17:54:54', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6502'',\n							''Event Materia&amp; Supplies'',\n							''Expenses'')'),
('2013-01-22 17:54:55', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1315'',\n							''DUE FROM - CONVENTION'',\n							''Other Current Assets'')'),
('2013-01-22 17:55:11', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1370'',\n							''ADVANCES-OFFICERS &amp; EMPLOYEES'',\n							''Other Current Assets'')'),
('2013-01-22 17:55:26', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1371'',\n							''ADVANCES FOR LIQUIDATION'',\n							''Other Current Assets'')'),
('2013-01-22 17:55:50', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6500'''),
('2013-01-22 17:55:50', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6500'''),
('2013-01-22 17:58:23', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6500'',\n							''Office Supplies'',\n							''Expenses'')'),
('2013-01-22 18:00:07', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1372'',\n							''ADVANCES TO SUPPLIERS'',\n							''Sales'')'),
('2013-01-22 18:00:54', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6410'',\n							''Research &amp; Development'',\n							''Expenses'')'),
('2013-01-22 18:02:20', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6404'',\n							''Marketing Merchandise'',\n							''Expenses'')'),
('2013-01-22 18:04:56', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6403'',\n							''Awards and Tokens'',\n							''Expenses'')'),
('2013-01-22 18:05:26', 'admin', 'UPDATE chartmaster SET accountname=''ADVANCES TO SUPPLIERS'',\n						group_=''Other Current Assets''\n				WHERE accountcode =''1372'''),
('2013-01-22 18:06:59', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1380'',\n							''REFUNDABLE DEPOSITS'',\n							''Other Current Assets'')'),
('2013-01-22 18:07:29', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1400'',\n							''Prepaid Expense- Rental'',\n							''Other Current Assets'')'),
('2013-01-22 18:07:52', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1420'',\n							''Creditable INPUT tax'',\n							''Other Current Assets'')'),
('2013-01-22 18:08:16', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1430'',\n							''Creditable Withholding Tax'',\n							''Other Current Assets'')'),
('2013-01-22 18:08:36', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1450'',\n							''Prepaid expense - Others'',\n							''Other Current Assets'')'),
('2013-01-22 18:10:46', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1500'''),
('2013-01-22 18:10:46', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1500'''),
('2013-01-22 18:10:58', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1550'''),
('2013-01-22 18:10:59', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1550'''),
('2013-01-22 18:11:09', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1600'''),
('2013-01-22 18:11:09', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1600'''),
('2013-01-22 18:11:12', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6402'',\n							''Advertising/Promotional items'',\n							''Expenses'')'),
('2013-01-22 18:11:42', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1620'''),
('2013-01-22 18:11:42', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1620'''),
('2013-01-22 18:12:14', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1650'''),
('2013-01-22 18:12:14', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1650'''),
('2013-01-22 18:13:04', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1670'''),
('2013-01-22 18:13:04', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1670'''),
('2013-01-22 18:13:18', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1700'''),
('2013-01-22 18:13:18', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1700'''),
('2013-01-22 18:13:48', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6401'',\n							''Representation &amp; Entertainment'',\n							''Expenses'')'),
('2013-01-22 18:13:49', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1710'''),
('2013-01-22 18:13:49', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1710'''),
('2013-01-22 18:13:59', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1720'''),
('2013-01-22 18:13:59', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1720'''),
('2013-01-22 18:15:21', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6400'''),
('2013-01-22 18:15:21', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6400'''),
('2013-01-22 18:16:52', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6400'',\n							''Conferences &amp; Meetings'',\n							''Expenses'')'),
('2013-01-22 18:17:16', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1730'''),
('2013-01-22 18:17:16', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1730'''),
('2013-01-22 18:17:36', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1740'''),
('2013-01-22 18:17:36', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1740'''),
('2013-01-22 18:17:46', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1750'''),
('2013-01-22 18:17:46', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1750'''),
('2013-01-22 18:18:07', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1760'''),
('2013-01-22 18:18:07', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1760'''),
('2013-01-22 18:18:17', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1770'''),
('2013-01-22 18:18:17', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1770'''),
('2013-01-22 18:18:55', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1780'''),
('2013-01-22 18:18:55', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1780'''),
('2013-01-22 18:19:04', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1790'''),
('2013-01-22 18:19:04', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1790'''),
('2013-01-22 18:19:05', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6304'',\n							''Meals - Seminars'',\n							''Expenses'')'),
('2013-01-22 18:19:17', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1800'''),
('2013-01-22 18:19:17', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1800'''),
('2013-01-22 18:19:29', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1850'''),
('2013-01-22 18:19:29', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1850'''),
('2013-01-22 18:20:29', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6303'',\n							''Meals - Other Events,Conv,GMMs'',\n							''Expenses'')'),
('2013-01-22 18:25:12', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1500'',\n							''Office Unit &amp; Improvements'',\n							''Fixed Assets'')'),
('2013-01-22 18:26:10', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6302'',\n							''Accomodation'',\n							''Expenses'')'),
('2013-01-22 18:26:17', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1501'',\n							''Accum. deprn - Leasehold'',\n							''Accumulated Depreciation'')'),
('2013-01-22 18:26:36', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1510'',\n							''Office furniture and fixtures'',\n							''Fixed Assets'')'),
('2013-01-22 18:27:16', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1511'',\n							''Accum. deprn- Furniture &amp; Fix'',\n							''Accumulated Depreciation'')'),
('2013-01-22 18:27:32', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1520'',\n							''Office equipment'',\n							''Fixed Assets'')'),
('2013-01-22 18:27:58', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1521'',\n							''Accum, deprn - Office Equip\\''t.'',\n							''Accumulated Depreciation'')'),
('2013-01-22 18:28:25', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1530'',\n							''Transportation equipment'',\n							''Fixed Assets'')'),
('2013-01-22 18:28:29', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6301'',\n							''Transportation &amp; Travel'',\n							''Expenses'')'),
('2013-01-22 18:28:42', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1531'',\n							''Accum. deprn - Transpo Equip\\''t'',\n							''Accumulated Depreciation'')'),
('2013-01-22 18:28:58', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1540'',\n							''Other asset - software'',\n							''Fixed Assets'')'),
('2013-01-22 18:29:11', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6300'''),
('2013-01-22 18:29:11', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6300'''),
('2013-01-22 18:29:14', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1541'',\n							''Accumulated deprn - software'',\n							''Accumulated Depreciation'')'),
('2013-01-22 18:29:39', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''1900'''),
('2013-01-22 18:29:39', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''1900'''),
('2013-01-22 18:29:54', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6300'',\n							''Transportation (local)'',\n							''Expenses'')'),
('2013-01-22 18:31:12', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1800'',\n							''Other assets - library material'',\n							''Other Assets'')'),
('2013-01-22 18:31:33', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1850'',\n							''Other assets - deposits'',\n							''Other Assets'')'),
('2013-01-22 18:33:21', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6253'',\n							''IIA Inc.\\''s Gain Fee'',\n							''Sales'')'),
('2013-01-22 18:33:49', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1900'',\n							''SINKING FUND - for future Proj'',\n							''Other Assets'')'),
('2013-01-22 18:34:16', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''1901'',\n							''Trust Fund Assets'',\n							''Other Assets'')'),
('2013-01-22 18:35:14', 'admin', 'UPDATE companies SET coyname=''Institute of Internal Auditors PH'',\n									companynumber = '''',\n									gstno=''not entered yet'',\n									regoffice1=''Unit 702 139 Corporate Center'',\n									regoffice2=''Valero St.'',\n									regoffice3=''Salcedo Village'',\n									regoffice4=''Makati City'',\n									regoffice5=''1227'',\n									regoffice6=''Philippines'',\n									telephone=''+63 2 940 9551'',\n									fax=''+63 2 325 0414'',\n									email=''weberp@weberpdemo.com'',\n									currencydefault=''PHP'',\n									debtorsact=''1002'',\n									pytdiscountact=''1'',\n									creditorsact=''1001'',\n									payrollact=''1030'',\n									grnact=''1031'',\n									exchangediffact=''1'',\n									purchasesexchangediffact=''1'',\n									retainedearnings=''1031'',\n									gllink_debtors=''1'',\n									gllink_creditors=''1'',\n									gllink_stock=''1'',\n									freightact=''1''\n								WHERE coycode=1'),
('2013-01-22 18:35:14', 'admin', 'UPDATE currencies SET rate=rate/1'),
('2013-01-22 18:35:41', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2100'''),
('2013-01-22 18:35:41', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2100'''),
('2013-01-22 18:36:03', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2001'',\n							''Accounts payable'',\n							''Accounts Payable'')'),
('2013-01-22 18:37:35', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6252'',\n							''IIA Inc.\\''s Royalty-Cert. Exams'',\n							''Expenses'')'),
('2013-01-22 18:38:22', 'admin', 'UPDATE chartmaster SET accountname=''Other Accounts Payable'',\n						group_=''Other Current Liabilities''\n				WHERE accountcode =''2010'''),
('2013-01-22 18:39:52', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6251'',\n							''IIA Inc.\\''s Royalty-Seminars'',\n							''Expenses'')'),
('2013-01-22 18:40:38', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6250'''),
('2013-01-22 18:40:38', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6250'''),
('2013-01-22 18:41:20', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6250'',\n							''IIA Inc.\\''s Share in Membership'',\n							''Expenses'')'),
('2013-01-22 18:42:06', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2111'',\n							''INCOME TAX PAYABLE'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:42:24', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2099'',\n							''Accrued Expenses'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:42:55', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2050'''),
('2013-01-22 18:42:55', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2050'''),
('2013-01-22 18:43:08', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2020'''),
('2013-01-22 18:43:08', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2020'''),
('2013-01-22 18:43:24', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2150'''),
('2013-01-22 18:43:24', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2150'''),
('2013-01-22 18:43:48', 'admin', 'UPDATE chartmaster SET accountname=''REFUNDS-Members/Non-member'',\n						group_=''Other Current Liabilities''\n				WHERE accountcode =''2200'''),
('2013-01-22 18:45:11', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2101'',\n							''WITHHOLDING TAX - COMPENSATION'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:45:29', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2102'',\n							''WITHHOLDING TAX - EXPANDED'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:45:43', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6210'',\n							''Messengerial Srvc, Mailing/Post'',\n							''Expenses'')'),
('2013-01-22 18:45:46', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2103'',\n							''SSS CONT.PAYABLES'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:46:01', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2104'',\n							''SSS LOANS PAYABLES'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:46:14', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2105'',\n							''PHILHEALTH CONT. PAYABLES'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:46:26', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2106'',\n							''PAG-IBIG CONT. PAYABLES'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:46:38', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2107'',\n							''PAG-IBIG LOANS PAYABLES'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:47:07', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2110'',\n							''VAT / Output Tax Payable'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:47:18', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6202'',\n							''Professional Fees - Others'',\n							''Expenses'')'),
('2013-01-22 18:47:35', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2112'',\n							''Deferred VAT - Output Tax - (AR)'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:47:50', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2210'',\n							''DEFERRED INCOME-MEMBERSHIP'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:48:15', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2211'',\n							''DEFERRED INCOME-CIA EXAM'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:48:31', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2212'',\n							''DEFERRED INCOME - REVIEW'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:48:44', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2213'',\n							''DEFERRED INCOME - JOURNAL SUBS'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:48:59', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2214'',\n							''DEFERRED INCOME - CONVENTION'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:49:12', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6201'',\n							''Professional Fees - Seminars'',\n							''Expenses'')'),
('2013-01-22 18:49:20', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2230'''),
('2013-01-22 18:49:20', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2230'''),
('2013-01-22 18:49:31', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2250'''),
('2013-01-22 18:49:31', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2250'''),
('2013-01-22 18:49:52', 'admin', 'UPDATE chartmaster SET accountname=''Other AP- CONVENTION'',\n						group_=''Other Current Liabilities''\n				WHERE accountcode =''2300''');
INSERT INTO `audittrail` (`transactiondate`, `userid`, `querystring`) VALUES
('2013-01-22 18:50:11', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2301'',\n							''Other AP- MEMBERSHIP'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:50:25', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6200'''),
('2013-01-22 18:50:25', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6200'''),
('2013-01-22 18:50:30', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2302'',\n							''Other AP- SEMINARS'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:50:46', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2303'',\n							''Other AP- CERTIFICATION'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:50:58', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6200'',\n							''Management/Consultancy Fees'',\n							''Expenses'')'),
('2013-01-22 18:50:59', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2304'',\n							''Other AP- REVIEW'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:52:08', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6120'',\n							''Website Hosting'',\n							''Expenses'')'),
('2013-01-22 18:52:55', 'admin', 'UPDATE taxauthorities\n					SET taxglcode =''2300'',\n					purchtaxglaccount =''2103'',\n					description = ''Australian GST'',\n					bank = '''',\n					bankacctype = '''',\n					bankacc = '''',\n					bankswift = ''''\n				WHERE taxid = ''1'''),
('2013-01-22 18:53:01', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6111'',\n							''Power, Light &amp; Water'',\n							''Expenses'')'),
('2013-01-22 18:53:41', 'admin', 'UPDATE taxauthorities\n					SET taxglcode =''2300'',\n					purchtaxglaccount =''2104'',\n					description = ''Sales Tax'',\n					bank = '''',\n					bankacctype = '''',\n					bankacc = '''',\n					bankswift = ''''\n				WHERE taxid = ''5'''),
('2013-01-22 18:53:52', 'admin', 'UPDATE taxauthorities\n					SET taxglcode =''2300'',\n					purchtaxglaccount =''2103'',\n					description = ''Canadian GST'',\n					bank = '''',\n					bankacctype = '''',\n					bankacc = '''',\n					bankswift = ''''\n				WHERE taxid = ''11'''),
('2013-01-22 18:54:15', 'admin', 'UPDATE taxauthorities\n					SET taxglcode =''2300'',\n					purchtaxglaccount =''2104'',\n					description = ''Ontario PST'',\n					bank = '''',\n					bankacctype = '''',\n					bankacc = '''',\n					bankswift = ''''\n				WHERE taxid = ''12'''),
('2013-01-22 18:54:22', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6110'',\n							''Telephone/Communication'',\n							''Expenses'')'),
('2013-01-22 18:54:24', 'admin', 'UPDATE taxauthorities\n					SET taxglcode =''2300'',\n					purchtaxglaccount =''2104'',\n					description = ''UK VAT'',\n					bank = '''',\n					bankacctype = '''',\n					bankacc = '''',\n					bankswift = ''''\n				WHERE taxid = ''13'''),
('2013-01-22 18:54:38', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2310'''),
('2013-01-22 18:54:38', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2310'''),
('2013-01-22 18:55:05', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2320'''),
('2013-01-22 18:55:05', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2320'''),
('2013-01-22 18:55:15', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2330'''),
('2013-01-22 18:55:15', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2330'''),
('2013-01-22 18:55:43', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2340'''),
('2013-01-22 18:55:43', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2340'''),
('2013-01-22 18:55:49', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6109'',\n							''Insuranc'',\n							''Expenses'')'),
('2013-01-22 18:55:52', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2350'''),
('2013-01-22 18:55:52', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2350'''),
('2013-01-22 18:56:09', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2360'''),
('2013-01-22 18:56:09', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2360'''),
('2013-01-22 18:56:34', 'admin', 'UPDATE chartmaster SET accountname=''DUE TO - IIA INC'',\n						group_=''Other Current Liabilities''\n				WHERE accountcode =''2400'''),
('2013-01-22 18:56:48', 'admin', 'UPDATE chartmaster SET accountname=''Insurance'',\n						group_=''Expenses''\n				WHERE accountcode =''6109'''),
('2013-01-22 18:56:56', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2401'',\n							''DUE TO - IIA INC MALAYSIA'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:57:09', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2402'',\n							''DUE TO - Affiliates ACIIA'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:57:22', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2403'',\n							''DUE TO - Affiliates IIAPCebu'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:57:59', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6103'',\n							''Association dues'',\n							''Expenses'')'),
('2013-01-22 18:58:53', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2404'',\n							''DUE TO- Affiliates IIAPDavao'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:59:04', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2405'',\n							''DUE TO - CONVENTION'',\n							''Other Current Liabilities'')'),
('2013-01-22 18:59:17', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2410'''),
('2013-01-22 18:59:17', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2410'''),
('2013-01-22 18:59:23', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6102'',\n							''Rental - Office/Secratariat'',\n							''Expenses'')'),
('2013-01-22 18:59:26', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2420'''),
('2013-01-22 18:59:26', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2420'''),
('2013-01-22 18:59:33', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2450'''),
('2013-01-22 18:59:33', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2450'''),
('2013-01-22 18:59:41', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2460'''),
('2013-01-22 18:59:41', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2460'''),
('2013-01-22 18:59:49', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2470'''),
('2013-01-22 18:59:49', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2470'''),
('2013-01-22 18:59:58', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2480'''),
('2013-01-22 18:59:58', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2480'''),
('2013-01-22 19:00:22', 'admin', 'UPDATE chartmaster SET accountname=''Funds Held in Trust'',\n						group_=''Other Current Liabilities''\n				WHERE accountcode =''2500'''),
('2013-01-22 19:00:28', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6101'',\n							''Rental - Events\\'' venue'',\n							''Expenses'')'),
('2013-01-22 19:00:34', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2501'',\n							''Funds Held in Trust CIA Exam 1'',\n							''Other Current Liabilities'')'),
('2013-01-22 19:00:47', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2502'',\n							''Funds Held in Trust CIA Exam 2'',\n							''Other Current Liabilities'')'),
('2013-01-22 19:01:01', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2503'',\n							''Funds Held in Trust CIA Exam 3'',\n							''Other Current Liabilities'')'),
('2013-01-22 19:01:12', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2504'',\n							''Funds Held in Trust CIA Exam 4'',\n							''Other Current Liabilities'')'),
('2013-01-22 19:01:26', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2505'',\n							''Funds Held in Trust CCSA Exam'',\n							''Other Current Liabilities'')'),
('2013-01-22 19:01:40', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2506'',\n							''Funds Held in Trust CFSA Exam'',\n							''Other Current Liabilities'')'),
('2013-01-22 19:01:48', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6100'''),
('2013-01-22 19:01:49', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6100'''),
('2013-01-22 19:01:53', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''2507'',\n							''Funds Held in Trust - Tripartite'',\n							''Other Current Liabilities'')'),
('2013-01-22 19:02:07', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2550'''),
('2013-01-22 19:02:07', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2550'''),
('2013-01-22 19:02:15', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2560'''),
('2013-01-22 19:02:16', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2560'''),
('2013-01-22 19:02:25', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2600'''),
('2013-01-22 19:02:25', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2600'''),
('2013-01-22 19:02:34', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2700'''),
('2013-01-22 19:02:34', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2700'''),
('2013-01-22 19:02:46', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2720'''),
('2013-01-22 19:02:46', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2720'''),
('2013-01-22 19:02:47', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6100'',\n							''RENTAL - Seminars, Training, etc'',\n							''Expenses'')'),
('2013-01-22 19:02:55', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2740'''),
('2013-01-22 19:02:55', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2740'''),
('2013-01-22 19:03:17', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2760'''),
('2013-01-22 19:03:18', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2760'''),
('2013-01-22 19:03:25', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2800'''),
('2013-01-22 19:03:25', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2800'''),
('2013-01-22 19:03:39', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''2900'''),
('2013-01-22 19:03:39', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''2900'''),
('2013-01-22 19:04:28', 'admin', 'UPDATE chartmaster SET accountname=''Fund Bal. - unappropriated'',\n						group_=''Equity-Retained Earnings''\n				WHERE accountcode =''3100'''),
('2013-01-22 19:04:45', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''3099'',\n							''Beginning Balance Equity'',\n							''Equity-gets closed'')'),
('2013-01-22 19:05:00', 'admin', 'UPDATE chartmaster SET accountname=''Beginning Balance Equity'',\n						group_=''Equity-does not close''\n				WHERE accountcode =''3099'''),
('2013-01-22 19:05:26', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''3101'',\n							''Prior Period Adjustment'',\n							''Equity-gets closed'')'),
('2013-01-22 19:05:50', 'admin', 'UPDATE chartmaster SET accountname=''Fund Bal. - APPROPRIATED'',\n						group_=''Equity-does not close''\n				WHERE accountcode =''3200'''),
('2013-01-22 19:06:18', 'admin', 'UPDATE chartmaster SET accountname=''Dividend Taxes Payable'',\n						group_=''Equity''\n				WHERE accountcode =''3300'''),
('2013-01-22 19:06:27', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''3300'''),
('2013-01-22 19:06:27', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''3300'''),
('2013-01-22 19:06:46', 'admin', 'UPDATE chartmaster SET accountname=''RECEIVABLE- CONVENTION'',\n						group_=''Accounts Receivable''\n				WHERE accountcode =''3400'''),
('2013-01-22 19:07:12', 'admin', 'UPDATE chartmaster SET accountname=''RECEIVABLES- OTHERS'',\n						group_=''Accounts Receivable''\n				WHERE accountcode =''3500'''),
('2013-01-22 19:07:49', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4001'',\n							''Membership - Annual dues'',\n							''Income'')'),
('2013-01-22 19:08:01', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4051'',\n							''Registration Fees- GMM/AGM'',\n							''Income'')'),
('2013-01-22 19:08:14', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4052'',\n							''Registration Fees - Convention'',\n							''Income'')'),
('2013-01-22 19:08:28', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4053'',\n							''SPONSORSHIP - Convention/Event'',\n							''Income'')'),
('2013-01-22 19:08:43', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4054'',\n							''Registration fees - Tripartite'',\n							''Income'')'),
('2013-01-22 19:09:03', 'admin', 'UPDATE chartmaster SET accountname=''CIA Seminar - IN HOUSE'',\n						group_=''Income''\n				WHERE accountcode =''4100'''),
('2013-01-22 19:09:11', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6050'',\n							''Training, Seminars &amp; Workshop'',\n							''Expenses'')'),
('2013-01-22 19:09:14', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4101'',\n							''CIA Seminar Series- Part 1'',\n							''Income'')'),
('2013-01-22 19:09:27', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4102'',\n							''CIA Seminar Series- Part 2'',\n							''Income'')'),
('2013-01-22 19:09:39', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4103'',\n							''CIA Seminar Series- Part 3'',\n							''Income'')'),
('2013-01-22 19:09:55', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4110'',\n							''CFSA Certification Review'',\n							''Income'')'),
('2013-01-22 19:10:18', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6010'',\n							''Meals/Pantry-Secratariat'',\n							''Expenses'')'),
('2013-01-22 19:10:21', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4119'',\n							''Output tax on CIA Review Fees'',\n							''Income'')'),
('2013-01-22 19:10:38', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4150'',\n							''Public Run-Seminars&amp;Workshops'',\n							''Income'')'),
('2013-01-22 19:10:49', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4159'',\n							''Output tax on Public Run Sem'',\n							''Income'')'),
('2013-01-22 19:11:06', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4160'',\n							''In-House-Seminars&amp;Workshops'',\n							''Income'')'),
('2013-01-22 19:11:16', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6009'',\n							''Employee benefits'',\n							''Expenses'')'),
('2013-01-22 19:11:17', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4169'',\n							''Output tax on In-House-Sem'',\n							''Income'')'),
('2013-01-22 19:11:38', 'admin', 'UPDATE chartmaster SET accountname=''CIA Exam - Registration Fee'',\n						group_=''Income''\n				WHERE accountcode =''4200'''),
('2013-01-22 19:11:56', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4201'',\n							''CIA Exam Fee Part1'',\n							''Income'')'),
('2013-01-22 19:12:18', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6008'',\n							''ER ShareSSS, PHIC HDMF Premium'',\n							''Expenses'')'),
('2013-01-22 19:12:23', 'admin', 'UPDATE chartmaster SET accountname=''CIA Exam - Registration Fee'',\n						group_=''Income''\n				WHERE accountcode =''4200'''),
('2013-01-22 19:12:41', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4202'',\n							''CIA Exam Fee Part 2'',\n							''Income'')'),
('2013-01-22 19:12:53', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4203'',\n							''CIA Exam Fee Part 3'',\n							''Income'')'),
('2013-01-22 19:13:07', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6004'',\n							''13th Month/Bonus/Incentive'',\n							''Expenses'')'),
('2013-01-22 19:13:08', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4204'',\n							''CIA Exam Fee Part 4'',\n							''Income'')'),
('2013-01-22 19:13:21', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4205'',\n							''CIA Exam Fee Part 4 - Credit'',\n							''Income'')'),
('2013-01-22 19:13:36', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6003'',\n							''SL/VL Benefits'',\n							''Expenses'')'),
('2013-01-22 19:13:45', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4210'',\n							''CCSA /CFSA EXAM FEE'',\n							''Income'')'),
('2013-01-22 19:13:57', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4220'',\n							''MOCK EXAM FEE'',\n							''Income'')'),
('2013-01-22 19:14:09', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4230'',\n							''DEFERRALS - EXAM'',\n							''Income'')'),
('2013-01-22 19:14:15', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6002'',\n							''Overtime Pay'',\n							''Expenses'')'),
('2013-01-22 19:14:21', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4250'',\n							''CANCELLATIONS- FEE/REG'',\n							''Income'')'),
('2013-01-22 19:14:35', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4300'',\n							''Q.A.R. ENGAGEMENT FEE'',\n							''Income'')'),
('2013-01-22 19:14:47', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4410'',\n							''Discount-Early bird'',\n							''Income'')'),
('2013-01-22 19:14:59', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4420'',\n							''Discount- Early bird&amp;Volume'',\n							''Income'')'),
('2013-01-22 19:15:00', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''6001'',\n							''Salaries and Wages'',\n							''Expenses'')'),
('2013-01-22 19:15:09', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4430'',\n							''Discounts- Volume/Group'',\n							''Income'')'),
('2013-01-22 19:15:20', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4440'',\n							''Discount - Others'',\n							''Income'')'),
('2013-01-22 19:15:46', 'admin', 'UPDATE chartmaster SET accountname=''Sale of materials - Journal'',\n						group_=''Income''\n				WHERE accountcode =''4500'''),
('2013-01-22 19:15:58', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4510'',\n							''Sale of materials - GLEIMS pri'',\n							''Income'')'),
('2013-01-22 19:16:08', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5599'',\n							''COST OF Sale - others'',\n							''Expenses'')'),
('2013-01-22 19:16:20', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4511'',\n							''Sale of materials - GLEIMS sof'',\n							''Income'')'),
('2013-01-22 19:16:33', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4520'',\n							''Sale of materials - ISPPIA'',\n							''Income'')'),
('2013-01-22 19:16:46', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4540'',\n							''Sale of materials - Review Mat'',\n							''Income'')'),
('2013-01-22 19:16:58', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5550'',\n							''COST OF Sale - WILEY Book'',\n							''Cost of Sales'')'),
('2013-01-22 19:16:58', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4550'',\n							''Sale of materials - WILEY Book'',\n							''Income'')'),
('2013-01-22 19:17:09', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4560'',\n							''Sale of materials - ADB blue'',\n							''Income'')'),
('2013-01-22 19:17:21', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4561'',\n							''Sale of materials - ADB red'',\n							''Income'')'),
('2013-01-22 19:17:33', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''4600'''),
('2013-01-22 19:17:33', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''4600'''),
('2013-01-22 19:17:43', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''4700'''),
('2013-01-22 19:17:43', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''4700'''),
('2013-01-22 19:17:46', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5540'',\n							''COST OF Sale- Review Materials'',\n							''Cost of Sales'')'),
('2013-01-22 19:18:59', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5520'',\n							''COST OF Sale - ISPPIA'',\n							''Expenses'')'),
('2013-01-22 19:20:08', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5511'',\n							''COST OF Sale - GLEIMS software'',\n							''Cost of Sales'')'),
('2013-01-22 19:20:38', 'admin', 'UPDATE salesglpostings SET salesglcode = ''1'',\n										discountglcode = ''1'',\n										area = ''AN'',\n										stkcat = ''ANY'',\n										salestype = ''AN''\n				WHERE salesglpostings.id = ''1'''),
('2013-01-22 19:20:54', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5510'',\n							''COST OF Sale - GLEIMS print'',\n							''Expenses'')'),
('2013-01-22 19:21:26', 'admin', 'DELETE FROM salesglpostings WHERE id=''2'''),
('2013-01-22 19:21:38', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''5500'''),
('2013-01-22 19:21:38', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''5500'''),
('2013-01-22 19:21:40', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''4800'''),
('2013-01-22 19:21:40', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''4800'''),
('2013-01-22 19:22:21', 'admin', 'UPDATE chartmaster SET accountname=''Interest Inc. fr. saving acct.'',\n						group_=''Income''\n				WHERE accountcode =''4900'''),
('2013-01-22 19:22:28', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5500'',\n							''COST OF Sale - Journal'',\n							''Expenses'')'),
('2013-01-22 19:22:36', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4901'',\n							''Int. Inc. fr.T/D &amp; money plcmn'',\n							''Income'')'),
('2013-01-22 19:22:50', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''4950'',\n							''Other/ Misc income -OTHERS'',\n							''Income'')'),
('2013-01-22 19:22:55', 'admin', 'UPDATE chartmaster SET accountname=''COST OF Sale - ISPPIA'',\n						group_=''Cost of Sales''\n				WHERE accountcode =''5520'''),
('2013-01-22 19:23:54', 'admin', 'UPDATE chartmaster SET accountname=''COST OF Sale - others'',\n						group_=''Cost of Sales''\n				WHERE accountcode =''5599'''),
('2013-01-22 19:24:18', 'admin', 'UPDATE cogsglpostings SET\n						glcode = ''1'',\n						area = ''AN'',\n						stkcat = ''ANY'',\n						salestype=''AN''\n				WHERE id =''5'''),
('2013-01-22 19:24:22', 'admin', 'UPDATE chartmaster SET accountname=''COST OF Sale - GLEIMS print'',\n						group_=''Cost of Sales''\n				WHERE accountcode =''5510'''),
('2013-01-22 19:24:28', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''5000'''),
('2013-01-22 19:24:28', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''5000'''),
('2013-01-22 19:24:48', 'admin', 'UPDATE chartmaster SET accountname=''COST OF Sale - Journal'',\n						group_=''Cost of Sales''\n				WHERE accountcode =''5500'''),
('2013-01-22 19:24:48', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5001'',\n							''COST: Membership &amp; Affiliation'',\n							''Cost of Sales'')'),
('2013-01-22 19:25:14', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5051'',\n							''COST: GMM / AGM'',\n							''Cost of Sales'')'),
('2013-01-22 19:25:30', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5052'',\n							''COST: Convention'',\n							''Cost of Sales'')'),
('2013-01-22 19:25:51', 'admin', 'UPDATE chartmaster SET accountname=''COST: CIA Review Class'',\n						group_=''Cost of Sales''\n				WHERE accountcode =''5100'''),
('2013-01-22 19:26:23', 'admin', 'UPDATE chartmaster SET accountname=''COST: Exams CIA/CFSA/CCSA'',\n						group_=''Cost of Sales''\n				WHERE accountcode =''5200'''),
('2013-01-22 19:26:36', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5150'',\n							''COST: In-House Seminar'',\n							''Cost of Sales'')'),
('2013-01-22 19:26:51', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5160'',\n							''COST: Public Run Seminar'',\n							''Cost of Sales'')'),
('2013-01-22 19:26:59', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES (''5300'',\n							''COST: QAR Engagement'',\n							''Cost of Sales'')'),
('2013-01-22 19:27:12', 'admin', 'INSERT INTO chartmaster (accountcode,\n						accountname,\n						group_)\n					VALUES ('''',\n							'''',\n							''Sales'')'),
('2013-01-22 19:28:05', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''5700'''),
('2013-01-22 19:28:06', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''5700'''),
('2013-01-22 19:28:22', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''9100'''),
('2013-01-22 19:28:22', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''9100'''),
('2013-01-22 19:28:37', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''8900'''),
('2013-01-22 19:28:37', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''8900'''),
('2013-01-22 19:28:46', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''5800'''),
('2013-01-22 19:28:46', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''5800'''),
('2013-01-22 19:28:49', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''8600'''),
('2013-01-22 19:28:49', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''8600'''),
('2013-01-22 19:29:00', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''8500'''),
('2013-01-22 19:29:00', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''8500'''),
('2013-01-22 19:29:10', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''8400'''),
('2013-01-22 19:29:10', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''8400'''),
('2013-01-22 19:29:17', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''5900'''),
('2013-01-22 19:29:17', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''5900'''),
('2013-01-22 19:29:19', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''8300'''),
('2013-01-22 19:29:19', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''8300'''),
('2013-01-22 19:29:28', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''8200'''),
('2013-01-22 19:29:28', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''8200'''),
('2013-01-22 19:29:39', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''8100'''),
('2013-01-22 19:29:39', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''8100'''),
('2013-01-22 19:31:10', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7900'''),
('2013-01-22 19:31:10', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7900'''),
('2013-01-22 19:31:27', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7800'''),
('2013-01-22 19:31:27', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7800'''),
('2013-01-22 19:31:35', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7750'''),
('2013-01-22 19:31:35', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7750'''),
('2013-01-22 19:31:46', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7700'''),
('2013-01-22 19:31:46', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7700'''),
('2013-01-22 19:31:57', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7660'''),
('2013-01-22 19:31:57', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7660'''),
('2013-01-22 19:32:06', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7650'''),
('2013-01-22 19:32:06', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7650'''),
('2013-01-22 19:32:14', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7630'''),
('2013-01-22 19:32:14', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7630'''),
('2013-01-22 19:32:22', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7620'''),
('2013-01-22 19:32:22', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7620'''),
('2013-01-22 19:32:31', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7610'''),
('2013-01-22 19:32:31', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7610'''),
('2013-01-22 19:32:42', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7600'''),
('2013-01-22 19:32:42', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7600'''),
('2013-01-22 19:33:08', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7550'''),
('2013-01-22 19:33:08', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7550'''),
('2013-01-22 19:33:19', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7500'''),
('2013-01-22 19:33:19', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7500'''),
('2013-01-22 19:34:19', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7450'''),
('2013-01-22 19:34:19', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7450'''),
('2013-01-22 19:34:27', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7400'''),
('2013-01-22 19:34:27', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7400'''),
('2013-01-22 19:34:39', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7390'''),
('2013-01-22 19:34:39', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7390'''),
('2013-01-22 19:34:46', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7280'''),
('2013-01-22 19:34:46', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7280'''),
('2013-01-22 19:34:53', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7240'''),
('2013-01-22 19:34:53', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7240'''),
('2013-01-22 19:35:02', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7200'''),
('2013-01-22 19:35:02', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7200'''),
('2013-01-22 19:35:10', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7210'''),
('2013-01-22 19:35:10', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7210'''),
('2013-01-22 19:35:18', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7220'''),
('2013-01-22 19:35:18', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7220'''),
('2013-01-22 19:35:26', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7260'''),
('2013-01-22 19:35:26', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7260'''),
('2013-01-22 19:35:34', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7090'''),
('2013-01-22 19:35:34', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7090'''),
('2013-01-22 19:35:44', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7080'''),
('2013-01-22 19:35:44', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7080'''),
('2013-01-22 19:35:53', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7060'''),
('2013-01-22 19:35:53', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7060'''),
('2013-01-22 19:36:06', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7100'''),
('2013-01-22 19:36:06', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7100'''),
('2013-01-22 19:36:13', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7050'''),
('2013-01-22 19:36:13', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7050'''),
('2013-01-22 19:36:24', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7350'''),
('2013-01-22 19:36:24', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7350'''),
('2013-01-22 19:36:33', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7300'''),
('2013-01-22 19:36:33', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7300'''),
('2013-01-22 19:37:06', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7230'''),
('2013-01-22 19:37:06', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7230'''),
('2013-01-22 19:37:16', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7070'''),
('2013-01-22 19:37:16', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7070'''),
('2013-01-22 19:37:32', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7040'''),
('2013-01-22 19:37:32', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7040'''),
('2013-01-22 19:37:40', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7150'''),
('2013-01-22 19:37:40', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7150'''),
('2013-01-22 19:37:56', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''7030'''),
('2013-01-22 19:37:56', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''7030'''),
('2013-01-22 19:38:26', 'admin', 'UPDATE chartmaster SET accountname=''VAT/input tax on EXEMPT activi'',\n						group_=''Expenses''\n				WHERE accountcode =''6999'''),
('2013-01-22 19:38:46', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6590'''),
('2013-01-22 19:38:46', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6590'''),
('2013-01-22 19:38:53', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6550'''),
('2013-01-22 19:38:53', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6550'''),
('2013-01-22 19:39:13', 'admin', 'UPDATE chartmaster SET accountname=''IIA Inc.\\''s Gain Fee'',\n						group_=''Expenses''\n				WHERE accountcode =''6253'''),
('2013-01-22 19:39:41', 'admin', 'DELETE FROM chartdetails WHERE accountcode=''6150'''),
('2013-01-22 19:39:41', 'admin', 'DELETE FROM chartmaster WHERE accountcode= ''6150'''),
('2013-01-23 12:09:52', 'admin', 'INSERT INTO locations (loccode,\n										locationname,\n										deladd1,\n										deladd2,\n										deladd3,\n										deladd4,\n										deladd5,\n										deladd6,\n										tel,\n										fax,\n										email,\n										contact,\n										taxprovinceid,\n										cashsalecustomer,\n										cashsalebranch,\n										managed )\n						VALUES (''MKT'',\n								''Philippines'',\n								''Unit 702 139 Corporate Center '',\n								''Valero St.'',\n								''Salcedo Village'',\n								''Makati City'',\n								''1227'',\n								''Philippines'',\n								''+63 2 940 9551'',\n								''+63 2 325 0414'',\n								''weberp@weberpdemo.com'',\n								''Clarisse Andino'',\n								''1'',\n								'''',\n				        		'''',\n								''0'')'),
('2013-01-23 12:09:52', 'admin', 'INSERT INTO locstock (\n					loccode,\n					stockid,\n					quantity,\n					reorderlevel)\n			SELECT ''MKT'',\n				stockmaster.stockid,\n				0,\n				0\n			FROM stockmaster'),
('2013-01-23 12:10:26', 'admin', 'INSERT INTO taxprovinces (taxprovincename )\n					VALUES (''None'')'),
('2013-01-23 12:10:26', 'admin', 'INSERT INTO taxauthrates (taxauthority, dispatchtaxprovince, taxcatid)\n					SELECT taxauthorities.taxid, ''2'', taxcategories.taxcatid\n					FROM taxauthorities CROSS JOIN taxcategories'),
('2013-01-23 12:10:50', 'admin', 'UPDATE locations SET loccode=''MEL'',\n									locationname=''Melbourne'',\n									deladd1=''1234 Collins Street'',\n									deladd2=''Melbourne'',\n									deladd3=''Victoria 2345'',\n									deladd4='''',\n									deladd5='''',\n									deladd6=''Australia'',\n									tel=''+61 3 56789012'',\n									fax=''+61 3 56789013'',\n									email=''jacko@webdemo.com'',\n									contact=''Jack Roberts'',\n									taxprovinceid = ''2'',\n									cashsalecustomer ='''',\n									cashsalebranch ='''',\n									managed = ''0''\n						WHERE loccode = ''MEL'''),
('2013-01-23 12:12:22', 'admin', 'UPDATE config SET confvalue = ''companies/weberpold/EDI_Incoming_Orders'' WHERE confname = ''part_pics_dir'''),
('2013-01-23 12:12:22', 'admin', 'UPDATE config SET confvalue = ''companies/weberpold/EDI_Incoming_Orders'' WHERE confname = ''reports_dir'''),
('2013-01-23 12:12:22', 'admin', 'UPDATE config SET confvalue = ''1900-01-01'' WHERE confname = ''ProhibitPostingsBefore'''),
('2013-01-23 12:12:22', 'admin', 'UPDATE config SET confvalue=''MKT'' WHERE confname=''DefaultFactoryLocation'''),
('2013-01-23 12:12:33', 'admin', 'UPDATE locations SET loccode=''TOR'',\n									locationname=''Toronto'',\n									deladd1=''Level 100 '',\n									deladd2=''CN Tower'',\n									deladd3=''Toronto'',\n									deladd4='''',\n									deladd5='''',\n									deladd6='''',\n									tel='''',\n									fax='''',\n									email='''',\n									contact=''Clive Contrary'',\n									taxprovinceid = ''1'',\n									cashsalecustomer ='''',\n									cashsalebranch ='''',\n									managed = ''0''\n						WHERE loccode = ''TOR'''),
('2013-01-23 12:13:21', 'admin', 'UPDATE www_users\n				SET displayrecordsmax=''50'',\n					theme=''aguapop'',\n					language=''en_US.utf8'',\n					email=''siteadmin@iia-p.org'',\n					pdflanguage=''0''\n				WHERE userid = ''admin'''),
('2013-01-23 12:13:39', 'admin', 'UPDATE www_users SET realname=''Demonstration user'',\n						customerid='''',\n						phone='''',\n						email=''siteadmin@iia-p.org'',\n						\n						branchcode='''',\n						supplierid='''',\n						salesman='''',\n						pagesize=''A4'',\n						fullaccess=''8'',\n						cancreatetender=''0'',\n						theme=''aguapop'',\n						language =''en_US.utf8'',\n						defaultlocation=''MKT'',\n						modulesallowed=''1,1,1,1,1,1,1,1,1,1,'',\n						blocked=''0'',\n						pdflanguage=''0''\n					WHERE userid = ''admin'''),
('2013-01-23 12:14:02', 'admin', 'DELETE FROM taxauthrates\n								WHERE dispatchtaxprovince=''2'''),
('2013-01-23 12:14:02', 'admin', 'DELETE FROM locstock WHERE loccode =''MEL'''),
('2013-01-23 12:14:02', 'admin', 'DELETE FROM locations WHERE loccode=''MEL'''),
('2013-01-23 12:14:10', 'admin', 'UPDATE locations SET loccode=''TOR'',\n									locationname=''Toronto'',\n									deladd1=''Level 100 '',\n									deladd2=''CN Tower'',\n									deladd3=''Toronto'',\n									deladd4='''',\n									deladd5='''',\n									deladd6='''',\n									tel='''',\n									fax='''',\n									email='''',\n									contact=''Clive Contrary'',\n									taxprovinceid = ''2'',\n									cashsalecustomer ='''',\n									cashsalebranch ='''',\n									managed = ''0''\n						WHERE loccode = ''TOR'''),
('2013-01-23 12:14:10', 'admin', 'DELETE FROM taxauthrates WHERE dispatchtaxprovince=''2'''),
('2013-01-23 12:14:10', 'admin', 'INSERT INTO taxauthrates (taxauthority,\n										dispatchtaxprovince,\n										taxcatid)\n							SELECT taxid,\n								''2'',\n								''1''\n							FROM taxauthorities'),
('2013-01-23 12:14:10', 'admin', 'INSERT INTO taxauthrates (taxauthority,\n										dispatchtaxprovince,\n										taxcatid)\n							SELECT taxid,\n								''2'',\n								''2''\n							FROM taxauthorities'),
('2013-01-23 12:14:11', 'admin', 'INSERT INTO taxauthrates (taxauthority,\n										dispatchtaxprovince,\n										taxcatid)\n							SELECT taxid,\n								''2'',\n								''4''\n							FROM taxauthorities'),
('2013-01-23 12:14:11', 'admin', 'INSERT INTO taxauthrates (taxauthority,\n										dispatchtaxprovince,\n										taxcatid)\n							SELECT taxid,\n								''2'',\n								''5''\n							FROM taxauthorities'),
('2013-01-23 12:14:16', 'admin', 'DELETE FROM taxauthrates\n								WHERE dispatchtaxprovince=''2'''),
('2013-01-23 12:14:17', 'admin', 'DELETE FROM locstock WHERE loccode =''TOR'''),
('2013-01-23 12:14:17', 'admin', 'DELETE FROM locations WHERE loccode=''TOR'''),
('2013-01-23 12:17:31', 'admin', 'INSERT INTO www_users (userid,\n						realname,\n						customerid,\n						branchcode,\n						supplierid,\n						salesman,\n						password,\n						phone,\n						email,\n						pagesize,\n						fullaccess,\n						cancreatetender,\n						defaultlocation,\n						modulesallowed,\n						displayrecordsmax,\n						theme,\n						language,\n						pdflanguage)\n					VALUES (''iiap_api'',\n						''API'',\n						'''',\n						'''',\n						'''',\n						'''',\n						''a46e5607a231e168d5f97c56cfad17178c5079d4'',\n						'''',\n						'''',\n						''A4'',\n						''8'',\n						''0'',\n						''MKT'',\n						''1,1,1,1,1,1,1,1,1,1,'',\n						''50'',\n						''silverwolf'',\n						''en_GB.utf8'',\n						''0'')'),
('2013-01-23 14:28:02', 'admin', 'UPDATE www_users SET lastvisitdate=''2013-01-23 14:28:02''\n							WHERE www_users.userid=''admin''');

-- --------------------------------------------------------

--
-- Table structure for table `bankaccounts`
--

CREATE TABLE IF NOT EXISTS `bankaccounts` (
  `accountcode` varchar(20) NOT NULL DEFAULT '0',
  `currcode` char(3) NOT NULL,
  `invoice` smallint(2) NOT NULL DEFAULT '0',
  `bankaccountcode` varchar(50) NOT NULL DEFAULT '',
  `bankaccountname` char(50) NOT NULL DEFAULT '',
  `bankaccountnumber` char(50) NOT NULL DEFAULT '',
  `bankaddress` char(50) DEFAULT NULL,
  PRIMARY KEY (`accountcode`),
  KEY `currcode` (`currcode`),
  KEY `BankAccountName` (`bankaccountname`),
  KEY `BankAccountNumber` (`bankaccountnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bankaccounts`
--

INSERT INTO `bankaccounts` (`accountcode`, `currcode`, `invoice`, `bankaccountcode`, `bankaccountname`, `bankaccountnumber`, `bankaddress`) VALUES
('1010', 'PHP', 2, '', 'CIB-BPI PESO ACCT#3561-0030-08', '3561-0030-08	', ''),
('1011', 'PHP', 0, '', 'CIB-BPI USD$Accnt#3564-0058-26', '3564-0058-26', ''),
('1012', 'PHP', 0, '', 'CIB-BPI USD$Accnt#0454-0137-78', '0454-0137-78', ''),
('1020', 'PHP', 0, '', 'CIB-CBC PESOACCNT#124-042011-9', '124-042011-9', '');

-- --------------------------------------------------------

--
-- Table structure for table `banktrans`
--

CREATE TABLE IF NOT EXISTS `banktrans` (
  `banktransid` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `transno` bigint(20) NOT NULL DEFAULT '0',
  `bankact` varchar(20) NOT NULL DEFAULT '0',
  `ref` varchar(50) NOT NULL DEFAULT '',
  `amountcleared` double NOT NULL DEFAULT '0',
  `exrate` double NOT NULL DEFAULT '1' COMMENT 'From bank account currency to payment currency',
  `functionalexrate` double NOT NULL DEFAULT '1' COMMENT 'Account currency to functional currency',
  `transdate` date NOT NULL DEFAULT '0000-00-00',
  `banktranstype` varchar(30) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `currcode` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`banktransid`),
  KEY `BankAct` (`bankact`,`ref`),
  KEY `TransDate` (`transdate`),
  KEY `TransType` (`banktranstype`),
  KEY `Type` (`type`,`transno`),
  KEY `CurrCode` (`currcode`),
  KEY `ref` (`ref`),
  KEY `ref_2` (`ref`),
  KEY `ref_3` (`ref`),
  KEY `ref_4` (`ref`),
  KEY `ref_5` (`ref`),
  KEY `ref_6` (`ref`),
  KEY `ref_7` (`ref`),
  KEY `ref_8` (`ref`),
  KEY `ref_9` (`ref`),
  KEY `ref_10` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bom`
--

CREATE TABLE IF NOT EXISTS `bom` (
  `parent` char(20) NOT NULL DEFAULT '',
  `component` char(20) NOT NULL DEFAULT '',
  `workcentreadded` char(5) NOT NULL DEFAULT '',
  `loccode` char(5) NOT NULL DEFAULT '',
  `effectiveafter` date NOT NULL DEFAULT '0000-00-00',
  `effectiveto` date NOT NULL DEFAULT '9999-12-31',
  `quantity` double NOT NULL DEFAULT '1',
  `autoissue` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`parent`,`component`,`workcentreadded`,`loccode`),
  KEY `Component` (`component`),
  KEY `EffectiveAfter` (`effectiveafter`),
  KEY `EffectiveTo` (`effectiveto`),
  KEY `LocCode` (`loccode`),
  KEY `Parent` (`parent`,`effectiveafter`,`effectiveto`,`loccode`),
  KEY `Parent_2` (`parent`),
  KEY `WorkCentreAdded` (`workcentreadded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chartdetails`
--

CREATE TABLE IF NOT EXISTS `chartdetails` (
  `accountcode` varchar(20) NOT NULL DEFAULT '0',
  `period` smallint(6) NOT NULL DEFAULT '0',
  `budget` double NOT NULL DEFAULT '0',
  `actual` double NOT NULL DEFAULT '0',
  `bfwd` double NOT NULL DEFAULT '0',
  `bfwdbudget` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountcode`,`period`),
  KEY `Period` (`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chartmaster`
--

CREATE TABLE IF NOT EXISTS `chartmaster` (
  `accountcode` varchar(20) NOT NULL DEFAULT '0',
  `accountname` char(50) NOT NULL DEFAULT '',
  `group_` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`accountcode`),
  KEY `AccountName` (`accountname`),
  KEY `Group_` (`group_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chartmaster`
--

INSERT INTO `chartmaster` (`accountcode`, `accountname`, `group_`) VALUES
('0', '', 'Sales'),
('1', 'Default Sales/Discounts', 'Sales'),
('1001', 'CASH ON HAND', 'Cash'),
('1002', 'PETTY CASH FUND', 'Cash'),
('1010', 'CIB-BPI PESO ACCT#3561-0030-08', 'Cash'),
('1011', 'CIB-BPI USD$Accnt#3564-0058-26', 'Cash'),
('1012', 'CIB-BPI USD$Accnt#0454-0137-78', 'Cash'),
('1020', 'CIB-CBC PESOACCNT#124-042011-9', 'Cash'),
('1025', 'CIB-CBC CONVENTION #042841-2	', 'Cash'),
('1030', 'CIB-BDO PESOACCNT#691-00217-45', 'Cash'),
('1031', 'CIB-BDO TRIPARTITE691-00279-80', 'Cash'),
('1081', 'CIB-CBC TIME DEP PESO', 'Cash'),
('1082', 'CIB-CBC TIME DEPUSD$', 'Cash'),
('1083', 'CIB-BPI TIME DEP USD$', 'Cash'),
('1084', 'CIB-BPI TIME DEP Php', 'Cash'),
('1085', 'CIB-BDO PLACEMENT IMA03', 'Cash'),
('1098', 'IIA INC. FUNDS - HELD IN TRUST', 'Cash'),
('1099', 'Reserved for SINKING FUND', 'Cash'),
('1100', 'RECEIVABLE -MEMBERSHIP', 'Accounts Receivable'),
('1101', 'RECEIVABLE -CIA REVIEW', 'Accounts Receivable'),
('1105', 'RECEIVABLES - CIA EXAM', 'Accounts Receivable'),
('1110', 'RECEIVABLE-IN HOUSE CIA REVIEW', 'Accounts Receivable'),
('1111', 'RECEIVABLE-IN HOUSE SEMINAR', 'Accounts Receivable'),
('1115', 'RECEIVABLE-PUBLIC SEMINARS', 'Accounts Receivable'),
('1120', 'RECEIVABLE- CONVENTION', 'Accounts Receivable'),
('1121', 'RECEIVABLE - TRIPARTITE', 'Accounts Receivable'),
('1150', 'RECEIVABLES- OTHERS', 'Accounts Receivable'),
('1199', 'Allowance for Doubtful Account', 'Accounts Receivable'),
('1200', 'Inventory- ISPPIA / PPF', 'Inventory'),
('1201', 'Inventory- IA JOURNAL', 'Inventory'),
('1202', 'Inventory - Review materials', 'Inventory'),
('1203', 'Inventory - GLEIMS Print', 'Inventory'),
('1204', 'Inventory - Wiley Books', 'Inventory'),
('1290', 'Inventory - Office Supplies', 'Inventory'),
('1291', 'INVENTORY - OTHER MDSE', 'Inventory'),
('1299', 'Allow. for Inventory Obsolescence', 'Inventory'),
('1300', 'DUE FROM - IIA INC', 'Other Current Assets'),
('1301', 'DUE FROM- IIA MALAYSIA', 'Other Current Assets'),
('1311', 'DUE FROM - AFFILIATES CEBU', 'Other Current Assets'),
('1312', 'DUE FROM - AFFILIATES DAVAO', 'Other Current Assets'),
('1313', 'DUE FR - ACIIA/ASIAN CAE FORUM', 'Other Current Assets'),
('1315', 'DUE FROM - CONVENTION', 'Other Current Assets'),
('1370', 'ADVANCES-OFFICERS &amp; EMPLOYEES', 'Other Current Assets'),
('1371', 'ADVANCES FOR LIQUIDATION', 'Other Current Assets'),
('1372', 'ADVANCES TO SUPPLIERS', 'Other Current Assets'),
('1380', 'REFUNDABLE DEPOSITS', 'Other Current Assets'),
('1400', 'Prepaid Expense- Rental', 'Other Current Assets'),
('1420', 'Creditable INPUT tax', 'Other Current Assets'),
('1430', 'Creditable Withholding Tax', 'Other Current Assets'),
('1450', 'Prepaid expense - Others', 'Other Current Assets'),
('1500', 'Office Unit &amp; Improvements', 'Fixed Assets'),
('1501', 'Accum. deprn - Leasehold', 'Accumulated Depreciation'),
('1510', 'Office furniture and fixtures', 'Fixed Assets'),
('1511', 'Accum. deprn- Furniture &amp; Fix', 'Accumulated Depreciation'),
('1520', 'Office equipment', 'Fixed Assets'),
('1521', 'Accum, deprn - Office Equip''t.', 'Accumulated Depreciation'),
('1530', 'Transportation equipment', 'Fixed Assets'),
('1531', 'Accum. deprn - Transpo Equip''t', 'Accumulated Depreciation'),
('1540', 'Other asset - software', 'Fixed Assets'),
('1541', 'Accumulated deprn - software', 'Accumulated Depreciation'),
('1800', 'Other assets - library material', 'Other Assets'),
('1850', 'Other assets - deposits', 'Other Assets'),
('1900', 'SINKING FUND - for future Proj', 'Other Assets'),
('1901', 'Trust Fund Assets', 'Other Assets'),
('2001', 'Accounts payable', 'Accounts Payable'),
('2010', 'Other Accounts Payable', 'Other Current Liabilities'),
('2099', 'Accrued Expenses', 'Other Current Liabilities'),
('2101', 'WITHHOLDING TAX - COMPENSATION', 'Other Current Liabilities'),
('2102', 'WITHHOLDING TAX - EXPANDED', 'Other Current Liabilities'),
('2103', 'SSS CONT.PAYABLES', 'Other Current Liabilities'),
('2104', 'SSS LOANS PAYABLES', 'Other Current Liabilities'),
('2105', 'PHILHEALTH CONT. PAYABLES', 'Other Current Liabilities'),
('2106', 'PAG-IBIG CONT. PAYABLES', 'Other Current Liabilities'),
('2107', 'PAG-IBIG LOANS PAYABLES', 'Other Current Liabilities'),
('2110', 'VAT / Output Tax Payable', 'Other Current Liabilities'),
('2111', 'INCOME TAX PAYABLE', 'Other Current Liabilities'),
('2112', 'Deferred VAT - Output Tax - (AR)', 'Other Current Liabilities'),
('2200', 'REFUNDS-Members/Non-member', 'Other Current Liabilities'),
('2210', 'DEFERRED INCOME-MEMBERSHIP', 'Other Current Liabilities'),
('2211', 'DEFERRED INCOME-CIA EXAM', 'Other Current Liabilities'),
('2212', 'DEFERRED INCOME - REVIEW', 'Other Current Liabilities'),
('2213', 'DEFERRED INCOME - JOURNAL SUBS', 'Other Current Liabilities'),
('2214', 'DEFERRED INCOME - CONVENTION', 'Other Current Liabilities'),
('2300', 'Other AP- CONVENTION', 'Other Current Liabilities'),
('2301', 'Other AP- MEMBERSHIP', 'Other Current Liabilities'),
('2302', 'Other AP- SEMINARS', 'Other Current Liabilities'),
('2303', 'Other AP- CERTIFICATION', 'Other Current Liabilities'),
('2304', 'Other AP- REVIEW', 'Other Current Liabilities'),
('2400', 'DUE TO - IIA INC', 'Other Current Liabilities'),
('2401', 'DUE TO - IIA INC MALAYSIA', 'Other Current Liabilities'),
('2402', 'DUE TO - Affiliates ACIIA', 'Other Current Liabilities'),
('2403', 'DUE TO - Affiliates IIAPCebu', 'Other Current Liabilities'),
('2404', 'DUE TO- Affiliates IIAPDavao', 'Other Current Liabilities'),
('2405', 'DUE TO - CONVENTION', 'Other Current Liabilities'),
('2500', 'Funds Held in Trust', 'Other Current Liabilities'),
('2501', 'Funds Held in Trust CIA Exam 1', 'Other Current Liabilities'),
('2502', 'Funds Held in Trust CIA Exam 2', 'Other Current Liabilities'),
('2503', 'Funds Held in Trust CIA Exam 3', 'Other Current Liabilities'),
('2504', 'Funds Held in Trust CIA Exam 4', 'Other Current Liabilities'),
('2505', 'Funds Held in Trust CCSA Exam', 'Other Current Liabilities'),
('2506', 'Funds Held in Trust CFSA Exam', 'Other Current Liabilities'),
('2507', 'Funds Held in Trust - Tripartite', 'Other Current Liabilities'),
('3099', 'Beginning Balance Equity', 'Equity-does not close'),
('3100', 'Fund Bal. - unappropriated', 'Equity-Retained Earnings'),
('3101', 'Prior Period Adjustment', 'Equity-gets closed'),
('3200', 'Fund Bal. - APPROPRIATED', 'Equity-does not close'),
('3400', 'RECEIVABLE- CONVENTION', 'Accounts Receivable'),
('3500', 'RECEIVABLES- OTHERS', 'Accounts Receivable'),
('4001', 'Membership - Annual dues', 'Income'),
('4051', 'Registration Fees- GMM/AGM', 'Income'),
('4052', 'Registration Fees - Convention', 'Income'),
('4053', 'SPONSORSHIP - Convention/Event', 'Income'),
('4054', 'Registration fees - Tripartite', 'Income'),
('4100', 'CIA Seminar - IN HOUSE', 'Income'),
('4101', 'CIA Seminar Series- Part 1', 'Income'),
('4102', 'CIA Seminar Series- Part 2', 'Income'),
('4103', 'CIA Seminar Series- Part 3', 'Income'),
('4110', 'CFSA Certification Review', 'Income'),
('4119', 'Output tax on CIA Review Fees', 'Income'),
('4150', 'Public Run-Seminars&amp;Workshops', 'Income'),
('4159', 'Output tax on Public Run Sem', 'Income'),
('4160', 'In-House-Seminars&amp;Workshops', 'Income'),
('4169', 'Output tax on In-House-Sem', 'Income'),
('4200', 'CIA Exam - Registration Fee', 'Income'),
('4201', 'CIA Exam Fee Part1', 'Income'),
('4202', 'CIA Exam Fee Part 2', 'Income'),
('4203', 'CIA Exam Fee Part 3', 'Income'),
('4204', 'CIA Exam Fee Part 4', 'Income'),
('4205', 'CIA Exam Fee Part 4 - Credit', 'Income'),
('4210', 'CCSA /CFSA EXAM FEE', 'Income'),
('4220', 'MOCK EXAM FEE', 'Income'),
('4230', 'DEFERRALS - EXAM', 'Income'),
('4250', 'CANCELLATIONS- FEE/REG', 'Income'),
('4300', 'Q.A.R. ENGAGEMENT FEE', 'Income'),
('4410', 'Discount-Early bird', 'Income'),
('4420', 'Discount- Early bird&amp;Volume', 'Income'),
('4430', 'Discounts- Volume/Group', 'Income'),
('4440', 'Discount - Others', 'Income'),
('4500', 'Sale of materials - Journal', 'Income'),
('4510', 'Sale of materials - GLEIMS pri', 'Income'),
('4511', 'Sale of materials - GLEIMS sof', 'Income'),
('4520', 'Sale of materials - ISPPIA', 'Income'),
('4540', 'Sale of materials - Review Mat', 'Income'),
('4550', 'Sale of materials - WILEY Book', 'Income'),
('4560', 'Sale of materials - ADB blue', 'Income'),
('4561', 'Sale of materials - ADB red', 'Income'),
('4900', 'Interest Inc. fr. saving acct.', 'Income'),
('4901', 'Int. Inc. fr.T/D &amp; money plcmn', 'Income'),
('4950', 'Other/ Misc income -OTHERS', 'Income'),
('5001', 'COST: Membership &amp; Affiliation', 'Cost of Sales'),
('5051', 'COST: GMM / AGM', 'Cost of Sales'),
('5052', 'COST: Convention', 'Cost of Sales'),
('5100', 'COST: CIA Review Class', 'Cost of Sales'),
('5150', 'COST: In-House Seminar', 'Cost of Sales'),
('5160', 'COST: Public Run Seminar', 'Cost of Sales'),
('5200', 'COST: Exams CIA/CFSA/CCSA', 'Cost of Sales'),
('5300', 'COST: QAR Engagement', 'Cost of Sales'),
('5500', 'COST OF Sale - Journal', 'Cost of Sales'),
('5510', 'COST OF Sale - GLEIMS print', 'Cost of Sales'),
('5511', 'COST OF Sale - GLEIMS software', 'Cost of Sales'),
('5520', 'COST OF Sale - ISPPIA', 'Cost of Sales'),
('5540', 'COST OF Sale- Review Materials', 'Cost of Sales'),
('5550', 'COST OF Sale - WILEY Book', 'Cost of Sales'),
('5599', 'COST OF Sale - others', 'Cost of Sales'),
('6001', 'Salaries and Wages', 'Expenses'),
('6002', 'Overtime Pay', 'Expenses'),
('6003', 'SL/VL Benefits', 'Expenses'),
('6004', '13th Month/Bonus/Incentive', 'Expenses'),
('6008', 'ER ShareSSS, PHIC HDMF Premium', 'Expenses'),
('6009', 'Employee benefits', 'Expenses'),
('6010', 'Meals/Pantry-Secratariat', 'Expenses'),
('6050', 'Training, Seminars &amp; Workshop', 'Expenses'),
('6100', 'RENTAL - Seminars, Training, etc', 'Expenses'),
('6101', 'Rental - Events'' venue', 'Expenses'),
('6102', 'Rental - Office/Secratariat', 'Expenses'),
('6103', 'Association dues', 'Expenses'),
('6109', 'Insurance', 'Expenses'),
('6110', 'Telephone/Communication', 'Expenses'),
('6111', 'Power, Light &amp; Water', 'Expenses'),
('6120', 'Website Hosting', 'Expenses'),
('6200', 'Management/Consultancy Fees', 'Expenses'),
('6201', 'Professional Fees - Seminars', 'Expenses'),
('6202', 'Professional Fees - Others', 'Expenses'),
('6210', 'Messengerial Srvc, Mailing/Post', 'Expenses'),
('6250', 'IIA Inc.''s Share in Membership', 'Expenses'),
('6251', 'IIA Inc.''s Royalty-Seminars', 'Expenses'),
('6252', 'IIA Inc.''s Royalty-Cert. Exams', 'Expenses'),
('6253', 'IIA Inc.''s Gain Fee', 'Expenses'),
('6300', 'Transportation (local)', 'Expenses'),
('6301', 'Transportation &amp; Travel', 'Expenses'),
('6302', 'Accomodation', 'Expenses'),
('6303', 'Meals - Other Events,Conv,GMMs', 'Expenses'),
('6304', 'Meals - Seminars', 'Expenses'),
('6400', 'Conferences &amp; Meetings', 'Expenses'),
('6401', 'Representation &amp; Entertainment', 'Expenses'),
('6402', 'Advertising/Promotional items', 'Expenses'),
('6403', 'Awards and Tokens', 'Expenses'),
('6404', 'Marketing Merchandise', 'Expenses'),
('6410', 'Research &amp; Development', 'Expenses'),
('6500', 'Office Supplies', 'Expenses'),
('6502', 'Event Materia&amp; Supplies', 'Expenses'),
('6503', 'Reproduction/printing/Photocopy', 'Expenses'),
('6600', 'Taxes, Licenses &amp; Registration', 'Expenses'),
('6700', 'Repair and Maintenance', 'Expenses'),
('6800', 'Depreciation and amortization', 'Expenses'),
('6801', 'Provisions for Bad debts', 'Expenses'),
('6900', 'Freight Charges', 'Expenses'),
('6950', 'Bank &amp; other Charges', 'Expenses'),
('6997', 'Donations and Contributions', 'Expenses'),
('6998', 'Miscellaneous Expenses', 'Expenses'),
('6999', 'VAT/input tax on EXEMPT activi', 'Expenses'),
('7000', 'Forex Gain (Loss) - Unrealized', 'Expenses'),
('7001', 'Forex Gain (Loss) - Realized', 'Expenses'),
('7020', 'Loss on inventory obsolence', 'Expenses'),
('8000', 'Sundry/Suspense Acct', 'Expenses'),
('8001', 'INCOME TAX EXPENSE', 'Expenses');

-- --------------------------------------------------------

--
-- Table structure for table `cogsglpostings`
--

CREATE TABLE IF NOT EXISTS `cogsglpostings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` char(3) NOT NULL DEFAULT '',
  `stkcat` varchar(6) NOT NULL DEFAULT '',
  `glcode` int(11) NOT NULL DEFAULT '0',
  `salestype` char(2) NOT NULL DEFAULT 'AN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Area_StkCat` (`area`,`stkcat`,`salestype`),
  KEY `Area` (`area`),
  KEY `StkCat` (`stkcat`),
  KEY `GLCode` (`glcode`),
  KEY `SalesType` (`salestype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cogsglpostings`
--

INSERT INTO `cogsglpostings` (`id`, `area`, `stkcat`, `glcode`, `salestype`) VALUES
(5, 'AN', 'ANY', 1, 'AN');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `coycode` int(11) NOT NULL DEFAULT '1',
  `coyname` varchar(50) NOT NULL DEFAULT '',
  `gstno` varchar(20) NOT NULL DEFAULT '',
  `companynumber` varchar(20) NOT NULL DEFAULT '0',
  `regoffice1` varchar(40) NOT NULL DEFAULT '',
  `regoffice2` varchar(40) NOT NULL DEFAULT '',
  `regoffice3` varchar(40) NOT NULL DEFAULT '',
  `regoffice4` varchar(40) NOT NULL DEFAULT '',
  `regoffice5` varchar(20) NOT NULL DEFAULT '',
  `regoffice6` varchar(15) NOT NULL DEFAULT '',
  `telephone` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `currencydefault` varchar(4) NOT NULL DEFAULT '',
  `debtorsact` int(11) NOT NULL DEFAULT '70000',
  `pytdiscountact` int(11) NOT NULL DEFAULT '55000',
  `creditorsact` int(11) NOT NULL DEFAULT '80000',
  `payrollact` int(11) NOT NULL DEFAULT '84000',
  `grnact` int(11) NOT NULL DEFAULT '72000',
  `exchangediffact` int(11) NOT NULL DEFAULT '65000',
  `purchasesexchangediffact` int(11) NOT NULL DEFAULT '0',
  `retainedearnings` int(11) NOT NULL DEFAULT '90000',
  `gllink_debtors` tinyint(1) DEFAULT '1',
  `gllink_creditors` tinyint(1) DEFAULT '1',
  `gllink_stock` tinyint(1) DEFAULT '1',
  `freightact` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`coycode`, `coyname`, `gstno`, `companynumber`, `regoffice1`, `regoffice2`, `regoffice3`, `regoffice4`, `regoffice5`, `regoffice6`, `telephone`, `fax`, `email`, `currencydefault`, `debtorsact`, `pytdiscountact`, `creditorsact`, `payrollact`, `grnact`, `exchangediffact`, `purchasesexchangediffact`, `retainedearnings`, `gllink_debtors`, `gllink_creditors`, `gllink_stock`, `freightact`) VALUES
(1, 'Institute of Internal Auditors PH', 'not entered yet', '', 'Unit 702 139 Corporate Center', 'Valero St.', 'Salcedo Village', 'Makati City', '1227', 'Philippines', '+63 2 940 9551', '+63 2 325 0414', 'weberp@weberpdemo.com', 'PHP', 1002, 1, 1001, 1030, 1031, 1, 1, 1031, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `confname` varchar(35) NOT NULL DEFAULT '',
  `confvalue` text NOT NULL,
  PRIMARY KEY (`confname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`confname`, `confvalue`) VALUES
('AllowOrderLineItemNarrative', '1'),
('AllowSalesOfZeroCostItems', '0'),
('AutoAuthorisePO', '1'),
('AutoCreateWOs', '1'),
('AutoDebtorNo', '0'),
('AutoIssue', '1'),
('CheckCreditLimits', '0'),
('Check_Price_Charged_vs_Order_Price', '1'),
('Check_Qty_Charged_vs_Del_Qty', '1'),
('CountryOfOperation', 'USD'),
('CreditingControlledItems_MustExist', '0'),
('DB_Maintenance', '30'),
('DB_Maintenance_LastRun', '2013-01-17'),
('DefaultBlindPackNote', '1'),
('DefaultCreditLimit', '1000'),
('DefaultCustomerType', '1'),
('DefaultDateFormat', 'm/d/Y'),
('DefaultDisplayRecordsMax', '50'),
('DefaultFactoryLocation', 'MKT'),
('DefaultPriceList', ''),
('DefaultSupplierType', '1'),
('DefaultTaxCategory', '1'),
('DefaultTheme', 'silverwolf'),
('Default_Shipper', '1'),
('DefineControlledOnWOEntry', '1'),
('DispatchCutOffTime', '14'),
('DoFreightCalc', '0'),
('EDIHeaderMsgId', 'D:01B:UN:EAN010'),
('EDIReference', 'WEBERP'),
('EDI_Incoming_Orders', 'companies/weberpdemo/EDI_Incoming_Orders'),
('EDI_MsgPending', 'companies/weberpdemo/EDI_MsgPending'),
('EDI_MsgSent', 'companies/weberpdemo/EDI_Sent'),
('Extended_CustomerInfo', '0'),
('Extended_SupplierInfo', '0'),
('FactoryManagerEmail', 'manager@company.com'),
('FreightChargeAppliesIfLessThan', '1000'),
('FreightTaxCategory', '1'),
('FrequentlyOrderedItems', '0'),
('geocode_integration', '0'),
('HTTPS_Only', '0'),
('InventoryManagerEmail', ''),
('InvoicePortraitFormat', '1'),
('LogPath', ''),
('LogSeverity', '1'),
('MaxImageSize', '300'),
('MonthsAuditTrail', '1'),
('NumberOfMonthMustBeShown', '6'),
('NumberOfPeriodsOfStockUsage', '12'),
('OverChargeProportion', '30'),
('OverReceiveProportion', '20'),
('PackNoteFormat', '1'),
('PageLength', '48'),
('part_pics_dir', 'companies/weberpold/EDI_Incoming_Orders'),
('PastDueDays1', '30'),
('PastDueDays2', '60'),
('PO_AllowSameItemMultipleTimes', '1'),
('ProhibitJournalsToControlAccounts', '1'),
('ProhibitNegativeStock', '1'),
('ProhibitPostingsBefore', '1900-01-01'),
('PurchasingManagerEmail', 'test@company.com'),
('QuickEntries', '10'),
('RadioBeaconFileCounter', '/home/RadioBeacon/FileCounter'),
('RadioBeaconFTP_user_name', 'RadioBeacon ftp server user name'),
('RadioBeaconHomeDir', '/home/RadioBeacon'),
('RadioBeaconStockLocation', 'BL'),
('RadioBraconFTP_server', '192.168.2.2'),
('RadioBreaconFilePrefix', 'ORDXX'),
('RadionBeaconFTP_user_pass', 'Radio Beacon remote ftp server password'),
('reports_dir', 'companies/weberpold/EDI_Incoming_Orders'),
('RequirePickingNote', '0'),
('RomalpaClause', 'Ownership will not pass to the buyer until the goods have been paid for in full.'),
('ShowStockidOnImages', '0'),
('ShowValueOnGRN', '1'),
('Show_Settled_LastMonth', '1'),
('SO_AllowSameItemMultipleTimes', '1'),
('StandardCostDecimalPlaces', '2'),
('TaxAuthorityReferenceName', ''),
('UpdateCurrencyRatesDaily', '0'),
('VersionNumber', '4.09.1'),
('WeightedAverageCosting', '0'),
('WikiApp', 'Disabled'),
('WikiPath', 'wiki'),
('WorkingDaysWeek', '5'),
('YearEnd', '12');

-- --------------------------------------------------------

--
-- Table structure for table `contractbom`
--

CREATE TABLE IF NOT EXISTS `contractbom` (
  `contractref` varchar(20) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `workcentreadded` char(5) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`contractref`,`stockid`,`workcentreadded`),
  KEY `Stockid` (`stockid`),
  KEY `ContractRef` (`contractref`),
  KEY `WorkCentreAdded` (`workcentreadded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contractcharges`
--

CREATE TABLE IF NOT EXISTS `contractcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractref` varchar(20) NOT NULL,
  `transtype` smallint(6) NOT NULL DEFAULT '20',
  `transno` int(11) NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `narrative` text NOT NULL,
  `anticipated` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contractref` (`contractref`,`transtype`,`transno`),
  KEY `contractcharges_ibfk_2` (`transtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contractreqts`
--

CREATE TABLE IF NOT EXISTS `contractreqts` (
  `contractreqid` int(11) NOT NULL AUTO_INCREMENT,
  `contractref` varchar(20) NOT NULL DEFAULT '0',
  `requirement` varchar(40) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1',
  `costperunit` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`contractreqid`),
  KEY `ContractRef` (`contractref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE IF NOT EXISTS `contracts` (
  `contractref` varchar(20) NOT NULL DEFAULT '',
  `contractdescription` text NOT NULL,
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `categoryid` varchar(6) NOT NULL DEFAULT '',
  `orderno` int(11) NOT NULL DEFAULT '0',
  `customerref` varchar(20) NOT NULL DEFAULT '',
  `margin` double NOT NULL DEFAULT '1',
  `wo` int(11) NOT NULL DEFAULT '0',
  `requireddate` date NOT NULL DEFAULT '0000-00-00',
  `drawing` varchar(50) NOT NULL DEFAULT '',
  `exrate` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`contractref`),
  KEY `OrderNo` (`orderno`),
  KEY `CategoryID` (`categoryid`),
  KEY `Status` (`status`),
  KEY `WO` (`wo`),
  KEY `loccode` (`loccode`),
  KEY `DebtorNo` (`debtorno`,`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `currency` char(20) NOT NULL DEFAULT '',
  `currabrev` char(3) NOT NULL DEFAULT '',
  `country` char(50) NOT NULL DEFAULT '',
  `hundredsname` char(15) NOT NULL DEFAULT 'Cents',
  `decimalplaces` tinyint(3) NOT NULL DEFAULT '2',
  `rate` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`currabrev`),
  KEY `Country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currency`, `currabrev`, `country`, `hundredsname`, `decimalplaces`, `rate`) VALUES
('Australian Dollars', 'AUD', 'Australia', 'cents', 2, 0.02464268112370626),
('Swiss Francs', 'CHF', 'Swizerland', 'centimes', 2, 0.02464268112370626),
('Euro', 'EUR', 'Euroland', 'cents', 2, 0.010842779694430755),
('Pounds', 'GBP', 'England', 'Pence', 2, 0.01971414489896501),
('Peso', 'PHP', 'Philippines', 'centavo', 2, 1),
('US Dollars', 'USD', 'United States', 'Cents', 2, 0.020946278955150322);

-- --------------------------------------------------------

--
-- Table structure for table `custallocns`
--

CREATE TABLE IF NOT EXISTS `custallocns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amt` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `datealloc` date NOT NULL DEFAULT '0000-00-00',
  `transid_allocfrom` int(11) NOT NULL DEFAULT '0',
  `transid_allocto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `DateAlloc` (`datealloc`),
  KEY `TransID_AllocFrom` (`transid_allocfrom`),
  KEY `TransID_AllocTo` (`transid_allocto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custbranch`
--

CREATE TABLE IF NOT EXISTS `custbranch` (
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `brname` varchar(40) NOT NULL DEFAULT '',
  `braddress1` varchar(40) NOT NULL DEFAULT '',
  `braddress2` varchar(40) NOT NULL DEFAULT '',
  `braddress3` varchar(40) NOT NULL DEFAULT '',
  `braddress4` varchar(50) NOT NULL DEFAULT '',
  `braddress5` varchar(20) NOT NULL DEFAULT '',
  `braddress6` varchar(40) NOT NULL DEFAULT '',
  `lat` float(10,6) NOT NULL DEFAULT '0.000000',
  `lng` float(10,6) NOT NULL DEFAULT '0.000000',
  `estdeliverydays` smallint(6) NOT NULL DEFAULT '1',
  `area` char(3) NOT NULL,
  `salesman` varchar(4) NOT NULL DEFAULT '',
  `fwddate` smallint(6) NOT NULL DEFAULT '0',
  `phoneno` varchar(20) NOT NULL DEFAULT '',
  `faxno` varchar(20) NOT NULL DEFAULT '',
  `contactname` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `defaultlocation` varchar(5) NOT NULL DEFAULT '',
  `taxgroupid` tinyint(4) NOT NULL DEFAULT '1',
  `defaultshipvia` int(11) NOT NULL DEFAULT '1',
  `deliverblind` tinyint(1) DEFAULT '1',
  `disabletrans` tinyint(4) NOT NULL DEFAULT '0',
  `brpostaddr1` varchar(40) NOT NULL DEFAULT '',
  `brpostaddr2` varchar(40) NOT NULL DEFAULT '',
  `brpostaddr3` varchar(30) NOT NULL DEFAULT '',
  `brpostaddr4` varchar(20) NOT NULL DEFAULT '',
  `brpostaddr5` varchar(20) NOT NULL DEFAULT '',
  `brpostaddr6` varchar(15) NOT NULL DEFAULT '',
  `specialinstructions` text NOT NULL,
  `custbranchcode` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`branchcode`,`debtorno`),
  KEY `BrName` (`brname`),
  KEY `DebtorNo` (`debtorno`),
  KEY `Salesman` (`salesman`),
  KEY `Area` (`area`),
  KEY `DefaultLocation` (`defaultlocation`),
  KEY `DefaultShipVia` (`defaultshipvia`),
  KEY `taxgroupid` (`taxgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custcontacts`
--

CREATE TABLE IF NOT EXISTS `custcontacts` (
  `contid` int(11) NOT NULL AUTO_INCREMENT,
  `debtorno` varchar(10) NOT NULL,
  `contactname` varchar(40) NOT NULL,
  `role` varchar(40) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `email` varchar(55) NOT NULL,
  PRIMARY KEY (`contid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custnotes`
--

CREATE TABLE IF NOT EXISTS `custnotes` (
  `noteid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `debtorno` varchar(10) NOT NULL DEFAULT '0',
  `href` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `priority` varchar(20) NOT NULL,
  PRIMARY KEY (`noteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `debtorsmaster`
--

CREATE TABLE IF NOT EXISTS `debtorsmaster` (
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '',
  `address1` varchar(40) NOT NULL DEFAULT '',
  `address2` varchar(40) NOT NULL DEFAULT '',
  `address3` varchar(40) NOT NULL DEFAULT '',
  `address4` varchar(50) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL DEFAULT '',
  `address6` varchar(40) NOT NULL DEFAULT '',
  `currcode` char(3) NOT NULL DEFAULT '',
  `salestype` char(2) NOT NULL DEFAULT '',
  `clientsince` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `holdreason` smallint(6) NOT NULL DEFAULT '0',
  `paymentterms` char(2) NOT NULL DEFAULT 'f',
  `discount` double NOT NULL DEFAULT '0',
  `pymtdiscount` double NOT NULL DEFAULT '0',
  `lastpaid` double NOT NULL DEFAULT '0',
  `lastpaiddate` datetime DEFAULT NULL,
  `creditlimit` double NOT NULL DEFAULT '1000',
  `invaddrbranch` tinyint(4) NOT NULL DEFAULT '0',
  `discountcode` char(2) NOT NULL DEFAULT '',
  `ediinvoices` tinyint(4) NOT NULL DEFAULT '0',
  `ediorders` tinyint(4) NOT NULL DEFAULT '0',
  `edireference` varchar(20) NOT NULL DEFAULT '',
  `editransport` varchar(5) NOT NULL DEFAULT 'email',
  `ediaddress` varchar(50) NOT NULL DEFAULT '',
  `ediserveruser` varchar(20) NOT NULL DEFAULT '',
  `ediserverpwd` varchar(20) NOT NULL DEFAULT '',
  `taxref` varchar(20) NOT NULL DEFAULT '',
  `customerpoline` tinyint(1) NOT NULL DEFAULT '0',
  `typeid` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`debtorno`),
  KEY `Currency` (`currcode`),
  KEY `HoldReason` (`holdreason`),
  KEY `Name` (`name`),
  KEY `PaymentTerms` (`paymentterms`),
  KEY `SalesType` (`salestype`),
  KEY `EDIInvoices` (`ediinvoices`),
  KEY `EDIOrders` (`ediorders`),
  KEY `debtorsmaster_ibfk_5` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `debtortrans`
--

CREATE TABLE IF NOT EXISTS `debtortrans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transno` int(11) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `trandate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputdate` datetime NOT NULL,
  `prd` smallint(6) NOT NULL DEFAULT '0',
  `settled` tinyint(4) NOT NULL DEFAULT '0',
  `reference` varchar(20) NOT NULL DEFAULT '',
  `tpe` char(2) NOT NULL DEFAULT '',
  `order_` int(11) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  `ovamount` double NOT NULL DEFAULT '0',
  `ovgst` double NOT NULL DEFAULT '0',
  `ovfreight` double NOT NULL DEFAULT '0',
  `ovdiscount` double NOT NULL DEFAULT '0',
  `diffonexch` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `invtext` text,
  `shipvia` int(11) NOT NULL DEFAULT '0',
  `edisent` tinyint(4) NOT NULL DEFAULT '0',
  `consignment` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `DebtorNo` (`debtorno`,`branchcode`),
  KEY `Order_` (`order_`),
  KEY `Prd` (`prd`),
  KEY `Tpe` (`tpe`),
  KEY `Type` (`type`),
  KEY `Settled` (`settled`),
  KEY `TranDate` (`trandate`),
  KEY `TransNo` (`transno`),
  KEY `Type_2` (`type`,`transno`),
  KEY `EDISent` (`edisent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `debtortranstaxes`
--

CREATE TABLE IF NOT EXISTS `debtortranstaxes` (
  `debtortransid` int(11) NOT NULL DEFAULT '0',
  `taxauthid` tinyint(4) NOT NULL DEFAULT '0',
  `taxamount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`debtortransid`,`taxauthid`),
  KEY `taxauthid` (`taxauthid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `debtortype`
--

CREATE TABLE IF NOT EXISTS `debtortype` (
  `typeid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `debtortypenotes`
--

CREATE TABLE IF NOT EXISTS `debtortypenotes` (
  `noteid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(4) NOT NULL DEFAULT '0',
  `href` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `priority` varchar(20) NOT NULL,
  PRIMARY KEY (`noteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deliverynotes`
--

CREATE TABLE IF NOT EXISTS `deliverynotes` (
  `deliverynotenumber` int(11) NOT NULL,
  `deliverynotelineno` tinyint(4) NOT NULL,
  `salesorderno` int(11) NOT NULL,
  `salesorderlineno` int(11) NOT NULL,
  `qtydelivered` double NOT NULL DEFAULT '0',
  `printed` tinyint(4) NOT NULL DEFAULT '0',
  `invoiced` tinyint(4) NOT NULL DEFAULT '0',
  `deliverydate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`deliverynotenumber`,`deliverynotelineno`),
  KEY `deliverynotes_ibfk_2` (`salesorderno`,`salesorderlineno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `departmentid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  `authoriser` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `discountmatrix`
--

CREATE TABLE IF NOT EXISTS `discountmatrix` (
  `salestype` char(2) NOT NULL DEFAULT '',
  `discountcategory` char(2) NOT NULL DEFAULT '',
  `quantitybreak` int(11) NOT NULL DEFAULT '1',
  `discountrate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`salestype`,`discountcategory`,`quantitybreak`),
  KEY `QuantityBreak` (`quantitybreak`),
  KEY `DiscountCategory` (`discountcategory`),
  KEY `SalesType` (`salestype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ediitemmapping`
--

CREATE TABLE IF NOT EXISTS `ediitemmapping` (
  `supporcust` varchar(4) NOT NULL DEFAULT '',
  `partnercode` varchar(10) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `partnerstockid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`supporcust`,`partnercode`,`stockid`),
  KEY `PartnerCode` (`partnercode`),
  KEY `StockID` (`stockid`),
  KEY `PartnerStockID` (`partnerstockid`),
  KEY `SuppOrCust` (`supporcust`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `edimessageformat`
--

CREATE TABLE IF NOT EXISTS `edimessageformat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnercode` varchar(10) NOT NULL DEFAULT '',
  `messagetype` varchar(6) NOT NULL DEFAULT '',
  `section` varchar(7) NOT NULL DEFAULT '',
  `sequenceno` int(11) NOT NULL DEFAULT '0',
  `linetext` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `PartnerCode` (`partnercode`,`messagetype`,`sequenceno`),
  KEY `Section` (`section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `edi_orders_segs`
--

CREATE TABLE IF NOT EXISTS `edi_orders_segs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `segtag` char(3) NOT NULL DEFAULT '',
  `seggroup` tinyint(4) NOT NULL DEFAULT '0',
  `maxoccur` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SegTag` (`segtag`),
  KEY `SegNo` (`seggroup`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=96 ;

--
-- Dumping data for table `edi_orders_segs`
--

INSERT INTO `edi_orders_segs` (`id`, `segtag`, `seggroup`, `maxoccur`) VALUES
(1, 'UNB', 0, 1),
(2, 'UNH', 0, 1),
(3, 'BGM', 0, 1),
(4, 'DTM', 0, 35),
(5, 'PAI', 0, 1),
(6, 'ALI', 0, 5),
(7, 'FTX', 0, 99),
(8, 'RFF', 1, 1),
(9, 'DTM', 1, 5),
(10, 'NAD', 2, 1),
(11, 'LOC', 2, 99),
(12, 'FII', 2, 5),
(13, 'RFF', 3, 1),
(14, 'CTA', 5, 1),
(15, 'COM', 5, 5),
(16, 'TAX', 6, 1),
(17, 'MOA', 6, 1),
(18, 'CUX', 7, 1),
(19, 'DTM', 7, 5),
(20, 'PAT', 8, 1),
(21, 'DTM', 8, 5),
(22, 'PCD', 8, 1),
(23, 'MOA', 9, 1),
(24, 'TDT', 10, 1),
(25, 'LOC', 11, 1),
(26, 'DTM', 11, 5),
(27, 'TOD', 12, 1),
(28, 'LOC', 12, 2),
(29, 'PAC', 13, 1),
(30, 'PCI', 14, 1),
(31, 'RFF', 14, 1),
(32, 'DTM', 14, 5),
(33, 'GIN', 14, 10),
(34, 'EQD', 15, 1),
(35, 'ALC', 19, 1),
(36, 'ALI', 19, 5),
(37, 'DTM', 19, 5),
(38, 'QTY', 20, 1),
(39, 'RNG', 20, 1),
(40, 'PCD', 21, 1),
(41, 'RNG', 21, 1),
(42, 'MOA', 22, 1),
(43, 'RNG', 22, 1),
(44, 'RTE', 23, 1),
(45, 'RNG', 23, 1),
(46, 'TAX', 24, 1),
(47, 'MOA', 24, 1),
(48, 'LIN', 28, 1),
(49, 'PIA', 28, 25),
(50, 'IMD', 28, 99),
(51, 'MEA', 28, 99),
(52, 'QTY', 28, 99),
(53, 'ALI', 28, 5),
(54, 'DTM', 28, 35),
(55, 'MOA', 28, 10),
(56, 'GIN', 28, 127),
(57, 'QVR', 28, 1),
(58, 'FTX', 28, 99),
(59, 'PRI', 32, 1),
(60, 'CUX', 32, 1),
(61, 'DTM', 32, 5),
(62, 'RFF', 33, 1),
(63, 'DTM', 33, 5),
(64, 'PAC', 34, 1),
(65, 'QTY', 34, 5),
(66, 'PCI', 36, 1),
(67, 'RFF', 36, 1),
(68, 'DTM', 36, 5),
(69, 'GIN', 36, 10),
(70, 'LOC', 37, 1),
(71, 'QTY', 37, 1),
(72, 'DTM', 37, 5),
(73, 'TAX', 38, 1),
(74, 'MOA', 38, 1),
(75, 'NAD', 39, 1),
(76, 'CTA', 42, 1),
(77, 'COM', 42, 5),
(78, 'ALC', 43, 1),
(79, 'ALI', 43, 5),
(80, 'DTM', 43, 5),
(81, 'QTY', 44, 1),
(82, 'RNG', 44, 1),
(83, 'PCD', 45, 1),
(84, 'RNG', 45, 1),
(85, 'MOA', 46, 1),
(86, 'RNG', 46, 1),
(87, 'RTE', 47, 1),
(88, 'RNG', 47, 1),
(89, 'TAX', 48, 1),
(90, 'MOA', 48, 1),
(91, 'TDT', 49, 1),
(92, 'UNS', 50, 1),
(93, 'MOA', 50, 1),
(94, 'CNT', 50, 1),
(95, 'UNT', 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `edi_orders_seg_groups`
--

CREATE TABLE IF NOT EXISTS `edi_orders_seg_groups` (
  `seggroupno` tinyint(4) NOT NULL DEFAULT '0',
  `maxoccur` int(4) NOT NULL DEFAULT '0',
  `parentseggroup` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seggroupno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `edi_orders_seg_groups`
--

INSERT INTO `edi_orders_seg_groups` (`seggroupno`, `maxoccur`, `parentseggroup`) VALUES
(0, 1, 0),
(1, 9999, 0),
(2, 99, 0),
(3, 99, 2),
(5, 5, 2),
(6, 5, 0),
(7, 5, 0),
(8, 10, 0),
(9, 9999, 8),
(10, 10, 0),
(11, 10, 10),
(12, 5, 0),
(13, 99, 0),
(14, 5, 13),
(15, 10, 0),
(19, 99, 0),
(20, 1, 19),
(21, 1, 19),
(22, 2, 19),
(23, 1, 19),
(24, 5, 19),
(28, 200000, 0),
(32, 25, 28),
(33, 9999, 28),
(34, 99, 28),
(36, 5, 34),
(37, 9999, 28),
(38, 10, 28),
(39, 999, 28),
(42, 5, 39),
(43, 99, 28),
(44, 1, 43),
(45, 1, 43),
(46, 2, 43),
(47, 1, 43),
(48, 5, 43),
(49, 10, 28),
(50, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emailsettings`
--

CREATE TABLE IF NOT EXISTS `emailsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(30) NOT NULL,
  `port` char(5) NOT NULL,
  `heloaddress` varchar(20) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `timeout` int(11) DEFAULT '5',
  `companyname` varchar(50) DEFAULT NULL,
  `auth` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `factorcompanies`
--

CREATE TABLE IF NOT EXISTS `factorcompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coyname` varchar(50) NOT NULL DEFAULT '',
  `address1` varchar(40) NOT NULL DEFAULT '',
  `address2` varchar(40) NOT NULL DEFAULT '',
  `address3` varchar(40) NOT NULL DEFAULT '',
  `address4` varchar(40) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL DEFAULT '',
  `address6` varchar(15) NOT NULL DEFAULT '',
  `contact` varchar(25) NOT NULL DEFAULT '',
  `telephone` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `factor_name` (`coyname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fixedassetcategories`
--

CREATE TABLE IF NOT EXISTS `fixedassetcategories` (
  `categoryid` char(6) NOT NULL DEFAULT '',
  `categorydescription` char(20) NOT NULL DEFAULT '',
  `costact` int(11) NOT NULL DEFAULT '0',
  `depnact` int(11) NOT NULL DEFAULT '0',
  `disposalact` int(11) NOT NULL DEFAULT '80000',
  `accumdepnact` int(11) NOT NULL DEFAULT '0',
  `defaultdepnrate` double NOT NULL DEFAULT '0.2',
  `defaultdepntype` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fixedassetlocations`
--

CREATE TABLE IF NOT EXISTS `fixedassetlocations` (
  `locationid` char(6) NOT NULL DEFAULT '',
  `locationdescription` char(20) NOT NULL DEFAULT '',
  `parentlocationid` char(6) DEFAULT '',
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fixedassets`
--

CREATE TABLE IF NOT EXISTS `fixedassets` (
  `assetid` int(11) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `barcode` varchar(20) NOT NULL,
  `assetlocation` varchar(6) NOT NULL DEFAULT '',
  `cost` double NOT NULL DEFAULT '0',
  `accumdepn` double NOT NULL DEFAULT '0',
  `datepurchased` date NOT NULL DEFAULT '0000-00-00',
  `disposalproceeds` double NOT NULL DEFAULT '0',
  `assetcategoryid` varchar(6) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `longdescription` text NOT NULL,
  `depntype` int(11) NOT NULL DEFAULT '1',
  `depnrate` double NOT NULL,
  `disposaldate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`assetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fixedassettrans`
--

CREATE TABLE IF NOT EXISTS `fixedassettrans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetid` int(11) NOT NULL,
  `transtype` tinyint(4) NOT NULL,
  `transdate` date NOT NULL,
  `transno` int(11) NOT NULL,
  `periodno` smallint(6) NOT NULL,
  `inputdate` date NOT NULL,
  `fixedassettranstype` varchar(8) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assetid` (`assetid`,`transtype`,`transno`),
  KEY `inputdate` (`inputdate`),
  KEY `transdate` (`transdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `freightcosts`
--

CREATE TABLE IF NOT EXISTS `freightcosts` (
  `shipcostfromid` int(11) NOT NULL AUTO_INCREMENT,
  `locationfrom` varchar(5) NOT NULL DEFAULT '',
  `destination` varchar(40) NOT NULL DEFAULT '',
  `shipperid` int(11) NOT NULL DEFAULT '0',
  `cubrate` double NOT NULL DEFAULT '0',
  `kgrate` double NOT NULL DEFAULT '0',
  `maxkgs` double NOT NULL DEFAULT '999999',
  `maxcub` double NOT NULL DEFAULT '999999',
  `fixedprice` double NOT NULL DEFAULT '0',
  `minimumchg` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipcostfromid`),
  KEY `Destination` (`destination`),
  KEY `LocationFrom` (`locationfrom`),
  KEY `ShipperID` (`shipperid`),
  KEY `Destination_2` (`destination`,`locationfrom`,`shipperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `geocode_param`
--

CREATE TABLE IF NOT EXISTS `geocode_param` (
  `geocodeid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `geocode_key` varchar(200) NOT NULL DEFAULT '',
  `center_long` varchar(20) NOT NULL DEFAULT '',
  `center_lat` varchar(20) NOT NULL DEFAULT '',
  `map_height` varchar(10) NOT NULL DEFAULT '',
  `map_width` varchar(10) NOT NULL DEFAULT '',
  `map_host` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`geocodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gltrans`
--

CREATE TABLE IF NOT EXISTS `gltrans` (
  `counterindex` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `typeno` bigint(16) NOT NULL DEFAULT '1',
  `chequeno` int(11) NOT NULL DEFAULT '0',
  `trandate` date NOT NULL DEFAULT '0000-00-00',
  `periodno` smallint(6) NOT NULL DEFAULT '0',
  `account` varchar(20) NOT NULL DEFAULT '0',
  `narrative` varchar(200) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `posted` tinyint(4) NOT NULL DEFAULT '0',
  `jobref` varchar(20) NOT NULL DEFAULT '',
  `tag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`counterindex`),
  KEY `Account` (`account`),
  KEY `ChequeNo` (`chequeno`),
  KEY `PeriodNo` (`periodno`),
  KEY `Posted` (`posted`),
  KEY `TranDate` (`trandate`),
  KEY `TypeNo` (`typeno`),
  KEY `Type_and_Number` (`type`,`typeno`),
  KEY `JobRef` (`jobref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `grns`
--

CREATE TABLE IF NOT EXISTS `grns` (
  `grnbatch` smallint(6) NOT NULL DEFAULT '0',
  `grnno` int(11) NOT NULL AUTO_INCREMENT,
  `podetailitem` int(11) NOT NULL DEFAULT '0',
  `itemcode` varchar(20) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '0000-00-00',
  `itemdescription` varchar(100) NOT NULL DEFAULT '',
  `qtyrecd` double NOT NULL DEFAULT '0',
  `quantityinv` double NOT NULL DEFAULT '0',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `stdcostunit` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`grnno`),
  KEY `DeliveryDate` (`deliverydate`),
  KEY `ItemCode` (`itemcode`),
  KEY `PODetailItem` (`podetailitem`),
  KEY `SupplierID` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `holdreasons`
--

CREATE TABLE IF NOT EXISTS `holdreasons` (
  `reasoncode` smallint(6) NOT NULL DEFAULT '1',
  `reasondescription` char(30) NOT NULL DEFAULT '',
  `dissallowinvoices` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`reasoncode`),
  KEY `ReasonDescription` (`reasondescription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holdreasons`
--

INSERT INTO `holdreasons` (`reasoncode`, `reasondescription`, `dissallowinvoices`) VALUES
(1, 'Good History', 0),
(20, 'Watch', 0),
(51, 'In liquidation', 1);

-- --------------------------------------------------------

--
-- Table structure for table `internalstockcatrole`
--

CREATE TABLE IF NOT EXISTS `internalstockcatrole` (
  `categoryid` varchar(6) NOT NULL,
  `secroleid` int(11) NOT NULL,
  PRIMARY KEY (`categoryid`,`secroleid`),
  KEY `internalstockcatrole_ibfk_1` (`categoryid`),
  KEY `internalstockcatrole_ibfk_2` (`secroleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `labelfields`
--

CREATE TABLE IF NOT EXISTS `labelfields` (
  `labelfieldid` int(11) NOT NULL AUTO_INCREMENT,
  `labelid` tinyint(4) NOT NULL,
  `fieldvalue` varchar(20) NOT NULL,
  `vpos` double NOT NULL DEFAULT '0',
  `hpos` double NOT NULL DEFAULT '0',
  `fontsize` tinyint(4) NOT NULL,
  `barcode` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`labelfieldid`),
  KEY `labelid` (`labelid`),
  KEY `vpos` (`vpos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE IF NOT EXISTS `labels` (
  `labelid` tinyint(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `pagewidth` double NOT NULL DEFAULT '0',
  `pageheight` double NOT NULL DEFAULT '0',
  `height` double NOT NULL DEFAULT '0',
  `width` double NOT NULL DEFAULT '0',
  `topmargin` double NOT NULL DEFAULT '0',
  `leftmargin` double NOT NULL DEFAULT '0',
  `rowheight` double NOT NULL DEFAULT '0',
  `columnwidth` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`labelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lastcostrollup`
--

CREATE TABLE IF NOT EXISTS `lastcostrollup` (
  `stockid` char(20) NOT NULL DEFAULT '',
  `totalonhand` double NOT NULL DEFAULT '0',
  `matcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `labcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `oheadcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `categoryid` char(6) NOT NULL DEFAULT '',
  `stockact` int(11) NOT NULL DEFAULT '0',
  `adjglact` int(11) NOT NULL DEFAULT '0',
  `newmatcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `newlabcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `newoheadcost` decimal(20,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `locationname` varchar(50) NOT NULL DEFAULT '',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL DEFAULT '',
  `deladd3` varchar(40) NOT NULL DEFAULT '',
  `deladd4` varchar(40) NOT NULL DEFAULT '',
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `taxprovinceid` tinyint(4) NOT NULL DEFAULT '1',
  `cashsalecustomer` varchar(10) DEFAULT '',
  `managed` int(11) DEFAULT '0',
  `cashsalebranch` varchar(10) DEFAULT '',
  `internalrequest` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Allow (1) or not (0) internal request from this location',
  PRIMARY KEY (`loccode`),
  UNIQUE KEY `locationname` (`locationname`),
  KEY `taxprovinceid` (`taxprovinceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`loccode`, `locationname`, `deladd1`, `deladd2`, `deladd3`, `deladd4`, `deladd5`, `deladd6`, `tel`, `fax`, `email`, `contact`, `taxprovinceid`, `cashsalecustomer`, `managed`, `cashsalebranch`, `internalrequest`) VALUES
('MKT', 'Philippines', 'Unit 702 139 Corporate Center ', 'Valero St.', 'Salcedo Village', 'Makati City', '1227', 'Philippines', '+63 2 940 9551', '+63 2 325 0414', 'weberp@weberpdemo.com', 'Clarisse Andino', 1, '', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locstock`
--

CREATE TABLE IF NOT EXISTS `locstock` (
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '0',
  `reorderlevel` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loccode`,`stockid`),
  KEY `StockID` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loctransfers`
--

CREATE TABLE IF NOT EXISTS `loctransfers` (
  `reference` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `shipqty` double NOT NULL DEFAULT '0',
  `recqty` double NOT NULL DEFAULT '0',
  `shipdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shiploc` varchar(7) NOT NULL DEFAULT '',
  `recloc` varchar(7) NOT NULL DEFAULT '',
  KEY `Reference` (`reference`,`stockid`),
  KEY `ShipLoc` (`shiploc`),
  KEY `RecLoc` (`recloc`),
  KEY `StockID` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Shipments To And From Locations';

-- --------------------------------------------------------

--
-- Table structure for table `mrpcalendar`
--

CREATE TABLE IF NOT EXISTS `mrpcalendar` (
  `calendardate` date NOT NULL,
  `daynumber` int(6) NOT NULL,
  `manufacturingflag` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`calendardate`),
  KEY `daynumber` (`daynumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mrpdemands`
--

CREATE TABLE IF NOT EXISTS `mrpdemands` (
  `demandid` int(11) NOT NULL AUTO_INCREMENT,
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `mrpdemandtype` varchar(6) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '0',
  `duedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`demandid`),
  KEY `StockID` (`stockid`),
  KEY `mrpdemands_ibfk_1` (`mrpdemandtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mrpdemandtypes`
--

CREATE TABLE IF NOT EXISTS `mrpdemandtypes` (
  `mrpdemandtype` varchar(6) NOT NULL DEFAULT '',
  `description` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`mrpdemandtype`),
  KEY `mrpdemandtype` (`mrpdemandtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mrpplannedorders`
--

CREATE TABLE IF NOT EXISTS `mrpplannedorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part` char(20) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `supplyquantity` double DEFAULT NULL,
  `ordertype` varchar(6) DEFAULT NULL,
  `orderno` int(11) DEFAULT NULL,
  `mrpdate` date DEFAULT NULL,
  `updateflag` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
  `offerid` int(11) NOT NULL AUTO_INCREMENT,
  `tenderid` int(11) NOT NULL DEFAULT '0',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '0',
  `uom` varchar(15) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `expirydate` date NOT NULL DEFAULT '0000-00-00',
  `currcode` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`offerid`),
  KEY `offers_ibfk_1` (`supplierid`),
  KEY `offers_ibfk_2` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orderdeliverydifferenceslog`
--

CREATE TABLE IF NOT EXISTS `orderdeliverydifferenceslog` (
  `orderno` int(11) NOT NULL DEFAULT '0',
  `invoiceno` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantitydiff` double NOT NULL DEFAULT '0',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branch` varchar(10) NOT NULL DEFAULT '',
  `can_or_bo` char(3) NOT NULL DEFAULT 'CAN',
  KEY `StockID` (`stockid`),
  KEY `DebtorNo` (`debtorno`,`branch`),
  KEY `Can_or_BO` (`can_or_bo`),
  KEY `OrderNo` (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethods`
--

CREATE TABLE IF NOT EXISTS `paymentmethods` (
  `paymentid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `paymentname` varchar(15) NOT NULL DEFAULT '',
  `paymenttype` int(11) NOT NULL DEFAULT '1',
  `receipttype` int(11) NOT NULL DEFAULT '1',
  `usepreprintedstationery` tinyint(4) NOT NULL DEFAULT '0',
  `opencashdrawer` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paymentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `paymentmethods`
--

INSERT INTO `paymentmethods` (`paymentid`, `paymentname`, `paymenttype`, `receipttype`, `usepreprintedstationery`, `opencashdrawer`) VALUES
(1, 'Cheque', 1, 1, 1, 0),
(2, 'Cash', 1, 1, 0, 0),
(3, 'Direct Credit', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `paymentterms`
--

CREATE TABLE IF NOT EXISTS `paymentterms` (
  `termsindicator` char(2) NOT NULL DEFAULT '',
  `terms` char(40) NOT NULL DEFAULT '',
  `daysbeforedue` smallint(6) NOT NULL DEFAULT '0',
  `dayinfollowingmonth` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`termsindicator`),
  KEY `DaysBeforeDue` (`daysbeforedue`),
  KEY `DayInFollowingMonth` (`dayinfollowingmonth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paymentterms`
--

INSERT INTO `paymentterms` (`termsindicator`, `terms`, `daysbeforedue`, `dayinfollowingmonth`) VALUES
('20', 'Due 20th Of the Following Month', 0, 22),
('30', 'Due By End Of The Following Month', 0, 30),
('7', 'Payment due within 7 days', 7, 0),
('CA', 'Cash Only', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pcashdetails`
--

CREATE TABLE IF NOT EXISTS `pcashdetails` (
  `counterindex` int(20) NOT NULL AUTO_INCREMENT,
  `tabcode` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `codeexpense` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `authorized` date NOT NULL COMMENT 'date cash assigment was revised and authorized by authorizer from tabs table',
  `posted` tinyint(4) NOT NULL COMMENT 'has (or has not) been posted into gltrans',
  `notes` text NOT NULL,
  `receipt` text COMMENT 'filename or path to scanned receipt or code of receipt to find physical receipt if tax guys or auditors show up',
  PRIMARY KEY (`counterindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pcexpenses`
--

CREATE TABLE IF NOT EXISTS `pcexpenses` (
  `codeexpense` varchar(20) NOT NULL COMMENT 'code for the group',
  `description` varchar(50) NOT NULL COMMENT 'text description, e.g. meals, train tickets, fuel, etc',
  `glaccount` varchar(20) NOT NULL DEFAULT '0',
  `tag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codeexpense`),
  KEY `glaccount` (`glaccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pctabexpenses`
--

CREATE TABLE IF NOT EXISTS `pctabexpenses` (
  `typetabcode` varchar(20) NOT NULL,
  `codeexpense` varchar(20) NOT NULL,
  KEY `typetabcode` (`typetabcode`),
  KEY `codeexpense` (`codeexpense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pctabs`
--

CREATE TABLE IF NOT EXISTS `pctabs` (
  `tabcode` varchar(20) NOT NULL,
  `usercode` varchar(20) NOT NULL COMMENT 'code of user employee from www_users',
  `typetabcode` varchar(20) NOT NULL,
  `currency` char(3) NOT NULL,
  `tablimit` double NOT NULL,
  `assigner` varchar(20) NOT NULL COMMENT 'Cash assigner for the tab',
  `authorizer` varchar(20) NOT NULL COMMENT 'code of user from www_users',
  `glaccountassignment` varchar(20) NOT NULL DEFAULT '0',
  `glaccountpcash` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tabcode`),
  KEY `usercode` (`usercode`),
  KEY `typetabcode` (`typetabcode`),
  KEY `currency` (`currency`),
  KEY `authorizer` (`authorizer`),
  KEY `glaccountassignment` (`glaccountassignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pctypetabs`
--

CREATE TABLE IF NOT EXISTS `pctypetabs` (
  `typetabcode` varchar(20) NOT NULL COMMENT 'code for the type of petty cash tab',
  `typetabdescription` varchar(50) NOT NULL COMMENT 'text description, e.g. tab for CEO',
  PRIMARY KEY (`typetabcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

CREATE TABLE IF NOT EXISTS `periods` (
  `periodno` smallint(6) NOT NULL DEFAULT '0',
  `lastdate_in_period` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`periodno`),
  KEY `LastDate_in_Period` (`lastdate_in_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pickinglistdetails`
--

CREATE TABLE IF NOT EXISTS `pickinglistdetails` (
  `pickinglistno` int(11) NOT NULL DEFAULT '0',
  `pickinglistlineno` int(11) NOT NULL DEFAULT '0',
  `orderlineno` int(11) NOT NULL DEFAULT '0',
  `qtyexpected` double NOT NULL DEFAULT '0',
  `qtypicked` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`pickinglistno`,`pickinglistlineno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pickinglists`
--

CREATE TABLE IF NOT EXISTS `pickinglists` (
  `pickinglistno` int(11) NOT NULL DEFAULT '0',
  `orderno` int(11) NOT NULL DEFAULT '0',
  `pickinglistdate` date NOT NULL DEFAULT '0000-00-00',
  `dateprinted` date NOT NULL DEFAULT '0000-00-00',
  `deliverynotedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`pickinglistno`),
  KEY `pickinglists_ibfk_1` (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE IF NOT EXISTS `prices` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `typeabbrev` char(2) NOT NULL DEFAULT '',
  `currabrev` char(3) NOT NULL DEFAULT '',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `enddate` date NOT NULL DEFAULT '9999-12-31',
  PRIMARY KEY (`stockid`,`typeabbrev`,`currabrev`,`debtorno`,`branchcode`,`startdate`,`enddate`),
  KEY `CurrAbrev` (`currabrev`),
  KEY `DebtorNo` (`debtorno`),
  KEY `StockID` (`stockid`),
  KEY `TypeAbbrev` (`typeabbrev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchdata`
--

CREATE TABLE IF NOT EXISTS `purchdata` (
  `supplierno` char(10) NOT NULL DEFAULT '',
  `stockid` char(20) NOT NULL DEFAULT '',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `suppliersuom` char(50) NOT NULL DEFAULT '',
  `conversionfactor` double NOT NULL DEFAULT '1',
  `supplierdescription` char(50) NOT NULL DEFAULT '',
  `leadtime` smallint(6) NOT NULL DEFAULT '1',
  `preferred` tinyint(4) NOT NULL DEFAULT '0',
  `effectivefrom` date NOT NULL,
  `suppliers_partno` varchar(50) NOT NULL DEFAULT '',
  `minorderqty` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`supplierno`,`stockid`,`effectivefrom`),
  KEY `StockID` (`stockid`),
  KEY `SupplierNo` (`supplierno`),
  KEY `Preferred` (`preferred`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchorderauth`
--

CREATE TABLE IF NOT EXISTS `purchorderauth` (
  `userid` varchar(20) NOT NULL DEFAULT '',
  `currabrev` char(3) NOT NULL DEFAULT '',
  `cancreate` smallint(2) NOT NULL DEFAULT '0',
  `authlevel` int(11) NOT NULL DEFAULT '0',
  `offhold` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`currabrev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchorderdetails`
--

CREATE TABLE IF NOT EXISTS `purchorderdetails` (
  `podetailitem` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` int(11) NOT NULL DEFAULT '0',
  `itemcode` varchar(20) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '0000-00-00',
  `itemdescription` varchar(100) NOT NULL,
  `glcode` int(11) NOT NULL DEFAULT '0',
  `qtyinvoiced` double NOT NULL DEFAULT '0',
  `unitprice` double NOT NULL DEFAULT '0',
  `actprice` double NOT NULL DEFAULT '0',
  `stdcostunit` double NOT NULL DEFAULT '0',
  `quantityord` double NOT NULL DEFAULT '0',
  `quantityrecd` double NOT NULL DEFAULT '0',
  `shiptref` int(11) NOT NULL DEFAULT '0',
  `jobref` varchar(20) NOT NULL DEFAULT '',
  `completed` tinyint(4) NOT NULL DEFAULT '0',
  `suppliersunit` varchar(50) DEFAULT NULL,
  `suppliers_partno` varchar(50) NOT NULL DEFAULT '',
  `assetid` int(11) NOT NULL DEFAULT '0',
  `conversionfactor` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`podetailitem`),
  KEY `DeliveryDate` (`deliverydate`),
  KEY `GLCode` (`glcode`),
  KEY `ItemCode` (`itemcode`),
  KEY `JobRef` (`jobref`),
  KEY `OrderNo` (`orderno`),
  KEY `ShiptRef` (`shiptref`),
  KEY `Completed` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchorders`
--

CREATE TABLE IF NOT EXISTS `purchorders` (
  `orderno` int(11) NOT NULL AUTO_INCREMENT,
  `supplierno` varchar(10) NOT NULL DEFAULT '',
  `comments` longblob,
  `orddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rate` double NOT NULL DEFAULT '1',
  `dateprinted` datetime DEFAULT NULL,
  `allowprint` tinyint(4) NOT NULL DEFAULT '1',
  `initiator` varchar(10) DEFAULT NULL,
  `requisitionno` varchar(15) DEFAULT NULL,
  `intostocklocation` varchar(5) NOT NULL DEFAULT '',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL DEFAULT '',
  `deladd3` varchar(40) NOT NULL DEFAULT '',
  `deladd4` varchar(40) NOT NULL DEFAULT '',
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `tel` varchar(15) NOT NULL DEFAULT '',
  `suppdeladdress1` varchar(40) NOT NULL DEFAULT '',
  `suppdeladdress2` varchar(40) NOT NULL DEFAULT '',
  `suppdeladdress3` varchar(40) NOT NULL DEFAULT '',
  `suppdeladdress4` varchar(40) NOT NULL DEFAULT '',
  `suppdeladdress5` varchar(20) NOT NULL DEFAULT '',
  `suppdeladdress6` varchar(15) NOT NULL DEFAULT '',
  `suppliercontact` varchar(30) NOT NULL DEFAULT '',
  `supptel` varchar(30) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `version` decimal(3,2) NOT NULL DEFAULT '1.00',
  `revised` date NOT NULL DEFAULT '0000-00-00',
  `realorderno` varchar(16) NOT NULL DEFAULT '',
  `deliveryby` varchar(100) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '0000-00-00',
  `status` varchar(12) NOT NULL DEFAULT '',
  `stat_comment` text NOT NULL,
  `paymentterms` char(2) NOT NULL DEFAULT '',
  `port` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`orderno`),
  KEY `OrdDate` (`orddate`),
  KEY `SupplierNo` (`supplierno`),
  KEY `IntoStockLocation` (`intostocklocation`),
  KEY `AllowPrintPO` (`allowprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recurringsalesorders`
--

CREATE TABLE IF NOT EXISTS `recurringsalesorders` (
  `recurrorderno` int(11) NOT NULL AUTO_INCREMENT,
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `customerref` varchar(50) NOT NULL DEFAULT '',
  `buyername` varchar(50) DEFAULT NULL,
  `comments` longblob,
  `orddate` date NOT NULL DEFAULT '0000-00-00',
  `ordertype` char(2) NOT NULL DEFAULT '',
  `shipvia` int(11) NOT NULL DEFAULT '0',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL DEFAULT '',
  `deladd3` varchar(40) NOT NULL DEFAULT '',
  `deladd4` varchar(40) DEFAULT NULL,
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `contactphone` varchar(25) DEFAULT NULL,
  `contactemail` varchar(25) DEFAULT NULL,
  `deliverto` varchar(40) NOT NULL DEFAULT '',
  `freightcost` double NOT NULL DEFAULT '0',
  `fromstkloc` varchar(5) NOT NULL DEFAULT '',
  `lastrecurrence` date NOT NULL DEFAULT '0000-00-00',
  `stopdate` date NOT NULL DEFAULT '0000-00-00',
  `frequency` tinyint(4) NOT NULL DEFAULT '1',
  `autoinvoice` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`recurrorderno`),
  KEY `debtorno` (`debtorno`),
  KEY `orddate` (`orddate`),
  KEY `ordertype` (`ordertype`),
  KEY `locationindex` (`fromstkloc`),
  KEY `branchcode` (`branchcode`,`debtorno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recurrsalesorderdetails`
--

CREATE TABLE IF NOT EXISTS `recurrsalesorderdetails` (
  `recurrorderno` int(11) NOT NULL DEFAULT '0',
  `stkcode` varchar(20) NOT NULL DEFAULT '',
  `unitprice` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discountpercent` double NOT NULL DEFAULT '0',
  `narrative` text NOT NULL,
  KEY `orderno` (`recurrorderno`),
  KEY `stkcode` (`stkcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reportcolumns`
--

CREATE TABLE IF NOT EXISTS `reportcolumns` (
  `reportid` smallint(6) NOT NULL DEFAULT '0',
  `colno` smallint(6) NOT NULL DEFAULT '0',
  `heading1` varchar(15) NOT NULL DEFAULT '',
  `heading2` varchar(15) DEFAULT NULL,
  `calculation` tinyint(1) NOT NULL DEFAULT '0',
  `periodfrom` smallint(6) DEFAULT NULL,
  `periodto` smallint(6) DEFAULT NULL,
  `datatype` varchar(15) DEFAULT NULL,
  `colnumerator` tinyint(4) DEFAULT NULL,
  `coldenominator` tinyint(4) DEFAULT NULL,
  `calcoperator` char(1) DEFAULT NULL,
  `budgetoractual` tinyint(1) NOT NULL DEFAULT '0',
  `valformat` char(1) NOT NULL DEFAULT 'N',
  `constant` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`reportid`,`colno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reportfields`
--

CREATE TABLE IF NOT EXISTS `reportfields` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `reportid` int(5) NOT NULL DEFAULT '0',
  `entrytype` varchar(15) NOT NULL DEFAULT '',
  `seqnum` int(3) NOT NULL DEFAULT '0',
  `fieldname` varchar(80) NOT NULL DEFAULT '',
  `displaydesc` varchar(25) NOT NULL DEFAULT '',
  `visible` enum('1','0') NOT NULL DEFAULT '1',
  `columnbreak` enum('1','0') NOT NULL DEFAULT '1',
  `params` text,
  PRIMARY KEY (`id`),
  KEY `reportid` (`reportid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1805 ;

-- --------------------------------------------------------

--
-- Table structure for table `reportheaders`
--

CREATE TABLE IF NOT EXISTS `reportheaders` (
  `reportid` smallint(6) NOT NULL AUTO_INCREMENT,
  `reportheading` varchar(80) NOT NULL DEFAULT '',
  `groupbydata1` varchar(15) NOT NULL DEFAULT '',
  `newpageafter1` tinyint(1) NOT NULL DEFAULT '0',
  `lower1` varchar(10) NOT NULL DEFAULT '',
  `upper1` varchar(10) NOT NULL DEFAULT '',
  `groupbydata2` varchar(15) DEFAULT NULL,
  `newpageafter2` tinyint(1) NOT NULL DEFAULT '0',
  `lower2` varchar(10) DEFAULT NULL,
  `upper2` varchar(10) DEFAULT NULL,
  `groupbydata3` varchar(15) DEFAULT NULL,
  `newpageafter3` tinyint(1) NOT NULL DEFAULT '0',
  `lower3` varchar(10) DEFAULT NULL,
  `upper3` varchar(10) DEFAULT NULL,
  `groupbydata4` varchar(15) NOT NULL DEFAULT '',
  `newpageafter4` tinyint(1) NOT NULL DEFAULT '0',
  `upper4` varchar(10) NOT NULL DEFAULT '',
  `lower4` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`reportid`),
  KEY `ReportHeading` (`reportheading`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reportlinks`
--

CREATE TABLE IF NOT EXISTS `reportlinks` (
  `table1` varchar(25) NOT NULL DEFAULT '',
  `table2` varchar(25) NOT NULL DEFAULT '',
  `equation` varchar(75) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `reportname` varchar(30) NOT NULL DEFAULT '',
  `reporttype` char(3) NOT NULL DEFAULT 'rpt',
  `groupname` varchar(9) NOT NULL DEFAULT 'misc',
  `defaultreport` enum('1','0') NOT NULL DEFAULT '0',
  `papersize` varchar(15) NOT NULL DEFAULT 'A4,210,297',
  `paperorientation` enum('P','L') NOT NULL DEFAULT 'P',
  `margintop` int(3) NOT NULL DEFAULT '10',
  `marginbottom` int(3) NOT NULL DEFAULT '10',
  `marginleft` int(3) NOT NULL DEFAULT '10',
  `marginright` int(3) NOT NULL DEFAULT '10',
  `coynamefont` varchar(20) NOT NULL DEFAULT 'Helvetica',
  `coynamefontsize` int(3) NOT NULL DEFAULT '12',
  `coynamefontcolor` varchar(11) NOT NULL DEFAULT '0,0,0',
  `coynamealign` enum('L','C','R') NOT NULL DEFAULT 'C',
  `coynameshow` enum('1','0') NOT NULL DEFAULT '1',
  `title1desc` varchar(50) NOT NULL DEFAULT '%reportname%',
  `title1font` varchar(20) NOT NULL DEFAULT 'Helvetica',
  `title1fontsize` int(3) NOT NULL DEFAULT '10',
  `title1fontcolor` varchar(11) NOT NULL DEFAULT '0,0,0',
  `title1fontalign` enum('L','C','R') NOT NULL DEFAULT 'C',
  `title1show` enum('1','0') NOT NULL DEFAULT '1',
  `title2desc` varchar(50) NOT NULL DEFAULT 'Report Generated %date%',
  `title2font` varchar(20) NOT NULL DEFAULT 'Helvetica',
  `title2fontsize` int(3) NOT NULL DEFAULT '10',
  `title2fontcolor` varchar(11) NOT NULL DEFAULT '0,0,0',
  `title2fontalign` enum('L','C','R') NOT NULL DEFAULT 'C',
  `title2show` enum('1','0') NOT NULL DEFAULT '1',
  `filterfont` varchar(10) NOT NULL DEFAULT 'Helvetica',
  `filterfontsize` int(3) NOT NULL DEFAULT '8',
  `filterfontcolor` varchar(11) NOT NULL DEFAULT '0,0,0',
  `filterfontalign` enum('L','C','R') NOT NULL DEFAULT 'L',
  `datafont` varchar(10) NOT NULL DEFAULT 'Helvetica',
  `datafontsize` int(3) NOT NULL DEFAULT '10',
  `datafontcolor` varchar(10) NOT NULL DEFAULT 'black',
  `datafontalign` enum('L','C','R') NOT NULL DEFAULT 'L',
  `totalsfont` varchar(10) NOT NULL DEFAULT 'Helvetica',
  `totalsfontsize` int(3) NOT NULL DEFAULT '10',
  `totalsfontcolor` varchar(11) NOT NULL DEFAULT '0,0,0',
  `totalsfontalign` enum('L','C','R') NOT NULL DEFAULT 'L',
  `col1width` int(3) NOT NULL DEFAULT '25',
  `col2width` int(3) NOT NULL DEFAULT '25',
  `col3width` int(3) NOT NULL DEFAULT '25',
  `col4width` int(3) NOT NULL DEFAULT '25',
  `col5width` int(3) NOT NULL DEFAULT '25',
  `col6width` int(3) NOT NULL DEFAULT '25',
  `col7width` int(3) NOT NULL DEFAULT '25',
  `col8width` int(3) NOT NULL DEFAULT '25',
  `col9width` int(3) NOT NULL DEFAULT '25',
  `col10width` int(3) NOT NULL DEFAULT '25',
  `col11width` int(3) NOT NULL DEFAULT '25',
  `col12width` int(3) NOT NULL DEFAULT '25',
  `col13width` int(3) NOT NULL DEFAULT '25',
  `col14width` int(3) NOT NULL DEFAULT '25',
  `col15width` int(3) NOT NULL DEFAULT '25',
  `col16width` int(3) NOT NULL DEFAULT '25',
  `col17width` int(3) NOT NULL DEFAULT '25',
  `col18width` int(3) NOT NULL DEFAULT '25',
  `col19width` int(3) NOT NULL DEFAULT '25',
  `col20width` int(3) NOT NULL DEFAULT '25',
  `table1` varchar(25) NOT NULL DEFAULT '',
  `table2` varchar(25) DEFAULT NULL,
  `table2criteria` varchar(75) DEFAULT NULL,
  `table3` varchar(25) DEFAULT NULL,
  `table3criteria` varchar(75) DEFAULT NULL,
  `table4` varchar(25) DEFAULT NULL,
  `table4criteria` varchar(75) DEFAULT NULL,
  `table5` varchar(25) DEFAULT NULL,
  `table5criteria` varchar(75) DEFAULT NULL,
  `table6` varchar(25) DEFAULT NULL,
  `table6criteria` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`reportname`,`groupname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=136 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesanalysis`
--

CREATE TABLE IF NOT EXISTS `salesanalysis` (
  `typeabbrev` char(2) NOT NULL DEFAULT '',
  `periodno` smallint(6) NOT NULL DEFAULT '0',
  `amt` double NOT NULL DEFAULT '0',
  `cost` double NOT NULL DEFAULT '0',
  `cust` varchar(10) NOT NULL DEFAULT '',
  `custbranch` varchar(10) NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '0',
  `disc` double NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(3) NOT NULL,
  `budgetoractual` tinyint(1) NOT NULL DEFAULT '0',
  `salesperson` char(3) NOT NULL DEFAULT '',
  `stkcategory` varchar(6) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `CustBranch` (`custbranch`),
  KEY `Cust` (`cust`),
  KEY `PeriodNo` (`periodno`),
  KEY `StkCategory` (`stkcategory`),
  KEY `StockID` (`stockid`),
  KEY `TypeAbbrev` (`typeabbrev`),
  KEY `Area` (`area`),
  KEY `BudgetOrActual` (`budgetoractual`),
  KEY `Salesperson` (`salesperson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salescat`
--

CREATE TABLE IF NOT EXISTS `salescat` (
  `salescatid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `parentcatid` tinyint(4) DEFAULT NULL,
  `salescatname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`salescatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salescatprod`
--

CREATE TABLE IF NOT EXISTS `salescatprod` (
  `salescatid` tinyint(4) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`salescatid`,`stockid`),
  KEY `salescatid` (`salescatid`),
  KEY `stockid` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salesglpostings`
--

CREATE TABLE IF NOT EXISTS `salesglpostings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(3) NOT NULL,
  `stkcat` varchar(6) NOT NULL DEFAULT '',
  `discountglcode` int(11) NOT NULL DEFAULT '0',
  `salesglcode` int(11) NOT NULL DEFAULT '0',
  `salestype` char(2) NOT NULL DEFAULT 'AN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Area_StkCat` (`area`,`stkcat`,`salestype`),
  KEY `Area` (`area`),
  KEY `StkCat` (`stkcat`),
  KEY `SalesType` (`salestype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `salesglpostings`
--

INSERT INTO `salesglpostings` (`id`, `area`, `stkcat`, `discountglcode`, `salesglcode`, `salestype`) VALUES
(1, 'AN', 'ANY', 1, 1, 'AN');

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE IF NOT EXISTS `salesman` (
  `salesmancode` char(3) NOT NULL DEFAULT '',
  `salesmanname` char(30) NOT NULL DEFAULT '',
  `smantel` char(20) NOT NULL DEFAULT '',
  `smanfax` char(20) NOT NULL DEFAULT '',
  `commissionrate1` double NOT NULL DEFAULT '0',
  `breakpoint` decimal(10,0) NOT NULL DEFAULT '0',
  `commissionrate2` double NOT NULL DEFAULT '0',
  `current` tinyint(4) NOT NULL COMMENT 'Salesman current (1) or not (0)',
  PRIMARY KEY (`salesmancode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salesorderdetails`
--

CREATE TABLE IF NOT EXISTS `salesorderdetails` (
  `orderlineno` int(11) NOT NULL DEFAULT '0',
  `orderno` int(11) NOT NULL DEFAULT '0',
  `stkcode` varchar(20) NOT NULL DEFAULT '',
  `qtyinvoiced` double NOT NULL DEFAULT '0',
  `unitprice` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `estimate` tinyint(4) NOT NULL DEFAULT '0',
  `discountpercent` double NOT NULL DEFAULT '0',
  `actualdispatchdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `narrative` text,
  `itemdue` date DEFAULT NULL COMMENT 'Due date for line item.  Some customers require \r\nacknowledgements with due dates by line item',
  `poline` varchar(10) DEFAULT NULL COMMENT 'Some Customers require acknowledgements with a PO line number for each sales line',
  `commissionrate` double NOT NULL DEFAULT '0',
  `commissionearned` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderlineno`,`orderno`),
  KEY `OrderNo` (`orderno`),
  KEY `StkCode` (`stkcode`),
  KEY `Completed` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salesorders`
--

CREATE TABLE IF NOT EXISTS `salesorders` (
  `orderno` int(11) NOT NULL,
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `customerref` varchar(50) NOT NULL DEFAULT '',
  `buyername` varchar(50) DEFAULT NULL,
  `comments` longblob,
  `orddate` date NOT NULL DEFAULT '0000-00-00',
  `ordertype` char(2) NOT NULL DEFAULT '',
  `shipvia` int(11) NOT NULL DEFAULT '0',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL DEFAULT '',
  `deladd3` varchar(40) NOT NULL DEFAULT '',
  `deladd4` varchar(40) DEFAULT NULL,
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `contactphone` varchar(25) DEFAULT NULL,
  `contactemail` varchar(40) DEFAULT NULL,
  `deliverto` varchar(40) NOT NULL DEFAULT '',
  `deliverblind` tinyint(1) DEFAULT '1',
  `freightcost` double NOT NULL DEFAULT '0',
  `fromstkloc` varchar(5) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '0000-00-00',
  `confirmeddate` date NOT NULL DEFAULT '0000-00-00',
  `printedpackingslip` tinyint(4) NOT NULL DEFAULT '0',
  `datepackingslipprinted` date NOT NULL DEFAULT '0000-00-00',
  `quotation` tinyint(4) NOT NULL DEFAULT '0',
  `quotedate` date NOT NULL DEFAULT '0000-00-00',
  `poplaced` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderno`),
  KEY `DebtorNo` (`debtorno`),
  KEY `OrdDate` (`orddate`),
  KEY `OrderType` (`ordertype`),
  KEY `LocationIndex` (`fromstkloc`),
  KEY `BranchCode` (`branchcode`,`debtorno`),
  KEY `ShipVia` (`shipvia`),
  KEY `quotation` (`quotation`),
  KEY `poplaced` (`poplaced`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salestypes`
--

CREATE TABLE IF NOT EXISTS `salestypes` (
  `typeabbrev` char(2) NOT NULL DEFAULT '',
  `sales_type` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`typeabbrev`),
  KEY `Sales_Type` (`sales_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scripts`
--

CREATE TABLE IF NOT EXISTS `scripts` (
  `script` varchar(78) NOT NULL DEFAULT '',
  `pagesecurity` int(11) NOT NULL DEFAULT '1',
  `description` text NOT NULL,
  PRIMARY KEY (`script`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scripts`
--

INSERT INTO `scripts` (`script`, `pagesecurity`, `description`) VALUES
('AccountGroups.php', 10, 'Defines the groupings of general ledger accounts'),
('AccountSections.php', 10, 'Defines the sections in the general ledger reports'),
('AddCustomerContacts.php', 3, 'Adds customer contacts'),
('AddCustomerNotes.php', 3, 'Adds notes about customers'),
('AddCustomerTypeNotes.php', 3, ''),
('AgedDebtors.php', 2, 'Lists customer account balances in detail or summary in selected currency'),
('AgedSuppliers.php', 2, 'Lists supplier account balances in detail or summary in selected currency'),
('Areas.php', 3, 'Defines the sales areas - all customers must belong to a sales area for the purposes of sales analysis'),
('AuditTrail.php', 15, 'Shows the activity with SQL statements and who performed the changes'),
('BankAccounts.php', 10, 'Defines the general ledger code for bank accounts and specifies that bank transactions be created for these accounts for the purposes of reconciliation'),
('BankMatching.php', 7, 'Allows payments and receipts to be matched off against bank statements'),
('BankReconciliation.php', 7, 'Displays the bank reconciliation for a selected bank account'),
('BOMExtendedQty.php', 2, 'Shows the component requirements to make an item'),
('BOMIndented.php', 2, 'Shows the bill of material indented for each level'),
('BOMIndentedReverse.php', 2, ''),
('BOMInquiry.php', 2, 'Displays the bill of material with cost information'),
('BOMListing.php', 2, 'Lists the bills of material for a selected range of items'),
('BOMs.php', 9, 'Administers the bills of material for a selected item'),
('COGSGLPostings.php', 10, 'Defines the general ledger account to be used for cost of sales entries'),
('CompanyPreferences.php', 10, 'Defines the settings applicable for the company, including name, address, tax authority reference, whether GL integration used etc.'),
('ConfirmDispatchControlled_Invoice.php', 11, 'Specifies the batch references/serial numbers of items dispatched that are being invoiced'),
('ConfirmDispatch_Invoice.php', 2, 'Creates sales invoices from entered sales orders based on the quantities dispatched that can be modified'),
('ContractBOM.php', 6, 'Creates the item requirements from stock for a contract as part of the contract cost build up'),
('ContractCosting.php', 6, 'Shows a contract cost - the components and other non-stock costs issued to the contract'),
('ContractOtherReqts.php', 4, 'Creates the other requirements for a contract cost build up'),
('Contracts.php', 6, 'Creates or modifies a customer contract costing'),
('CopyBOM.php', 9, 'Allows a bill of material to be copied between items'),
('CounterSales.php', 1, 'Allows sales to be entered against a cash sale customer account defined in the users location record'),
('CreditItemsControlled.php', 3, 'Specifies the batch references/serial numbers of items being credited back into stock'),
('CreditStatus.php', 3, 'Defines the credit status records. Each customer account is given a credit status from this table. Some credit status records can prohibit invoicing and new orders being entered.'),
('Credit_Invoice.php', 3, 'Creates a credit note based on the details of an existing invoice'),
('Currencies.php', 9, 'Defines the currencies available. Each customer and supplier must be defined as transacting in one of the currencies defined here.'),
('CustEDISetup.php', 11, 'Allows the set up the customer specified EDI parameters for server, email or ftp.'),
('CustLoginSetup.php', 15, ''),
('CustomerAllocations.php', 3, 'Allows customer receipts and credit notes to be allocated to sales invoices'),
('CustomerBranches.php', 3, 'Defines the details of customer branches such as delivery address and contact details - also sales area, representative etc'),
('CustomerInquiry.php', 1, 'Shows the customers account transactions with balances outstanding, links available to drill down to invoice/credit note or email invoices/credit notes'),
('CustomerReceipt.php', 3, 'Entry of both customer receipts against accounts receivable and also general ledger or nominal receipts'),
('Customers.php', 3, 'Defines the setup of a customer account, including payment terms, billing address, credit status, currency etc'),
('CustomerTransInquiry.php', 2, 'Lists in html the sequence of customer transactions, invoices, credit notes or receipts by a user entered date range'),
('CustomerTypes.php', 15, ''),
('CustWhereAlloc.php', 2, 'Shows to which invoices a receipt was allocated to'),
('DailyBankTransactions.php', 8, ''),
('DailySalesInquiry.php', 2, 'Shows the daily sales with GP in a calendar format'),
('DebtorsAtPeriodEnd.php', 2, 'Shows the debtors control account as at a previous period end - based on system calendar monthly periods'),
('DeliveryDetails.php', 1, 'Used during order entry to allow the entry of delivery addresses other than the defaulted branch delivery address and information about carrier/shipping method etc'),
('Departments.php', 1, 'Create business departments'),
('DiscountCategories.php', 11, 'Defines the items belonging to a discount category. Discount Categories are used to allow discounts based on quantities across a range of producs'),
('DiscountMatrix.php', 11, 'Defines the rates of discount applicable to discount categories and the customer groupings to which the rates are to apply'),
('EDIMessageFormat.php', 10, 'Specifies the EDI message format used by a customer - administrator use only.'),
('EDIProcessOrders.php', 11, 'Processes incoming EDI orders into sales orders'),
('EDISendInvoices.php', 15, 'Processes invoiced EDI customer invoices into EDI messages and sends using the customers preferred method either ftp or email attachments.'),
('EmailConfirmation.php', 2, ''),
('EmailCustTrans.php', 2, 'Emails selected invoice or credit to the customer'),
('ExchangeRateTrend.php', 2, 'Shows the trend in exchange rates as retrieved from ECB'),
('Factors.php', 5, 'Defines supplier factor companies'),
('FixedAssetCategories.php', 11, 'Defines the various categories of fixed assets'),
('FixedAssetDepreciation.php', 10, 'Calculates and creates GL transactions to post depreciation for a period'),
('FixedAssetItems.php', 11, 'Allows fixed assets to be defined'),
('FixedAssetList.php', 11, ''),
('FixedAssetLocations.php', 11, 'Allows the locations of fixed assets to be defined'),
('FixedAssetRegister.php', 11, 'Produces a csv, html or pdf report of the fixed assets over a period showing period depreciation, additions and disposals'),
('FixedAssetTransfer.php', 11, 'Allows the fixed asset locations to be changed in bulk'),
('FormDesigner.php', 14, ''),
('FormMaker.php', 1, 'Allows running user defined Forms'),
('FreightCosts.php', 11, 'Defines the setup of the freight cost using different shipping methods to different destinations. The system can use this information to calculate applicable freight if the items are defined with the correct kgs and cubic volume'),
('FTP_RadioBeacon.php', 2, 'FTPs sales orders for dispatch to a radio beacon software enabled warehouse dispatching facility'),
('geocode.php', 3, ''),
('GeocodeSetup.php', 3, ''),
('geocode_genxml_customers.php', 3, ''),
('geocode_genxml_suppliers.php', 3, ''),
('geo_displaymap_customers.php', 3, ''),
('geo_displaymap_suppliers.php', 3, ''),
('GetStockImage.php', 1, ''),
('GLAccountCSV.php', 8, 'Produces a CSV of the GL transactions for a particular range of periods and GL account'),
('GLAccountInquiry.php', 8, 'Shows the general ledger transactions for a specified account over a specified range of periods'),
('GLAccountReport.php', 8, 'Produces a report of the GL transactions for a particular account'),
('GLAccounts.php', 10, 'Defines the general ledger accounts'),
('GLBalanceSheet.php', 8, 'Shows the balance sheet for the company as at a specified date'),
('GLBudgets.php', 10, 'Defines GL Budgets'),
('GLCodesInquiry.php', 8, 'Shows the list of general ledger codes defined with account names and groupings'),
('GLJournal.php', 10, 'Entry of general ledger journals, periods are calculated based on the date entered here'),
('GLJournalInquiry.php', 15, 'General Ledger Journal Inquiry'),
('GLProfit_Loss.php', 8, 'Shows the profit and loss of the company for the range of periods entered'),
('GLTagProfit_Loss.php', 8, ''),
('GLTags.php', 10, 'Allows GL tags to be defined'),
('GLTransInquiry.php', 8, 'Shows the general ledger journal created for the sub ledger transaction specified'),
('GLTrialBalance.php', 8, 'Shows the trial balance for the month and the for the period selected together with the budgeted trial balances'),
('GLTrialBalance_csv.php', 8, 'Produces a CSV of the Trial Balance for a particular period'),
('GoodsReceived.php', 11, 'Entry of items received against purchase orders'),
('GoodsReceivedControlled.php', 11, 'Entry of the serial numbers or batch references for controlled items received against purchase orders'),
('index.php', 1, 'The main menu from where all functions available to the user are accessed by clicking on the links'),
('InternalStockCategoriesByRole.php', 15, 'Maintains the stock categories to be used as internal for any user security role'),
('InternalStockRequest.php', 1, 'Create an internal stock request'),
('InternalStockRequestAuthorisation.php', 1, 'Authorise internal stock requests'),
('InternalStockRequestFulfill.php', 1, 'Fulfill an internal stock request'),
('InventoryPlanning.php', 2, 'Creates a pdf report showing the last 4 months use of items including as a component of assemblies together with stock quantity on hand, current demand for the item and current quantity on sales order.'),
('InventoryPlanningPrefSupplier.php', 2, 'Produces a report showing the inventory to be ordered by supplier'),
('InventoryQuantities.php', 2, ''),
('InventoryValuation.php', 2, 'Creates a pdf report showing the value of stock at standard cost for a range of product categories selected'),
('Labels.php', 15, 'Produces item pricing labels in a pdf from a range of selected criteria'),
('Locations.php', 11, 'Defines the inventory stocking locations or warehouses'),
('Logout.php', 1, 'Shows when the user logs out of webERP'),
('MailInventoryValuation.php', 1, 'Meant to be run as a scheduled process to email the stock valuation off to a specified person. Creates the same stock valuation report as InventoryValuation.php'),
('ManualContents.php', 1, ''),
('MenuAccess.php', 15, ''),
('MRP.php', 9, ''),
('MRPCalendar.php', 9, ''),
('MRPCreateDemands.php', 9, ''),
('MRPDemands.php', 9, ''),
('MRPDemandTypes.php', 9, ''),
('MRPPlannedPurchaseOrders.php', 2, ''),
('MRPPlannedWorkOrders.php', 2, ''),
('MRPReport.php', 2, ''),
('MRPReschedules.php', 2, ''),
('MRPShortages.php', 2, ''),
('NoSalesItems.php', 2, 'Shows the No Selling (worst) items'),
('OffersReceived.php', 4, ''),
('OrderDetails.php', 2, 'Shows the detail of a sales order'),
('OutstandingGRNs.php', 2, 'Creates a pdf showing all GRNs for which there has been no purchase invoice matched off against.'),
('PageSecurity.php', 15, ''),
('PaymentAllocations.php', 5, ''),
('PaymentMethods.php', 15, ''),
('Payments.php', 5, 'Entry of bank account payments either against an AP account or a general ledger payment - if the AP-GL link in company preferences is set'),
('PaymentTerms.php', 10, 'Defines the payment terms records, these can be expressed as either a number of days credit or a day in the following month. All customers and suppliers must have a corresponding payment term recorded against their account'),
('PcAssignCashToTab.php', 6, ''),
('PcAuthorizeExpenses.php', 6, ''),
('PcClaimExpensesFromTab.php', 6, ''),
('PcExpenses.php', 15, ''),
('PcExpensesTypeTab.php', 15, ''),
('PcReportTab.php', 6, ''),
('PcTabs.php', 15, ''),
('PcTypeTabs.php', 15, ''),
('PDFBankingSummary.php', 3, 'Creates a pdf showing the amounts entered as receipts on a specified date together with references for the purposes of banking'),
('PDFChequeListing.php', 3, 'Creates a pdf showing all payments that have been made from a specified bank account over a specified period. This can be emailed to an email account defined in config.php - ie a financial controller'),
('PDFCustomerList.php', 2, 'Creates a report of the customer and branch information held. This report has options to print only customer branches in a specified sales area and sales person. Additional option allows to list only those customers with activity either under or over a specified amount, since a specified date.'),
('PDFCustTransListing.php', 3, ''),
('PDFDeliveryDifferences.php', 3, 'Creates a pdf report listing the delivery differences from what the customer requested as recorded in the order entry. The report calculates a percentage of order fill based on the number of orders filled in full on time'),
('PDFDIFOT.php', 3, 'Produces a pdf showing the delivery in full on time performance'),
('PDFGLJournal.php', 15, 'General Ledger Journal Print'),
('PDFGrn.php', 2, 'Produces a GRN report on the receipt of stock'),
('PDFLowGP.php', 2, 'Creates a pdf report showing the low gross profit sales made in the selected date range. The percentage of gp deemed acceptable can also be entered'),
('PDFOrdersInvoiced.php', 3, 'Produces a pdf of orders invoiced based on selected criteria'),
('PDFOrderStatus.php', 3, 'Reports on sales order status by date range, by stock location and stock category - producing a pdf showing each line items and any quantites delivered'),
('PDFPeriodStockTransListing.php', 3, 'Allows stock transactions of a specific transaction type to be listed over a single day or period range'),
('PDFPickingList.php', 2, ''),
('PDFPriceList.php', 2, 'Creates a pdf of the price list applicable to a given sales type and customer. Also allows the listing of prices specific to a customer'),
('PDFPrintLabel.php', 10, ''),
('PDFQuotation.php', 2, ''),
('PDFQuotationPortrait.php', 2, 'Portrait quotation'),
('PDFReceipt.php', 2, ''),
('PDFRemittanceAdvice.php', 2, ''),
('PDFStockCheckComparison.php', 2, 'Creates a pdf comparing the quantites entered as counted at a given range of locations against the quantity stored as on hand as at the time a stock check was initiated.'),
('PDFStockLocTransfer.php', 1, 'Creates a stock location transfer docket for the selected location transfer reference number'),
('PDFStockNegatives.php', 1, 'Produces a pdf of the negative stocks by location'),
('PDFStockTransfer.php', 2, 'Produces a report for stock transfers'),
('PDFSuppTransListing.php', 3, ''),
('PDFTopItems.php', 2, 'Produces a pdf report of the top items sold'),
('PeriodsInquiry.php', 2, 'Shows a list of all the system defined periods'),
('POReport.php', 2, ''),
('PO_AuthorisationLevels.php', 15, ''),
('PO_AuthoriseMyOrders.php', 4, ''),
('PO_Header.php', 4, 'Entry of a purchase order header record - date, references buyer etc'),
('PO_Items.php', 4, 'Entry of a purchase order items - allows entry of items with lookup of currency cost from Purchasing Data previously entered also allows entry of nominal items against a general ledger code if the AP is integrated to the GL'),
('PO_OrderDetails.php', 2, 'Purchase order inquiry shows the quantity received and invoiced of purchase order items as well as the header information'),
('PO_PDFPurchOrder.php', 2, 'Creates a pdf of the selected purchase order for printing or email to one of the supplier contacts entered'),
('PO_SelectOSPurchOrder.php', 2, 'Shows the outstanding purchase orders for selecting with links to receive or modify the purchase order header and items'),
('PO_SelectPurchOrder.php', 2, 'Allows selection of any purchase order with links to the inquiry'),
('Prices.php', 9, 'Entry of prices for a selected item also allows selection of sales type and currency for the price'),
('PricesBasedOnMarkUp.php', 11, ''),
('PricesByCost.php', 11, 'Allows prices to be updated based on cost'),
('Prices_Customer.php', 11, 'Entry of prices for a selected item and selected customer/branch. The currency and sales type is defaulted from the customer''s record'),
('PrintCheque.php', 5, ''),
('PrintCustOrder.php', 2, 'Creates a pdf of the dispatch note - by default this is expected to be on two part pre-printed stationery to allow pickers to note discrepancies for the confirmer to update the dispatch at the time of invoicing'),
('PrintCustOrder_generic.php', 2, 'Creates two copies of a laser printed dispatch note - both copies need to be written on by the pickers with any discrepancies to advise customer of any shortfall and on the office copy to ensure the correct quantites are invoiced'),
('PrintCustStatements.php', 2, 'Creates a pdf for the customer statements in the selected range'),
('PrintCustTrans.php', 1, 'Creates either a html invoice or credit note or a pdf. A range of invoices or credit notes can be selected also.'),
('PrintCustTransPortrait.php', 1, ''),
('PrintSalesOrder_generic.php', 2, ''),
('PurchData.php', 4, 'Entry of supplier purchasing data, the suppliers part reference and the suppliers currency cost of the item'),
('RecurringSalesOrders.php', 1, ''),
('RecurringSalesOrdersProcess.php', 1, 'Process Recurring Sales Orders'),
('ReorderLevel.php', 2, 'Allows reorder levels of inventory to be updated'),
('ReorderLevelLocation.php', 2, ''),
('ReportBug.php', 15, ''),
('ReportCreator.php', 13, 'Report Writer and Form Creator script that creates templates for user defined reports and forms'),
('ReportletContainer.php', 1, ''),
('ReportMaker.php', 1, 'Produces reports from the report writer templates created'),
('reportwriter/admin/ReportCreator.php', 15, 'Report Writer'),
('ReprintGRN.php', 11, 'Allows selection of a goods received batch for reprinting the goods received note given a purchase order number'),
('ReverseGRN.php', 11, 'Reverses the entry of goods received - creating stock movements back out and necessary general ledger journals to effect the reversal'),
('SalesAnalReptCols.php', 2, 'Entry of the definition of a sales analysis report''s columns.'),
('SalesAnalRepts.php', 2, 'Entry of the definition of a sales analysis report headers'),
('SalesAnalysis_UserDefined.php', 2, 'Creates a pdf of a selected user defined sales analysis report'),
('SalesByTypePeriodInquiry.php', 2, 'Shows sales for a selected date range by sales type/price list'),
('SalesCategories.php', 11, ''),
('SalesCategoryPeriodInquiry.php', 2, 'Shows sales for a selected date range by stock category'),
('SalesGLPostings.php', 10, 'Defines the general ledger accounts used to post sales to based on product categories and sales areas'),
('SalesGraph.php', 6, ''),
('SalesInquiry.php', 2, ''),
('SalesPeople.php', 3, 'Defines the sales people of the business'),
('SalesTopItemsInquiry.php', 2, 'Shows the top item sales for a selected date range'),
('SalesTypes.php', 15, 'Defines the sales types - prices are held against sales types they can be considered price lists. Sales analysis records are held by sales type too.'),
('SecurityTokens.php', 15, 'Administration of security tokens'),
('SelectAsset.php', 2, 'Allows a fixed asset to be selected for modification or viewing'),
('SelectCompletedOrder.php', 1, 'Allows the selection of completed sales orders for inquiries - choices to select by item code or customer'),
('SelectContract.php', 6, 'Allows a contract costing to be selected for modification or viewing'),
('SelectCreditItems.php', 3, 'Entry of credit notes from scratch, selecting the items in either quick entry mode or searching for them manually'),
('SelectCustomer.php', 2, 'Selection of customer - from where all customer related maintenance, transactions and inquiries start'),
('SelectGLAccount.php', 8, 'Selection of general ledger account from where all general ledger account maintenance, or inquiries are initiated'),
('SelectOrderItems.php', 1, 'Entry of sales order items with both quick entry and part search functions'),
('SelectProduct.php', 2, 'Selection of items. All item maintenance, transactions and inquiries start with this script'),
('SelectRecurringSalesOrder.php', 2, ''),
('SelectSalesOrder.php', 2, 'Selects a sales order irrespective of completed or not for inquiries'),
('SelectSupplier.php', 2, 'Selects a supplier. A supplier is required to be selected before any AP transactions and before any maintenance or inquiry of the supplier'),
('SelectWorkOrder.php', 2, ''),
('ShipmentCosting.php', 11, 'Shows the costing of a shipment with all the items invoice values and any shipment costs apportioned. Updating the shipment has an option to update standard costs of all items on the shipment and create any general ledger variance journals'),
('Shipments.php', 11, 'Entry of shipments from outstanding purchase orders for a selected supplier - changes in the delivery date will cascade into the different purchase orders on the shipment'),
('Shippers.php', 15, 'Defines the shipping methods available. Each customer branch has a default shipping method associated with it which must match a record from this table'),
('ShiptsList.php', 2, 'Shows a list of all the open shipments for a selected supplier. Linked from POItems.php'),
('Shipt_Select.php', 11, 'Selection of a shipment for displaying and modification or updating'),
('SMTPServer.php', 15, ''),
('SpecialOrder.php', 4, 'Allows for a sales order to be created and an indent order to be created on a supplier for a one off item that may never be purchased again. A dummy part is created based on the description and cost details given.'),
('StockAdjustments.php', 11, 'Entry of quantity corrections to stocks in a selected location.'),
('StockAdjustmentsControlled.php', 11, 'Entry of batch references or serial numbers on controlled stock items being adjusted'),
('StockCategories.php', 11, 'Defines the stock categories. All items must refer to one of these categories. The category record also allows the specification of the general ledger codes where stock items are to be posted - the balance sheet account and the profit and loss effect of any adjustments and the profit and loss effect of any price variances'),
('StockCheck.php', 2, 'Allows creation of a stock check file - copying the current quantites in stock for later comparison to the entered counts. Also produces a pdf for the count sheets.'),
('StockCostUpdate.php', 9, 'Allows update of the standard cost of items producing general ledger journals if the company preferences stock GL interface is active'),
('StockCounts.php', 2, 'Allows entry of stock counts'),
('StockDispatch.php', 2, ''),
('StockLocMovements.php', 2, 'Inquiry shows the Movements of all stock items for a specified location'),
('StockLocStatus.php', 2, 'Shows the stock on hand together with outstanding sales orders and outstanding purchase orders by stock location for all items in the selected stock category'),
('StockLocTransfer.php', 11, 'Entry of a bulk stock location transfer for many parts from one location to another.'),
('StockLocTransferReceive.php', 11, 'Effects the transfer and creates the stock movements for a bulk stock location transfer initiated from StockLocTransfer.php'),
('StockMovements.php', 2, 'Shows a list of all the stock movements for a selected item and stock location including the price at which they were sold in local currency and the price at which they were purchased for in local currency'),
('StockQties_csv.php', 5, 'Makes a comma separated values (CSV)file of the stock item codes and quantities'),
('StockQuantityByDate.php', 2, 'Shows the stock on hand for each item at a selected location and stock category as at a specified date'),
('StockReorderLevel.php', 4, 'Entry and review of the re-order level of items by stocking location'),
('Stocks.php', 11, 'Defines an item - maintenance and addition of new parts'),
('StockSerialItemResearch.php', 3, ''),
('StockSerialItems.php', 2, 'Shows a list of the serial numbers or the batch references and quantities of controlled items. This inquiry is linked from the stock status inquiry'),
('StockStatus.php', 2, 'Shows the stock on hand together with outstanding sales orders and outstanding purchase orders by stock location for a selected part. Has a link to show the serial numbers in stock at the location selected if the item is controlled'),
('StockTransferControlled.php', 11, 'Entry of serial numbers/batch references for controlled items being received on a stock transfer. The script is used by both bulk transfers and point to point transfers'),
('StockTransfers.php', 11, 'Entry of point to point stock location transfers of a single part'),
('StockUsage.php', 2, 'Inquiry showing the quantity of stock used by period calculated from the sum of the stock movements over that period - by item and stock location. Also available over all locations'),
('StockUsageGraph.php', 2, ''),
('SuppContractChgs.php', 5, ''),
('SuppCreditGRNs.php', 5, 'Entry of a supplier credit notes (debit notes) against existing GRN which have already been matched in full or in part'),
('SuppFixedAssetChgs.php', 5, ''),
('SuppInvGRNs.php', 5, 'Entry of supplier invoices against goods received'),
('SupplierAllocations.php', 5, 'Entry of allocations of supplier payments and credit notes to invoices'),
('SupplierBalsAtPeriodEnd.php', 2, ''),
('SupplierContacts.php', 5, 'Entry of supplier contacts and contact details including email addresses'),
('SupplierCredit.php', 5, 'Entry of supplier credit notes (debit notes)'),
('SupplierInquiry.php', 2, 'Inquiry showing invoices, credit notes and payments made to suppliers together with the amounts outstanding'),
('SupplierInvoice.php', 5, 'Entry of supplier invoices'),
('SupplierPriceList.php', 4, 'Maintain Supplier Price Lists'),
('Suppliers.php', 5, 'Entry of new suppliers and maintenance of existing suppliers'),
('SupplierTenderCreate.php', 4, 'Create or Edit tenders'),
('SupplierTenders.php', 9, ''),
('SupplierTransInquiry.php', 2, ''),
('SupplierTypes.php', 4, ''),
('SuppLoginSetup.php', 15, ''),
('SuppPaymentRun.php', 5, 'Automatic creation of payment records based on calculated amounts due from AP invoices entered'),
('SuppPriceList.php', 2, ''),
('SuppShiptChgs.php', 5, 'Entry of supplier invoices against shipments as charges against a shipment'),
('SuppTransGLAnalysis.php', 5, 'Entry of supplier invoices against general ledger codes'),
('SystemCheck.php', 10, ''),
('SystemParameters.php', 15, ''),
('Tax.php', 2, 'Creates a report of the ad-valoerm tax - GST/VAT - for the period selected from accounts payable and accounts receivable data'),
('TaxAuthorities.php', 15, 'Entry of tax authorities - the state intitutions that charge tax'),
('TaxAuthorityRates.php', 11, 'Entry of the rates of tax applicable to the tax authority depending on the item tax level'),
('TaxCategories.php', 15, 'Allows for categories of items to be defined that might have different tax rates applied to them'),
('TaxGroups.php', 15, 'Allows for taxes to be grouped together where multiple taxes might apply on sale or purchase of items'),
('TaxProvinces.php', 15, 'Allows for inventory locations to be defined so that tax applicable from sales in different provinces can be dealt with'),
('TopItems.php', 2, 'Shows the top selling items'),
('UnitsOfMeasure.php', 15, 'Allows for units of measure to be defined'),
('UpgradeDatabase.php', 15, 'Allows for the database to be automatically upgraded based on currently recorded DBUpgradeNumber config option'),
('UserSettings.php', 1, 'Allows the user to change system wide defaults for the theme - appearance, the number of records to show in searches and the language to display messages in'),
('WhereUsedInquiry.php', 2, 'Inquiry showing where an item is used ie all the parents where the item is a component of'),
('WorkCentres.php', 9, 'Defines the various centres of work within a manufacturing company. Also the overhead and labour rates applicable to the work centre and its standard capacity'),
('WorkOrderCosting.php', 11, ''),
('WorkOrderEntry.php', 10, 'Entry of new work orders'),
('WorkOrderIssue.php', 11, 'Issue of materials to a work order'),
('WorkOrderReceive.php', 11, 'Allows for receiving of works orders'),
('WorkOrderStatus.php', 11, 'Shows the status of works orders'),
('WOSerialNos.php', 10, ''),
('WWW_Access.php', 15, ''),
('WWW_Users.php', 15, 'Entry of users and security settings of users'),
('Z_BottomUpCosts.php', 15, ''),
('Z_ChangeBranchCode.php', 15, 'Utility to change the branch code of a customer that cascades the change through all the necessary tables'),
('Z_ChangeCustomerCode.php', 15, 'Utility to change a customer code that cascades the change through all the necessary tables'),
('Z_ChangeLocationCode.php', 15, 'Change a locations code and in all tables where the old code was used to the new code'),
('Z_ChangeStockCategory.php', 15, ''),
('Z_ChangeStockCode.php', 15, 'Utility to change an item code that cascades the change through all the necessary tables'),
('Z_ChangeSupplierCode.php', 15, 'Script to change a supplier code accross all tables necessary'),
('Z_CheckAllocationsFrom.php', 15, ''),
('Z_CheckAllocs.php', 2, ''),
('Z_CheckDebtorsControl.php', 15, 'Inquiry that shows the total local currency (functional currency) balance of all customer accounts to reconcile with the general ledger debtors account'),
('Z_CheckGLTransBalance.php', 15, 'Checks all GL transactions balance and reports problem ones'),
('Z_CreateChartDetails.php', 9, 'Utility page to create chart detail records for all general ledger accounts and periods created - needs expert assistance in use'),
('Z_CreateCompany.php', 15, 'Utility to insert company number 1 if not already there - actually only company 1 is used - the system is not multi-company'),
('Z_CreateCompanyTemplateFile.php', 15, ''),
('Z_CurrencyDebtorsBalances.php', 15, 'Inquiry that shows the total foreign currency together with the total local currency (functional currency) balances of all customer accounts to reconcile with the general ledger debtors account'),
('Z_CurrencySuppliersBalances.php', 15, 'Inquiry that shows the total foreign currency amounts and also the local currency (functional currency) balances of all supplier accounts to reconcile with the general ledger creditors account'),
('Z_DataExport.php', 15, ''),
('Z_DeleteCreditNote.php', 15, 'Utility to reverse a customer credit note - a desperate measure that should not be used except in extreme circumstances'),
('Z_DeleteInvoice.php', 15, 'Utility to reverse a customer invoice - a desperate measure that should not be used except in extreme circumstances'),
('Z_DeleteOldPrices.php', 15, 'Deletes all old prices'),
('Z_DeleteSalesTransActions.php', 15, 'Utility to delete all sales transactions, sales analysis the lot! Extreme care required!!!'),
('Z_DescribeTable.php', 11, ''),
('Z_ImportChartOfAccounts.php', 11, ''),
('Z_ImportFixedAssets.php', 15, 'Allow fixed assets to be imported from a csv'),
('Z_ImportGLAccountGroups.php', 11, ''),
('Z_ImportGLAccountSections.php', 11, ''),
('Z_ImportPartCodes.php', 11, 'Allows inventory items to be imported from a csv'),
('Z_ImportStocks.php', 15, ''),
('Z_index.php', 15, 'Utility menu page'),
('Z_MakeNewCompany.php', 15, ''),
('Z_MakeStockLocns.php', 15, 'Utility to make LocStock records for all items and locations if not already set up.'),
('Z_poAddLanguage.php', 15, 'Allows a new language po file to be created'),
('Z_poAdmin.php', 15, 'Allows for a gettext language po file to be administered'),
('Z_poEditLangHeader.php', 15, ''),
('Z_poEditLangModule.php', 15, ''),
('Z_poEditLangRemaining.php', 15, ''),
('Z_poRebuildDefault.php', 15, ''),
('Z_PriceChanges.php', 15, 'Utility to make bulk pricing alterations to selected sales type price lists or selected customer prices only'),
('Z_ReApplyCostToSA.php', 15, 'Utility to allow the sales analysis table to be updated with the latest cost information - the sales analysis takes the cost at the time the sale was made to reconcile with the enteries made in the gl.'),
('Z_RePostGLFromPeriod.php', 15, 'Utility to repost all general ledger transaction commencing from a specified period. This can take some time in busy environments. Normally GL transactions are posted automatically each time a trial balance or profit and loss account is run'),
('Z_ReverseSuppPaymentRun.php', 15, 'Utility to reverse an entire Supplier payment run'),
('Z_SalesIntegrityCheck.php', 15, ''),
('Z_UpdateChartDetailsBFwd.php', 15, 'Utility to recalculate the ChartDetails table B/Fwd balances - extreme care!!'),
('Z_Upgrade3.10.php', 15, ''),
('Z_Upgrade_3.01-3.02.php', 15, ''),
('Z_Upgrade_3.04-3.05.php', 15, ''),
('Z_Upgrade_3.05-3.06.php', 15, ''),
('Z_Upgrade_3.07-3.08.php', 15, ''),
('Z_Upgrade_3.08-3.09.php', 15, ''),
('Z_Upgrade_3.09-3.10.php', 15, ''),
('Z_Upgrade_3.10-3.11.php', 15, ''),
('Z_Upgrade_3.11-4.00.php', 15, ''),
('Z_UploadForm.php', 15, 'Utility to upload a file to a remote server'),
('Z_UploadResult.php', 15, 'Utility to upload a file to a remote server');

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups`
--

CREATE TABLE IF NOT EXISTS `securitygroups` (
  `secroleid` int(11) NOT NULL DEFAULT '0',
  `tokenid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`secroleid`,`tokenid`),
  KEY `secroleid` (`secroleid`),
  KEY `tokenid` (`tokenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `securitygroups`
--

INSERT INTO `securitygroups` (`secroleid`, `tokenid`) VALUES
(1, 0),
(1, 1),
(1, 2),
(2, 0),
(2, 1),
(2, 2),
(2, 11),
(3, 0),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 11),
(4, 0),
(4, 1),
(4, 2),
(4, 5),
(5, 0),
(5, 1),
(5, 2),
(5, 3),
(5, 11),
(6, 0),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(7, 0),
(7, 1),
(8, 0),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 13),
(8, 14),
(8, 15),
(9, 0),
(9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `securityroles`
--

CREATE TABLE IF NOT EXISTS `securityroles` (
  `secroleid` int(11) NOT NULL AUTO_INCREMENT,
  `secrolename` text NOT NULL,
  PRIMARY KEY (`secroleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `securityroles`
--

INSERT INTO `securityroles` (`secroleid`, `secrolename`) VALUES
(1, 'Inquiries/Order Entry'),
(2, 'Manufac/Stock Admin'),
(3, 'Purchasing Officer'),
(4, 'AP Clerk'),
(5, 'AR Clerk'),
(6, 'Accountant'),
(7, 'Customer Log On Only'),
(8, 'System Administrator'),
(9, 'Supplier Log On Only');

-- --------------------------------------------------------

--
-- Table structure for table `securitytokens`
--

CREATE TABLE IF NOT EXISTS `securitytokens` (
  `tokenid` int(11) NOT NULL DEFAULT '0',
  `tokenname` text NOT NULL,
  PRIMARY KEY (`tokenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `securitytokens`
--

INSERT INTO `securitytokens` (`tokenid`, `tokenname`) VALUES
(0, 'Main Index Page'),
(1, 'Order Entry/Inquiries customer access only'),
(2, 'Basic Reports and Inquiries with selection options'),
(3, 'Credit notes and AR management'),
(4, 'Purchasing data/PO Entry/Reorder Levels'),
(5, 'Accounts Payable'),
(6, 'Petty Cash'),
(7, 'Bank Reconciliations'),
(8, 'General ledger reports/inquiries'),
(9, 'Supplier centre - Supplier access only'),
(10, 'General Ledger Maintenance, stock valuation & Configuration'),
(11, 'Inventory Management and Pricing'),
(12, 'Prices Security'),
(13, 'Unknown'),
(14, 'Unknown'),
(15, 'User Management and System Administration');

-- --------------------------------------------------------

--
-- Table structure for table `shipmentcharges`
--

CREATE TABLE IF NOT EXISTS `shipmentcharges` (
  `shiptchgid` int(11) NOT NULL AUTO_INCREMENT,
  `shiptref` int(11) NOT NULL DEFAULT '0',
  `transtype` smallint(6) NOT NULL DEFAULT '0',
  `transno` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `value` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`shiptchgid`),
  KEY `TransType` (`transtype`,`transno`),
  KEY `ShiptRef` (`shiptref`),
  KEY `StockID` (`stockid`),
  KEY `TransType_2` (`transtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE IF NOT EXISTS `shipments` (
  `shiptref` int(11) NOT NULL DEFAULT '0',
  `voyageref` varchar(20) NOT NULL DEFAULT '0',
  `vessel` varchar(50) NOT NULL DEFAULT '',
  `eta` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `accumvalue` double NOT NULL DEFAULT '0',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shiptref`),
  KEY `ETA` (`eta`),
  KEY `SupplierID` (`supplierid`),
  KEY `ShipperRef` (`voyageref`),
  KEY `Vessel` (`vessel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shippers`
--

CREATE TABLE IF NOT EXISTS `shippers` (
  `shipper_id` int(11) NOT NULL AUTO_INCREMENT,
  `shippername` char(40) NOT NULL DEFAULT '',
  `mincharge` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipper_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shippers`
--

INSERT INTO `shippers` (`shipper_id`, `shippername`, `mincharge`) VALUES
(1, 'Default Shipper', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stockcategory`
--

CREATE TABLE IF NOT EXISTS `stockcategory` (
  `categoryid` char(6) NOT NULL DEFAULT '',
  `categorydescription` char(20) NOT NULL DEFAULT '',
  `stocktype` char(1) NOT NULL DEFAULT 'F',
  `stockact` int(11) NOT NULL DEFAULT '0',
  `adjglact` int(11) NOT NULL DEFAULT '0',
  `issueglact` int(11) NOT NULL DEFAULT '0',
  `purchpricevaract` int(11) NOT NULL DEFAULT '80000',
  `materialuseagevarac` int(11) NOT NULL DEFAULT '80000',
  `wipact` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoryid`),
  KEY `CategoryDescription` (`categorydescription`),
  KEY `StockType` (`stocktype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stockcatproperties`
--

CREATE TABLE IF NOT EXISTS `stockcatproperties` (
  `stkcatpropid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` char(6) NOT NULL,
  `label` text NOT NULL,
  `controltype` tinyint(4) NOT NULL DEFAULT '0',
  `defaultvalue` varchar(100) NOT NULL DEFAULT '''''',
  `maximumvalue` double NOT NULL DEFAULT '999999999',
  `reqatsalesorder` tinyint(4) NOT NULL DEFAULT '0',
  `minimumvalue` double NOT NULL DEFAULT '-999999999',
  `numericvalue` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stkcatpropid`),
  KEY `categoryid` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stockcheckfreeze`
--

CREATE TABLE IF NOT EXISTS `stockcheckfreeze` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `qoh` double NOT NULL DEFAULT '0',
  `stockcheckdate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`stockid`,`loccode`),
  KEY `LocCode` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stockcounts`
--

CREATE TABLE IF NOT EXISTS `stockcounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `qtycounted` double NOT NULL DEFAULT '0',
  `reference` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `StockID` (`stockid`),
  KEY `LocCode` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stockitemproperties`
--

CREATE TABLE IF NOT EXISTS `stockitemproperties` (
  `stockid` varchar(20) NOT NULL,
  `stkcatpropid` int(11) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`stockid`,`stkcatpropid`),
  KEY `stockid` (`stockid`),
  KEY `value` (`value`),
  KEY `stkcatpropid` (`stkcatpropid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stockmaster`
--

CREATE TABLE IF NOT EXISTS `stockmaster` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `categoryid` varchar(6) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `longdescription` text NOT NULL,
  `units` varchar(20) NOT NULL DEFAULT 'each',
  `mbflag` char(1) NOT NULL DEFAULT 'B',
  `actualcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `lastcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `materialcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `labourcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `overheadcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `lowestlevel` smallint(6) NOT NULL DEFAULT '0',
  `discontinued` tinyint(4) NOT NULL DEFAULT '0',
  `controlled` tinyint(4) NOT NULL DEFAULT '0',
  `eoq` double NOT NULL DEFAULT '0',
  `volume` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `kgs` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `barcode` varchar(50) NOT NULL DEFAULT '',
  `discountcategory` char(2) NOT NULL DEFAULT '',
  `taxcatid` tinyint(4) NOT NULL DEFAULT '1',
  `serialised` tinyint(4) NOT NULL DEFAULT '0',
  `appendfile` varchar(40) NOT NULL DEFAULT 'none',
  `perishable` tinyint(1) NOT NULL DEFAULT '0',
  `decimalplaces` tinyint(4) NOT NULL DEFAULT '0',
  `pansize` double NOT NULL DEFAULT '0',
  `shrinkfactor` double NOT NULL DEFAULT '0',
  `nextserialno` bigint(20) NOT NULL DEFAULT '0',
  `netweight` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `lastcostupdate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`stockid`),
  KEY `CategoryID` (`categoryid`),
  KEY `Description` (`description`),
  KEY `MBflag` (`mbflag`),
  KEY `StockID` (`stockid`,`categoryid`),
  KEY `Controlled` (`controlled`),
  KEY `DiscountCategory` (`discountcategory`),
  KEY `taxcatid` (`taxcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stockmoves`
--

CREATE TABLE IF NOT EXISTS `stockmoves` (
  `stkmoveno` int(11) NOT NULL AUTO_INCREMENT,
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `transno` int(11) NOT NULL DEFAULT '0',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `trandate` date NOT NULL DEFAULT '0000-00-00',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `prd` smallint(6) NOT NULL DEFAULT '0',
  `reference` varchar(40) NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '1',
  `discountpercent` double NOT NULL DEFAULT '0',
  `standardcost` double NOT NULL DEFAULT '0',
  `show_on_inv_crds` tinyint(4) NOT NULL DEFAULT '1',
  `newqoh` double NOT NULL DEFAULT '0',
  `hidemovt` tinyint(4) NOT NULL DEFAULT '0',
  `narrative` text,
  PRIMARY KEY (`stkmoveno`),
  KEY `DebtorNo` (`debtorno`),
  KEY `LocCode` (`loccode`),
  KEY `Prd` (`prd`),
  KEY `StockID_2` (`stockid`),
  KEY `TranDate` (`trandate`),
  KEY `TransNo` (`transno`),
  KEY `Type` (`type`),
  KEY `Show_On_Inv_Crds` (`show_on_inv_crds`),
  KEY `Hide` (`hidemovt`),
  KEY `reference` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stockmovestaxes`
--

CREATE TABLE IF NOT EXISTS `stockmovestaxes` (
  `stkmoveno` int(11) NOT NULL DEFAULT '0',
  `taxauthid` tinyint(4) NOT NULL DEFAULT '0',
  `taxrate` double NOT NULL DEFAULT '0',
  `taxontax` tinyint(4) NOT NULL DEFAULT '0',
  `taxcalculationorder` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stkmoveno`,`taxauthid`),
  KEY `taxauthid` (`taxauthid`),
  KEY `calculationorder` (`taxcalculationorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stockrequest`
--

CREATE TABLE IF NOT EXISTS `stockrequest` (
  `dispatchid` int(11) NOT NULL AUTO_INCREMENT,
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `departmentid` int(11) NOT NULL DEFAULT '0',
  `despatchdate` date NOT NULL DEFAULT '0000-00-00',
  `authorised` tinyint(4) NOT NULL DEFAULT '0',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `narrative` text NOT NULL,
  PRIMARY KEY (`dispatchid`),
  KEY `loccode` (`loccode`),
  KEY `departmentid` (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stockrequestitems`
--

CREATE TABLE IF NOT EXISTS `stockrequestitems` (
  `dispatchitemsid` int(11) NOT NULL DEFAULT '0',
  `dispatchid` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '0',
  `qtydelivered` double NOT NULL DEFAULT '0',
  `decimalplaces` int(11) NOT NULL DEFAULT '0',
  `uom` varchar(20) NOT NULL DEFAULT '',
  `completed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dispatchitemsid`),
  KEY `dispatchid` (`dispatchid`),
  KEY `stockid` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stockserialitems`
--

CREATE TABLE IF NOT EXISTS `stockserialitems` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `expirationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `quantity` double NOT NULL DEFAULT '0',
  `qualitytext` text NOT NULL,
  PRIMARY KEY (`stockid`,`serialno`,`loccode`),
  KEY `StockID` (`stockid`),
  KEY `LocCode` (`loccode`),
  KEY `serialno` (`serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stockserialmoves`
--

CREATE TABLE IF NOT EXISTS `stockserialmoves` (
  `stkitmmoveno` int(11) NOT NULL AUTO_INCREMENT,
  `stockmoveno` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `moveqty` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`stkitmmoveno`),
  KEY `StockMoveNo` (`stockmoveno`),
  KEY `StockID_SN` (`stockid`,`serialno`),
  KEY `serialno` (`serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `suppallocs`
--

CREATE TABLE IF NOT EXISTS `suppallocs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amt` double NOT NULL DEFAULT '0',
  `datealloc` date NOT NULL DEFAULT '0000-00-00',
  `transid_allocfrom` int(11) NOT NULL DEFAULT '0',
  `transid_allocto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `TransID_AllocFrom` (`transid_allocfrom`),
  KEY `TransID_AllocTo` (`transid_allocto`),
  KEY `DateAlloc` (`datealloc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `suppliercontacts`
--

CREATE TABLE IF NOT EXISTS `suppliercontacts` (
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `position` varchar(30) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `mobile` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `ordercontact` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplierid`,`contact`),
  KEY `Contact` (`contact`),
  KEY `SupplierID` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `suppname` varchar(40) NOT NULL DEFAULT '',
  `address1` varchar(40) NOT NULL DEFAULT '',
  `address2` varchar(40) NOT NULL DEFAULT '',
  `address3` varchar(40) NOT NULL DEFAULT '',
  `address4` varchar(50) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL DEFAULT '',
  `address6` varchar(40) NOT NULL DEFAULT '',
  `supptype` tinyint(4) NOT NULL DEFAULT '1',
  `lat` float(10,6) NOT NULL DEFAULT '0.000000',
  `lng` float(10,6) NOT NULL DEFAULT '0.000000',
  `currcode` char(3) NOT NULL DEFAULT '',
  `suppliersince` date NOT NULL DEFAULT '0000-00-00',
  `paymentterms` char(2) NOT NULL DEFAULT '',
  `lastpaid` double NOT NULL DEFAULT '0',
  `lastpaiddate` datetime DEFAULT NULL,
  `bankact` varchar(30) NOT NULL DEFAULT '',
  `bankref` varchar(12) NOT NULL DEFAULT '',
  `bankpartics` varchar(12) NOT NULL DEFAULT '',
  `remittance` tinyint(4) NOT NULL DEFAULT '1',
  `taxgroupid` tinyint(4) NOT NULL DEFAULT '1',
  `factorcompanyid` int(11) NOT NULL DEFAULT '1',
  `taxref` varchar(20) NOT NULL DEFAULT '',
  `phn` varchar(50) NOT NULL DEFAULT '',
  `port` varchar(200) NOT NULL DEFAULT '',
  `email` varchar(55) DEFAULT NULL,
  `fax` varchar(25) DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`supplierid`),
  KEY `CurrCode` (`currcode`),
  KEY `PaymentTerms` (`paymentterms`),
  KEY `SuppName` (`suppname`),
  KEY `taxgroupid` (`taxgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplierid`, `suppname`, `address1`, `address2`, `address3`, `address4`, `address5`, `address6`, `supptype`, `lat`, `lng`, `currcode`, `suppliersince`, `paymentterms`, `lastpaid`, `lastpaiddate`, `bankact`, `bankref`, `bankpartics`, `remittance`, `taxgroupid`, `factorcompanyid`, `taxref`, `phn`, `port`, `email`, `fax`, `telephone`) VALUES
('0001-Cance', 'CANCELLED', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('13901', '139 CORPORATE CENTER', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'USD', '2012-08-24', 'CA', 300, '2012-08-24 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '812 0521'),
('1IA00', 'INST. OF INTERNAL AUDITORS PHILS.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('1IA01', 'INST. INTERNAL AUDITORS (IIA INC.)', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('1IA02', 'THE IIA - AUSTRALIA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('1IA03', 'IIAP - CEBU CHAPTER', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('1IA04', 'IIA-PHILIPPINES DAVAO Chapter INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('1IA05', 'IIA - MALAYSIA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('1IA06', 'IIA - INDONESIA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('1IA07', 'IIA – INT''L CONFERENCE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('1IA08', 'IIA INC, PUBLICATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('1IA09', 'IIA - SINGAPORE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-A01', 'MELANIE T OTEYZA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-A02', 'MYRNA AMAHAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-A03', 'FRANKLIN T. AGAMATA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-B01', 'DUKE BAKENTING', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-B02', 'JOSE RIZAL BATILES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-B03', 'CLARISSA S. BASSIG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-C01', 'MICHAEL O. CABATUANDO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-C02', 'MA. LUZ CANTORIA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-C03', 'ALVIN SUN CADALIN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-C04', 'ALEXANDER T CORDERO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-C05', 'AMABLE CASTRO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-C06', 'PAOLO CORTEZ', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-C07', 'NENER CONCEPCION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-C08', 'ABRAHAM B. CORTEZ', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '2012-08-31', '7', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-C09', 'CATAJAN, ANTHONY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-D01', 'HELEN T. DE GUZMAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '6317267'),
('2-D02', 'SUSAN S. DOMINGO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-D03', 'EDNA G. DE LEON', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '+639178982524'),
('2-E01', 'JUAN B ESTIOKO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-F01', 'LAURO D.G. FRANCISCO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-F02', 'GERRY V. FERNANDO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-G01', 'NORMAN C. GABRIEL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-G02', 'MICHAEL C. GALLEGO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-G03', 'GUILLERMO, EUGENIO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-H01', 'MARC JOZSEF G. HALLIG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-K01', 'FRANCIS J. KONG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '727-5692'),
('2-L01', 'SHERWIN BRYAN L. LU', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-M01', 'KEVIN CARLO MUNGCAL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-M02', 'RHEA MAUREEN MORALITA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-M03', 'SEPHORA R. MONTEMAYOR', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('2-S01', 'DANTE P. SORIANO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('36001', '360 DEGREES SYSTEM', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '2012-09-03', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('3ACI1', 'ACIIA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '2012-09-03', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('3ACP1', 'ASSOC. OF CPAS IN PUB PRACTICE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('3ACP2', 'ACPACI', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '2012-09-03', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('3CTM01', 'CITY TREASURER OF MAKATI', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('3IDC01', 'INSTITUTE OF CORPORATE DIRECTORS, INC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '884 1494'),
('3ISA1', 'ISACA MANILA CHAPTER', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('3PIC', 'PICPA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '7236305'),
('3PIC2', 'PICPA MMR', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '723-6313  / 725-3337'),
('3SGIA', 'ASSOC OF GOV''T INTERNAL AUDITORS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '412 2049'),
('7CS01', '7C''S CATERING & FOOD SERVICES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '2012-08-31', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('8BA01', 'ROMUEL PHILIP BALINTAG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('8FE01', 'FERRER, RONALDO T.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('8IR01', 'IRIGAYEN, VAL J.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('8P01', 'FELINO PALAFOX', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('8RAF01', 'MARY JANE RAFOL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('8SA002', 'JERRICO A. SAGALA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('8SA01', 'SANTE, SALLY P.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('8SU01', 'SUNPOWER PHILIPPINES LTD.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('8TH01', '8TH WEST MARKETING', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '2012-09-03', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '323-2014'),
('9-ACC', 'ANABELL C. CHEN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-APS', 'ANTOINETTE P. SANTOS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-AYJ', 'ANNA LOU Y. JUDILLA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8122754'),
('9-CBP', 'CHRISTIAN BRYAN PARANI', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8122754'),
('9-CDLST', 'CARLA TIMTIMAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-CMS', 'CYRUS M SANTANA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-EMA', 'ELOISA M. ACOSTA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-EOA', 'EARL O. AQUINO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-GDT', 'GRACE D. TORDILLA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-JBL', 'JIVILYN B. LACHICA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-JDS', 'JOHN RAPHAEL D. SEÑO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-JPC', 'JEHAN HOSEA P. CABUÑAG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-LAS', 'LEMUEL A. SUNGAHID', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-LRS', 'LAARNI R. SILVERIO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8122754'),
('9-MBB', 'MELANIE BUENAFE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8122754'),
('9-MCM', 'MA. CARLA C. MEDRANO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8122754'),
('9-MGB', 'MARJORIE G. BANGUIAO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-MRW', 'MARK ANTHONY R. WYCOCO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-PSA', 'PERCINET S. ASPARIN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-RBD', 'RUBEN B. DALUSUNG JR.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-RBL', 'ROMALYN B. LONGALONG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('9-RCL', 'RODELYN CHAN LEE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8122754'),
('9-SFM', 'MA. SHEENA F. MALAPITAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ABS01', 'ABS-CBN FOUNDATION INC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '2012-09-03', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '632-411-4995'),
('ACD01', 'ADCY TRADING', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '2012-08-01', '20', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ACU01', 'ACUATICO BEACH RESORT & HOTEL INC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '2012-09-03', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ADI01', 'ADI-ASIANIC DISTRIBUTOR''S INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '2012-09-03', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '808 0625'),
('ADM01', 'ATENEO DE MANILA UNIVERSITY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('AIM01', 'AIM CONFERENCE CENTER', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('AIR01', 'AIRFREIGHT 2100, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '855-8450/855-8484'),
('ALC01', 'BERNADETTE R. ALCOBER', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ALP01', 'ALPHA STEEL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '810-5637'),
('AME01', 'AMEX Card# 3769-895197-24009', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ARG01', 'ARGUS DEVELOPMENT CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8151538/8177905/8138'),
('ARI01', 'ARIVA EVENTS MANAGEMENT', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '890-9651/895-9527'),
('ASI01', 'ASIANIC DISTRIBUTORS, INC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ASI02', 'ASIA FINEST CUISINE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '892-8882'),
('ASI03', 'ASIAN INSTITUTE OF TAXATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '435-5905'),
('ASS01', 'ASSESSMENT CENTRAL, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ASS02', 'AMCSI (ASSO MED & CLINICAL SVS INC)', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '892-5906 TO 08'),
('AWA01', 'AWARDWORKS INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '884-8177'),
('BEH01', 'BEHAVIORAL DYNAMICS INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('BES01', 'BEST WESTERN ASTOR HOTEL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '7507564'),
('BIR01', 'BIR - COMPENSATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('BIR02', 'BIR - EXPANDED', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('BIR03', 'BUREAU OF INTERNAL REVENUE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('BLE01', 'BLESSING PHOTOGRAPHY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '(046) 5065144'),
('BOH01', 'BOHOL TROPICS CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '(038) 4113510'),
('BOH02', 'BOHOL RESORT DEVELOPMENT', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('BPI01', 'BPI - BUENDIA-P TAMO BRANCH', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('BPI02', 'MASTERCARD 5455 1220 1188 624', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8122754'),
('BPI03', 'BPI MASTERCARD 5488093920051112', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('BRA01', 'BRAINBENCH PHILS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('BUN01', 'DIOSDADO D. BUNCAB', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('CAF01', 'CAFÉ KRISTINE, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('CAF02', 'CAFE J / MILKYWAY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('CAT01', 'CATKO COUTURE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('CAV01', 'CAVALRY TRANSPORT SERVICES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('CEN01', 'CENTREX CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '032-3454210'),
('CEP01', 'C.E.P. GARMENTS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '2427810'),
('CFC01', 'CFC TEKTON FOUNDATION, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '6312769'),
('CFC02', 'COUPLES FOR CHRIST', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '561-0939'),
('CFC03', 'CFC FOUNDATION INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('CIT01', 'CITYLAND HERRERA TOWER, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8451539'),
('CIT02', 'CITIBANK 4539720061677014', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('CIT03', 'CITRUSNAP PHOTOGRAPHY STUDIO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '211 4642'),
('CLU01', 'CLUB BALAI ISABEL INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('COF01', 'COFFEE EDITION INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('COP01', 'COPYLANDIA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '753-2529'),
('COP02', 'COPIES UNLIMITED, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('CRO01', 'CROWN REGENCY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '(02)845-0211 TO 15'),
('DEL01', 'DELOITTE & TOUCHE ENTERPRISE RISK SERVI', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('DGI01', 'DGIPrinters', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('DHL01', 'DHL DANZAS AIR & OCEAN-PHILS.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8511373'),
('DHL02', 'DHL EXPRESS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('DHL03', 'DHL GLOBAL FORWARDING PHILS. INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '851-5601 EXT. 110'),
('DIM01', 'DIMACULANGAN,DIMACULANGAN AND CO. CPA''S', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('EAS01', 'EASTERN TELECOMMUNICATIONS PHILIPPINES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '300-1000'),
('EAS02', 'EASTBAY RESORTS INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8865555'),
('EHU01', 'E-HUB COMPUTERS & ACCESSORIES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '818-4856'),
('ELI01', 'ELISEUS'' CUISINE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('EMB01', 'AUSTRALIAN EMBASSY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ENE01', 'ENERGY DEVELOPMENT CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('EPI01', 'EPIDEMIKA EPDMK CLOTHING', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '219 7722'),
('ERA01', 'ERAYSIDA REFRIGERATION AND AIR-CON SERV', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '826 1532'),
('ERN01', 'ERNST AND YOUNG HAN YOUNG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ESC01', 'ESCOBAR PHOTOGRAPHY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '490-6772'),
('EYE01', 'EYEMARJ ENTERPRISES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '386-9752'),
('EZA01', 'EZAM TOURS & TRAVEL SERVICES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('FAM01', 'FAMOSA TRAVEL AND TOUR', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '0916-3307909'),
('FAS01', 'FASTRUST SERVICES, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8435092'),
('FIR01', 'FIRST PHIL. REALTY CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('FLI01', 'FLIX PHOTOBOOTH', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '0917 8960417'),
('GES01', 'GESCHENK IDEE, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '809 5953'),
('GLE01', 'GLEIM PUBLICATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '(352)3770772 EXT.107'),
('GMA01', 'GMA KAPUSO FOUNDATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('GRA01', 'GRAPHICOM PRINTHAUS CO.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '412-1748/ 411-2444'),
('GUT01', 'GUTHRIE-JENSEN CONSULTANT INC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HAP001', 'HAPPY CLICKS PHOTOGRAPHY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HAR01', 'HARRYPOUND CONSULTANTS INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HEN01', 'HENRY''S PROFESSIONAL PHOTO MARKETING IN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '733-7723'),
('HEN02', 'HENANN HOTEL MANAGEMENT', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HEW01', 'HEWLETT-PACKARD PHILS.CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HOL01', 'HOLIDAY INN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HOL02', 'HOLMES CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HOL03', 'HOLIDAY INN CLARK PHILIPPINES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '(632)845-1888'),
('HOS01', 'HOSTWAY BILLING CENTER', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HOT01', 'HOTEL INTERCONTINENTAL MANILA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8159711'),
('HOT02', 'HOTEL IBIS DARLING HARBOR', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HOT03', 'HOTEL SPECIALIST INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '750-1999 LOC. 26'),
('HSB01', 'HSBC VISA 4028 9200 0463 3524', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8122754'),
('HSB02', 'HSBC VISA 4028 9200 0376 4684', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HSB03', 'HSBC VISA 4028 9200 0108 6080', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('HSI01', 'HOTEL SPECIALIST INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '750-1999 LOC. 26'),
('HYT01', 'HYTECH INTEGRATED PRODUCTS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('IBC01', 'ISLANDS BANCA CRUISES CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('IBM01', 'IBM PHILIPPINES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('IIA010', 'IIA CIA LEARNING SYSTEM', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('IMP01', 'IMPIANA KLCC HOTEL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('IMP02', 'THE IMPERIAL RIDING SCHOOL VIENNA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('IMP03', 'IMPERIUM TECHNOLOGY, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('INF01', 'INFOCOM TECHNOLOGIES, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('INK001', 'INK BRIGHT TRADING', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '896-1301'),
('INS01', 'INSTIGLIO INTERIORS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ION01', 'IONNAS ENTERPRISES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8312196'),
('ISI01', 'RICARDO ISIDRO & COMPANY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '7062516'),
('ISL01', 'ISLA LIPANA & CO.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ISS01', 'ISS FACILITY SERVICES PHILS.,INC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '759-4532'),
('J&J01', 'J & JC DIGITAL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '038 412 0389'),
('JDF01', 'JDF LITHOGRAPHY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '4113444'),
('JEM01', 'JEMIL PRINTING SERVICES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('JGN01', 'JGEN Printing & Engraving Services', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '0906-9791785'),
('JOB01', 'JOBSTREET.COM PHILS. INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '451-9999 LOC.4509'),
('JOH01', 'JOHNVYNN INTERNATIONAL ENGINEERING SUPP', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '9851164'),
('JOM001', 'JOMAN PRINTING PRESS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '5436924'),
('JOS01', 'JOSHJENJOY GIFTS & GENERAL MERCHANDISE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '577 1083/576 6629'),
('JVJ01', 'JVJIMENEZ & ASSOCIATES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '0906-219-4448'),
('KAR01', 'KARIGALAN INTERNATIONAL TRAVEL & TOURS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8187926'),
('KYN01', 'KYNESS BAG PRODUCT', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '0926-6399799'),
('LEG01', 'LEGEND VILLAS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '6331501'),
('LEG02', 'LEGEND INTERNATIONAL RESORTS LIMITED', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '853-0325'),
('LEG03', 'LEGEND HOTEL INT''L CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '633-1501-12'),
('LEG04', 'LE GRAND COMMERCIAL INC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '364-4581 TO 85'),
('LGM01', 'LG MALLARI DESIGN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '362-7948'),
('LIA01', 'LIANCO MIRROR ENTERPRISES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('LUC01', 'LUCKY TRAVEL CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8154620-23'),
('LYC001', 'LYCEUM OF THE PHILIPPINES UNIVERSITY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('MAK01', 'MAKATI SPORTS CLUB INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '817-8731'),
('MAN01', 'MANAGEMENT ASSOCIATION OF THE PHILS.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('MAN02', 'MANLIS TRADING', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('MAN03', 'MANILA BULLETIN PUBLISHING CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '527 8121 TO 35'),
('MAR01', 'MARIETTA D. CARDENAS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('MAS01', 'MASTERCATERERS, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('MAX01', 'MAXICARE HEALTHCARE CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '7526294'),
('MEG01', 'MEGAWORLD CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '709 1111'),
('MER01', 'MERALCO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '7299866'),
('MER02', 'MERCHANT''S & SOUTHERN BANK', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('MER03', 'MERVIAN IAN DIZON', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('MET01', 'METROBANK CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('MET02', 'METROBANK CARD CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('MET03', 'metroConnections FBO IIA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('MIN01', 'MINUTEMAN PRINTERS, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8101170'),
('MML01', 'MMLDC FOUNDATION, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '632-8111'),
('MOO01', 'MOONBAY MARINA RESTAURANT&ENTERTAIMENT', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '(047)252-7098'),
('MUS01', 'MUSTARD SEED SYSTEMS CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '533 6040/ 533 1562/'),
('NER01', 'NERDIDEA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('OVO01', 'OVO ENTERTAINMENT CORP', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PAG01', 'PAG-IBIG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8114401'),
('PAG02', 'PAGCOR', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PAN01', 'PANPACIFIC TRAVEL CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PAY01', 'PAYROLL ADVICE TO B.D.O.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PBD01', 'PBD, WORLDWIDE FULFILLMENT SERVICES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PER01', 'PERDANA HOTEL PHILIPPINES, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '7507500'),
('PER02', 'IONA KRISTINA O. PEREZ', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-A01', 'AGUILAR, PIDO JR', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '725 7459'),
('PF-B001', 'BURGOS, AILEEN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-B02', 'APRIL THERESA D.C. BERNANDINO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-D01', 'ANTHONY JAKE V. DURAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-D02', 'REX ANSELM DRILON III', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-E01', 'ERIC EMMANUEL P. EBRO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-F01', 'JOSEPH ARLAN C. FAJARDO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-H002', 'LU HONG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-H003', 'EDGARDO HERRERA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-H004', 'HUFANA-ANG, CATHERINE L.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-I01', 'JOSE M. IRENEO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-I02', 'IGUAL, GING', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-J01', 'ROSSANA S. JAVIER', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-J02', 'JOSEPH QUIAZON', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-L01', 'LILIAN LINSANGAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-L02', 'CHARLWIN P. LEE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-M01', 'LEONARDO J MATIGNAS, JR.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-M02', 'RAYMUND S. MUNGKAL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-M03', 'RICHEL D. MENDOZA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-M04', 'DUCHESS MARIE MUNSAYAC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-M05', 'POL B. MIRAFUENTES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-M06', 'HEIDI MENDOZA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-M07', 'MAGDALENO V. MENDEZ III', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-N01', 'REGINALD C. NERY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8857000 LOC. 207'),
('PF-N02', 'SATURNINO NICANOR JR.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-N03', 'NESTOR MACARANIAG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-P01', 'MA. SALOME V. PANZO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '');
INSERT INTO `suppliers` (`supplierid`, `suppname`, `address1`, `address2`, `address3`, `address4`, `address5`, `address6`, `supptype`, `lat`, `lng`, `currcode`, `suppliersince`, `paymentterms`, `lastpaid`, `lastpaiddate`, `bankact`, `bankref`, `bankpartics`, `remittance`, `taxgroupid`, `factorcompanyid`, `taxref`, `phn`, `port`, `email`, `fax`, `telephone`) VALUES
('PF-P02', 'JOCELYN PADILLA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-P03', 'RAMON T. PAGDAGDAGAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-P04', 'FERDINAND P. PABALAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-R01', 'MARY JANE O ROSALES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-R02', 'JUAN CARLOS ROBLES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-R03', 'CORAZON S. REY', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-R04', 'ANNABETH R. BERNARDO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-R05', 'AMADOR A. RACPAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-S007', 'REBECCA SARMENTA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-S02', 'ROLANDO D. SOLIVEN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-S03', 'BARBARA ANN SANTOS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-S04', 'CARLOS G. SANTOS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-S05', 'ELVIRA SORIANO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-S06', 'GINA B. SANTOS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-S08', 'SORIANO, DANTE P.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-T01', 'VENERANDA M. TOMAS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-V01', 'EDEL MARY VEGAMORA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-V02', 'JIMMY VILLEGAS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-V03', 'MITCH VALDES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-Y01', 'YAM, FRANK', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PF-Z01', 'JAY LORD E. ZAFRA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PFT-001', 'ALVIN TAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PHI001', 'PHILHEALTH', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PHI002', 'PHILIPPINE DAILY INQUIRER', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8978808'),
('PHI003', 'PHIL. AIRLINES INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PHI004', 'PHIL. BXT CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PHI005', 'PHILIPPINE RED CROSS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PHI006', 'PHILIPPINE ACADEMY OF ACCOUNTANTS FOR B', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '0917-562-2437'),
('PHI01', 'PHILIPPINE DIAMOND HOTEL & RESORT INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PLD001', 'PLDT', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PNB01', 'PHIL.NATIONAL BANK', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('PRI001', 'PRISHOTAM R. MIRPURI', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '521-1364 loc 208'),
('PRI002', 'PRIME ACCESS IT SOLUTIONS, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '3837094'),
('PRI003', 'PRINTCOPY VENTURES, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '701 6580'),
('PRI004', 'PRIMEDIA GRAPHICS SOLUTIONS CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '964 0932/ 557 6342'),
('PRO001', 'PROVIDENT DEVELOPER & HOLDINGS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '813-2664/2667'),
('PRR-001', 'EMILYN A. RESPICIO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '075-696-1350'),
('PSP01', 'PS PRINT ENT./SUSAN R. MENDOZA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '881 3617 / 788 3617'),
('PUL01', 'PULPA PRESS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '932-0177'),
('PUN001', 'PUNONGBAYAN & ARAULLO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8865511'),
('PUR01', 'PURPLE TAG INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '894-1500'),
('QUA001', 'QUARTZ BUSINESS PRODUCTS CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '815-1466'),
('QUA002', 'QUALITRANS COURIER', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '897-4368'),
('QUA003', 'QUALITY PLUS MANAGEMENT CONSULTING CO.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '434 3583'),
('R&N001', 'R & N GRAPHICS PRINTING', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '6401109'),
('RAD01', 'R.A. DELA ROSA ELECTRICAL SERVICES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '840 4147'),
('RCA01', 'RIGHT CLIQUE ADVERTISING & GRAPHIX', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REC001', 'R.E.C. PRINTMEDIA CO.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '4113444'),
('REF001', 'CATHERINE T. CO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF002', 'NUMERIANO D. DELA CRUZ', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF003', 'ENRICO M. TALAO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF004', 'RHEELYN P. SILAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF005', 'HEIDE  M. MATEO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF006', 'MARY ANN GRACE LLAMOSO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF007', 'MARIA AMMIE B. SEDANO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF008', 'ROGER CENIZA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF009', 'JEA CONCEPCION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF010', 'IGNACIO LEONARDO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF011', 'MA. CLEOFE ABAD', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF012', 'ELIEZER GOMEZ', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF013', 'NOREEN YOUNG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF014', 'JOANNA MARIE M. TALINGDAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF015', 'MANAGEMENT SYSTEMS INTERNATIONAL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '887-7412'),
('REF016', 'PETER M. MONTALBAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF017', 'TAYTAY SA KAUSWAGAN, INC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF018', 'MARY GRACE O. VILLION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF019', 'MA. CECILIA T. CANDIDO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF020', 'LEAH G. ALAMO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF021', 'MERLEN C. DELA CRUZ', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF022', 'FLORENCIO Y. ROJAS JR.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF023', 'EDUCATION DEVELOPMENT CENTER, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF024', 'MARILEN V. GRAMA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF025', 'JODAN ELIAS TAPANG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF026', 'EDMOND VILLASANTA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF027', 'MYLA JOY SIMBAHAN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF028', 'ELAINE Y. ONG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF029', 'JUNEDINE A. CORTEZA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF030', 'ALVIN SANTIAGO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF031', 'MELODY MACARAIG-BINAG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF032', 'CRUZ, ROSE MARIE V.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF033', 'NELL G. REGALA/PHIL.BATTERIES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF034', 'FRITZIE SACRAMENTO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF035', 'MARISSA ALLID', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF036', 'AMELIA T. AWANIN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF037', 'BOBBY F. FABREAG', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF038', 'NORWIN V. VALENZUELA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF039', 'ELIZABETH LINAGO/BSP', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF040', 'CLARISSE G. BOLALIN', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REF041', 'ARNOLD S. LANDICHO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('REG001', 'REGENCY LAGOON RESORT', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('RES001', 'RESORTS WORLD AT SENTOSA PTE LTD.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('RIC01', 'RICKY JAY CHEONG GLASSETCHED CREATIONS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '253-6035'),
('RIZ01', 'RIZAL COMMERCIAL BANKING CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('RNA001', 'R.N. ALFONSO CONSTRUCTION SERVICE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ROA01', 'ROAVSAN GENERAL MERCHANDISE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '829-1170'),
('ROB01', 'ROBINSONS LAND CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ROM01', 'ROMADS GLASS ALUMINUM', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('ROS01', 'ROSEHALL MANAGEMENT CONSULTANTS INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '633-4733'),
('ROY001', 'ROY-DENS COMMERCIAL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '9298383'),
('RUS001', 'RUSTAN COMMERCIAL CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '896-9294'),
('RUS002', 'RUSTICO BONUS JR.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '478-8259'),
('SAG001', 'SAGESOFT SOLUTIONS, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('SAN001', 'SAN MIGUEL CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('SAP001', 'SAPORI D'' ITALIA, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '7594451'),
('SAR001', 'SARAH''S GARMENT', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '0906 5858531'),
('SAV01', 'SPECTRA AUDIO VIDEO CENTER', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '818-5493'),
('SCB01', 'STANDARD CHARTERED BANK4054603850544642', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('SER01', 'SERAPH MANAGEMENT GROUP, INC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('SHA001', 'EDSA SHANGRI-LA MANILA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '633-8888'),
('SHE001', 'SHELLSOFT TECHNOLOGY CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '7400435'),
('SHE002', 'SHEPHERDESS TRAVEL, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '5261887'),
('SHE003', 'SHERWIN L. CHICO', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('SHI001', 'SHILOHS GIFTS AND PREMIUMS, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '4946001'),
('SHO001', 'SHOWER OF GOLD FLOWER SHOPPE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '890-2731'),
('SIG01', 'SIGNRAYS ADVERTISING, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('SKY01', 'SKY COMPUTER & OFFICE SUPPLIES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '495-9999/ 495-0999'),
('SKY02', 'SKYDRIVE TRAVEL & TOURS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('SSS001', 'SOCIAL SECURITY SYSTEM', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('STP001', 'ST. PETER LIFE PLAN INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('SUN001', 'SUNSHINE COMMODITIES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '7508227'),
('SUR001', 'SUREMAIL COURIER SERVICES, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('SWA01', 'SWAN CATERING SERVICE CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('THE01', 'THE COLUMNS AYALA AVENUE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('THE02', 'THE REGISTER OF DEEDS OF MAKATI', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('THE03', 'THE LALIT, NEW DELHI', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('THE04', 'THE BRAIN COMPUTER CORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('TID001', 'TIDCORP.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '893-4204 LOC. 358'),
('TNT001', 'TNT EXPRESS WORLDWIDE, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '5510918'),
('TOW001', 'TOWER CLUB INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('TRA001', 'TRADERS HOTEL MANILA', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('TRE001', 'TRENDS AND CONCEPTS FURNITURE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8898192/8898193'),
('UBI001', 'U-BIX CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '8976819'),
('UH01', 'U! HAPPY EVENTS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '470-6668'),
('UNI001', 'UNITED LABORATORIES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('UPS001', 'UPS-DELBROS INTERNATIONAL', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '5121355'),
('VAL01', 'VALLEY SPORTS CORPORATION', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '725-3965 & 67'),
('VCM-001', 'V.C. MAMALATEO & ASSOCIATES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '(63)372-9267'),
('VOY001', 'VOYAGER TRAVEL & TOURS, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '840-1161'),
('WIL01', 'WILLIMSON INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('WMJ01', 'W.M. JOSE JEWELRIES & GEN MERCHANDISE', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '583-8429'),
('WOR01', 'WORLD SPICES INTERNATIONAL CUISINE, INC', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('WOW01', 'WOW! FIREWORKS', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('WRE01', 'WR ENTERPRISES AND PRINTING SERVICES', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, ''),
('XEN001', 'XENTRIX SOLUTIONS, INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '6317448/6378741'),
('ZFI01', 'ZUBUFOODS INC.', '', '', '', '', '', '', 0, 0.000000, 0.000000, 'PHP', '0000-00-00', 'CA', 0, '0000-00-00 00:00:00', '', '0', '', 0, 1, 0, '', '', '', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `suppliertype`
--

CREATE TABLE IF NOT EXISTS `suppliertype` (
  `typeid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `supptrans`
--

CREATE TABLE IF NOT EXISTS `supptrans` (
  `transno` int(11) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `supplierno` varchar(10) NOT NULL DEFAULT '',
  `suppreference` varchar(20) NOT NULL DEFAULT '',
  `trandate` date NOT NULL DEFAULT '0000-00-00',
  `duedate` date NOT NULL DEFAULT '0000-00-00',
  `inputdate` datetime NOT NULL,
  `settled` tinyint(4) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `ovamount` double NOT NULL DEFAULT '0',
  `ovgst` double NOT NULL DEFAULT '0',
  `diffonexch` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `transtext` text,
  `hold` tinyint(4) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TypeTransNo` (`transno`,`type`),
  KEY `DueDate` (`duedate`),
  KEY `Hold` (`hold`),
  KEY `SupplierNo` (`supplierno`),
  KEY `Settled` (`settled`),
  KEY `SupplierNo_2` (`supplierno`,`suppreference`),
  KEY `SuppReference` (`suppreference`),
  KEY `TranDate` (`trandate`),
  KEY `TransNo` (`transno`),
  KEY `Type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `supptranstaxes`
--

CREATE TABLE IF NOT EXISTS `supptranstaxes` (
  `supptransid` int(11) NOT NULL DEFAULT '0',
  `taxauthid` tinyint(4) NOT NULL DEFAULT '0',
  `taxamount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`supptransid`,`taxauthid`),
  KEY `taxauthid` (`taxauthid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `systypes`
--

CREATE TABLE IF NOT EXISTS `systypes` (
  `typeid` smallint(6) NOT NULL DEFAULT '0',
  `typename` char(50) NOT NULL DEFAULT '',
  `typeno` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`typeid`),
  KEY `TypeNo` (`typeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `systypes`
--

INSERT INTO `systypes` (`typeid`, `typename`, `typeno`) VALUES
(0, 'Journal - GL', 0),
(1, 'Payment - GL', 0),
(2, 'Receipt - GL', 0),
(3, 'Standing Journal', 0),
(10, 'Sales Invoice', 0),
(11, 'Credit Note', 0),
(12, 'Receipt', 0),
(15, 'Journal - Debtors', 0),
(16, 'Location Transfer', 0),
(17, 'Stock Adjustment', 0),
(18, 'Purchase Order', 0),
(19, 'Picking List', 0),
(20, 'Purchase Invoice', 0),
(21, 'Debit Note', 0),
(22, 'Creditors Payment', 0),
(23, 'Creditors Journal', 0),
(25, 'Purchase Order Delivery', 0),
(26, 'Work Order Receipt', 0),
(28, 'Work Order Issue', 0),
(29, 'Work Order Variance', 0),
(30, 'Sales Order', 0),
(31, 'Shipment Close', 0),
(32, 'Contract Close', 0),
(35, 'Cost Update', 0),
(36, 'Exchange Difference', 0),
(37, 'Tenders', 0),
(38, 'Stock Requests', 0),
(40, 'Work Order', 0),
(41, 'Asset Addition', 0),
(42, 'Asset Category Change', 0),
(43, 'Delete w/down asset', 0),
(44, 'Depreciation', 0),
(49, 'Import Fixed Assets', 0),
(50, 'Opening Balance', 0),
(500, 'Auto Debtor Number', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `tagref` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tagdescription` varchar(50) NOT NULL,
  PRIMARY KEY (`tagref`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tagref`, `tagdescription`) VALUES
(1, 'CIA Review'),
(2, 'Public run seminar'),
(3, 'In house seminar'),
(4, 'Certification - CIA P1'),
(5, 'Certification - CIA P2'),
(6, 'Certification - CIA P3'),
(7, 'Certification - CIA P4'),
(8, 'Certification - CIA P4c'),
(9, 'Certification - Reg. fees'),
(10, 'Certification - CRMA'),
(11, 'Certification - CCSA'),
(12, 'Certification - CFSA'),
(13, 'Membership'),
(14, 'Journal'),
(15, 'Books'),
(16, 'Annual Convention'),
(17, 'Internal Affairs'),
(18, 'Tripartite');

-- --------------------------------------------------------

--
-- Table structure for table `taxauthorities`
--

CREATE TABLE IF NOT EXISTS `taxauthorities` (
  `taxid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL DEFAULT '',
  `taxglcode` varchar(20) NOT NULL DEFAULT '0',
  `purchtaxglaccount` varchar(20) NOT NULL DEFAULT '0',
  `bank` varchar(50) NOT NULL DEFAULT '',
  `bankacctype` varchar(20) NOT NULL DEFAULT '',
  `bankacc` varchar(50) NOT NULL DEFAULT '',
  `bankswift` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`taxid`),
  KEY `TaxGLCode` (`taxglcode`),
  KEY `PurchTaxGLAccount` (`purchtaxglaccount`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `taxauthorities`
--

INSERT INTO `taxauthorities` (`taxid`, `description`, `taxglcode`, `purchtaxglaccount`, `bank`, `bankacctype`, `bankacc`, `bankswift`) VALUES
(1, 'Australian GST', '2300', '2103', '', '', '', ''),
(5, 'Sales Tax', '2300', '2104', '', '', '', ''),
(11, 'Canadian GST', '2300', '2103', '', '', '', ''),
(12, 'Ontario PST', '2300', '2104', '', '', '', ''),
(13, 'UK VAT', '2300', '2104', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `taxauthrates`
--

CREATE TABLE IF NOT EXISTS `taxauthrates` (
  `taxauthority` tinyint(4) NOT NULL DEFAULT '1',
  `dispatchtaxprovince` tinyint(4) NOT NULL DEFAULT '1',
  `taxcatid` tinyint(4) NOT NULL DEFAULT '0',
  `taxrate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`taxauthority`,`dispatchtaxprovince`,`taxcatid`),
  KEY `TaxAuthority` (`taxauthority`),
  KEY `dispatchtaxprovince` (`dispatchtaxprovince`),
  KEY `taxcatid` (`taxcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taxauthrates`
--

INSERT INTO `taxauthrates` (`taxauthority`, `dispatchtaxprovince`, `taxcatid`, `taxrate`) VALUES
(1, 1, 1, 0.1),
(1, 1, 2, 0),
(1, 1, 5, 0),
(5, 1, 1, 0.2),
(5, 1, 2, 0.35),
(5, 1, 5, 0),
(11, 1, 1, 0.07),
(11, 1, 2, 0.12),
(11, 1, 5, 0.07),
(12, 1, 1, 0.05),
(12, 1, 2, 0.075),
(12, 1, 5, 0),
(13, 1, 1, 0),
(13, 1, 2, 0),
(13, 1, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxcategories`
--

CREATE TABLE IF NOT EXISTS `taxcategories` (
  `taxcatid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `taxcatname` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`taxcatid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `taxcategories`
--

INSERT INTO `taxcategories` (`taxcatid`, `taxcatname`) VALUES
(1, 'Taxable supply'),
(2, 'Luxury Items'),
(4, 'Exempt'),
(5, 'Freight');

-- --------------------------------------------------------

--
-- Table structure for table `taxgroups`
--

CREATE TABLE IF NOT EXISTS `taxgroups` (
  `taxgroupid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `taxgroupdescription` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`taxgroupid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `taxgroups`
--

INSERT INTO `taxgroups` (`taxgroupid`, `taxgroupdescription`) VALUES
(1, 'Default'),
(2, 'Ontario'),
(3, 'UK Inland Revenue');

-- --------------------------------------------------------

--
-- Table structure for table `taxgrouptaxes`
--

CREATE TABLE IF NOT EXISTS `taxgrouptaxes` (
  `taxgroupid` tinyint(4) NOT NULL DEFAULT '0',
  `taxauthid` tinyint(4) NOT NULL DEFAULT '0',
  `calculationorder` tinyint(4) NOT NULL DEFAULT '0',
  `taxontax` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`taxgroupid`,`taxauthid`),
  KEY `taxgroupid` (`taxgroupid`),
  KEY `taxauthid` (`taxauthid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxprovinces`
--

CREATE TABLE IF NOT EXISTS `taxprovinces` (
  `taxprovinceid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `taxprovincename` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`taxprovinceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `taxprovinces`
--

INSERT INTO `taxprovinces` (`taxprovinceid`, `taxprovincename`) VALUES
(1, 'Default Tax province'),
(2, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `tenderitems`
--

CREATE TABLE IF NOT EXISTS `tenderitems` (
  `tenderid` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantity` varchar(40) NOT NULL DEFAULT '',
  `units` varchar(20) NOT NULL DEFAULT 'each',
  PRIMARY KEY (`tenderid`,`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tenders`
--

CREATE TABLE IF NOT EXISTS `tenders` (
  `tenderid` int(11) NOT NULL DEFAULT '0',
  `location` varchar(5) NOT NULL DEFAULT '',
  `address1` varchar(40) NOT NULL DEFAULT '',
  `address2` varchar(40) NOT NULL DEFAULT '',
  `address3` varchar(40) NOT NULL DEFAULT '',
  `address4` varchar(40) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL DEFAULT '',
  `address6` varchar(15) NOT NULL DEFAULT '',
  `telephone` varchar(25) NOT NULL DEFAULT '',
  `closed` int(2) NOT NULL DEFAULT '0',
  `requiredbydate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tenderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tendersuppliers`
--

CREATE TABLE IF NOT EXISTS `tendersuppliers` (
  `tenderid` int(11) NOT NULL DEFAULT '0',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT '',
  `responded` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tenderid`,`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unitsofmeasure`
--

CREATE TABLE IF NOT EXISTS `unitsofmeasure` (
  `unitid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `unitname` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`unitid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `unitsofmeasure`
--

INSERT INTO `unitsofmeasure` (`unitid`, `unitname`) VALUES
(1, 'each'),
(2, 'meters'),
(3, 'kgs'),
(4, 'litres'),
(5, 'length');

-- --------------------------------------------------------

--
-- Table structure for table `woitems`
--

CREATE TABLE IF NOT EXISTS `woitems` (
  `wo` int(11) NOT NULL,
  `stockid` char(20) NOT NULL DEFAULT '',
  `qtyreqd` double NOT NULL DEFAULT '1',
  `qtyrecd` double NOT NULL DEFAULT '0',
  `stdcost` double NOT NULL,
  `nextlotsnref` varchar(20) DEFAULT '',
  PRIMARY KEY (`wo`,`stockid`),
  KEY `stockid` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `worequirements`
--

CREATE TABLE IF NOT EXISTS `worequirements` (
  `wo` int(11) NOT NULL,
  `parentstockid` varchar(20) NOT NULL,
  `stockid` varchar(20) NOT NULL,
  `qtypu` double NOT NULL DEFAULT '1',
  `stdcost` double NOT NULL DEFAULT '0',
  `autoissue` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wo`,`parentstockid`,`stockid`),
  KEY `stockid` (`stockid`),
  KEY `worequirements_ibfk_3` (`parentstockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workcentres`
--

CREATE TABLE IF NOT EXISTS `workcentres` (
  `code` char(5) NOT NULL DEFAULT '',
  `location` char(5) NOT NULL DEFAULT '',
  `description` char(20) NOT NULL DEFAULT '',
  `capacity` double NOT NULL DEFAULT '1',
  `overheadperhour` decimal(10,0) NOT NULL DEFAULT '0',
  `overheadrecoveryact` int(11) NOT NULL DEFAULT '0',
  `setuphrs` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `Description` (`description`),
  KEY `Location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workorders`
--

CREATE TABLE IF NOT EXISTS `workorders` (
  `wo` int(11) NOT NULL,
  `loccode` char(5) NOT NULL DEFAULT '',
  `requiredby` date NOT NULL DEFAULT '0000-00-00',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `costissued` double NOT NULL DEFAULT '0',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wo`),
  KEY `LocCode` (`loccode`),
  KEY `StartDate` (`startdate`),
  KEY `RequiredBy` (`requiredby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `woserialnos`
--

CREATE TABLE IF NOT EXISTS `woserialnos` (
  `wo` int(11) NOT NULL,
  `stockid` varchar(20) NOT NULL,
  `serialno` varchar(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT '1',
  `qualitytext` text NOT NULL,
  PRIMARY KEY (`wo`,`stockid`,`serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `www_users`
--

CREATE TABLE IF NOT EXISTS `www_users` (
  `userid` varchar(20) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `realname` varchar(35) NOT NULL DEFAULT '',
  `customerid` varchar(10) NOT NULL DEFAULT '',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `salesman` char(3) NOT NULL,
  `phone` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) DEFAULT NULL,
  `defaultlocation` varchar(5) NOT NULL DEFAULT '',
  `fullaccess` int(11) NOT NULL DEFAULT '1',
  `cancreatetender` tinyint(1) NOT NULL DEFAULT '0',
  `lastvisitdate` datetime DEFAULT NULL,
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `pagesize` varchar(20) NOT NULL DEFAULT 'A4',
  `modulesallowed` varchar(40) NOT NULL DEFAULT '',
  `blocked` tinyint(4) NOT NULL DEFAULT '0',
  `displayrecordsmax` int(11) NOT NULL DEFAULT '0',
  `theme` varchar(30) NOT NULL DEFAULT 'fresh',
  `language` varchar(10) NOT NULL DEFAULT 'en_GB.utf8',
  `pdflanguage` tinyint(1) NOT NULL DEFAULT '0',
  `department` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `CustomerID` (`customerid`),
  KEY `DefaultLocation` (`defaultlocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `www_users`
--

INSERT INTO `www_users` (`userid`, `password`, `realname`, `customerid`, `supplierid`, `salesman`, `phone`, `email`, `defaultlocation`, `fullaccess`, `cancreatetender`, `lastvisitdate`, `branchcode`, `pagesize`, `modulesallowed`, `blocked`, `displayrecordsmax`, `theme`, `language`, `pdflanguage`, `department`) VALUES
('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Demonstration user', '', '', '', '', 'siteadmin@iia-p.org', 'MKT', 8, 0, '2013-01-23 14:28:02', '', 'A4', '1,1,1,1,1,1,1,1,1,1,0,', 0, 50, 'aguapop', 'en_US.utf8', 0, 0),
('iiap_api', 'a46e5607a231e168d5f97c56cfad17178c5079d4', 'API', '', '', '', '', '', 'MKT', 8, 0, NULL, '', 'A4', '1,1,1,1,1,1,1,1,1,1,0,', 0, 50, 'silverwolf', 'en_GB.utf8', 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountgroups`
--
ALTER TABLE `accountgroups`
  ADD CONSTRAINT `accountgroups_ibfk_1` FOREIGN KEY (`sectioninaccounts`) REFERENCES `accountsection` (`sectionid`);

--
-- Constraints for table `audittrail`
--
ALTER TABLE `audittrail`
  ADD CONSTRAINT `audittrail_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `www_users` (`userid`);

--
-- Constraints for table `bankaccounts`
--
ALTER TABLE `bankaccounts`
  ADD CONSTRAINT `bankaccounts_ibfk_1` FOREIGN KEY (`accountcode`) REFERENCES `chartmaster` (`accountcode`);

--
-- Constraints for table `banktrans`
--
ALTER TABLE `banktrans`
  ADD CONSTRAINT `banktrans_ibfk_2` FOREIGN KEY (`bankact`) REFERENCES `bankaccounts` (`accountcode`),
  ADD CONSTRAINT `banktrans_ibfk_1` FOREIGN KEY (`type`) REFERENCES `systypes` (`typeid`);

--
-- Constraints for table `bom`
--
ALTER TABLE `bom`
  ADD CONSTRAINT `bom_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `bom_ibfk_2` FOREIGN KEY (`component`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `bom_ibfk_3` FOREIGN KEY (`workcentreadded`) REFERENCES `workcentres` (`code`),
  ADD CONSTRAINT `bom_ibfk_4` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`);

--
-- Constraints for table `chartdetails`
--
ALTER TABLE `chartdetails`
  ADD CONSTRAINT `chartdetails_ibfk_1` FOREIGN KEY (`accountcode`) REFERENCES `chartmaster` (`accountcode`),
  ADD CONSTRAINT `chartdetails_ibfk_2` FOREIGN KEY (`period`) REFERENCES `periods` (`periodno`);

--
-- Constraints for table `chartmaster`
--
ALTER TABLE `chartmaster`
  ADD CONSTRAINT `chartmaster_ibfk_1` FOREIGN KEY (`group_`) REFERENCES `accountgroups` (`groupname`);

--
-- Constraints for table `contractbom`
--
ALTER TABLE `contractbom`
  ADD CONSTRAINT `contractbom_ibfk_1` FOREIGN KEY (`workcentreadded`) REFERENCES `workcentres` (`code`),
  ADD CONSTRAINT `contractbom_ibfk_3` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`);

--
-- Constraints for table `contractcharges`
--
ALTER TABLE `contractcharges`
  ADD CONSTRAINT `contractcharges_ibfk_1` FOREIGN KEY (`contractref`) REFERENCES `contracts` (`contractref`),
  ADD CONSTRAINT `contractcharges_ibfk_2` FOREIGN KEY (`transtype`) REFERENCES `systypes` (`typeid`);

--
-- Constraints for table `contractreqts`
--
ALTER TABLE `contractreqts`
  ADD CONSTRAINT `contractreqts_ibfk_1` FOREIGN KEY (`contractref`) REFERENCES `contracts` (`contractref`);

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`debtorno`, `branchcode`) REFERENCES `custbranch` (`debtorno`, `branchcode`),
  ADD CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`categoryid`) REFERENCES `stockcategory` (`categoryid`),
  ADD CONSTRAINT `contracts_ibfk_3` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`);

--
-- Constraints for table `custallocns`
--
ALTER TABLE `custallocns`
  ADD CONSTRAINT `custallocns_ibfk_1` FOREIGN KEY (`transid_allocfrom`) REFERENCES `debtortrans` (`id`),
  ADD CONSTRAINT `custallocns_ibfk_2` FOREIGN KEY (`transid_allocto`) REFERENCES `debtortrans` (`id`);

--
-- Constraints for table `custbranch`
--
ALTER TABLE `custbranch`
  ADD CONSTRAINT `custbranch_ibfk_1` FOREIGN KEY (`debtorno`) REFERENCES `debtorsmaster` (`debtorno`),
  ADD CONSTRAINT `custbranch_ibfk_2` FOREIGN KEY (`area`) REFERENCES `areas` (`areacode`),
  ADD CONSTRAINT `custbranch_ibfk_3` FOREIGN KEY (`salesman`) REFERENCES `salesman` (`salesmancode`),
  ADD CONSTRAINT `custbranch_ibfk_4` FOREIGN KEY (`defaultlocation`) REFERENCES `locations` (`loccode`),
  ADD CONSTRAINT `custbranch_ibfk_6` FOREIGN KEY (`defaultshipvia`) REFERENCES `shippers` (`shipper_id`),
  ADD CONSTRAINT `custbranch_ibfk_7` FOREIGN KEY (`taxgroupid`) REFERENCES `taxgroups` (`taxgroupid`);

--
-- Constraints for table `debtorsmaster`
--
ALTER TABLE `debtorsmaster`
  ADD CONSTRAINT `debtorsmaster_ibfk_1` FOREIGN KEY (`holdreason`) REFERENCES `holdreasons` (`reasoncode`),
  ADD CONSTRAINT `debtorsmaster_ibfk_2` FOREIGN KEY (`currcode`) REFERENCES `currencies` (`currabrev`),
  ADD CONSTRAINT `debtorsmaster_ibfk_3` FOREIGN KEY (`paymentterms`) REFERENCES `paymentterms` (`termsindicator`),
  ADD CONSTRAINT `debtorsmaster_ibfk_4` FOREIGN KEY (`salestype`) REFERENCES `salestypes` (`typeabbrev`),
  ADD CONSTRAINT `debtorsmaster_ibfk_5` FOREIGN KEY (`typeid`) REFERENCES `debtortype` (`typeid`);

--
-- Constraints for table `debtortrans`
--
ALTER TABLE `debtortrans`
  ADD CONSTRAINT `debtortrans_ibfk_2` FOREIGN KEY (`type`) REFERENCES `systypes` (`typeid`),
  ADD CONSTRAINT `debtortrans_ibfk_3` FOREIGN KEY (`prd`) REFERENCES `periods` (`periodno`);

--
-- Constraints for table `debtortranstaxes`
--
ALTER TABLE `debtortranstaxes`
  ADD CONSTRAINT `debtortranstaxes_ibfk_1` FOREIGN KEY (`taxauthid`) REFERENCES `taxauthorities` (`taxid`),
  ADD CONSTRAINT `debtortranstaxes_ibfk_2` FOREIGN KEY (`debtortransid`) REFERENCES `debtortrans` (`id`);

--
-- Constraints for table `deliverynotes`
--
ALTER TABLE `deliverynotes`
  ADD CONSTRAINT `deliverynotes_ibfk_1` FOREIGN KEY (`salesorderno`) REFERENCES `salesorders` (`orderno`),
  ADD CONSTRAINT `deliverynotes_ibfk_2` FOREIGN KEY (`salesorderno`, `salesorderlineno`) REFERENCES `salesorderdetails` (`orderno`, `orderlineno`);

--
-- Constraints for table `discountmatrix`
--
ALTER TABLE `discountmatrix`
  ADD CONSTRAINT `discountmatrix_ibfk_1` FOREIGN KEY (`salestype`) REFERENCES `salestypes` (`typeabbrev`);

--
-- Constraints for table `freightcosts`
--
ALTER TABLE `freightcosts`
  ADD CONSTRAINT `freightcosts_ibfk_1` FOREIGN KEY (`locationfrom`) REFERENCES `locations` (`loccode`),
  ADD CONSTRAINT `freightcosts_ibfk_2` FOREIGN KEY (`shipperid`) REFERENCES `shippers` (`shipper_id`);

--
-- Constraints for table `gltrans`
--
ALTER TABLE `gltrans`
  ADD CONSTRAINT `gltrans_ibfk_1` FOREIGN KEY (`account`) REFERENCES `chartmaster` (`accountcode`),
  ADD CONSTRAINT `gltrans_ibfk_2` FOREIGN KEY (`type`) REFERENCES `systypes` (`typeid`),
  ADD CONSTRAINT `gltrans_ibfk_3` FOREIGN KEY (`periodno`) REFERENCES `periods` (`periodno`);

--
-- Constraints for table `grns`
--
ALTER TABLE `grns`
  ADD CONSTRAINT `grns_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`supplierid`),
  ADD CONSTRAINT `grns_ibfk_2` FOREIGN KEY (`podetailitem`) REFERENCES `purchorderdetails` (`podetailitem`);

--
-- Constraints for table `internalstockcatrole`
--
ALTER TABLE `internalstockcatrole`
  ADD CONSTRAINT `internalstockcatrole_ibfk_2` FOREIGN KEY (`secroleid`) REFERENCES `securityroles` (`secroleid`),
  ADD CONSTRAINT `internalstockcatrole_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `stockcategory` (`categoryid`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`taxprovinceid`) REFERENCES `taxprovinces` (`taxprovinceid`);

--
-- Constraints for table `locstock`
--
ALTER TABLE `locstock`
  ADD CONSTRAINT `locstock_ibfk_1` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`),
  ADD CONSTRAINT `locstock_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`);

--
-- Constraints for table `loctransfers`
--
ALTER TABLE `loctransfers`
  ADD CONSTRAINT `loctransfers_ibfk_1` FOREIGN KEY (`shiploc`) REFERENCES `locations` (`loccode`),
  ADD CONSTRAINT `loctransfers_ibfk_2` FOREIGN KEY (`recloc`) REFERENCES `locations` (`loccode`),
  ADD CONSTRAINT `loctransfers_ibfk_3` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`);

--
-- Constraints for table `mrpdemands`
--
ALTER TABLE `mrpdemands`
  ADD CONSTRAINT `mrpdemands_ibfk_1` FOREIGN KEY (`mrpdemandtype`) REFERENCES `mrpdemandtypes` (`mrpdemandtype`),
  ADD CONSTRAINT `mrpdemands_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`);

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`supplierid`),
  ADD CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`);

--
-- Constraints for table `orderdeliverydifferenceslog`
--
ALTER TABLE `orderdeliverydifferenceslog`
  ADD CONSTRAINT `orderdeliverydifferenceslog_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `orderdeliverydifferenceslog_ibfk_2` FOREIGN KEY (`debtorno`, `branch`) REFERENCES `custbranch` (`debtorno`, `branchcode`),
  ADD CONSTRAINT `orderdeliverydifferenceslog_ibfk_3` FOREIGN KEY (`orderno`) REFERENCES `salesorders` (`orderno`);

--
-- Constraints for table `pcexpenses`
--
ALTER TABLE `pcexpenses`
  ADD CONSTRAINT `pcexpenses_ibfk_1` FOREIGN KEY (`glaccount`) REFERENCES `chartmaster` (`accountcode`);

--
-- Constraints for table `pctabexpenses`
--
ALTER TABLE `pctabexpenses`
  ADD CONSTRAINT `pctabexpenses_ibfk_1` FOREIGN KEY (`typetabcode`) REFERENCES `pctypetabs` (`typetabcode`),
  ADD CONSTRAINT `pctabexpenses_ibfk_2` FOREIGN KEY (`codeexpense`) REFERENCES `pcexpenses` (`codeexpense`);

--
-- Constraints for table `pctabs`
--
ALTER TABLE `pctabs`
  ADD CONSTRAINT `pctabs_ibfk_1` FOREIGN KEY (`usercode`) REFERENCES `www_users` (`userid`),
  ADD CONSTRAINT `pctabs_ibfk_2` FOREIGN KEY (`typetabcode`) REFERENCES `pctypetabs` (`typetabcode`),
  ADD CONSTRAINT `pctabs_ibfk_3` FOREIGN KEY (`currency`) REFERENCES `currencies` (`currabrev`),
  ADD CONSTRAINT `pctabs_ibfk_4` FOREIGN KEY (`authorizer`) REFERENCES `www_users` (`userid`),
  ADD CONSTRAINT `pctabs_ibfk_5` FOREIGN KEY (`glaccountassignment`) REFERENCES `chartmaster` (`accountcode`);

--
-- Constraints for table `pickinglistdetails`
--
ALTER TABLE `pickinglistdetails`
  ADD CONSTRAINT `pickinglistdetails_ibfk_1` FOREIGN KEY (`pickinglistno`) REFERENCES `pickinglists` (`pickinglistno`);

--
-- Constraints for table `pickinglists`
--
ALTER TABLE `pickinglists`
  ADD CONSTRAINT `pickinglists_ibfk_1` FOREIGN KEY (`orderno`) REFERENCES `salesorders` (`orderno`);

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `prices_ibfk_2` FOREIGN KEY (`currabrev`) REFERENCES `currencies` (`currabrev`),
  ADD CONSTRAINT `prices_ibfk_3` FOREIGN KEY (`typeabbrev`) REFERENCES `salestypes` (`typeabbrev`);

--
-- Constraints for table `purchdata`
--
ALTER TABLE `purchdata`
  ADD CONSTRAINT `purchdata_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `purchdata_ibfk_2` FOREIGN KEY (`supplierno`) REFERENCES `suppliers` (`supplierid`);

--
-- Constraints for table `purchorderdetails`
--
ALTER TABLE `purchorderdetails`
  ADD CONSTRAINT `purchorderdetails_ibfk_1` FOREIGN KEY (`orderno`) REFERENCES `purchorders` (`orderno`);

--
-- Constraints for table `purchorders`
--
ALTER TABLE `purchorders`
  ADD CONSTRAINT `purchorders_ibfk_1` FOREIGN KEY (`supplierno`) REFERENCES `suppliers` (`supplierid`),
  ADD CONSTRAINT `purchorders_ibfk_2` FOREIGN KEY (`intostocklocation`) REFERENCES `locations` (`loccode`);

--
-- Constraints for table `recurringsalesorders`
--
ALTER TABLE `recurringsalesorders`
  ADD CONSTRAINT `recurringsalesorders_ibfk_1` FOREIGN KEY (`branchcode`, `debtorno`) REFERENCES `custbranch` (`branchcode`, `debtorno`);

--
-- Constraints for table `recurrsalesorderdetails`
--
ALTER TABLE `recurrsalesorderdetails`
  ADD CONSTRAINT `recurrsalesorderdetails_ibfk_1` FOREIGN KEY (`recurrorderno`) REFERENCES `recurringsalesorders` (`recurrorderno`),
  ADD CONSTRAINT `recurrsalesorderdetails_ibfk_2` FOREIGN KEY (`stkcode`) REFERENCES `stockmaster` (`stockid`);

--
-- Constraints for table `reportcolumns`
--
ALTER TABLE `reportcolumns`
  ADD CONSTRAINT `reportcolumns_ibfk_1` FOREIGN KEY (`reportid`) REFERENCES `reportheaders` (`reportid`);

--
-- Constraints for table `salesanalysis`
--
ALTER TABLE `salesanalysis`
  ADD CONSTRAINT `salesanalysis_ibfk_1` FOREIGN KEY (`periodno`) REFERENCES `periods` (`periodno`);

--
-- Constraints for table `salescatprod`
--
ALTER TABLE `salescatprod`
  ADD CONSTRAINT `salescatprod_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `salescatprod_ibfk_2` FOREIGN KEY (`salescatid`) REFERENCES `salescat` (`salescatid`);

--
-- Constraints for table `salesorderdetails`
--
ALTER TABLE `salesorderdetails`
  ADD CONSTRAINT `salesorderdetails_ibfk_1` FOREIGN KEY (`orderno`) REFERENCES `salesorders` (`orderno`),
  ADD CONSTRAINT `salesorderdetails_ibfk_2` FOREIGN KEY (`stkcode`) REFERENCES `stockmaster` (`stockid`);

--
-- Constraints for table `salesorders`
--
ALTER TABLE `salesorders`
  ADD CONSTRAINT `salesorders_ibfk_1` FOREIGN KEY (`branchcode`, `debtorno`) REFERENCES `custbranch` (`branchcode`, `debtorno`),
  ADD CONSTRAINT `salesorders_ibfk_2` FOREIGN KEY (`shipvia`) REFERENCES `shippers` (`shipper_id`),
  ADD CONSTRAINT `salesorders_ibfk_3` FOREIGN KEY (`fromstkloc`) REFERENCES `locations` (`loccode`);

--
-- Constraints for table `securitygroups`
--
ALTER TABLE `securitygroups`
  ADD CONSTRAINT `securitygroups_secroleid_fk` FOREIGN KEY (`secroleid`) REFERENCES `securityroles` (`secroleid`),
  ADD CONSTRAINT `securitygroups_tokenid_fk` FOREIGN KEY (`tokenid`) REFERENCES `securitytokens` (`tokenid`);

--
-- Constraints for table `shipmentcharges`
--
ALTER TABLE `shipmentcharges`
  ADD CONSTRAINT `shipmentcharges_ibfk_1` FOREIGN KEY (`shiptref`) REFERENCES `shipments` (`shiptref`),
  ADD CONSTRAINT `shipmentcharges_ibfk_2` FOREIGN KEY (`transtype`) REFERENCES `systypes` (`typeid`);

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`supplierid`);

--
-- Constraints for table `stockcatproperties`
--
ALTER TABLE `stockcatproperties`
  ADD CONSTRAINT `stockcatproperties_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `stockcategory` (`categoryid`);

--
-- Constraints for table `stockcheckfreeze`
--
ALTER TABLE `stockcheckfreeze`
  ADD CONSTRAINT `stockcheckfreeze_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `stockcheckfreeze_ibfk_2` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`);

--
-- Constraints for table `stockcounts`
--
ALTER TABLE `stockcounts`
  ADD CONSTRAINT `stockcounts_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `stockcounts_ibfk_2` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`);

--
-- Constraints for table `stockitemproperties`
--
ALTER TABLE `stockitemproperties`
  ADD CONSTRAINT `stockitemproperties_ibfk_2` FOREIGN KEY (`stkcatpropid`) REFERENCES `stockcatproperties` (`stkcatpropid`),
  ADD CONSTRAINT `stockitemproperties_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`);

--
-- Constraints for table `stockmaster`
--
ALTER TABLE `stockmaster`
  ADD CONSTRAINT `stockmaster_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `stockcategory` (`categoryid`),
  ADD CONSTRAINT `stockmaster_ibfk_2` FOREIGN KEY (`taxcatid`) REFERENCES `taxcategories` (`taxcatid`);

--
-- Constraints for table `stockmoves`
--
ALTER TABLE `stockmoves`
  ADD CONSTRAINT `stockmoves_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `stockmoves_ibfk_2` FOREIGN KEY (`type`) REFERENCES `systypes` (`typeid`),
  ADD CONSTRAINT `stockmoves_ibfk_3` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`),
  ADD CONSTRAINT `stockmoves_ibfk_4` FOREIGN KEY (`prd`) REFERENCES `periods` (`periodno`);

--
-- Constraints for table `stockmovestaxes`
--
ALTER TABLE `stockmovestaxes`
  ADD CONSTRAINT `stockmovestaxes_ibfk_2` FOREIGN KEY (`stkmoveno`) REFERENCES `stockmoves` (`stkmoveno`),
  ADD CONSTRAINT `stockmovestaxes_ibfk_1` FOREIGN KEY (`taxauthid`) REFERENCES `taxauthorities` (`taxid`);

--
-- Constraints for table `stockrequest`
--
ALTER TABLE `stockrequest`
  ADD CONSTRAINT `stockrequest_ibfk_2` FOREIGN KEY (`departmentid`) REFERENCES `departments` (`departmentid`),
  ADD CONSTRAINT `stockrequest_ibfk_1` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`);

--
-- Constraints for table `stockrequestitems`
--
ALTER TABLE `stockrequestitems`
  ADD CONSTRAINT `stockrequestitems_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `stockrequestitems_ibfk_1` FOREIGN KEY (`dispatchid`) REFERENCES `stockrequest` (`dispatchid`);

--
-- Constraints for table `stockserialitems`
--
ALTER TABLE `stockserialitems`
  ADD CONSTRAINT `stockserialitems_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `stockserialitems_ibfk_2` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`);

--
-- Constraints for table `stockserialmoves`
--
ALTER TABLE `stockserialmoves`
  ADD CONSTRAINT `stockserialmoves_ibfk_1` FOREIGN KEY (`stockmoveno`) REFERENCES `stockmoves` (`stkmoveno`),
  ADD CONSTRAINT `stockserialmoves_ibfk_2` FOREIGN KEY (`stockid`, `serialno`) REFERENCES `stockserialitems` (`stockid`, `serialno`);

--
-- Constraints for table `suppallocs`
--
ALTER TABLE `suppallocs`
  ADD CONSTRAINT `suppallocs_ibfk_1` FOREIGN KEY (`transid_allocfrom`) REFERENCES `supptrans` (`id`),
  ADD CONSTRAINT `suppallocs_ibfk_2` FOREIGN KEY (`transid_allocto`) REFERENCES `supptrans` (`id`);

--
-- Constraints for table `suppliercontacts`
--
ALTER TABLE `suppliercontacts`
  ADD CONSTRAINT `suppliercontacts_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`supplierid`);

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`currcode`) REFERENCES `currencies` (`currabrev`),
  ADD CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`paymentterms`) REFERENCES `paymentterms` (`termsindicator`),
  ADD CONSTRAINT `suppliers_ibfk_3` FOREIGN KEY (`taxgroupid`) REFERENCES `taxgroups` (`taxgroupid`);

--
-- Constraints for table `supptrans`
--
ALTER TABLE `supptrans`
  ADD CONSTRAINT `supptrans_ibfk_1` FOREIGN KEY (`type`) REFERENCES `systypes` (`typeid`),
  ADD CONSTRAINT `supptrans_ibfk_2` FOREIGN KEY (`supplierno`) REFERENCES `suppliers` (`supplierid`);

--
-- Constraints for table `supptranstaxes`
--
ALTER TABLE `supptranstaxes`
  ADD CONSTRAINT `supptranstaxes_ibfk_1` FOREIGN KEY (`taxauthid`) REFERENCES `taxauthorities` (`taxid`),
  ADD CONSTRAINT `supptranstaxes_ibfk_2` FOREIGN KEY (`supptransid`) REFERENCES `supptrans` (`id`);

--
-- Constraints for table `taxauthorities`
--
ALTER TABLE `taxauthorities`
  ADD CONSTRAINT `taxauthorities_ibfk_2` FOREIGN KEY (`purchtaxglaccount`) REFERENCES `chartmaster` (`accountcode`),
  ADD CONSTRAINT `taxauthorities_ibfk_1` FOREIGN KEY (`taxglcode`) REFERENCES `chartmaster` (`accountcode`);

--
-- Constraints for table `taxauthrates`
--
ALTER TABLE `taxauthrates`
  ADD CONSTRAINT `taxauthrates_ibfk_1` FOREIGN KEY (`taxauthority`) REFERENCES `taxauthorities` (`taxid`),
  ADD CONSTRAINT `taxauthrates_ibfk_2` FOREIGN KEY (`taxcatid`) REFERENCES `taxcategories` (`taxcatid`),
  ADD CONSTRAINT `taxauthrates_ibfk_3` FOREIGN KEY (`dispatchtaxprovince`) REFERENCES `taxprovinces` (`taxprovinceid`);

--
-- Constraints for table `taxgrouptaxes`
--
ALTER TABLE `taxgrouptaxes`
  ADD CONSTRAINT `taxgrouptaxes_ibfk_1` FOREIGN KEY (`taxgroupid`) REFERENCES `taxgroups` (`taxgroupid`),
  ADD CONSTRAINT `taxgrouptaxes_ibfk_2` FOREIGN KEY (`taxauthid`) REFERENCES `taxauthorities` (`taxid`);

--
-- Constraints for table `woitems`
--
ALTER TABLE `woitems`
  ADD CONSTRAINT `woitems_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `woitems_ibfk_2` FOREIGN KEY (`wo`) REFERENCES `workorders` (`wo`);

--
-- Constraints for table `worequirements`
--
ALTER TABLE `worequirements`
  ADD CONSTRAINT `worequirements_ibfk_1` FOREIGN KEY (`wo`) REFERENCES `workorders` (`wo`),
  ADD CONSTRAINT `worequirements_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  ADD CONSTRAINT `worequirements_ibfk_3` FOREIGN KEY (`wo`, `parentstockid`) REFERENCES `woitems` (`wo`, `stockid`);

--
-- Constraints for table `workcentres`
--
ALTER TABLE `workcentres`
  ADD CONSTRAINT `workcentres_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`loccode`);

--
-- Constraints for table `workorders`
--
ALTER TABLE `workorders`
  ADD CONSTRAINT `worksorders_ibfk_1` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`);

--
-- Constraints for table `www_users`
--
ALTER TABLE `www_users`
  ADD CONSTRAINT `www_users_ibfk_1` FOREIGN KEY (`defaultlocation`) REFERENCES `locations` (`loccode`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
