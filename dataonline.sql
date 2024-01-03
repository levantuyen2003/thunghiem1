-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 19, 2023 lúc 06:37 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dataonline`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `iddonhang` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`iddonhang`, `idsp`, `soluong`, `gia`) VALUES
(8, 19, 1, '33990000'),
(8, 20, 1, '20500000'),
(9, 20, 1, '20500000'),
(10, 20, 1, '20500000'),
(10, 17, 1, '46600000'),
(10, 20, 1, '20500000'),
(11, 20, 3, '20500000'),
(11, 19, 1, '33990000'),
(12, 20, 1, '20500000'),
(13, 20, 1, '82000000'),
(14, 20, 2, '20500000'),
(15, 20, 1, '20500000'),
(16, 20, 1, '20500000'),
(17, 19, 1, '33990000'),
(17, 20, 1, '2'),
(18, 20, 3, '6'),
(19, 53, 1, '1'),
(20, 20, 1, '25000000'),
(21, 19, 1, '33990000'),
(22, 20, 2, '50000000'),
(22, 18, 1, '24280000'),
(23, 17, 1, '46600000'),
(23, 19, 2, '67980000'),
(24, 19, 1, '33990000'),
(25, 20, 1, '25000000'),
(26, 1, 1, '12200000'),
(26, 2, 1, '46600000'),
(26, 18, 1, '24280000'),
(27, 5, 1, '20500000'),
(27, 3, 1, '24280000'),
(27, 2, 1, '46600000'),
(28, 18, 1, '24280000'),
(28, 17, 1, '46600000'),
(28, 15, 1, '20500000'),
(29, 18, 1, '24280000'),
(30, 19, 1, '33990000'),
(31, 1, 1, '12200000'),
(31, 2, 1, '46600000'),
(31, 3, 1, '24280000'),
(32, 16, 1, '12200000'),
(32, 15, 1, '20500000'),
(33, 18, 1, '24280000'),
(33, 20, 1, '25000000'),
(34, 14, 1, '33990000'),
(34, 15, 1, '20500000'),
(35, 17, 1, '46600000'),
(35, 20, 1, '25000000'),
(35, 18, 1, '24280000'),
(36, 20, 1, '25000000'),
(36, 20, 1, '25000000'),
(36, 19, 1, '33990000'),
(36, 19, 1, '33990000'),
(37, 20, 1, '25000000'),
(37, 17, 1, '46600000'),
(38, 20, 1, '25000000'),
(38, 17, 1, '46600000'),
(39, 18, 1, '24280000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `diachi` text NOT NULL,
  `sodienthoai` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `soluong` int(11) NOT NULL,
  `tongtien` varchar(250) NOT NULL,
  `trangthai` int(2) NOT NULL DEFAULT 0,
  `ngaydat` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `iduser`, `diachi`, `sodienthoai`, `email`, `soluong`, `tongtien`, `trangthai`, `ngaydat`) VALUES
(22, 24, 'mmmm', '0123456789', 'kh@gmail.com', 3, '124280000', 3, '2023-04-07'),
(23, 25, 'mmm', '0123456789', 'Kh1@gmail.com', 3, '182560000', 3, '2023-05-09'),
(34, 26, 'kh2', '01234567', 'kh2@gmail.com', 2, '54490000', 3, '2023-05-10'),
(35, 27, 'kh3', '0123456789', 'kh3@gmail.com', 3, '95880000', 3, '2023-06-11'),
(36, 31, 'HaNoi', '0123456789', 'User1@gmail.com', 4, '117980000', 3, '2023-06-13'),
(38, 25, 'Ha Noi', '0123456789', 'Kh1@gmail.com', 2, '71600000', 3, '2023-06-13'),
(39, 25, 'Ha Noi', '0123456789', 'Kh1@gmail.com', 1, '24280000', 3, '2023-06-19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `tensanpham` varchar(100) NOT NULL,
  `hinhanh` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensanpham`, `hinhanh`) VALUES
