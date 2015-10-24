-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2015 at 10:56 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jhrpayonline`
--
 
--
-- Functions
--
CREATE   FUNCTION `initcaps`(x varchar(255)) RETURNS varchar(255) CHARSET latin1
return concat( upper(substring(x,1,1)),lower(substring(x,2)) ) 

  ;

-- --------------------------------------------------------

--
-- Table structure for table `branch_location`
--



CREATE TABLE IF NOT EXISTS `branch_location` (
  `id` varchar(50) NOT NULL,
  `branch_name` varchar(200) NOT NULL,
  `abbrevation` varchar(100) NOT NULL,
  `department_id` varchar(50) NOT NULL,
  `state_id` int(6) NOT NULL,
  `district_id` varchar(6) NOT NULL,
  `address` varchar(400) NOT NULL,
  `pincode` int(6) NOT NULL,
  `parent_id` varchar(50) NOT NULL,
  `child_node` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_date` datetime NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(2) NOT NULL DEFAULT 'A',
 UNIQUE KEY `branch_name` (`branch_name`),
  PRIMARY KEY (`id`)
);


--
-- Dumping data for table `branch_location`
--

INSERT INTO `branch_location` (`id`, `branch_name`, `abbrevation`, `department_id`, `state_id`, `district_id`, `address`, `pincode`, `parent_id`, `child_node`, `created_date`, `modified_date`) VALUES
('3EEFF11D-A2D3-11E4-80EF-AC7BA1A4B30B', 'Ranchi Headquarter', 'RNC HQ', 3, 34, '3401', 'Project Building, Dhurwa, Ranchi', 834004, '0', 'Y', '2015-01-19 15:16:58', '2015-01-23 07:41:30'),
('3EF3A77D-A2D3-11E4-80EF-AC7BA1A4B30B', 'Hazaribagh Division', 'HZ DIV', 3, 34, '3416', 'Hazaribagh', 222222, '1', 'Y', '2015-01-19 15:34:09', '2015-01-23 07:41:30'),
('3EF3A887-A2D3-11E4-80EF-AC7BA1A4B30B', 'Koderma Circle Koderma', 'KC HZ', 3, 34, '3418', 'KODERMA', 222222, '10', 'N', '2015-01-19 15:38:22', '2015-01-23 07:41:30'),
('3EF3A8FB-A2D3-11E4-80EF-AC7BA1A4B30B', 'Giridih Circle, Giridih', 'GC HZ', 3, 34, '3419', 'GIRIDIH', 222222, '10', 'N', '2015-01-19 15:39:15', '2015-01-23 07:41:30'),
('3EF3A95D-A2D3-11E4-80EF-AC7BA1A4B30B', 'Hazaribagh Circle Hazaribagh', 'HZC HZ', 3, 34, '3416', 'Hazaribagh', 222222, '10', 'N', '2015-01-19 15:40:35', '2015-01-23 07:41:30'),
('3EF3A9E0-A2D3-11E4-80EF-AC7BA1A4B30B', 'Ramgarh Circle Ramgarh', 'RMC HZ', 3, 34, '3424', 'Ramgarh', 222222, '10', 'N', '2015-01-19 15:41:51', '2015-01-23 07:41:30'),
('3EF3AA42-A2D3-11E4-80EF-AC7BA1A4B30B', 'Tenughat Circle Tenughat', 'TENC HZ', 3, 34, '3420', 'Tenughat, Bokaro', 222222, '10', 'N', '2015-01-19 15:43:34', '2015-01-23 07:41:30'),
('3EF3AAA4-A2D3-11E4-80EF-AC7BA1A4B30B', 'Jamshedpur Division', 'JSR DIV', 3, 34, '3410', 'JAMSHEDPUR', 831001, '1', 'Y', '2015-01-19 15:45:18', '2015-01-23 07:41:30'),
('3EF3AB39-A2D3-11E4-80EF-AC7BA1A4B30B', 'Jamshedpur Circle Jamshedpur', 'JSRC JSR', 3, 34, '3410', 'JAMSHEDPUR', 831001, '16', 'N', '2015-01-19 15:46:18', '2015-01-23 07:41:30'),
('3EF3ABCA-A2D3-11E4-80EF-AC7BA1A4B30B', 'Jamshedpur Urban Circle Jamshedpur', 'JSRUC JSR', 3, 34, '3410', 'JAMSHEDPUR', 831001, '16', 'N', '2015-01-19 15:47:31', '2015-01-23 07:41:30'),
('3EF3AC8E-A2D3-11E4-80EF-AC7BA1A4B30B', 'Singhbhum Circle Jamshedpur', 'SC JSR', 3, 34, '3410', 'JAMSHEDPUR', 831001, '16', 'N', '2015-01-19 15:49:08', '2015-01-23 07:41:30'),
('3EF3AD0C-A2D3-11E4-80EF-AC7BA1A4B30B', 'Ranchi Division', 'RNC DIV', 3, 34, '3401', 'Kachahari, Ranchi', 834001, '1', 'Y', '2015-01-19 15:18:05', '2015-01-23 07:41:30'),
('3EF3AD6E-A2D3-11E4-80EF-AC7BA1A4B30B', 'Adityapur Circle Jamshedpur', 'AC JSR', 3, 34, '3410', 'JAMSHEDPUR', 834001, '16', 'N', '2015-01-19 15:50:04', '2015-01-23 07:41:30'),
('3EF3ADC2-A2D3-11E4-80EF-AC7BA1A4B30B', 'Chaibasha Circle Chaibasha', 'CC JSR', 3, 34, '3408', 'Chaibasha', 832001, '16', 'N', '2015-01-19 15:51:50', '2015-01-23 07:41:30'),
('3EF3AE1F-A2D3-11E4-80EF-AC7BA1A4B30B', 'Dhanbad Division', 'DHN DIV', 3, 34, '3421', 'Dhanbad', 826001, '1', 'Y', '2015-01-19 15:54:15', '2015-01-23 07:41:30'),
('3EF3AE77-A2D3-11E4-80EF-AC7BA1A4B30B', 'Dhanbad Circle Dhanbad', 'DHNC DHN', 3, 34, '3421', 'Dhanbad', 826001, '22', 'N', '2015-01-19 15:55:04', '2015-01-23 07:41:30'),
('3EF3AED5-A2D3-11E4-80EF-AC7BA1A4B30B', 'Dhanbad Urban Circle', 'DHNUC DHN', 3, 34, '3421', 'Dhanbad', 826001, '22', 'N', '2015-01-19 15:55:52', '2015-01-23 07:41:30'),
('3EF3AF29-A2D3-11E4-80EF-AC7BA1A4B30B', 'Chirkunda Circle Chirkunda', 'CHC DHN', 3, 34, '3421', 'Chikunda, Dhanbad', 826001, '22', 'N', '2015-01-19 15:56:46', '2015-01-23 07:41:30'),
('3EF3AF7D-A2D3-11E4-80EF-AC7BA1A4B30B', 'Katras Circle Katras', 'KC DHN', 3, 34, '3421', 'Katras', 826001, '22', 'N', '2015-01-19 15:58:08', '2015-01-23 07:41:30'),
('3EF3AFDA-A2D3-11E4-80EF-AC7BA1A4B30B', 'Jharia Circle Jharia', 'JHC DHN', 3, 34, '3421', 'Jharia', 826001, '22', 'N', '2015-01-19 15:59:26', '2015-01-23 07:41:30'),
('3EF3B02E-A2D3-11E4-80EF-AC7BA1A4B30B', 'Bokaro Circle Bokaro', 'BC DHN', 3, 34, '3420', 'Bokaro Circle Bokaro', 826001, '22', 'N', '2015-01-19 16:00:36', '2015-01-23 07:41:30'),
('3EF3B099-A2D3-11E4-80EF-AC7BA1A4B30B', 'Santhal Pargana Division', 'San Div', 3, 34, '3411', 'Dumka', 222222, '1', 'Y', '2015-01-19 16:14:04', '2015-01-23 07:41:30'),
('3EF3B0F2-A2D3-11E4-80EF-AC7BA1A4B30B', 'Special Circle, Ranchi', 'SPC RNC', 3, 34, '3401', 'Kachahari, Ranchi', 834001, '2', 'N', '2015-01-19 15:19:27', '2015-01-23 07:41:30'),
('3EF3B146-A2D3-11E4-80EF-AC7BA1A4B30B', 'Dumka Circle Dumka', 'DC SAN', 3, 34, '3411', 'Dumka', 834001, '29', 'N', '2015-01-19 16:16:26', '2015-01-23 07:41:30'),
('3EF3B19A-A2D3-11E4-80EF-AC7BA1A4B30B', 'Deoghar Circle Deoghar', 'DEOC SAN', 3, 34, '3422', 'Deoghar', 834001, '29', 'N', '2015-01-19 16:17:25', '2015-01-23 07:41:30'),
('3EF3B1E9-A2D3-11E4-80EF-AC7BA1A4B30B', 'Godda Circle Godda', 'GODC SAN', 3, 34, '3415', 'Godda', 834001, '29', 'N', '2015-01-19 16:18:13', '2015-01-23 07:41:30'),
('3EF3B23D-A2D3-11E4-80EF-AC7BA1A4B30B', 'Pakur Circle Pakur', 'PC SAN', 3, 34, '3414', 'PAKUR', 834001, '29', 'N', '2015-01-19 16:19:27', '2015-01-23 07:41:30'),
('3EF3B291-A2D3-11E4-80EF-AC7BA1A4B30B', 'Sahibganj Circle Sahibganj', 'SAHC SAN', 3, 34, '3413', 'SAHIBGANJ', 834001, '29', 'N', '2015-01-19 16:20:24', '2015-01-23 07:41:30'),
('3EF3B2F8-A2D3-11E4-80EF-AC7BA1A4B30B', 'DEMO1', 'DEMO1', 2, 34, '3401', 'DEMO', 834001, '0', 'Y', '2015-01-19 17:58:48', '2015-01-23 07:41:30'),
('3EF3B350-A2D3-11E4-80EF-AC7BA1A4B30B', 'DEMO2', 'DEMO2', 2, 34, '3401', 'RANCHI', 111111, '35', 'N', '2015-01-19 17:59:26', '2015-01-23 07:41:30'),
('3EF3B3A0-A2D3-11E4-80EF-AC7BA1A4B30B', 'DEMO3', 'DEMO3', 2, 34, '3401', 'Ranchi', 111111, '0', 'N', '2015-01-19 18:00:04', '2015-01-23 07:41:30'),
('3EF3B3F4-A2D3-11E4-80EF-AC7BA1A4B30B', 'DEMOSS', 'DEMOSS', 5, 34, '3401', 'RANCHI', 111111, '0', 'N', '2015-01-19 18:04:47', '2015-01-23 07:41:30'),
('3EF3B443-A2D3-11E4-80EF-AC7BA1A4B30B', 'East Circle, Ranchi', 'EST RNC', 3, 34, '3401', 'Kachahari, Ranchi', 834001, '2', 'N', '2015-01-19 15:25:54', '2015-01-23 07:41:30'),
('3EF3B497-A2D3-11E4-80EF-AC7BA1A4B30B', 'West Circle, Ranchi', 'WST RNC', 3, 34, '3401', 'Kachahari, Ranchi', 834001, '2', 'N', '2015-01-19 15:27:29', '2015-01-23 07:41:30'),
('3EF3B4EB-A2D3-11E4-80EF-AC7BA1A4B30B', 'South Circle, Ranchi', 'SC RNC', 3, 34, '3401', 'Kachahari, Ranchi', 834001, '2', 'N', '2015-01-19 15:28:15', '2015-01-23 07:41:30'),
('3EF3B552-A2D3-11E4-80EF-AC7BA1A4B30B', 'Palamu Circle, Palamu', 'PALC RNC', 3, 34, '3401', 'Daltenganj, Palamu', 111111, '2', 'N', '2015-01-19 15:29:30', '2015-01-23 07:41:30'),
('3EF3B5A6-A2D3-11E4-80EF-AC7BA1A4B30B', 'Gumla Circle Gumla', 'GC RNC', 3, 34, '3403', 'Gumla', 111111, '2', 'N', '2015-01-19 15:30:47', '2015-01-23 07:41:30'),
('3EF3B5FA-A2D3-11E4-80EF-AC7BA1A4B30B', 'Lohardaga Circle Lohardaga', 'LC RNC', 3, 34, '3402', 'Lohardaga', 111111, '2', 'N', '2015-01-19 15:32:15', '2015-01-23 07:41:30'),
('B05AFC6B-A2D7-11E4-80EF-AC7BA1A4B30B', 'DEMO', 'DEMO', 1, 1, '102', 'DEMO', 832456, '0', 'Y', '2015-01-23 13:43:18', '2015-01-23 08:14:03'),
('CB86C477-A2D7-11E4-80EF-AC7BA1A4B30B', 'DE', 'DE', 1, 1, '102', 'DEM', 234567, 'B05AFC6B-A2D7-11E4-80EF-AC7BA1A4B30B', 'N', '2015-01-23 13:44:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--



CREATE TABLE IF NOT EXISTS `districts` (
  `STATE_CODE` varchar(2) DEFAULT NULL,
  `DISTRICT_CODE` varchar(4) NOT NULL,
  `DISTRICT_NAME` varchar(24) DEFAULT NULL,
  `SHORT_NAME` varchar(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`STATE_CODE`, `DISTRICT_CODE`, `DISTRICT_NAME`, `SHORT_NAME`) VALUES
('12', '1221', 'PALWAL', NULL),
('17', '1749', 'SINGRAULI', NULL),
('39', '3901', 'Adilabad', NULL),
('39', '3902', 'KarimnagarÃ‚Â Ã‚Â ', NULL),
('39', '3903', 'WarangalÃ‚Â Ã‚Â Ã‚Â Ã‚Â ', NULL),
('39', '3904', 'KhammamÃ‚Â Ã‚Â Ã‚Â Ã‚Â Ã', NULL),
('39', '3905', 'NalgondaÃ‚Â Ã‚Â Ã‚Â Ã‚Â ', NULL),
('39', '3906', 'Mahaboobnagar', NULL),
('39', '3907', 'MedakÃ‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â', NULL),
('39', '3908', 'NizamabadÃ‚Â Ã‚Â Ã‚Â ', NULL),
('39', '3909', 'HyderabadÃ‚Â Ã‚Â Ã‚Â ', NULL),
('39', '3910', 'RangareddyÃ‚Â Ã‚Â ', NULL),
('36', '3601', 'CENTRAL DELHI', NULL),
('36', '3602', 'NORTH DELHI', NULL),
('36', '3603', 'SOUTH DELHI', NULL),
('36', '3604', 'EAST DELHI', NULL),
('36', '3605', 'NORTH EAST DELHI', NULL),
('36', '3606', 'SOUTH WEST DELHI', NULL),
('36', '3607', 'NEW DELHI', NULL),
('36', '3608', 'NORTH WEST DELHI', NULL),
('36', '3609', 'WEST DELHI', NULL),
('37', '3701', 'CHANDIGARH', NULL),
('01', '0101', 'SOUTH ANDMAN', NULL),
('01', '0102', 'NICOBARS', NULL),
('01', '0103', 'NORTH AND MIDDLE ANDAMAN', NULL),
('02', '0201', 'SRIKAKULAM', NULL),
('02', '0202', 'VIZIANAGARAM', NULL),
('02', '0203', 'VISAKHAPATANAM', NULL),
('02', '0204', 'EAST GODAVARI', NULL),
('02', '0205', 'WEST GODAVARI', NULL),
('02', '0206', 'KRISHNA', NULL),
('02', '0207', 'GUNTUR', NULL),
('02', '0208', 'PRAKASAM', NULL),
('02', '0209', 'NELLORE', NULL),
('02', '0210', 'CHITTOOR', NULL),
('02', '0211', 'CUDDAPAH', NULL),
('02', '0212', 'ANANTAPUR', NULL),
('02', '0213', 'KURNOOL', NULL),
('02', '0214', 'MAHBUBNAGAR', NULL),
('02', '0215', 'RANGAREDDI', NULL),
('02', '0216', 'HYDERABAD', NULL),
('02', '0217', 'MEDAK', NULL),
('02', '0218', 'NIZAMABAD', NULL),
('02', '0219', 'ADILABAD', NULL),
('02', '0220', 'KARIMNAGAR', NULL),
('02', '0221', 'WARANGAL', NULL),
('02', '0222', 'KHAMMAM', NULL),
('02', '0223', 'NALGONDA', NULL),
('03', '0301', 'TAWANG', NULL),
('03', '0302', 'WEST KAMENG', NULL),
('03', '0303', 'EAST KAMENG', NULL),
('03', '0304', 'LOWER SUBANSIRI', NULL),
('03', '0305', 'UPPER SUBANSIRI', NULL),
('03', '0306', 'WEST SIANG', NULL),
('03', '0307', 'EAST SIANG', NULL),
('03', '0309', 'LOHIT', NULL),
('03', '0310', 'CHANGLANG', NULL),
('03', '0311', 'TIRAP', NULL),
('03', '0312', 'PAPUM PARE', NULL),
('03', '0313', 'UPPER SIANG', NULL),
('03', '0314', 'LOWER DIBANG VALLEY', NULL),
('03', '0315', 'UPPER DIBANG VALLEY', NULL),
('03', '0316', 'KURUNG KUMEY', NULL),
('04', '0401', 'DHUBRI', NULL),
('04', '0402', 'KOKRAJHAR', NULL),
('04', '0403', 'BONGAIGAON', NULL),
('04', '0404', 'GOALPARA', NULL),
('04', '0405', 'BARPETA', NULL),
('04', '0406', 'NALBARI', NULL),
('04', '0407', 'KAMRUP', NULL),
('04', '0408', 'DARRANG', NULL),
('04', '0409', 'SONITPUR', NULL),
('04', '0410', 'LAKHIMPUR', NULL),
('04', '0411', 'DHEMAJI', NULL),
('04', '0412', 'MORIGAON', NULL),
('04', '0413', 'NAGAON', NULL),
('04', '0414', 'GOLAGHAT', NULL),
('04', '0415', 'JORHAT', NULL),
('04', '0416', 'SIVASAGAR', NULL),
('04', '0417', 'DIBRUGARH', NULL),
('04', '0418', 'TINSUKIA', NULL),
('04', '0419', 'KARBI ANGLONG', NULL),
('04', '0420', 'NORTH CACHAR HILLS', NULL),
('04', '0421', 'KARIMGANJ', NULL),
('04', '0422', 'HAILAKANDI', NULL),
('04', '0423', 'CACHAR', NULL),
('04', '0424', 'BAKSA', NULL),
('04', '0426', 'KAMRUP METRO', NULL),
('04', '0427', 'Udalguri', NULL),
('05', '0501', 'PATNA', NULL),
('05', '0502', 'NALANDA', NULL),
('05', '0503', 'BHOJPUR', NULL),
('05', '0504', 'ROHTAS', NULL),
('05', '0505', 'AURANAGABAD', NULL),
('05', '0506', 'JEHANABAD', NULL),
('05', '0507', 'GAYA', NULL),
('05', '0508', 'NAWADA', NULL),
('05', '0509', 'SARAN', NULL),
('05', '0510', 'SIWAN', NULL),
('05', '0511', 'GOPALGANJ', NULL),
('05', '0512', 'PASHCHIM CHAMPARAN', NULL),
('05', '0513', 'PURBI CHAMPARAN', NULL),
('05', '0514', 'SITAMARHI', NULL),
('05', '0515', 'MUZAFFARPUR', NULL),
('05', '0516', 'VAISHALI', NULL),
('05', '0517', 'BEGUSARAI', NULL),
('05', '0518', 'SAMASTIPUR', NULL),
('05', '0519', 'DARBHANGA', NULL),
('05', '0520', 'MADHUBANI', NULL),
('05', '0521', 'SAHARSA', NULL),
('05', '0522', 'MADHEPURA', NULL),
('05', '0523', 'PURNIA', NULL),
('05', '0524', 'KATIHAR', NULL),
('05', '0525', 'KHAGARIA', NULL),
('05', '0526', 'MUNGER', NULL),
('05', '0527', 'BHAGALPUR', NULL),
('05', '0541', 'ARARIA', NULL),
('05', '0542', 'KISHANGANJ', NULL),
('05', '0543', 'SHEOHAR', NULL),
('05', '0544', 'SUPAUL', NULL),
('05', '0545', 'BANKA ', NULL),
('05', '0546', 'LAKHISARAI', NULL),
('05', '0547', 'Sheikhpura ', NULL),
('05', '0548', 'BUXAR ', NULL),
('05', '0549', 'KAIMUR (BHABUA)', NULL),
('05', '0550', 'JAMUI', NULL),
('05', '0551', 'ARWAL', NULL),
('06', '0601', 'CHANDIGARH', NULL),
('07', '0701', 'DADRA AND NAGAR HAVELI', NULL),
('08', '0801', 'DAMAN', NULL),
('08', '0802', 'DIU', NULL),
('09', '0902', 'North West', NULL),
('09', '0903', 'North', NULL),
('09', '0904', 'North East', NULL),
('09', '0905', 'East', NULL),
('09', '0906', 'New Delhi', NULL),
('09', '0907', 'Central', NULL),
('09', '0908', 'West', NULL),
('09', '0909', 'South West', NULL),
('09', '0910', 'South', NULL),
('10', '1001', 'NORTH GOA', NULL),
('10', '1002', 'SOUTH GOA', NULL),
('11', '1101', 'JAMNAGAR', NULL),
('11', '1102', 'RAJKOT', NULL),
('11', '1103', 'SURENDRANAGAR', NULL),
('11', '1104', 'BHAVNAGAR', NULL),
('11', '1105', 'AMRELI', NULL),
('11', '1106', 'JUNAGADH', NULL),
('11', '1107', 'KACHCHH', NULL),
('11', '1108', 'BANAS KANTHA', NULL),
('11', '1109', 'SABAR KANTHA', NULL),
('11', '1110', 'MAHESANA', NULL),
('11', '1111', 'GANDHINAGAR', NULL),
('11', '1112', 'AHMADABAD', NULL),
('11', '1113', 'KHEDA', NULL),
('11', '1114', 'PANCH MAHALS', NULL),
('11', '1115', 'VADODARA', NULL),
('11', '1116', 'BHARUCH', NULL),
('11', '1117', 'SURAT', NULL),
('11', '1118', 'VALSAD', NULL),
('11', '1119', 'DANG', NULL),
('11', '1120', 'PATAN', NULL),
('11', '1121', 'PORBANDAR', NULL),
('11', '1122', 'ANAND', NULL),
('11', '1123', 'DOHAD', NULL),
('11', '1124', 'NARMADA', NULL),
('11', '1125', 'NAVSARI  ', NULL),
('12', '1201', 'AMBALA', NULL),
('12', '1202', 'YAMUNANAGAR', NULL),
('12', '1203', 'KURUKSHETRA', NULL),
('12', '1204', 'KAITHAL', NULL),
('12', '1205', 'KARNAL', NULL),
('12', '1206', 'PANIPAT', NULL),
('12', '1207', 'SONIPAT', NULL),
('12', '1208', 'ROHTAK', NULL),
('12', '1209', 'FARIDABAD', NULL),
('12', '1210', 'GURGAON', NULL),
('12', '1211', 'REWARI', NULL),
('12', '1212', 'MAHENDRAGARH', NULL),
('12', '1213', 'BHIWANI', NULL),
('12', '1214', 'JIND', NULL),
('12', '1215', 'HISAR', NULL),
('12', '1216', 'SIRSA', NULL),
('12', '1217', 'PANCHKULA', NULL),
('12', '1218', 'FATEHABAD', NULL),
('12', '1219', 'MEWAT', NULL),
('12', '1220', 'JHAJJAR', NULL),
('13', '1301', 'Bilaspur', NULL),
('13', '1302', 'Chamba', NULL),
('13', '1303', 'Hamirpur', NULL),
('13', '1304', 'Kangra', NULL),
('13', '1305', 'Kinnaur', NULL),
('13', '1306', 'Kullu', NULL),
('13', '1307', 'LAHAUL & SPITI', NULL),
('13', '1308', 'MANDI', NULL),
('13', '1309', 'Shimla', NULL),
('13', '1310', 'Sirmaur', NULL),
('13', '1311', 'SOLAN', NULL),
('13', '1312', 'Una', NULL),
('14', '1401', 'KUPWARA', NULL),
('14', '1402', 'BARAMULLA', NULL),
('14', '1403', 'SRINAGAR', NULL),
('14', '1404', 'BADGAM', NULL),
('14', '1405', 'PULWAMA', NULL),
('14', '1406', 'ANANTNAG', NULL),
('14', '1407', 'LEH (LADAKH)', NULL),
('14', '1408', 'KARGIL', NULL),
('14', '1409', 'DODA', NULL),
('14', '1410', 'UDHAMPUR', NULL),
('14', '1411', 'POONCH', NULL),
('14', '1412', 'RAJAURI', NULL),
('14', '1413', 'JAMMU', NULL),
('14', '1414', 'KATHUA', NULL),
('14', '1415', 'KISHTWAR', NULL),
('14', '1416', 'RAMBAN', NULL),
('14', '1417', 'REASI', NULL),
('14', '1418', 'SAMBA', NULL),
('14', '1419', 'BANDIPORA', NULL),
('14', '1420', 'GANDERWAL', NULL),
('14', '1421', 'KULGAM', NULL),
('14', '1422', 'SHOPIAN', NULL),
('15', '1501', 'BAGALKOTE', NULL),
('15', '1502', 'BANGALORE', NULL),
('15', '1503', 'BANGALORE RURAL', NULL),
('15', '1504', 'BELGAUM', NULL),
('15', '1505', 'BELLARY', NULL),
('15', '1506', 'BIDAR', NULL),
('15', '1507', 'BIJAPUR', NULL),
('15', '1508', 'CHAMARAJA NAGARA', NULL),
('15', '1509', 'CHIKMAGALUR', NULL),
('15', '1510', 'CHITRADURGA', NULL),
('15', '1511', 'DAKSHINA KANNADA', NULL),
('15', '1512', 'DAVANAGERE', NULL),
('15', '1513', 'DHARWAR', NULL),
('15', '1514', 'GADAG', NULL),
('15', '1515', 'GULBARGA', NULL),
('15', '1516', 'HASSAN', NULL),
('15', '1517', 'HAVERI', NULL),
('15', '1518', 'KODAGU', NULL),
('15', '1519', 'KOLAR', NULL),
('15', '1520', 'KOPPAL', NULL),
('15', '1521', 'MANDYA', NULL),
('15', '1522', 'MYSORE', NULL),
('15', '1523', 'RAICHUR', NULL),
('15', '1524', 'SHIMOGA', NULL),
('15', '1525', 'TUMKUR', NULL),
('15', '1526', 'UDUPI', NULL),
('15', '1527', 'UTTARA KANNADA', NULL),
('15', '1528', 'CHIKKABALLAPURA', NULL),
('15', '1529', 'RAMANAGARA', NULL),
('16', '1601', 'KASARGOD', NULL),
('16', '1602', 'KANNUR', NULL),
('16', '1603', 'WAYANAD', NULL),
('16', '1604', 'KOZHIKODE', NULL),
('16', '1605', 'MALAPPURAM', NULL),
('16', '1606', 'PALAKKAD', NULL),
('16', '1607', 'THRISSUR', NULL),
('16', '1608', 'ERNAKULAM', NULL),
('16', '1609', 'IDUKKI', NULL),
('16', '1610', 'KOTTAYAM', NULL),
('16', '1611', 'ALAPPUZHA', NULL),
('16', '1612', 'PATHANAMTHITTA', NULL),
('16', '1613', 'KOLLAM', NULL),
('16', '1614', 'THIRUVANANTHAPURAM', NULL),
('17', '1701', 'MORENA', NULL),
('17', '1702', 'BHIND', NULL),
('17', '1703', 'GWALIOR', NULL),
('17', '1704', 'DATIA', NULL),
('17', '1705', 'SHIVPURI', NULL),
('17', '1706', 'GUNA', NULL),
('17', '1707', 'TIKAMGARH', NULL),
('17', '1708', 'CHHATARPUR', NULL),
('17', '1709', 'PANNA', NULL),
('17', '1710', 'SAGAR', NULL),
('17', '1711', 'DAMOH', NULL),
('17', '1712', 'SATNA', NULL),
('17', '1713', 'REWA', NULL),
('17', '1714', 'SHAHDOL', NULL),
('17', '1715', 'SIDHI', NULL),
('17', '1716', 'MANDSAUR', NULL),
('17', '1717', 'RATLAM', NULL),
('17', '1718', 'UJJAIN', NULL),
('17', '1719', 'SHAJAPUR', NULL),
('17', '1720', 'DEWAS', NULL),
('17', '1721', 'JHABUA', NULL),
('17', '1722', 'DHAR', NULL),
('17', '1723', 'INDORE', NULL),
('17', '1724', 'KHARGONE', NULL),
('17', '1725', 'EAST NIMAR', NULL),
('17', '1726', 'RAJGARH', NULL),
('17', '1727', 'VIDISHA', NULL),
('17', '1728', 'BHOPAL', NULL),
('17', '1729', 'SEHORE', NULL),
('17', '1730', 'RAISEN', NULL),
('17', '1731', 'BETUL', NULL),
('17', '1732', 'HOSHANGABAD', NULL),
('17', '1733', 'JABALPUR', NULL),
('17', '1734', 'NARSINGHPUR', NULL),
('17', '1735', 'MANDLA', NULL),
('17', '1736', 'CHHINDWARA', NULL),
('17', '1737', 'SEONI', NULL),
('17', '1738', 'BALAGHAT', NULL),
('17', '1739', 'SHEOPUR', NULL),
('17', '1740', 'UMARIA', NULL),
('17', '1741', 'NEEMUCH', NULL),
('17', '1742', 'BARWANI', NULL),
('17', '1743', 'HARDA ', NULL),
('17', '1744', 'KATNI ', NULL),
('17', '1745', 'DINDORI', NULL),
('17', '1746', 'ANUPPUR', NULL),
('17', '1747', 'BURHANPUR', NULL),
('17', '1748', 'ASHOK NAGAR', NULL),
('18', '1801', 'MUMBAI', NULL),
('18', '1802', 'THANE', NULL),
('18', '1803', 'RAIGAD', NULL),
('18', '1804', 'RATNAGIRI', NULL),
('18', '1805', 'SINDHUDURG', NULL),
('18', '1806', 'NASHIK', NULL),
('18', '1807', 'DHULE', NULL),
('18', '1808', 'JALGAON', NULL),
('18', '1809', 'AHMEDNAGAR', NULL),
('18', '1810', 'PUNE', NULL),
('18', '1811', 'SATARA', NULL),
('18', '1812', 'SANGLI', NULL),
('18', '1813', 'SOLAPUR', NULL),
('18', '1814', 'KOLHAPUR', NULL),
('18', '1815', 'AURANGABAD', NULL),
('18', '1816', 'JALNA', NULL),
('18', '1817', 'PARBHANI', NULL),
('18', '1818', 'BEED', NULL),
('18', '1819', 'NANDED', NULL),
('18', '1820', 'OSMANABAD', NULL),
('18', '1821', 'LATUR', NULL),
('18', '1822', 'BULDHANA', NULL),
('18', '1823', 'AKOLA', NULL),
('18', '1824', 'AMRAVATI', NULL),
('18', '1825', 'YAVATMAL', NULL),
('18', '1826', 'WARDHA', NULL),
('18', '1827', 'NAGPUR', NULL),
('18', '1828', 'BHANDARA', NULL),
('18', '1829', 'CHANDRAPUR', NULL),
('18', '1830', 'GADCHIROLI', NULL),
('18', '1831', 'NANDURBAR', NULL),
('18', '1832', 'WASHIM ', NULL),
('18', '1833', 'GONDIA', NULL),
('18', '1834', 'HINGOLI', NULL),
('18', '1835', 'MUMBAI (SUBURBAN)', NULL),
('19', '1901', 'LAKSHADWEEP DISTRICT', NULL),
('20', '2001', 'SENAPATI', NULL),
('20', '2002', 'TAMENGLONG', NULL),
('20', '2003', 'CHURACHANDPUR', NULL),
('20', '2004', 'CHANDEL', NULL),
('20', '2005', 'THOUBAL', NULL),
('20', '2006', 'BISHNUPUR', NULL),
('20', '2007', 'IMPHAL WEST', NULL),
('20', '2008', 'UKHRUL', NULL),
('20', '2009', 'IMPHAL EAST', NULL),
('21', '2101', 'JAINTIA HILLS', NULL),
('21', '2102', 'EAST KHASI HILLS', NULL),
('21', '2103', 'WEST KHASI HILLS', NULL),
('21', '2104', 'EAST GARO HILLS', NULL),
('21', '2105', 'WEST GARO HILLS', NULL),
('21', '2106', 'SOUTH GARO HILLS', NULL),
('21', '2107', 'RI BHOI  ', NULL),
('22', '2201', 'AIZAWL', NULL),
('22', '2202', 'LUNGLEI', NULL),
('22', '2203', 'SAIHA', NULL),
('22', '2204', 'MAMIT', NULL),
('22', '2205', 'KOLASIB', NULL),
('22', '2206', 'CHAMPHAI ', NULL),
('22', '2207', 'SERCHHIP', NULL),
('22', '2208', 'LAWNGTLAI', NULL),
('23', '2301', 'KOHIMA', NULL),
('23', '2302', 'PHEK', NULL),
('23', '2303', 'ZUNHEBOTO', NULL),
('23', '2304', 'WOKHA', NULL),
('23', '2305', 'MOKOKCHUNG', NULL),
('23', '2306', 'TUENSANG', NULL),
('23', '2307', 'MON', NULL),
('23', '2308', 'Dimapur', NULL),
('24', '2401', 'SAMBALPUR', NULL),
('24', '2402', 'SUNDARGARH', NULL),
('24', '2403', 'KENDUJHAR', NULL),
('24', '2404', 'MAYURBHANJ', NULL),
('24', '2405', 'BALESHWAR', NULL),
('24', '2406', 'CUTTACK', NULL),
('24', '2407', 'DHENKANAL', NULL),
('24', '2408', 'KANDHAMAL', NULL),
('24', '2409', 'BOLANGIR', NULL),
('24', '2410', 'KALAHANDI', NULL),
('24', '2411', 'KORAPUT', NULL),
('24', '2412', 'GANJAM', NULL),
('24', '2413', 'PURI', NULL),
('24', '2414', 'BARGARH  ', NULL),
('24', '2415', 'JHARSUGUDA', NULL),
('24', '2416', 'DEOGARH', NULL),
('24', '2417', 'BHADRAK  ', NULL),
('24', '2418', 'KENDRAPARA', NULL),
('24', '2419', 'JAGATSINGHAPUR', NULL),
('24', '2420', 'JAJPUR', NULL),
('24', '2421', 'ANGUL', NULL),
('24', '2422', 'NAYAGARH', NULL),
('24', '2423', 'KHORDHA(BHUBANESWAR)', NULL),
('24', '2424', 'GAJAPATI', NULL),
('24', '2426', 'BOUDH', NULL),
('24', '2427', 'SONEPUR', NULL),
('24', '2428', 'NUAPADA', NULL),
('24', '2429', 'RAYAGADA', NULL),
('24', '2430', 'NABARANGAPUR', NULL),
('24', '2431', 'MALKANGIRI', NULL),
('25', '2501', 'PONDICHERRY', NULL),
('25', '2502', 'KARAIKAL', NULL),
('25', '2503', 'MAHE', NULL),
('25', '2504', 'YANAM', NULL),
('26', '2601', 'GURDASPUR', NULL),
('26', '2602', 'AMRITSAR', NULL),
('26', '2603', 'FIROZEPUR', NULL),
('26', '2604', 'LUDHIANA', NULL),
('26', '2605', 'JALANDHAR', NULL),
('26', '2606', 'KAPURTHALA', NULL),
('26', '2607', 'HOSHIARPUR', NULL),
('26', '2608', 'RUPNAGAR', NULL),
('26', '2609', 'PATIALA', NULL),
('26', '2610', 'Sangrur', NULL),
('26', '2611', 'Bathinda', NULL),
('26', '2612', 'Faridkot', NULL),
('26', '2614', 'NAWANSHAHR ', NULL),
('26', '2615', 'MOGA', NULL),
('26', '2616', 'MUKTSAR *', NULL),
('26', '2617', 'MANSA', NULL),
('26', '2618', 'FATEHGARH SAHIB', NULL),
('26', '2619', 'SAS NAGAR', NULL),
('26', '2620', 'TARAN TARAN', NULL),
('26', '2621', 'BARNALA', NULL),
('27', '2701', 'Ajmer', NULL),
('27', '2702', 'Alwar', NULL),
('27', '2703', 'Baran', NULL),
('27', '2704', 'Bharatpur', NULL),
('27', '2705', 'Bhilwara', NULL),
('27', '2706', 'Bikaner', NULL),
('27', '2707', 'Bundi', NULL),
('27', '2708', 'Churu', NULL),
('27', '2709', 'KARAULI', NULL),
('27', '2710', 'SAWAI MADHOPUR', NULL),
('27', '2711', 'Dausa', NULL),
('27', '2712', 'Dholpur', NULL),
('27', '2713', 'Hanumangarh', NULL),
('27', '2714', 'Jaipur', NULL),
('27', '2715', 'Jhunjhunu', NULL),
('27', '2716', 'JAISALMER', NULL),
('27', '2717', 'BARMER', NULL),
('27', '2718', 'JALORE', NULL),
('27', '2719', 'SIROHI', NULL),
('27', '2720', 'Jodhpur', NULL),
('27', '2721', 'Kota', NULL),
('27', '2722', 'TONK', NULL),
('27', '2723', 'Nagaur', NULL),
('27', '2724', 'Pali', NULL),
('27', '2725', 'Pratapgarh', NULL),
('27', '2726', 'UDAIPUR', NULL),
('27', '2727', 'DUNGARPUR', NULL),
('27', '2728', 'BANSWARA', NULL),
('27', '2729', 'CHITTORGARH', NULL),
('27', '2730', 'Rajsamand', NULL),
('27', '2731', 'Sikar', NULL),
('27', '2732', 'JHALAWAR', NULL),
('28', '2801', 'NORTH DISTRICT', NULL),
('28', '2802', 'EAST DISTRICT', NULL),
('28', '2803', 'SOUTH DISTRICT', NULL),
('28', '2804', 'WEST DISTRICT', NULL),
('29', '2901', 'KANCHIPURAM', NULL),
('29', '2902', 'TIRUVALLUR', NULL),
('29', '2903', 'CUDDALORE', NULL),
('29', '2904', 'VILLUPURAM', NULL),
('29', '2905', 'VELLORE', NULL),
('29', '2906', 'TIRUVANNAMALAI', NULL),
('29', '2907', 'SALEM', NULL),
('29', '2908', 'NAMAKKAL', NULL),
('29', '2909', 'DHARMAPURI', NULL),
('29', '2910', 'ERODE', NULL),
('29', '2911', 'COIMBATORE', NULL),
('29', '2912', 'THE NILGIRIS', NULL),
('29', '2913', 'THANJAVUR', NULL),
('29', '2914', 'NAGAPATTINAM', NULL),
('29', '2915', 'TIRUVARUR', NULL),
('29', '2916', 'TIRUCHIRAPPALLI', NULL),
('29', '2917', 'KARUR', NULL),
('29', '2918', 'PERAMBALUR', NULL),
('29', '2919', 'PUDUKKOTTAI', NULL),
('29', '2920', 'MADURAI', NULL),
('29', '2921', 'THENI', NULL),
('29', '2922', 'DINDIGUL', NULL),
('29', '2923', 'RAMANATHAPURAM', NULL),
('29', '2924', 'VIRUDHUNAGAR', NULL),
('29', '2925', 'SIVAGANGAI', NULL),
('29', '2926', 'TIRUNELVELI', NULL),
('29', '2927', 'THOOTHUKKUDI', NULL),
('29', '2928', 'KANNIYAKUMARI', NULL),
('29', '2930', 'KRISHNAGIRI', NULL),
('29', '2931', 'ARIYALUR', NULL),
('30', '3001', 'WEST TRIPURA', NULL),
('30', '3002', 'SOUTH TRIPURA', NULL),
('30', '3003', 'SOUTH TRIPURA', NULL),
('30', '3004', 'DHALAI', NULL),
('31', '3109', 'BIJNOR', NULL),
('31', '3110', 'MORADABAD', NULL),
('31', '3111', 'RAMPUR', NULL),
('31', '3112', 'SAHARANPUR', NULL),
('31', '3114', 'MUZAFFARNAGAR', NULL),
('31', '3115', 'MEERUT', NULL),
('31', '3116', 'GHAZIABAD', NULL),
('31', '3117', 'BULANDSHAHR', NULL),
('31', '3118', 'ALIGARH', NULL),
('31', '3119', 'MATHURA', NULL),
('31', '3120', 'AGRA', NULL),
('31', '3121', 'FIROZABAD', NULL),
('31', '3122', 'ETAH', NULL),
('31', '3123', 'MAINPURI', NULL),
('31', '3124', 'BUDAUN', NULL),
('31', '3125', 'BAREILLY', NULL),
('31', '3126', 'PILIBHIT', NULL),
('31', '3127', 'SHAHJAHANPUR', NULL),
('31', '3128', 'KHERI', NULL),
('31', '3129', 'SITAPUR', NULL),
('31', '3130', 'HARDOI', NULL),
('31', '3131', 'UNNAO', NULL),
('31', '3132', 'LUCKNOW', NULL),
('31', '3133', 'RAE BARELI', NULL),
('31', '3134', 'FARRUKHABAD', NULL),
('31', '3135', 'ETAWAH', NULL),
('31', '3136', 'KANPUR DEHAT', NULL),
('31', '3137', 'KANPUR NAGAR', NULL),
('31', '3138', 'JALAUN', NULL),
('31', '3139', 'JHANSI', NULL),
('31', '3140', 'LALITPUR', NULL),
('31', '3141', 'HAMIRPUR', NULL),
('31', '3142', 'BANDA', NULL),
('31', '3143', 'FATEHPUR', NULL),
('31', '3144', 'PRATAPGARH', NULL),
('31', '3145', 'ALLAHABAD', NULL),
('31', '3146', 'BAHRAICH', NULL),
('31', '3147', 'GONDA', NULL),
('31', '3148', 'BARABANKI', NULL),
('31', '3149', 'FAIZABAD', NULL),
('31', '3150', 'SULTANPUR', NULL),
('31', '3151', 'SIDDHARTH NAGAR', NULL),
('31', '3152', 'MAHARAJGANJ', NULL),
('31', '3153', 'BASTI', NULL),
('31', '3154', 'GORAKHPUR', NULL),
('31', '3155', 'DEORIA', NULL),
('31', '3156', 'MAU', NULL),
('31', '3157', 'AZAMGARH', NULL),
('31', '3158', 'JAUNPUR', NULL),
('31', '3159', 'BALLIA', NULL),
('31', '3160', 'GHAZIPUR', NULL),
('31', '3161', 'VARANASI', NULL),
('31', '3162', 'MIRZAPUR', NULL),
('31', '3163', 'SONBHADRA', NULL),
('31', '3164', 'GAUTAM BUDDHA NAGAR', NULL),
('31', '3165', 'BAGHPAT', NULL),
('31', '3166', 'MAHAMAYA NAGAR', NULL),
('31', '3167', 'JYOTIBA PHOOLE NAGAR', NULL),
('31', '3168', 'KANNAUJ', NULL),
('31', '3169', 'AURAIYA', NULL),
('31', '3170', 'KAUSHAMBI', NULL),
('31', '3171', 'CHANDAULI', NULL),
('31', '3172', 'KUSHI NAGAR', NULL),
('31', '3173', 'SANT RAVIDAS NAGAR', NULL),
('31', '3174', 'SANT KABEER NAGAR', NULL),
('31', '3175', 'BALRAMPUR', NULL),
('31', '3176', 'SHRAVASTI', NULL),
('31', '3177', 'CHITRAKOOT', NULL),
('31', '3178', 'AMBEDKAR NAGAR', NULL),
('31', '3179', 'MAHOBA', NULL),
('32', '3201', 'NADIA', NULL),
('32', '3202', 'BURDWAN', NULL),
('32', '3203', 'BIRBHUM', NULL),
('32', '3204', 'DARJEELING', NULL),
('32', '3205', 'HOWRAH', NULL),
('32', '3206', 'HOOGHLY', NULL),
('32', '3207', 'JALPAIGURI', NULL),
('32', '3208', 'COOCHBEHAR', NULL),
('32', '3209', 'MALDAH', NULL),
('32', '3210', 'PASCHIM MEDINIPUR', NULL),
('32', '3211', 'PURBA MEDINIPUR', NULL),
('32', '3212', 'MURSHIDABAD', NULL),
('32', '3213', 'BANKURA', NULL),
('32', '3214', 'PURULIA', NULL),
('32', '3215', '24 PARGANAS (NORTH)', NULL),
('32', '3216', '24 PARGANAS SOUTH', NULL),
('32', '3217', 'DINAJPUR DAKSHIN', NULL),
('32', '3218', 'DINAJPUR UTTAR', NULL),
('33', '3301', 'BILASPUR', NULL),
('33', '3302', 'KAWARDHA', NULL),
('33', '3303', 'DURG', NULL),
('33', '3304', 'RAJNANDAGON', NULL),
('33', '3305', 'SURGUJA', NULL),
('33', '3306', 'KOREA', NULL),
('33', '3307', 'JASHPUR', NULL),
('33', '3308', 'KORBA', NULL),
('33', '3309', 'DHAMTARI', NULL),
('33', '3310', 'KANKER', NULL),
('33', '3311', 'BASTAR', NULL),
('33', '3312', 'DANTEWADA', NULL),
('33', '3313', 'RAIGARH', NULL),
('33', '3314', 'JANJGIR-CHAMPA', NULL),
('33', '3315', 'MAHASAMUND', NULL),
('33', '3316', 'RAIPUR', NULL),
('34', '3401', 'RANCHI', NULL),
('34', '3402', 'LOHARDAGA', NULL),
('34', '3403', 'GUMLA', NULL),
('34', '3404', 'SIMDEGA', NULL),
('34', '3405', 'PALAMU', NULL),
('34', '3406', 'LATEHAR', NULL),
('34', '3407', 'GARHWA', NULL),
('34', '3408', 'WEST SINGHBHUM', NULL),
('34', '3409', 'SARAIKELA KHARSAWAN', NULL),
('34', '3410', 'EAST SINGHBHUM', NULL),
('34', '3411', 'DUMKA', NULL),
('34', '3412', 'JAMTARA', NULL),
('34', '3413', 'SAHEBGANJ', NULL),
('34', '3414', 'PAKUR', NULL),
('34', '3415', 'GODDA', NULL),
('34', '3416', 'HAZARIBAGH', NULL),
('34', '3417', 'CHATRA', NULL),
('34', '3418', 'KODERMA', NULL),
('34', '3419', 'GIRIDIH', NULL),
('34', '3420', 'BOKARO', NULL),
('34', '3421', 'DHANBAD', NULL),
('34', '3422', 'DEOGHAR', NULL),
('35', '3501', 'UTTAR KASHI', NULL),
('35', '3502', 'DEHRADUN', NULL),
('35', '3503', 'HARIDWAR', NULL),
('35', '3504', 'CHAMOLI', NULL),
('35', '3505', 'PAURI GARHWAL', NULL),
('35', '3506', 'RUDRA PRAYAG', NULL),
('35', '3507', 'ALMORA', NULL),
('35', '3508', 'NAINITAL', NULL),
('35', '3509', 'UDAM SINGH NAGAR', NULL),
('35', '3510', 'CHAMPAWAT', NULL),
('35', '3511', 'PITHORAGARH', NULL),
('35', '3512', 'BAGESHWAR', NULL),
('35', '3513', 'TEHRI GARHWAL', NULL),
('29', '2932', 'TIRUPUR', NULL),
('29', '2933', 'CHENNAI', NULL),
('34', '3423', 'KHUNTI', NULL),
('34', '3424', 'RAMGARH', NULL),
('26', '2622', 'Mohali', NULL),
('32', '3219', 'Kolkata', NULL),
('38', '3801', 'Almora', NULL),
('38', '3802', 'Bageshwar', NULL),
('38', '3803', 'Chamoli', NULL),
('38', '3804', 'Champawat', NULL),
('38', '3805', 'Dehradun', NULL),
('38', '3806', 'Haridwar', NULL),
('38', '3807', 'Nainital', NULL),
('38', '3808', 'Pauri Garhwal', NULL),
('38', '3809', 'Pithoragarh', NULL),
('38', '3810', 'Rudra Prayag', NULL),
('38', '3811', 'Tehri Garhwal', NULL),
('38', '3812', 'Udham Singh Nagar', NULL),
('38', '3813', 'Uttarkashi', NULL),
('27', '2733', 'Sri Ganganagar', NULL),
('#', '#', 'OUTSIDE INDIA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `echallan_tax_purposes`
--


CREATE TABLE IF NOT EXISTS `echallan_tax_purposes` (
  `DEPT_ID` varchar(50) DEFAULT NULL,
  `TAX_PURPOSE` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `TAX_PURPOSE_ID` varchar(50) NOT NULL,
  `STATUS` varchar(4) NOT NULL DEFAULT 'A',
  `ISFIXED` varchar(2) DEFAULT NULL,
  `FIXAMOUNT` decimal(18,2) DEFAULT NULL,
  `TREASURY_HEAD_CODE` varchar(30) DEFAULT NULL,
  `TAX_PURPOSE_CODE` varchar(4) DEFAULT NULL,
  `MAJOR_TAX` varchar(200) DEFAULT NULL,
  `MAJOR_TAX_ID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`TAX_PURPOSE_ID`),
  UNIQUE KEY `DEPT_ID` (`DEPT_ID`,`TAX_PURPOSE`,`MAJOR_TAX`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Dumping data for table `echallan_tax_purposes`
--

INSERT INTO `echallan_tax_purposes` (`DEPT_ID`, `TAX_PURPOSE`, `DESCRIPTION`, `TAX_PURPOSE_ID`, `STATUS`, `ISFIXED`, `FIXAMOUNT`, `TREASURY_HEAD_CODE`, `TAX_PURPOSE_CODE`, `MAJOR_TAX`, `MAJOR_TAX_ID`) VALUES
('10', 'CAR TAXI-TRANSFER', 'CTT', '259', 'A', 'Y', '150.00', '004100101010101', 'CTT', 'Vehicles', '34'),
('10', 'CAR TAXI-TEMPORARY REGISTRATION', 'TTR', '261', 'A', 'Y', '100.00', '004100101010101', 'TTR', 'Vehicles', '34'),
('11', 'WITHOUT DRIVING LICENCE-THREE & FOUR WHEELER', 'WDLF', '205', 'A', 'Y', '450.00', '004100101010101', 'WDLF', 'Traffic Challan', '30'),
('10', 'ISSUE OF LEARNERS LICENCE-TWO WHEELER', 'LLT', '206', 'A', 'Y', '130.00', '004100101010101', 'LLT', 'Driving Licence', '31'),
('3', 'ADMITTED TAX', 'VAT', '208', 'A', 'N', '0.00', '004000102010101', 'VAT', 'Value Added Tax Regular', '32'),
('2', 'OTHER FEE', 'Country Fermented Liquor (Other Fee)', '133', 'A', 'N', '0.00', '003900102030101', NULL, 'Country Fermented Liquor', '3'),
('2', 'FINES AND CONFISCATION', 'Fines And Confiscation', '134', 'A', 'N', '0.00', '003900150020101', NULL, 'Fines And Confiscations', '5'),
('2', 'OTHERS', 'Other Receipts (Others)', '142', 'A', 'N', '0.00', '003900800030101', NULL, 'Other Receipts', '8'),
('1', 'PRELIMINARY EXPENSES', 'Jharkhand preliminary Expenses 2004', '156', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Minor Mineral Concession 2004', '18'),
('1', 'RENEWAL OF MINING LEASE', 'Renewal Of Mining Lease 2004', '158', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Minor Mineral Concession 2004', '18'),
('1', 'STOCKIST LICENCE', 'Stockist Licence 2004', '160', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Minor Mineral Concession 2004', '18'),
('3', 'ADVANCED TAX', 'JST', '185', 'A', 'N', '0.00', '004000102010101', NULL, 'Jharkhand Sales Tax', '26'),
('3', 'ADVANCED TAX', 'PT', '188', 'A', 'N', '0.00', '002800107010101', NULL, 'Professional Tax', '27'),
('3', 'ADVANCED TAX', 'VAT', '210', 'A', 'N', '0.00', '004000102010101', 'VAT', 'Value Added Tax Regular', '32'),
('3', 'ASSESSED TAX', 'CST', '212', 'A', 'N', '0.00', '004000101010101', 'CST', 'Central Sales Tax', '33'),
('10', 'ISSUE OF DUPLICATE LEARNERS LICENCE-TWO WHEELER', 'DLTW', '214', 'A', 'Y', '30.00', '004100101010101', 'DLTW', 'Driving Licence', '31'),
('10', 'ISSUE OF DUPLICATE DRIVING LICENCE-FOUR WHEELER', 'DDLF', '221', 'A', 'Y', '350.00', '004100101010101', 'DDLF', 'Driving Licence', '31'),
('10', 'REPLACEMENT OF PHOTO IN PERMANENT DRIVING LICENCE', 'RPPD', '227', 'A', 'Y', '60.00', '004100101010101', 'RPPD', 'Driving Licence', '31'),
('11', 'UNAUTHORIZED PARKING -TWO WHEELER', 'UP', '199', 'A', 'Y', '20.00', '004100101010101', 'UP', 'Traffic Challan', '30'),
('11', 'UNAUTHORIZED PARKING -THREE WHEELER', 'UPT', '200', 'A', 'Y', '30.00', '004100101010101', 'UPT', 'Traffic Challan', '30'),
('10', 'CAR TAXI-DUPLICATE REGISTRATION', 'CDR', '258', 'A', 'Y', '60.00', '004100101010101', 'CDR', 'Vehicles', '34'),
('11', 'OTHERS', 'TCO', '262', 'A', 'N', '0.00', '004100101010101', 'TCO', 'Traffic Challan', '30'),
('10', 'CRANNE-RENEWAL OF TEMPORARY REGISTRATION', 'CRTR', '271', 'A', 'Y', '300.00', '004100101010101', 'CRTR', 'Vehicles', '34'),
('10', 'CRANNE-DUPLICATE REGISTRATION', 'CD', '273', 'A', 'Y', '300.00', '004100101010101', 'CD', 'Vehicles', '34'),
('10', 'CRANNE-TEMPORARY REGISTRATION', 'CTR', '275', 'A', 'Y', '120.00', '004100101010101', 'CTR', 'Vehicles', '34'),
('10', 'ISSUE OF NEW DRIVING LICENCE-TWO WHEELER', 'NDL', '218', 'A', 'Y', '200.00', '004100101010101', 'NDL', 'Driving Licence', '31'),
('10', 'DRIVING LICENCE TEST', 'DLT', '224', 'A', 'Y', '300.00', '004100101010101', 'DLT', 'Driving Licence', '31'),
('2', 'LICENCE FEE', 'Opium Hemp And Other Drugs(Licence Fee)', '139', 'A', 'N', '0.00', '003900108010202', NULL, 'Opium, Hemp And Other Drugs', '7'),
('2', 'EXPENDITURE ON CHOA CONTROL', 'Expenditure On Choa Control', '140', 'A', 'N', '0.00', '003900800010101', NULL, 'Other Receipts', '8'),
('1', 'REVISION', 'Revision 2007', '165', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Mineral Dealer 2007', '19'),
('10', 'CHANGE OF NAME IN PERMANENT DRIVING LICENCE', 'NPDL', '226', 'A', 'Y', '10.00', '004100101010101', 'NPDL', 'Driving Licence', '31'),
('10', 'AC BUS-RE-ASSIGNMENT ', 'ABRA', '235', 'A', 'Y', '600.00', '004100101010101', 'ABRA', 'Vehicles', '34'),
('10', 'AMBULANCE-RE-ASSIGNMENT', 'ARA', '237', 'A', 'Y', '300.00', '004100101010101', 'ARA', 'Vehicles', '34'),
('11', 'WITHOUT DRIVING LICENCE-TWO WHEELER', 'WDLT', '204', 'A', 'Y', '50.00', '004100101010101', 'WDLT', 'Traffic Challan', '30'),
('10', 'AMBULANCE-REGISTRATION', 'AR', '239', 'A', 'Y', '300.00', '004100101010101', 'AR', 'Vehicles', '34'),
('10', 'AMBULANCE-DUPLICATE REGISTRATION', 'DR', '240', 'A', 'Y', '60.00', '004100101010101', 'DR', 'Vehicles', '34'),
('10', 'BUS-TEMPORARY REGISTRATION', 'BTR', '249', 'A', 'Y', '120.00', '004100101010101', 'BTR', 'Vehicles', '34'),
('10', 'BUS-REGISTRATION', 'BR', '251', 'A', 'Y', '600.00', '004100101010101', 'BR', 'Vehicles', '34'),
('10', 'BUS-TRANSFER', 'BT', '253', 'A', 'Y', '300.00', '004100101010101', 'BT', 'Vehicles', '34'),
('10', 'CONCRETE MIXTURE-RENEWAL OF TEMPORARY REGISTRATION', 'CMTR', '264', 'A', 'Y', '300.00', '004100101010101', 'CMTR', 'Vehicles', '34'),
('10', 'CAR TAXI-RE-ASSIGNMENT', 'CTRA', '260', 'A', 'Y', '300.00', '004100101010101', 'CTRA', 'Vehicles', '34'),
('10', 'CONCRETE MIXTURE-DUPLICATE REGISTRATION', 'CMDR', '266', 'A', 'Y', '300.00', '004100101010101', 'CMDR', 'Vehicles', '34'),
('10', 'CONCRETE MIXTURE-RE-ASSIGNMENT', 'CMA', '268', 'A', 'Y', '600.00', '004100101010101', 'CMA', 'Vehicles', '34'),
('10', 'CRANNE-RE-ASSIGNMENT', 'CRA', '270', 'A', 'Y', '600.00', '004100101010101', 'CRA', 'Vehicles', '34'),
('10', 'CRANNE-REGISTRATION', 'CR', '272', 'A', 'Y', '600.00', '004100101010101', 'CR', 'Vehicles', '34'),
('10', 'CRANNE-TRANSFER', 'CT', '274', 'A', 'Y', '300.00', '004100101010101', 'CT', 'Vehicles', '34'),
('10', 'CASH VAN-TEMPORARY REGISTRATION', 'CVTR', '276', 'A', 'Y', '120.00', '004100101010101', 'CVTR', 'Vehicles', '34'),
('10', 'DOUBLE DECKER BUS-TEMPORARY REGISTRATION', 'DDTR', '277', 'A', 'Y', '300.00', '004100101010101', 'DDTR', 'Vehicles', '34'),
('3', 'ADMITTED TAX', 'CST', '211', 'A', 'N', '0.00', '004000101010101', 'CST', 'Central Sales Tax', '33'),
('3', 'ADVANCED TAX', 'CST', '213', 'A', 'N', '0.00', '004000101010101', 'CST', 'Central Sales Tax', '33'),
('9', 'SALE OF STAMPS(NON COURT PRINTED STAMP)', 'Sale Of Stamps(Non court Printed stamp)', '193', 'A', 'N', '0.00', '003002102040101', NULL, 'Stamp', '28'),
('9', 'OTHER RECEIPT', 'Registration fees-Other Receipts', '194', 'A', 'N', '0.00', '003003800010101', NULL, 'Registration Fees', '29'),
('2', 'DUTY FEE', 'Duty Fee', '126', 'A', 'N', '0.00', '003900105030101', NULL, 'Foreign Liquor And Spirits(IMFL)', '1'),
('2', 'OTHER FEE', 'Medicianl and Toliet Preparations(Other Fee)', '138', 'I', 'N', '0.00', '003900107010101', NULL, 'Medicinal And Toilet Preparations', '6'),
('2', 'DEDUCT REFUNDS', 'Deduct Refunds', '143', 'A', 'N', '0.00', '003900900010101', NULL, 'Refund', '9'),
('1', 'PROSPECTING LICENCE', 'Mining Prospecting Licence', '151', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Mineral Concession 1960', '17'),
('1', 'SECURITY DEPOSIT', 'Security Deposit', '153', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Mineral Concession 1960', '17'),
('3', 'ADVANCED TAX', 'LT', '179', 'A', 'N', '0.00', '004500105010101', NULL, 'Luxury Tax', '24'),
('3', 'ASSESSED TAX', 'LT', '180', 'A', 'N', '0.00', '004500105010101', NULL, 'Luxury Tax', '24'),
('3', 'ADMITTED TAX', 'ED', '181', 'A', 'N', '0.00', '004300101010101', NULL, 'Electricity Duty', '25'),
('3', 'ADVANCED TAX', 'ED', '182', 'A', 'N', '0.00', '004300101010101', NULL, 'Electricity Duty', '25'),
('3', 'ASSESSED TAX', 'ED', '183', 'A', 'N', '0.00', '004300101010101', NULL, 'Electricity Duty', '25'),
('3', 'ADMITTED TAX', 'JST', '184', 'A', 'N', '0.00', '004000102010101', NULL, 'Jharkhand Sales Tax', '26'),
('3', 'ASSESSED TAX', 'JST', '186', 'A', 'N', '0.00', '004000102010101', NULL, 'Jharkhand Sales Tax', '26'),
('3', 'ADMITTED TAX', 'PT', '187', 'A', 'N', '0.00', '002800107010101', NULL, 'Professional Tax', '27'),
('3', 'ASSESSED TAX', 'PT', '189', 'A', 'N', '0.00', '002800107010101', NULL, 'Professional Tax', '27'),
('9', 'OTHER RECEIPT -JUDICIAL STAMP', 'Stamp-Other Receipt', '191', 'A', 'N', '0.00', '003001800010101', NULL, 'Stamp', '28'),
('9', 'ADDITIONAL  FEES OF  STAMPS', 'Additional  Fees of  Stamps', '195', 'A', 'N', '0.00', '003002102060101', NULL, 'Stamp', '28'),
('9', 'SARNARTHY SURCHARGE', 'Sale Of Stamps(Sarnarthy Surcharge)', '196', 'A', 'N', '0.00', '003002102050101', NULL, 'Stamp', '28'),
('10', 'ISSUE OF DUPLICATE LEARNERS LICENCE-FOUR WHEELER', 'DLTF', '215', 'A', 'Y', '30.00', '004100101010101', 'DLTF', 'Driving Licence', '31'),
('10', 'RENEWAL OF LEARNERS LICENCE-TWO WHEELER', 'RLLT', '216', 'A', 'Y', '30.00', '004100101010101', 'RLLT', 'Driving Licence', '31'),
('10', 'ISSUE OF DUPLICATE DRIVING LICENCE-TWO WHEELER', 'DDLT', '220', 'A', 'Y', '350.00', '004100101010101', 'DDLT', 'Driving Licence', '31'),
('10', 'RENEWAL OF DRIVING LICENCE-TWO WHEELER', 'RDLT', '222', 'A', 'Y', '250.00', '004100101010101', 'RDLT', 'Driving Licence', '31'),
('10', 'ADDITION OF NEW CLASS OF VEHICLE TO DRIVING LICENCE', 'NCV', '228', 'A', 'Y', '200.00', '004100101010101', 'NCV', 'Driving Licence', '31'),
('10', 'CHANGE OF ADDRESS WITHIN REGION -DRIVING LICENCE', 'COAD', '229', 'A', 'Y', '50.00', '004100101010101', 'COAD', 'Driving Licence', '31'),
('10', 'CHANGE OF ADDRESS WITHIN REGION -LEARNERS LICENCE', 'COAL', '230', 'A', 'Y', '15.00', '004100101010101', 'COAL', 'Driving Licence', '31'),
('11', 'UNAUTHORIZED PARKING-SECOND CRIME', 'UPSC', '202', 'A', 'Y', '270.00', '004100101010101', 'UPSC', 'Traffic Challan', '30'),
('3', 'ASSESSED TAX', 'VAT', '209', 'A', 'N', '0.00', '004000102010101', 'VAT', 'Value Added Tax Regular', '32'),
('10', 'AC BUS-RENEWAL OF TEMPORARY REGISTRATION', 'ACTR', '231', 'A', 'Y', '300.00', '004100101010101', 'ACTR', 'Vehicles', '34'),
('10', 'AC BUS-REGISTRATION', 'ABR', '232', 'A', 'Y', '600.00', '004100101010101', 'ABR', 'Vehicles', '34'),
('10', 'AC BUS-DUPLICATE REGISTRATION ', 'ADR', '233', 'A', 'Y', '60.00', '004100101010101', 'ADR', 'Vehicles', '34'),
('10', 'AC BUS-TRANSFER', 'ABT', '234', 'A', 'Y', '300.00', '004100101010101', 'ABT', 'Vehicles', '34'),
('1', 'RECONNAISSANCE PERMITS', 'Reconaissance Permits', '150', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Mineral Concession 1960', '17'),
('1', 'RENEWAL OF MINING LEASE', 'Renewal Of Mining Lease', '152', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Mineral Concession 1960', '17'),
('1', 'MINING LEASE', 'Mining Lease', '154', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Mineral Concession 1960', '17'),
('1', 'MINING LEASE', 'Jharkhand Mining Lease 2004', '155', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Minor Mineral Concession 2004', '18'),
('1', 'SECURITY DEPOSIT', 'Security Deposit 2004', '157', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Minor Mineral Concession 2004', '18'),
('1', 'FEES FOR MINING PERMIT', 'Application Fees For Mining Permit 2004', '159', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Minor Mineral Concession 2004', '18'),
('1', 'RENEWAL OF STOCKIST LICENCE', 'Renewal Of Stockist Licence 2004', '161', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Minor Mineral Concession 2004', '18'),
('1', 'REGISTRATION AND RENEWAL', 'Grant Of Registration And Renewal', '162', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Mineral Dealer 2007', '19'),
('1', 'APPEAL APPLICATION FEES', 'Appeal Application Fees 2007', '164', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Mineral Dealer 2007', '19'),
('9', 'MOTOR VEHICLE TAX ACT UNDER SPECIAL ADHESIVE STAMP', 'Motor Vehicle tax Act Under Special Adhesive Stamp', '198', 'A', 'N', '0.00', '003002102030101', NULL, 'Stamp', '28'),
('10', 'AMBULANCE-TEMPORARY REGISTRATION', 'TR', '242', 'A', 'Y', '120.00', '004100101010101', 'TR', 'Vehicles', '34'),
('2', 'LICENCE FEE', 'Licence Fee', '125', 'A', 'N', '0.00', '003900105020101', NULL, 'Foreign Liquor And Spirits(IMFL)', '1'),
('2', 'OTHER FEES', 'Other Fees', '127', 'A', 'N', '0.00', '003900105030101', NULL, 'Foreign Liquor And Spirits(IMFL)', '1'),
('2', 'DUTY FEE', 'Duty Fee', '129', 'A', 'N', '0.00', '003900101020101', NULL, 'Country Spirits', '2'),
('2', 'OTHER FEE', 'Other Fees', '130', 'A', 'N', '0.00', '003900101020101', NULL, 'Country Spirits', '2'),
('2', 'DUTY FEE', 'Country Fermented Liquor (Duty Fee)', '132', 'A', 'N', '0.00', '003900102030101', NULL, 'Country Fermented Liquor', '3'),
('2', 'MALT LIQUOR', 'Malt Liquor', '136', 'A', 'N', '0.00', '003900103010101', NULL, 'Malt Liquor', '4'),
('2', 'LICENCE FEE', 'Medicianl and Toliet Preparations(Licence Fee)', '137', 'A', 'N', '0.00', '003900107010101', NULL, 'Medicinal And Toilet Preparations', '6'),
('3', 'ASSESSED TAX', 'VAU', '171', 'A', 'N', '0.00', '004000102010101', NULL, 'Value Added Tax Unregistered', '21'),
('3', 'ADVANCED TAX', 'ADV', '173', 'A', 'N', '0.00', '004500111010101', NULL, 'Advertisement Tax', '22'),
('3', 'ADVANCED TAX', 'ENT', '176', 'A', 'N', '0.00', '004500101010101', NULL, 'Entertainment Tax', '23'),
('10', 'ANIMAL AMBULANCE-RENEWAL OF TEMPORARY REGISTRATION', 'RTR', '244', 'A', 'Y', '300.00', '004100101010101', 'RTR', 'Vehicles', '34'),
('10', 'ANIMAL AMBULANCE-DUPLICATE REGISTRATION', 'AADR', '246', 'A', 'Y', '150.00', '004100101010101', 'AADR', 'Vehicles', '34'),
('10', 'BUS-RENEWAL OF TEMPORARY REGISTRATION', 'BRTR', '250', 'A', 'Y', '300.00', '004100101010101', 'BRTR', 'Vehicles', '34'),
('10', 'BUS-DUPLICATE REGISTRATION', 'BDR', '252', 'A', 'Y', '60.00', '004100101010101', 'BDR', 'Vehicles', '34'),
('10', 'BUS-RE-ASSIGNMENT', 'BA', '254', 'A', 'Y', '600.00', '004100101010101', 'BA', 'Vehicles', '34'),
('10', 'CAMPER-TEMPORARY REGISTRATION', 'CTR', '255', 'A', 'Y', '100.00', '004100101010101', 'CTR', 'Vehicles', '34'),
('10', 'RENEWAL OF DRIVING LICENCE-FOUR WHEELER', 'RDLF', '223', 'A', 'Y', '250.00', '004100101010101', 'RDLF', 'Driving Licence', '31'),
('10', 'ISSUE OF DRIVING LICENCE FOR DEFENCE', 'DLD', '225', 'A', 'Y', '100.00', '004100101010101', 'DLD', 'Driving Licence', '31'),
('10', 'CAR TAXI-RENEWAL OF TEMPORARY REGISTRATION', 'TRTR', '256', 'A', 'Y', '300.00', '004100101010101', 'TRTR', 'Vehicles', '34'),
('10', 'CAR TAXI-REGISTRATION', 'CTRT', '257', 'A', 'Y', '300.00', '004100101010101', 'CTRT', 'Vehicles', '34'),
('10', 'OTHERS', 'TDLO', '263', 'A', 'N', '0.00', '004100101010101', 'TDLO', 'Driving Licence', '31'),
('10', 'CONCRETE MIXTURE-REGISTRATION', 'CMR', '265', 'A', 'Y', '600.00', '004100101010101', 'CMR', 'Vehicles', '34'),
('10', 'CONCRETE MIXTURE-TRANSFER', 'CMT', '267', 'A', 'Y', '300.00', '004100101010101', 'CMT', 'Vehicles', '34'),
('10', 'CONCRETE MIXTURE-TEMPORARY REGISTRATION', 'MTR', '269', 'A', 'Y', '120.00', '004100101010101', 'MTR', 'Vehicles', '34'),
('10', 'DOUBLE DECKER BUS- REGISTRATION', 'DDR', '278', 'A', 'Y', '600.00', '004100101010101', 'DDR', 'Vehicles', '34'),
('2', 'RECEIPT FROM CHAO SALE', 'Receipt From Chao Sale', '141', 'A', 'N', '0.00', '003900800020101', NULL, 'Other Receipts', '8'),
('2', 'LICENCE FEE', 'Commercial And Denatured Spirits And Medicated Wines', '144', 'A', 'N', '0.00', '003900106010101', NULL, 'Commercial And Denatured Spirits', '10'),
('1', 'ROYALTY', 'Mining Royalty', '146', 'A', 'N', '0.00', '085300102010101', NULL, 'Royalty', '11'),
('1', 'CERTIFICATED PRINCIPAL AMOUNT', 'Mining Certificated Principal Amount', '148', 'A', 'N', '0.00', '085300102010101', NULL, 'Certificated Principal Amount', '15'),
('1', 'DEAD RENT', 'Dead Rent', '166', 'A', 'N', '0.00', '085300102010101', NULL, 'Dead Rent', '12'),
('1', 'SURFACE RENT', 'Surface Rent', '167', 'A', 'N', '0.00', '085300102010101', NULL, 'Surface Rent ', '14'),
('1', 'OTHER RECEIPTS', 'Other Receipts Mining', '168', 'A', 'N', '0.00', '085300800010101', NULL, 'Other Receipts', '20'),
('3', 'ADMITTED TAX', 'VAU', '169', 'A', 'N', '0.00', '004000102010101', NULL, 'Value Added Tax Unregistered', '21'),
('10', 'ISSUE OF LEARNERS LICENCE-FOUR WHEELER', 'LLF', '207', 'A', 'Y', '130.00', '004100101010101', 'LLF', 'Driving Licence', '31'),
('2', 'LICENCE FEE', 'Licence Fee', '128', 'A', 'N', '0.00', '003900101010101', NULL, 'Country Spirits', '2'),
('2', 'LICENCE FEE', 'Country Fermented Liquor (Licence Fee)', '131', 'A', 'N', '0.00', '003900102010101', NULL, 'Country Fermented Liquor', '3'),
('2', 'GROSS RECEIPTS', 'Fines And Confiscation(Gross Receipt)', '135', 'A', 'N', '0.00', '003900150010101', NULL, 'Fines And Confiscations', '5'),
('2', 'OTHER FEES', 'Commercial And Denatured Spirits And Medicated Wines(Other Fees)', '145', 'A', 'N', '0.00', '003900106010101', NULL, 'Commercial And Denatured Spirits', '10'),
('1', 'INTEREST', 'Mining Interest', '147', 'A', 'N', '0.00', '085300102010101', NULL, 'Interest', '13'),
('1', 'INTEREST ON CERTIFICATED PRINCIPAL AMOUNT', 'Mining Interest on Certificated Principal Amount', '149', 'A', 'N', '0.00', '085300102010101', NULL, 'Interest on Certificated Principal Amount', '16'),
('1', 'SECURITY DEPOSIT', 'Security Deposit 2007', '163', 'A', 'N', '0.00', '085300102010101', NULL, 'Fees For Jharkhand Mineral Dealer 2007', '19'),
('3', 'ADVANCED TAX', 'VAU', '170', 'A', 'N', '0.00', '004000102010101', NULL, 'Value Added Tax Unregistered', '21'),
('3', 'ADMITTED TAX', 'ADV', '172', 'A', 'N', '0.00', '004500111010101', NULL, 'Advertisement Tax', '22'),
('3', 'ASSESSED TAX', 'ADV', '174', 'A', 'N', '0.00', '004500111010101', NULL, 'Advertisement Tax', '22'),
('3', 'ADMITTED TAX', 'ENT', '175', 'A', 'N', '0.00', '004500101010101', NULL, 'Entertainment Tax', '23'),
('3', 'ASSESSED TAX', 'ENT', '177', 'A', 'N', '0.00', '004500101010101', NULL, 'Entertainment Tax', '23'),
('3', 'ADMITTED TAX', 'LT', '178', 'A', 'N', '0.00', '004500105010101', NULL, 'Luxury Tax', '24'),
('9', 'COURT FEES REALISED IN STAMPS', 'Court Fees Realised In Stamps', '190', 'A', 'N', '0.00', '003001101010101', NULL, 'Stamp', '28'),
('9', 'SALE OF STAMPS(REVENUE STAMPS)', 'Sale Of Stamps(Revenue Stamps)', '192', 'A', 'N', '0.00', '003002102010101', NULL, 'Stamp', '28'),
('9', 'OTHER RECEIPT -NON JUDICIAL STAMP', 'Other Receipt -Non Judicial Stamp', '197', 'A', 'N', '0.00', '003002800010101', NULL, 'Stamp', '28'),
('10', 'RENEWAL OF LEARNERS LICENCE-FOUR WHEELER', 'RLLF', '217', 'A', 'Y', '30.00', '004100101010101', 'RLLF', 'Driving Licence', '31'),
('10', 'ISSUE OF NEW DRIVING LICENCE-FOUR WHEELER', 'NDLF', '219', 'A', 'Y', '200.00', '004100101010101', 'NDLF', 'Driving Licence', '31'),
('10', 'AC BUS-TEMPORARY REGISTRATION', 'ABTR', '236', 'A', 'Y', '120.00', '004100101010101', 'ABTR', 'Vehicles', '34'),
('10', 'AMBULANCE-RENEWAL OF TEMPORARY REGISTRATION', 'ART', '238', 'A', 'Y', '300.00', '004100101010101', 'ART', 'Vehicles', '34'),
('10', 'AMBULANCE-TRANSFER', 'AT', '241', 'A', 'Y', '150.00', '004100101010101', 'AT', 'Vehicles', '34'),
('10', 'ANIMAL AMBULANCE-RE-ASSIGNMENT', 'AARA', '243', 'A', 'Y', '300.00', '004100101010101', 'AARA', 'Vehicles', '34'),
('10', 'ANIMAL AMBULANCE-REGISTRATION', 'AAR', '245', 'A', 'Y', '300.00', '004100101010101', 'AAR', 'Vehicles', '34'),
('11', 'UNAUTHORIZED PARKING-FOUR WHEELER & OTHER VEHICLES', 'UPFW', '201', 'A', 'Y', '90.00', '004100101010101', 'UPFW', 'Traffic Challan', '30'),
('11', 'DRIVING WITHOUT HELMET', 'DWH', '203', 'A', 'Y', '90.00', '004100101010101', 'DWH', 'Traffic Challan', '30'),
('10', 'ANIMAL AMBULANCE-TRANSFER', 'AAT', '247', 'A', 'Y', '150.00', '004100101010101', 'AAT', 'Vehicles', '34'),
('10', 'ANIMAL AMBULANCE-TEMPORARY REGISTRATION', 'AATR', '248', 'A', 'Y', '120.00', '004100101010101', 'AATR', 'Vehicles', '34'),
('7', 'Testing', '12', '282', 'I', 'Y', '123.00', '0039001030101022', 'Test', 'TEST', '36'),
('7', 'AS', '12', '281', 'I', 'Y', '100.00', '003900103010101', 'Test', 'TEST', '36'),
('1', 'TEST TYPE', 'ww', '283', 'I', 'Y', '34.00', '1221111111', 'tst', 'Royalty', '11');

-- --------------------------------------------------------

--
-- Table structure for table `genericpay_monthly_report`
--


CREATE TABLE IF NOT EXISTS `genericpay_monthly_report` (
  `TOTAL` double(20,2) DEFAULT NULL,
  `DEPT_ID` varchar(50) DEFAULT NULL,
  `ENTRY_DATE` date DEFAULT NULL,
  `MONTH_STRING` varchar(40) DEFAULT NULL,
  `MONTH_INT` int(2) DEFAULT NULL,
  `YEAR_INT` varchar(4) DEFAULT NULL,
  `DEPT_NAME` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `generic_banner_content`
--


CREATE TABLE IF NOT EXISTS `generic_banner_content` (
  `CONTENT1` varchar(400) DEFAULT NULL,
  `CONTENT2` varchar(400) DEFAULT NULL,
  `CONTENT3` varchar(4000) DEFAULT NULL,
  `CONTENT_ID` varchar(50) DEFAULT NULL,
  `COPYRIGHT` varchar(400) DEFAULT NULL,
  `VERSION` varchar(400) DEFAULT NULL,
  `TERMS` varchar(400) DEFAULT NULL,
  `CONTACT_US` varchar(400) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generic_banner_content`
--

INSERT INTO `generic_banner_content` (`CONTENT1`, `CONTENT2`, `CONTENT3`, `CONTENT_ID`, `COPYRIGHT`, `VERSION`, `TERMS`, `CONTACT_US`) VALUES
('Welcome to Demo Payonline', 'DEMO PAYONLINE', NULL, '1', 'copyright@2014 demo', 'version 1', 'okay', '');

-- --------------------------------------------------------

--
-- Table structure for table `generic_dept`
--


CREATE TABLE IF NOT EXISTS `generic_dept` (
  `DEPT_ID` varchar(50) NOT NULL,
  `DEPT_NAME` varchar(150) NOT NULL,
  `STATUS` varchar(2) DEFAULT NULL,
  `INDEXING` int(11) DEFAULT NULL,
  PRIMARY KEY (`DEPT_ID`),
  UNIQUE KEY `DEPT_NAME` (`DEPT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generic_dept`
--

INSERT INTO `generic_dept` (`DEPT_ID`, `DEPT_NAME`, `STATUS`, `INDEXING`) VALUES
('1', 'MINES AND GEOLOGY', 'A', 2),
('2', 'EXCISE AND PROHIBITION', 'A', 4),
('3', 'COMMERCIAL TAX', 'A', 1),
('4', 'TRANSPORT', 'A', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `generic_dept_users`
--


CREATE TABLE IF NOT EXISTS `generic_dept_users` (
  `username` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `branch_location` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL,
  `department` varchar(50) NOT NULL,
  `state` varchar(5) NOT NULL,
  `no_of_attempts` varchar(2) NOT NULL,
  `status` varchar(2) NOT NULL,
  `ispwdchng` varchar(2) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generic_dept_users`
--

INSERT INTO `generic_dept_users` (`username`, `fullname`, `password`, `branch_location`, `role`, `department`, `state`, `no_of_attempts`, `status`, `ispwdchng`, `created_date`, `modified_date`) VALUES
('admin', 'Administrator', '555f11cf2c38b71d32a07d8f526a0ef0', '0', 'admin', '0', '34', '0', '1', '0', '2015-01-23 00:00:00', '2015-01-28 10:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `generic_email_setting`
--


CREATE TABLE IF NOT EXISTS `generic_email_setting` (
  `EMAIL_ID` varchar(50) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(400) DEFAULT NULL,
  `MAIL_SERVER` varchar(400) DEFAULT NULL,
  `SMTP_PORT` int(10) DEFAULT NULL,
  `USERNAME` varchar(400) DEFAULT NULL,
  `PASSWORD` varchar(400) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Dumping data for table `generic_email_setting`
--

INSERT INTO `generic_email_setting` (`EMAIL_ID`, `EMAIL_ADDRESS`, `MAIL_SERVER`, `SMTP_PORT`, `USERNAME`, `PASSWORD`) VALUES
(1, 'comtax_supoory', 'mail.com', 33, 'admin', '1d4a89d87f29d');

-- --------------------------------------------------------

--
-- Table structure for table `generic_epayment`
--

CREATE TABLE IF NOT EXISTS `generic_epayment` (
  `DEPARTMENT` varchar(40) DEFAULT NULL,
  `TREASURY_HEAD` varchar(20) DEFAULT NULL,
  `PURPOSE` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `PERIOD_TYPE` varchar(40) DEFAULT NULL,
  `REMARKS` varchar(100) DEFAULT NULL,
  `DLRNAME` varchar(40) DEFAULT NULL,
  `MOBILE` varchar(10) DEFAULT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `PERIOD_FROM` date DEFAULT NULL,
  `PERIOD_TO` date DEFAULT NULL,
  `CLIENT_STATUS` varchar(4) DEFAULT 'N',
  `CHALLAN_NO` varchar(40) NOT NULL,
  `CITY` varchar(40) DEFAULT NULL,
  `STATE` varchar(40) DEFAULT NULL,
  `PIN_CODE` varchar(6) DEFAULT NULL,
  `SECURITY_QUESTION` varchar(100) DEFAULT NULL,
  `SECURITY_ANSWER` varchar(200) DEFAULT NULL,
  `PASSWORD` varchar(40) DEFAULT NULL,
  `REPASSWORD` varchar(40) DEFAULT NULL,
  `REGISTERED` varchar(1) DEFAULT NULL,
  `PAYMENT_DATE` date DEFAULT NULL,
  `BANK_NAME` varchar(50) DEFAULT NULL,
  `TRANS_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IFSCODE` varchar(30) DEFAULT NULL,
  `TRANSID` varchar(30) DEFAULT NULL,
  `BANK_REFNO` varchar(30) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `CHALLAN_STATUS` varchar(5) DEFAULT '0',
  `STATE_CODE` varchar(6) DEFAULT NULL,
  `CITY_CODE` varchar(6) DEFAULT NULL,
  `CIN` varchar(30) DEFAULT NULL,
  `FLAG` varchar(1) DEFAULT NULL,
  `IDENTITY` varchar(40) DEFAULT NULL,
  `IDENTITY_NO` varchar(40) DEFAULT NULL,
  `SUBTAX` varchar(200) DEFAULT NULL,
  `INTEREST` decimal(20,2) DEFAULT NULL,
  `PENALTY` decimal(20,2) DEFAULT NULL,
  `MISC` decimal(20,2) DEFAULT NULL,
  `ADMITTED` decimal(30,2) DEFAULT NULL,
  `AMOUNT` decimal(30,2) DEFAULT NULL,
  `ASSESSED` decimal(30,2) DEFAULT NULL,
  `ADVANCED` decimal(30,2) DEFAULT NULL,
  `VERIFY_DATE` date DEFAULT NULL,
  `CIRCLE` varchar(3) DEFAULT NULL,
  `CIRCLE_NAME` varchar(75) DEFAULT NULL,
  `branch_location` varchar(400) DEFAULT NULL,
  `grand_total` decimal(30,2) DEFAULT NULL,
  PRIMARY KEY (`CHALLAN_NO`),
  UNIQUE KEY `CIN` (`CIN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generic_epayment`
--

-- --------------------------------------------------------

--
-- Table structure for table `generic_idproof`
--


CREATE TABLE IF NOT EXISTS `generic_idproof` (
  `IDPROOF` text NOT NULL,
  `DEPARTMENT` text NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `MODIFIED_DATE` date DEFAULT NULL,
  `STATUS` varchar(4) NOT NULL,
  `UNIQUEID` varchar(50) NOT NULL,
  PRIMARY KEY (`UNIQUEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generic_idproof`
--

INSERT INTO `generic_idproof` (`IDPROOF`, `DEPARTMENT`, `CREATED_DATE`, `MODIFIED_DATE`, `STATUS`, `UNIQUEID`) VALUES
('lesse no', '5', '2014-12-08', NULL, 'I', '1'),
('Vehicle No', '5', '2014-12-08', NULL, 'A', '2'),
('lesse no', '1', '2014-12-08', NULL, 'I', '3'),
('License NO', '2', '2014-12-08', NULL, 'A', '4'),
('Tin', '3', '2014-12-08', NULL, 'A', '5'),
('demoId', '7', '2014-12-10', NULL, 'I', '6'),
('id1', '8', '2014-12-26', NULL, 'A', '7');

-- --------------------------------------------------------

--
-- Table structure for table `generic_major_tax`
--


CREATE TABLE IF NOT EXISTS `generic_major_tax` (
  `DEPT_ID` varchar(3) DEFAULT NULL,
  `MAJOR_TAX` varchar(200) DEFAULT NULL,
  `MAJOR_TAX_CODE` varchar(200) DEFAULT NULL,
  `MAJOR_TAX_ID` varchar(50) NOT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`MAJOR_TAX_ID`),
  UNIQUE KEY `MAJOR_TAX_CODE` (`MAJOR_TAX_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generic_major_tax`
--

INSERT INTO `generic_major_tax` (`DEPT_ID`, `MAJOR_TAX`, `MAJOR_TAX_CODE`, `MAJOR_TAX_ID`, `STATUS`) VALUES
('1', 'Fees For Jharkhand Minor Mineral Concession 2004', 'jmmc 2004', '18', 'A'),
('3', 'Professional Tax', 'PT', '27', 'A'),
('3', 'Value Added Tax Regular', 'VAT', '32', 'A'),
('2', 'Foreign Liquor And Spirits(IMFL)', 'IMFL', '1', 'A'),
('1', 'Royalty', 'minroyal', '11', 'A'),
('10', 'Driving Licence', 'DL', '31', 'A'),
('2', 'Medicinal And Toilet Preparations', 'MTP', '6', 'A'),
('1', 'Fees For Mineral Concession 1960', 'Mcr 1960', '17', 'A'),
('3', 'Electricity Duty', 'ED', '25', 'A'),
('3', 'Jharkhand Sales Tax', 'JST', '26', 'A'),
('9', 'Stamp', 'Stamp catg', '28', 'A'),
('11', 'Traffic Challan', 'TC', '30', 'A'),
('3', 'Central Sales Tax', 'CST', '33', 'A'),
('10', 'Vehicles', 'VEH01', '34', 'A'),
('2', 'Country Spirits', 'CS', '2', 'A'),
('2', 'Opium, Hemp And Other Drugs', 'Opium', '7', 'A'),
('2', 'Other Receipts', 'Receipts', '8', 'A'),
('2', 'Refund', 'Refund', '9', 'A'),
('1', 'Interest', 'Mint', '13', 'A'),
('1', 'Fees For Jharkhand Mineral Dealer 2007', 'Jmd 2007', '19', 'A'),
('1', 'Other Receipts', 'OR-Mining', '20', 'A'),
('3', 'Advertisement Tax', 'ADV', '22', 'A'),
('3', 'Entertainment Tax', 'ENT', '23', 'A'),
('3', 'Luxury Tax', 'LT', '24', 'A'),
('2', 'Country Fermented Liquor', 'CFL', '3', 'A'),
('2', 'Malt Liquor', 'Malt', '4', 'A'),
('2', 'Fines And Confiscations', 'Fines', '5', 'A'),
('2', 'Commercial And Denatured Spirits', 'Denatured', '10', 'A'),
('1', 'Dead Rent', 'Midr', '12', 'A'),
('1', 'Surface Rent ', 'Msr', '14', 'A'),
('1', 'Certificated Principal Amount', 'Cpa', '15', 'A'),
('1', 'Interest on Certificated Principal Amount', 'Icpa', '16', 'A'),
('3', 'Value Added Tax Unregistered', 'VAU', '21', 'A'),
('9', 'Registration Fees', 'Fees', '29', 'A'),
('2', 'Major Liquor', 'ML', '35', 'A'),
('7', 'TEST', 'TEST123', '36', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `generic_msg`
--


CREATE TABLE IF NOT EXISTS `generic_msg` (
  `BILLDESK_CHECKSUM` varchar(100) DEFAULT NULL,
  `BILLDESK_URL` varchar(400) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `GENERIC_ID` varchar(50) DEFAULT NULL,
  `Merchant_id` varchar(20) DEFAULT NULL,
  `Security_id` varchar(20) DEFAULT NULL,
  `Response_url` varchar(400) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generic_msg`
--

INSERT INTO `generic_msg` (`BILLDESK_CHECKSUM`, `BILLDESK_URL`, `CREATED_DATE`, `GENERIC_ID`, `Merchant_id`, `Security_id`, `Response_url`) VALUES
('asdf1233', 'www.bill.com', '2014-12-31', 1, 'TAXPAYTEST', 'taxpaytest', 'www.response.co.in');

-- --------------------------------------------------------

--
-- Table structure for table `generic_settlement`
--

CREATE TABLE IF NOT EXISTS `generic_settlement` (
  `TRANSID` varchar(50) DEFAULT NULL,
  `CHALLAN_NO` varchar(40) DEFAULT NULL,
  `TREASURY_CODE` varchar(20) DEFAULT NULL,
  `CIN` varchar(20) NOT NULL DEFAULT '',
  `TRANSDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TOTAL1` decimal(18,2) DEFAULT NULL,
  `TOTAL2` decimal(18,2) DEFAULT NULL,
  `ADDINFO` varchar(20) DEFAULT NULL,
  `POS6` varchar(20) DEFAULT NULL,
  `POS7` varchar(20) DEFAULT NULL,
  `POS8` varchar(20) DEFAULT NULL,
  `FLAG` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`CIN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `generic_sms_setting`
--


CREATE TABLE IF NOT EXISTS `generic_sms_setting` (
  `SMS_ID` varchar(50) DEFAULT NULL,
  `PROVIDER_NAME` varchar(400) DEFAULT NULL,
  `HOST_URL` varchar(400) DEFAULT NULL,
  `HOST_PORT` int(10) DEFAULT NULL,
  `USERNAME` varchar(400) DEFAULT NULL,
  `PASSWORD` varchar(4000) DEFAULT NULL,
  `SENDER_ID` varchar(400) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Dumping data for table `generic_sms_setting`
--

INSERT INTO `generic_sms_setting` (`SMS_ID`, `PROVIDER_NAME`, `HOST_URL`, `HOST_PORT`, `USERNAME`, `PASSWORD`, `SENDER_ID`) VALUES
(1, 'as', 'smslane.com', 45, 'admin', '1d4a89d87f290517c75e50dcddd4ab6a', 'aa');

-- --------------------------------------------------------

--
-- Table structure for table `generic_user_profile`
--

CREATE TABLE IF NOT EXISTS `generic_user_profile` (
  `DLRNAME` varchar(40) DEFAULT NULL,
  `MOBILE` varchar(10) DEFAULT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `CITY` varchar(40) DEFAULT NULL,
  `STATE` varchar(40) DEFAULT NULL,
  `PIN_CODE` varchar(6) DEFAULT NULL,
  `SECURITY_QUESTION` varchar(100) DEFAULT NULL,
  `SECURITY_ANSWER` varchar(200) DEFAULT NULL,
  `PASSWORD` varchar(40) DEFAULT NULL,
  `REGISTRATION_DATE` date DEFAULT NULL,
  `MODIFIED_DATE` date DEFAULT NULL,
  `CITY_CODE` varchar(6) DEFAULT NULL,
  `STATE_CODE` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`EMAIL`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--
-- Dumping data for table `generic_user_profile`
--

INSERT INTO `generic_user_profile` (`DLRNAME`, `MOBILE`, `EMAIL`, `ADDRESS`, `CITY`, `STATE`, `PIN_CODE`, `SECURITY_QUESTION`, `SECURITY_ANSWER`, `PASSWORD`, `REGISTRATION_DATE`, `MODIFIED_DATE`, `CITY_CODE`, `STATE_CODE`) VALUES
('zephaniah', '9430763987', 'ng.zephaniah@nic.in', 'ranchi', 'RANCHI', 'JHARKHAND', '834002', 'Your Hobbies', 'nothing', 'bbc188942eaddc78a6b9fc3763cf4bf3', '2014-07-02', NULL, '3401', '34'),
('akshay', '9471325275', 'akshaykrray@gmail.com', 'ranchi', 'RANCHI', 'JHARKHAND', '814112', 'Your Hobbies', 'demo', 'bbc188942eaddc78a6b9fc3763cf4bf3', '2014-12-02', NULL, '3401', '34'),
('Kunal Sinha', '9693119805', 'kunal@gmail.com', 'hino', '3410', '34', '824004', 'Your Place Of Birth', 'jamshedpur', 'bbc188942eaddc78a6b9fc3763cf4bf3', '2014-12-06', '2014-12-25', '3414', '34'),
('anurag', '8986852175', 'anurag@gmail.com', 'shastri nagar', 'MEERUT', 'UTTAR PRADESH', '250004', 'Your Place Of Birth', 'bijnor', 'bbc188942eaddc78a6b9fc3763cf4bf3', '2014-12-12', NULL, '3115', '31'),
('akshay', '7894561236', 'akshay@gmail.com', 'hinoo', 'WEST DELHI', 'DELHI', '222222', 'Your Place Of Birth', 'india', 'bbc188942eaddc78a6b9fc3763cf4bf3', '2014-12-18', NULL, '3609', '36'),
('Rajiv', '9546852507', 'ranjan.rajiv5@yahoo.com', 'DEMO', 'BOKARO', 'JHARKHAND', '834004', 'Your Place Of Birth', 'JAMSHEDPUR', 'bbc188942eaddc78a6b9fc3763cf4bf3', '2015-01-19', NULL, '3420', '34'),
('Rajiv Ranjan Ojha', '9546852507', 'ranjan.rajiv5@gmail.com', 'Jamshedpur', '3410', '34', '831007', 'Your Place Of Birth', 'Jamshedpur', 'bbc188942eaddc78a6b9fc3763cf4bf3', '2015-01-20', '2015-01-21', '3410', '34'),
('Rajiv Ranjan Ojha', '9546852507', 'rajivojha3185@gmail.com', 'Burmamines', 'EAST SINGHBHUM', 'JHARKHAND', '831007', 'Your favorite sports team', 'india', 'bbc188942eaddc78a6b9fc3763cf4bf3', '2015-01-23', NULL, '3410', '34');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `STATE_CODE` varchar(2) NOT NULL DEFAULT '',
  `STATE_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`STATE_CODE`),
  UNIQUE KEY `STATE_NAME` (`STATE_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`STATE_CODE`, `STATE_NAME`) VALUES
('39', 'TELANGANA'),
('36', 'DELHI'),
('37', 'CHANDIGARH'),
('01', 'ANDAMAN AND NICOBAR'),
('02', 'ANDHRA PRADESH'),
('03', 'ARUNACHAL PRADESH'),
('04', 'ASSAM'),
('05', 'BIHAR'),
('07', 'DADRA  & NAGAR HAVEL'),
('08', 'DAMAN & DIU'),
('10', 'GOA'),
('11', 'GUJARAT'),
('12', 'HARYANA'),
('13', 'HIMACHAL PRADESH'),
('14', 'JAMMU AND KASHMIR'),
('15', 'KARNATAKA'),
('16', 'KERALA'),
('17', 'MADHYA PRADESH'),
('18', 'MAHARASHTRA'),
('19', 'LAKSHADWEEP'),
('20', 'MANIPUR'),
('21', 'MEGHALAYA'),
('22', 'MIZORAM'),
('23', 'NAGALAND'),
('24', 'ORISSA'),
('25', 'PONDICHERRY'),
('26', 'PUNJAB'),
('27', 'RAJASTHAN'),
('28', 'SIKKIM'),
('29', 'TAMIL NADU'),
('30', 'TRIPURA'),
('31', 'UTTAR PRADESH'),
('32', 'WEST BENGAL'),
('33', 'CHATTISGARH'),
('34', 'JHARKHAND'),
('35', 'UTTRANCHAL'),
('38', 'UTTARAKHAND'),
('#', 'OUTSIDE INDIA');

-- --------------------------------------------------------

--
-- Table structure for table `webservice_validator`
--

CREATE TABLE IF NOT EXISTS `webservice_validator` (
  `id` varchar(50) NOT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `deptid` varchar(50) DEFAULT NULL,
  `checksum` varchar(20) DEFAULT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chek` (`checksum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

 
CREATE TABLE IF NOT EXISTS `department_epayment` (
  `CHALLAN_NO` varchar(50) NOT NULL,
  `AMOUNT` double DEFAULT NULL,
  `BANK_NAME` varchar(50) DEFAULT NULL,
  `TREASURY_CODE` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DEPT_CODE` varchar(11) DEFAULT NULL,
  `TRANS_DATE` timestamp NULL DEFAULT NULL,
  `TRANSID` varchar(30) DEFAULT NULL,
  `BANK_REFNO` varchar(30) DEFAULT NULL,
  `CIN` varchar(30) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `MISC` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CHALLAN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `department_integration` (
  `sno` varchar(50) NOT NULL,
  `dept_name` varchar(200) DEFAULT NULL,
  `dept_code` varchar(20) DEFAULT NULL,
  `ip_adrs` varchar(16) DEFAULT NULL,
  `secret_code` varchar(50) DEFAULT NULL,
  `response_url` varchar(500) DEFAULT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Active, Inactive',
  `error_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  UNIQUE KEY `ipadrs` (`dept_code`,`ip_adrs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `generic_template` (
  `template_id` varchar(50) NOT NULL,
  `temp_msg` text,
  `temp_mail` text,
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `circles` (
  `CIR_NCODE` decimal(2,0) NOT NULL DEFAULT '0',
  `CIR_CODE` varchar(4) DEFAULT NULL,
  `CIR_NAME` varchar(75) DEFAULT NULL,
  `DIV_CODE` char(1) DEFAULT NULL,
  `USERID` varchar(15) DEFAULT NULL,
  `DATETIME` date DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `T_ORDER` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`CIR_NCODE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `generic_department_location` (
  `dept_id` int(3) NOT NULL,
  `address` varchar(200) NOT NULL,
  `state` varchar(60) NOT NULL,
  `state_code` int(5) NOT NULL,
  `city` varchar(100) NOT NULL,
  `city_code` int(5) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(80) NOT NULL,
  `created_dt` date NOT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'A',
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `genericc_contact_info` (
  `id` varchar(50) NOT NULL,
  `snam` varchar(200) NOT NULL,
  `isue_sbject` varchar(400) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mesg` varchar(500) NOT NULL,
  UNIQUE KEY `id` (`id`)
);


INSERT INTO `genericc_contact_info` (`id`, `snam`, `isue_sbject`, `email`, `mesg`) VALUES
('160CFBF6-DF55-11E4-897B-B8AC6F53ACF2', 'santosh', 'dont know', 'santoshkumar.utl@gmail.com', 'a'),
('389B7868-DF55-11E4-897B-B8AC6F53ACF2', 'santosh', 'dont know', 'santoshkumar.utl@gmail.com', 'a');


CREATE TABLE IF NOT EXISTS `generic_anual_date` (
  `id` varchar(50) NOT NULL,
  `cdate` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
);


INSERT INTO `generic_anual_date` (`id`, `cdate`) VALUES
('BF798A93-DD05-11E4-BA56-B8AC6F53ACF2', '2015-2016');

CREATE TABLE IF NOT EXISTS `generic_month_date` (
  `id` varchar(50) NOT NULL,
  `qurt_mnth_yr` varchar(50) NOT NULL
) ;

INSERT INTO `generic_month_date` (`id`, `qurt_mnth_yr`) VALUES
('B338A805-DD08-11E4-BA56-B8AC6F53ACF2', '2015');
 
 