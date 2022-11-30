-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2022 lúc 02:53 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `jsp2_blog_web_app`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `id_user`) VALUES
(2, 'Vue.js là gì ? Tại sao nên học Vuejs ? ', 'Vue.js, gọi tắt là Vue, là một framework linh động dùng để xây dựng giao diện người dùng. Khác với các framework nguyên khối, Vue được thiết kế từ đầu theo hướng cho phép và khuyến khích việc phát triển ứng dụng theo các bước. Trang Wikipedia .  ', 1),
(33, 'ESLint là gì ? ', 'Hiện nay JavaScript đã có những phát triển rất xa so với những thế hệ ban đầu, khi mà những đặc tả ES2015 (ECMAScript 2015 - ES6) và ES2017 được công bố. Đặc biệt, rất nhiều thư viện của JavaScript như ReactJS, AngularJS, VueJS, v.v... giúp chúng ta có thể xây dựng những ứng dụng web cực kỳ cool.\r\n\r\nMặc dù có những đặc tả kỹ thuật như vậy, nhưng việc code JavaScript hiện nay vẫn còn rất nhiều vấn đề. Vì vậy, việc đảm bảo chất lượng của code JavaScript vẫn luôn là một thách thức lớn.\r\n\r\nCó rất nhiều yếu tốt để tạo ra một project tốt như: cấu trúc thư mục rõ ràng, README đầy đủ thông tin, có hướng dẫn set up cũng như build, test. Và yếu tố quan trọng nhất của một project tốt phải là code dễ đọc, dễ hiểu và dễ bảo trì.\r\n\r\nĐể đảm bảo những yếu tố đó, sức người không thể làm hết được. Đó là lúc chúng ta cần đến các công cụ lint.  ', 1),
(34, 'PHP là gì? Lập trình viên PHP làm công việc gì?', 'PHP là viết tắt của cụm từ Personal Home Page nay đã được chuyển thành Hypertext Preprocessor. Hiểu đơn giản thì PHP là một ngôn ngữ lập trình kịch bản (scripting language) đa mục đích. PHP được dùng phổ biến cho việc phát triển các ứng dụng web chạy trên máy chủ. Dó đó, ngôn ngữ lập trình PHP có thể xử lý các chức năng từ phía server để sinh ra mã HTML trên client như thu thập dữ liệu biểu mẫu, sửa đổi cơ sở dữ liệu, quản lý file trên server hay các hoạt động khác. \r\n\r\nPHP là gì?\r\nPHP là gì?\r\n\r\nHiện nay rất phổ biến việc sử dụng mã nguồn mở để nhúng vào trong HTML nhờ sử dụng cặp thẻ\r\n\r\nPHP <?php?>. PHP khi áp dụng trong việc tối ưu hóa cho các ứng dụng web đã đem lại những hiệu quả cao như nhanh, tiện lợi, ít lỗi mà cấu trúc tương tự như Java hay C. Ngoài ra, PHP cũng được coi là một ngôn ngữ khá dễ học và thành thạo hơn so với các ngôn ngữ khác. Vì vậy đây là lý do mà PHP ngày càng được áp dụng nhiều và trở thành ngôn ngữ lập trình phổ biến nhất.\r\n\r\n \r\n\r\nLập trình viên PHP – PHP developer là gì?\r\nLập trình viên PHP chính là những kỹ sư phụ trách việc thiết kế phần mềm trên web từ máy tính chủ bằng cách sử dụng ngôn ngữ lập trình Hypertext Pre (PHP). Vậy một lập trình viên PHP sẽ có những nhiệm vụ công việc gì?\r\n\r\nLập trình website: Các lập trình viên PHP thường sử dụng ngôn ngữ này để thiết kế lên những website theo yêu cầu. Hiện nay có rất nhiều website được thiết kế dựa trên PHP, một số trong đó rất nổi tiếng có thể kể đến như Youtube, Facebook, Wikipedia hay WordPress. Không phải ngẫu nhiên mà các website hàng đầu thế giới đều dựa trên PHP, qua đó chúng ta có thể thấy được mức độ phổ biến và quan trọng của việc lập trình website theo PHP.\r\nQuản trị website: Trong khi website được vẫn hành thì việc quản trị các website cũng là một công việc cần thiết phải làm. Tuy nhiên công việc này thường ít đòi hỏi về chuyên môn PHP và mức thu nhập cũng', 1),
(35, 'Lập trình viên fullstack !', 'Lập trình viên full stack là người có thể làm các công việc nhiều mảng của lập trình. Bao gồm database, server, system engineering và client work. Hoặc về di động, web và phần mềm. Liệu với toàn bộ những kiến thức đó có quá nhiều cho công việc của lập trình viên. Cùng CodeGym tìm hiểu những điều liên quan tới lập trình viên full stack để hiểu hơn về công việc này nhé! Biết đâu chừng bạn lại muốn theo đuổi nghề lập trình ngay.\r\nLập trình viên full stack là gì?\r\nLập trình viên Full stack là sự tổng hợp nhiều kiến thức từ lập trình. Bao gồm cả sự hiểu biết tổng quan và chi tiết về front-end và back-end. Họ còn nắm vững các best practices và khái niệm trong lập trình. Full stack developer có thể code cho mọi thành phần của hệ thống. Do đó họ sẽ làm mọi thứ một cách tốt nhất từ những điều đơn giản nhất. Nhưng để làm được như vậy bạn phải trai quan một quá trình học hỏi một lượng lớn các kỹ năng cũng như kinh nghiệm.', 16),
(42, 'API là gì? Những đặc điểm nổi bật của Web API ', 'API là các phương thức, giao thức kết nối với các thư viện và ứng dụng khác. Nó là viết tắt của Application Programming Interface – giao diện lập trình ứng dụng. API cung cấp khả năng cung cấp khả năng truy xuất đến một tập các hàm hay dùng. Và từ đó có thể trao đổi dữ liệu giữa các ứng dụng.\r\n\r\nAPI là gì\r\nTham khảo thêm: việc làm API lương cao lên đến 3000 USD\r\n\r\nAPI thường ứng dụng vào đâu?\r\nWeb API: là hệ thống API được sử dụng trong các hệ thống website. Hầu hết các website đều ứng dụng đến Web API cho phép bạn kết nối, lấy dữ liệu hoặc cập nhật cơ sở dữ liệu. Ví dụ: Bạn thiết kế chức nằng login thông Google, Facebook, Twitter, Github… Điều này có nghĩa là bạn đang gọi đến API của. Hoặc như các ứng dụng di động đều lấy dữ liệu thông qua API.\r\nAPI trên hệ điều hành: Windows hay Linux có rất nhiều API, họ cung cấp các tài liệu API là đặc tả các hàm, phương thức cũng như các giao thức kết nối. Nó giúp lập trình viên có thể tạo ra các phần mềm ứng dụng có thể tương tác trực tiếp với hệ điều hành.\r\nAPI của thư viện phần mềm hay framework: API mô tả và quy định các hành động mong muốn mà các thư viện cung cấp. Một API có thể có nhiều cách triển khai khác nhau và nó cũng giúp cho một chương trình viết bằng ngôn ngữ này có thể sử dụng thư viện được viết bằng ngôn ngữ khác. Ví dụ bạn có thể dùng Php để yêu cầu một thư viện tạo file PDF được viết bằng C++.', 18);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`) VALUES
(1, 'vanmanh', 'vanmanhpro', 'Nguyễn Văn Mạnh VIP'),
(14, 'thanhnguyen', 'thanhnguyen', 'Trần Thanh Nguyên'),
(16, 'vanmanh999', 'vanmanh999', 'Nguyễn Văn Mạnh Pro'),
(18, 'congcuong', 'congcuong', 'Nguyễn Công Cường'),
(24, 'hoangphuc', 'hoangphuc', 'Nguyễn Văn Hoàng Phúc'),
(25, 'thuyduongdth', 'thuyduong', 'Trần Thị Thùy Dương dth');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