(1, 'Trang chủ', 'https://cdn-icons-png.flaticon.com/512/1299/1299961.png'),
(2, 'Điện thoại', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKxGPu1i29lnaFfQlN4pqyMKrgVnHjVVuVxS_D3GNaZ2zI_Rm1ypkWLRDTuXUgUuhXBnc&usqp=CAU'),
(3, 'Laptop', 'https://phongvu.vn/cong-nghe/wp-content/uploads/sites/2/2020/09/Dell-XPS-15-1024x572.jpg'),
(4, 'Thông tin', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh4GlK2PxnaZoVGTJ6glpu2nA_oh-w9wRbSQVEL4QSXygrLUUyHWM4Gseagl9DQrnUIWw&usqp=CAU'),
(5, 'Liên hệ', 'https://socencoop.org.vn/wp-content/uploads/2023/02/lienhe.png'),
(6, 'Đơn hàng', 'https://tse2.mm.bing.net/th?id=OIP.TKZ9Il1BRZpNAOeWr8hRPgAAAA&pid=Api&P=0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanphammoi`
--

CREATE TABLE `sanphammoi` (
  `id` int(11) NOT NULL,
  `tensp` varchar(250) NOT NULL,
  `giasp` varchar(100) NOT NULL,
  `hinhanh` text NOT NULL,
  `mota` text NOT NULL,
  `loai` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphammoi`
--

INSERT INTO `sanphammoi` (`id`, `tensp`, `giasp`, `hinhanh`, `mota`, `loai`) VALUES
(1, 'Laptop Dell Vostro V3568', '12200000', 'http://mauweb.monamedia.net/hanoicomputer/wp-content/uploads/2017/12/dell-V3568-XF6C61-01.jpg', 'Chip: Intel Core i5-7200U\r\nRAM: DDR4 4GB (2 khe cắm)\r\nỔ cứng: HDD 1TB\r\nChipset đồ họa: Intel HD Graphics 620\r\nMàn hình: 15.6 Inches\r\nHệ điều hành: Free Dos\r\nPin: 4 Cell Lithium-ion', 2),
(2, 'Apple Macbook Pro 2023', '46600000', 'https://cdn.tgdd.vn/Files/2020/12/21/1315201/macbook10_800x450.jpg', 'Bộ xử lý: Intel Core i5 dual-core 3.1GHz, Turbo Boost up to 3.5GHz, with 64MB of eDRAM\r\nRAM: 8GB 2133MHz LPDDR3 memory\r\nỔ cứng SSD: 512GB\r\nCard đồ hoạ: Intel Iris Plus Graphics 650\r\n', 2),
(3, 'Laptop HP Envy 13-ad074TU', '24280000', 'http://mauweb.monamedia.net/hanoicomputer/wp-content/uploads/2017/12/hp-envy-13-01.jpg', 'CPU Intel Core i7-7500U 2.7GHz up to 3.5GHz 4MB\r\nRAM 8GB LPDDR3 Onboard\r\nĐĩa cứng 256 GB PCIe® NVMe™ M.2 SSD\r\nCard đồ họa Intel® HD Graphics 620\r\nMàn hình 13.3 inch FHD (1920 x 1080) diagonal IPS BrightView micro-edge WLED-backlit', 2),
(4, 'Điện thoại iPhone 13 Pro', '33990000', 'https://tse1.mm.bing.net/th?id=OIP.IhFey9rIfedVre4_35eOMwHaHa&pid=Api&P=0', 'Kích thước màn hình 6.1 inches\r\nCông nghệ màn hình OLED\r\nCamera sau Camera góc rộng: 12MP, f/1.6\r\nCamera góc siêu rộng: 12MP, ƒ/2.4\r\nCamera trước 12MP, f/2.2\r\nChipset Apple A15\r\nDung lượng RAM 4 GB', 1),
(5, 'Samsung Galaxy Note 20 Ultra 5G', '20500000', 'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-sierra-blue-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1),
(6, 'Laptop Dell Vostro V3568', '12200000', 'http://mauweb.monamedia.net/hanoicomputer/wp-content/uploads/2017/12/dell-V3568-XF6C61-01.jpg', 'Chip: Intel Core i5-7200U\r\nRAM: DDR4 4GB (2 khe cắm)\r\nỔ cứng: HDD 1TB\r\nChipset đồ họa: Intel HD Graphics 620\r\nMàn hình: 15.6 Inches\r\nHệ điều hành: Free Dos\r\nPin: 4 Cell Lithium-ion', 2),
(7, 'Apple Macbook Pro 2023', '46600000', 'https://cdn.tgdd.vn/Files/2020/12/21/1315201/macbook10_800x450.jpg', 'Bộ xử lý: Intel Core i5 dual-core 3.1GHz, Turbo Boost up to 3.5GHz, with 64MB of eDRAM\r\nRAM: 8GB 2133MHz LPDDR3 memory\r\nỔ cứng SSD: 512GB\r\nCard đồ hoạ: Intel Iris Plus Graphics 650\r\n', 2),
(8, 'Laptop HP Envy 13-ad074TU', '24280000', 'http://mauweb.monamedia.net/hanoicomputer/wp-content/uploads/2017/12/hp-envy-13-01.jpg', 'CPU Intel Core i7-7500U 2.7GHz up to 3.5GHz 4MB\r\nRAM 8GB LPDDR3 Onboard\r\nĐĩa cứng 256 GB PCIe® NVMe™ M.2 SSD\r\nCard đồ họa Intel® HD Graphics 620\r\nMàn hình 13.3 inch FHD (1920 x 1080) diagonal IPS BrightView micro-edge WLED-backlit', 2),
(9, 'Điện thoại iPhone 13 Pro', '33990000', 'https://tse1.mm.bing.net/th?id=OIP.IhFey9rIfedVre4_35eOMwHaHa&pid=Api&P=0', 'Kích thước màn hình 6.1 inches\r\nCông nghệ màn hình OLED\r\nCamera sau Camera góc rộng: 12MP, f/1.6\r\nCamera góc siêu rộng: 12MP, ƒ/2.4\r\nCamera trước 12MP, f/2.2\r\nChipset Apple A15\r\nDung lượng RAM 4 GB', 1),
(10, 'Samsung Galaxy Note 20 Ultra 5G', '20500000', 'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-sierra-blue-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1),
(11, 'Laptop Dell Vostro V3568', '12200000', 'http://mauweb.monamedia.net/hanoicomputer/wp-content/uploads/2017/12/dell-V3568-XF6C61-01.jpg', 'Chip: Intel Core i5-7200U\r\nRAM: DDR4 4GB (2 khe cắm)\r\nỔ cứng: HDD 1TB\r\nChipset đồ họa: Intel HD Graphics 620\r\nMàn hình: 15.6 Inches\r\nHệ điều hành: Free Dos\r\nPin: 4 Cell Lithium-ion', 2),
(12, 'Apple Macbook Pro 2023', '46600000', 'https://cdn.tgdd.vn/Files/2020/12/21/1315201/macbook10_800x450.jpg', 'Bộ xử lý: Intel Core i5 dual-core 3.1GHz, Turbo Boost up to 3.5GHz, with 64MB of eDRAM\r\nRAM: 8GB 2133MHz LPDDR3 memory\r\nỔ cứng SSD: 512GB\r\nCard đồ hoạ: Intel Iris Plus Graphics 650\r\n', 2),
(13, 'Laptop HP Envy 13-ad074TU', '24280000', 'http://mauweb.monamedia.net/hanoicomputer/wp-content/uploads/2017/12/hp-envy-13-01.jpg', 'CPU Intel Core i7-7500U 2.7GHz up to 3.5GHz 4MB\r\nRAM 8GB LPDDR3 Onboard\r\nĐĩa cứng 256 GB PCIe® NVMe™ M.2 SSD\r\nCard đồ họa Intel® HD Graphics 620\r\nMàn hình 13.3 inch FHD (1920 x 1080) diagonal IPS BrightView micro-edge WLED-backlit', 2),
(14, 'Điện thoại iPhone 13 Pro', '33990000', 'https://tse1.mm.bing.net/th?id=OIP.IhFey9rIfedVre4_35eOMwHaHa&pid=Api&P=0', 'Kích thước màn hình 6.1 inches\r\nCông nghệ màn hình OLED\r\nCamera sau Camera góc rộng: 12MP, f/1.6\r\nCamera góc siêu rộng: 12MP, ƒ/2.4\r\nCamera trước 12MP, f/2.2\r\nChipset Apple A15\r\nDung lượng RAM 4 GB', 1),
(15, 'Samsung Galaxy Note 20 Ultra 5G', '20500000', 'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-sierra-blue-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1),
(16, 'Laptop Dell Vostro V3568', '12200000', 'http://mauweb.monamedia.net/hanoicomputer/wp-content/uploads/2017/12/dell-V3568-XF6C61-01.jpg', 'Chip: Intel Core i5-7200U\r\nRAM: DDR4 4GB (2 khe cắm)\r\nỔ cứng: HDD 1TB\r\nChipset đồ họa: Intel HD Graphics 620\r\nMàn hình: 15.6 Inches\r\nHệ điều hành: Free Dos\r\nPin: 4 Cell Lithium-ion', 2),
(17, 'Apple Macbook Pro 2023', '46600000', 'https://cdn.tgdd.vn/Files/2020/12/21/1315201/macbook10_800x450.jpg', 'Bộ xử lý: Intel Core i5 dual-core 3.1GHz, Turbo Boost up to 3.5GHz, with 64MB of eDRAM\r\nRAM: 8GB 2133MHz LPDDR3 memory\r\nỔ cứng SSD: 512GB\r\nCard đồ hoạ: Intel Iris Plus Graphics 650\r\n', 2),
(18, 'Laptop HP Envy 13-ad074TU', '24280000', 'http://mauweb.monamedia.net/hanoicomputer/wp-content/uploads/2017/12/hp-envy-13-01.jpg', 'CPU Intel Core i7-7500U 2.7GHz up to 3.5GHz 4MB\r\nRAM 8GB LPDDR3 Onboard\r\nĐĩa cứng 256 GB PCIe® NVMe™ M.2 SSD\r\nCard đồ họa Intel® HD Graphics 620\r\nMàn hình 13.3 inch FHD (1920 x 1080) diagonal IPS BrightView micro-edge WLED-backlit', 2),
(19, 'Điện thoại iPhone 15 Pro', '33990000', 'https://tse1.mm.bing.net/th?id=OIP.IhFey9rIfedVre4_35eOMwHaHa&pid=Api&P=0', 'Kích thước màn hình 6.1 inches\nCông nghệ màn hình OLED\nCamera sau Camera góc rộng: 12MP, f/1.6\nCamera góc siêu rộng: 12MP, ƒ/2.4\nCamera trước 12MP, f/2.2\nChipset Apple A15\nDung lượng RAM 4 GB', 1),
(20, 'Samsunggg1', '25000000', 'https://tse1.mm.bing.net/th?id=OIP.IhFey9rIfedVre4_35eOMwHaHa&pid=Api&P=0', 'Kích thước màn hình 6.1 inches\nCông nghệ màn hình OLED\nCamera sau Camera góc rộng: 12MP, f/1.6\nCamera góc siêu rộng: 12MP, ƒ/2.4\nCamera trước 12MP, f/2.2\nChipset Apple A15\nDung lượng RAM 4 GB', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `pass` varchar(250) NOT NULL,
  `username` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `username`, `mobile`) VALUES
(25, 'Kh1@gmail.com', '123', 'Khachhang', '0123456789'),
(30, 'Admin@gmail.com', '123', 'Admin', '0123456789');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanphammoi`
--
ALTER TABLE `sanphammoi`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `sanphammoi`
--
ALTER TABLE `sanphammoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
