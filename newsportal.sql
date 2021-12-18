-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 13, 2021 lúc 03:55 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `newsportal`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) NOT NULL,
  `AdminPassword` varchar(255) NOT NULL,
  `AdminEmailId` varchar(255) NOT NULL,
  `Is_Active` int(11) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `Is_Active`, `CreationDate`, `UpdationDate`) VALUES
(1, 'admin', '$2y$12$i4LMfeFPQpGSNPTaccIkKuwxAkJ4PhBr3JND7FpXwWFjRvchQn17C', 'trantu415211@gmail.com', 1, '2018-05-27 17:51:00', '2021-10-05 23:00:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(2, 'Thông báo', 'General Annoucement', '2020-10-02 10:28:09', '2021-07-28 18:41:07', 1),
(3, 'Sự kiện', 'Events & Activities', '2020-09-30 10:35:09', '2021-06-02 11:11:55', 1),
(4, 'Công nghệ', 'Webinar, Meeting', '2018-06-14 05:32:58', '2021-10-20 05:33:41', 1),
(5, 'Đời sống', '\"Blockbuster\" Contract', '2020-06-11 15:46:09', '0000-00-00 00:00:00', 1),
(6, 'Vui vẻ', 'Just4Fun at FIS', '2018-06-22 15:46:22', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcomments`
--

CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `postId` char(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblcomments`
--

INSERT INTO `tblcomments` (`id`, `postId`, `name`, `email`, `comment`, `postingDate`, `status`) VALUES
(1, '12', 'Anuj', 'anuj@gmail.com', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.', '2018-11-21 11:06:22', 0),
(2, '12', 'Test user', 'test@gmail.com', 'This is sample text for testing.', '2018-11-21 11:25:56', 1),
(3, '7', 'ABC', 'abc@test.com', 'This is sample text for testing.', '2018-11-21 11:27:06', 1),
(4, '12', 'Test21', 'abc@xyz.com', 'oke\r\n', '2021-10-13 13:50:57', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(200) DEFAULT NULL,
  `PageTitle` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'About FIS News', '<font color=\"#7b8898\" face=\"Mercury SSm A, Mercury SSm B, Georgia, Times, Times New Roman, Microsoft YaHei New, Microsoft Yahei, å¾®è½¯é›…é»‘, å®‹ä½“, SimSun, STXihei, åŽæ–‡ç»†é»‘, serif\"><span style=\"font-size: 26px;\">FPT Information System....!</span></font><br>', '2018-06-30 18:01:03', '2021-10-05 14:57:02'),
(2, 'contactus', 'Thông tin liên hệ', '<p><br></p><p><b>Địa chỉ :&nbsp; </b>Hà Nội</p><p><b>Số điện thoại : </b>01234567890</p><p><b>Email : </b>trantu415211@gmail.com</p>', '2018-06-30 18:01:36', '2021-10-13 13:25:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` longtext DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` longtext DEFAULT NULL,
  `PostImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblposts`
--

INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`) VALUES
(7, 'Uỷ ban Dân tộc và Tập đoàn FPT ký kết thỏa thuận hợp tác chiến lược giai đoạn 2021-2026', 3, 4, 'Ngày 13/10 tại Hà Nội, Uỷ ban Dân tộc đã ký thỏa thuận hợp tác với Tập đoàn FPT về chuyển đổi số và ứng dụng CNTT giai đoạn 2021-2026. Đồng chí Hầu A Lềnh - Ủy viên Ban Chấp hành Trung ương Đảng, Bộ trưởng, Chủ nhiệm Uỷ ban Dân tộc và ông Trương Gia Bình - Chủ tịch HĐQT Tập đoàn FPT chủ trì lễ ký kết cùng sự tham dự của các Thứ trưởng - Phó Chủ nhiệm, các Vụ trưởng, Giám đốc Trung tâm Thông tin Uỷ ban Dân tộc, lãnh đạo và đại diện các đơn vị thành viên Tập đoàn FPT. Thỏa thuận được ký kết nhằm mục tiêu thiết lập nền tảng công nghệ số vững chắc, là cơ sở để Uỷ ban Dân tộc hiện thực hóa các mục tiêu trong Chương trình Mục tiêu Quốc gia phát triển kinh tế - xã hội cho đồng bào dân tộc thiểu số và miền núi giai đoạn 2021-2030.\n\nDựa trên nguyên tắc \"Trách nhiệm - Sáng tạo - Cùng phát triển”, Uỷ ban Dân tộc và Tập đoàn FPT sẽ hợp tác toàn diện và đa dạng gồm 05 nhóm nội dung trọng tâm bao gồm: Tư vấn, đẩy mạnh ứng dụng CNTT, chuyển đổi số trong thực hiện nhiệm vụ chuyên môn của Ủy ban Dân tộc và Chương trình Mục tiêu Quốc gia; Thúc đẩy ứng dụng khoa học công nghệ trong giáo dục, đào tạo với đồng bào dân tộc thiểu số, miền núi và cho cán bộ công chức; Hợp tác thúc đẩy tham gia thị trường thương mại, sàn thương mại điện tử để đẩy mạnh tiêu thụ sản phẩm cho đồng bào các dân tộc; Phối hợp hoạt động truyền thông, tuyên truyền và đồng hành trong các hoạt động CSR, an sinh xã hội.', '2018-06-30 18:49:23', '2021-10-13 13:45:39', 1, '17173', 'DSCF6009.jpg'),
(10, 'FPT IS được vinh danh trong Top 10 doanh nghiệp CNTT Việt Nam 2021', 3, 4, 'Sáng ngày 09/10, Công ty TNHH Hệ thống Thông tin FPT (FPT IS) vinh dự được trao 3 Danh hiệu Top 10 doanh nghiệp CNTT Việt Nam năm 2021 ở 3 lĩnh vực trụ cột gồm Dịch vụ, giải pháp CNTT, Chính phủ số và Thành phố thông minh, góp phần khẳng định năng lực trải rộng và vị thế của FPT IS sau 27 năm hình thành và phát triển.\n\nChương trình “Top 10 doanh nghiệp CNTT Việt Nam” do Hiệp hội phần mềm và dịch vụ CNTT Việt Nam (VINASA) khởi xướng và tổ chức từ năm 2014. Dựa trên những tiêu chí đánh giá về chất lượng, công nghệ, nhân lực, tài chính, thị trường khách hàng…, FPT IS đã được Hội đồng giám khảo gồm 40 chuyên gia đầu ngành lựa chọn vào Top 10 doanh nghiệp CNTT cung cấp Dịch vụ, giải pháp CNTT, Top 10 doanh nghiệp cung cấp giải pháp Chính phủ số và Top 10 doanh nghiệp cung cấp giải pháp Thành phố thông minh năm 2021.', '2018-06-30 19:08:56', '2021-10-13 13:48:38', 1, '17165', 'GDD_9663.jfif'),
(11, 'Bộ Ngoại giao thăm FPT IS và trao đổi về chuyển đổi số', 6, 8, 'Chiều ngày 07/10/2021, Thứ trưởng Đặng Hoàng Giang đã dẫn đầu đoàn cán bộ của Bộ Ngoại giao đến thăm và trao đổi với Công ty TNHH Hệ thống Thông tin FPT (FPT IS) về các giải pháp cũng như kinh nghiệm về chuyển đổi số.\n\nMở đầu buổi họp, ông Dương Dũng Triều – Chủ tịch FPT IS gửi lời cảm ơn tới Bộ Ngoại giao vì đã hỗ trợ FPT trong nhiều dự án giao thương với các nước trên thế giới, đồng thời đưa ra chính sách kịp thời giải cứu những cán bộ của FPT bị mắc kẹt vì COVID-19. Ông Triều cũng khẳng định với năng lực và kinh nghiệm chuyển đổi số trong nhiều năm qua, FPT IS sẵn sàng chia sẻ, tư vấn các giải pháp phù hợp với đặc thù của Bộ Ngoại giao.', '2018-06-30 19:10:36', '2021-10-13 13:49:08', 1, '17167', 'BNG1.jpg'),
(12, 'EVNGENCO 3 hợp tác cùng FPT IS triển khai hệ thống báo cáo quản trị thông minh', 6, 7, 'Mới đây, Tổng Công ty phát điện 3 (EVNGENCO 3) đã quyết định lựa chọn Công ty TNHH Hệ thống Thông tin FPT (FPT IS) là đối tác triển khai hệ thống báo cáo quản trị thông minh Tableau BI. Đến nay, đây được coi là dự án Tableau BI lớn nhất của Tập đoàn Điện lực Việt Nam (EVN).\n\nTheo đó, FPT IS sẽ chịu trách nhiệm: Thiết lập, nâng cấp chức năng nhập liệu trên cổng portal hiện tại; Đồng bộ dữ liệu từ các hệ thống phần mềm dùng chung của Tập đoàn EVN (ERP, PR, E-Learning, HRMS, PMIS, IMIS) sang phần mềm Tableau BI; Xây dựng hệ thống báo cáo điều hành trên phần mềm Tableau BI cho 12 Ban chức năng của EVNGENCO 3 và 7 công ty thành viên; Đào tạo và chuyển giao công nghệ cho người dùng.', '2018-06-30 19:11:44', '2021-10-13 13:50:21', 1, '17162', 'genco2.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Subcategory` varchar(255) DEFAULT NULL,
  `SubCatDescription` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 5, 'Tech Talk', 'Tech term', '2018-06-22 15:45:38', '0000-00-00 00:00:00', 1),
(4, 3, 'Sub2', '\r\n\r\n', '2018-06-30 09:00:43', '0000-00-00 00:00:00', 1),
(5, 5, 'Sub3', 'Sub4', '2018-06-30 18:59:22', '0000-00-00 00:00:00', 1),
(6, 6, 'Sub4', NULL, '2018-06-30 19:04:29', '0000-00-00 00:00:00', 1),
(7, 6, 'International', NULL, '2018-06-30 19:04:43', '0000-00-00 00:00:00', 1),
(8, 7, 'Sub5', '', '2018-06-30 19:08:42', '0000-00-00 00:00:00', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
