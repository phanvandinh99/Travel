USE [master]
GO
/****** Object:  Database [TravelDB]    Script Date: 12/05/2022 01:31:08 ******/
CREATE DATABASE [TravelDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravelDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TravelDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TravelDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TravelDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TravelDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravelDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TravelDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TravelDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TravelDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TravelDB] SET  MULTI_USER 
GO
ALTER DATABASE [TravelDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TravelDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TravelDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TravelDB] SET QUERY_STORE = OFF
GO
USE [TravelDB]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 12/05/2022 01:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[MaBaiViet] [int] IDENTITY(1,1) NOT NULL,
	[TenBaiViet] [nvarchar](200) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[AnhBia] [nvarchar](max) NULL,
	[NgayDang] [datetime] NOT NULL,
	[NgayCapNhat] [datetime] NULL,
	[LuotThich] [int] NULL,
	[An] [int] NULL,
	[MaTheLoai] [int] NULL,
	[MaTaiKhoan] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBaiViet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 12/05/2022 01:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](200) NOT NULL,
	[SoLuongTheLoai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 12/05/2022 01:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/05/2022 01:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [int] NULL,
	[QueQuan] [nvarchar](200) NULL,
	[SDT] [varchar](12) NOT NULL,
	[MaQuyen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 12/05/2022 01:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](200) NOT NULL,
	[SoLuongBaiViet] [int] NULL,
	[MaDanhMuc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BaiViet] ON 

INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [AnhBia], [NgayDang], [NgayCapNhat], [LuotThich], [An], [MaTheLoai], [MaTaiKhoan]) VALUES (4, N'Hoạt động du lịch Lai Châu trong kỳ nghỉ Lễ ', N'<p>Trong 04 ng&agrave;y nghỉ Lễ Chiến thắng 30/4 v&agrave; Ng&agrave;y Quốc tế lao động 01/5/2022, tỉnh Lai Ch&acirc;u đ&oacute;n tr&ecirc;n 17.000 lượt kh&aacute;ch đến tham quan, t&igrave;m hiểu.</p>

<p>Địa điểm được du kh&aacute;ch lựa chọn để thăm quan chủ yếu như: th&agrave;nh phố Lai Ch&acirc;u 5.600 lượt, Than Uy&ecirc;n 5.527 lượt, Tam Đường 4.500 lượt, Phong Thổ 599 lượt&hellip; (c&aacute;c điểm được du kh&aacute;ch quan t&acirc;m nhiều như Cầu k&iacute;nh rồng m&acirc;y, Bản Thẳm, Động Ti&ecirc;n Sơn, Bản N&agrave; Khương, Bản Lao Chải 1, Bản S&igrave; Th&acirc;u Chải, &nbsp;đồi th&ocirc;ng Tả L&egrave;ng, bản Sin Suối Hồ, đồi th&ocirc;ng Than Uy&ecirc;n, Love Hill Than Uy&ecirc;n, Phố đi bộ Than Uy&ecirc;n&hellip;).</p>

<p>Để chủ động trong c&ocirc;ng t&aacute;c đ&oacute;n kh&aacute;ch du lịch, Sở Văn h&oacute;a, Thể thao v&agrave; Du lịch đ&atilde; ban h&agrave;nh C&ocirc;ng văn số 637/SVHTTDL-QLDL ng&agrave;y 25/4/2022 về việc đảm bảo c&aacute;c hoạt động du lịch trong dịp nghỉ Lễ 30/4 v&agrave; Ng&agrave;y Quốc tế lao động 01/5 phối hợp với Phòng Văn hóa và Th&ocirc;ng tin c&aacute;c huy&ecirc;̣n, th&agrave;nh phố chỉ đạo chỉ đạo c&aacute;c đơn vị kinh doanh dịch vụ du lịch tr&ecirc;n địa b&agrave;n thực hi&ecirc;̣n tốt c&aacute;c nội dung đảm bảo điều kiện phục vụ du lịch</p>
', N'anh-dep-lai-chau-2021.jpg', CAST(N'2022-05-11T20:03:07.330' AS DateTime), CAST(N'2022-05-11T20:04:00.003' AS DateTime), 0, 0, 2, N'Admin')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [AnhBia], [NgayDang], [NgayCapNhat], [LuotThich], [An], [MaTheLoai], [MaTaiKhoan]) VALUES (5, N'Du lịch Lai Châu: Những điểm đến nổi bật', N'<div class="item-content-content nopadding row"><strong>C&aacute;ch thủ đ&ocirc; H&agrave; Nội gần 400 km, tỉnh Lai Ch&acirc;u c&oacute; 9.068,78 km2 diện t&iacute;ch tự nhi&ecirc;n, d&acirc;n số to&agrave;n tỉnh năm 2019 l&agrave; 460.196 người.</strong></div>

<div class="item-content-content nopadding row">Ẩn m&igrave;nh trong bạt ng&agrave;n n&uacute;i rừng T&acirc;y Bắc, b&ecirc;n d&atilde;y Ho&agrave;ng Li&ecirc;n Sơn h&ugrave;ng vĩ, Lai Ch&acirc;u được thi&ecirc;n nhi&ecirc;n ban tặng những m&oacute;n qu&agrave; v&ocirc; gi&aacute;. Với kh&iacute; hậu trong l&agrave;nh, m&aacute;t mẻ, tỉnh Lai Ch&acirc;u c&oacute; nhiều cảnh quan thi&ecirc;n nhi&ecirc;n v&agrave; di t&iacute;ch danh thắng c&oacute; gi&aacute; trị như: Khu Du lịch sinh th&aacute;i đỉnh đ&egrave;o Ho&agrave;ng Li&ecirc;n, Cầu k&iacute;nh Rồng M&acirc;y, động Pusamcap, th&aacute;c T&aacute;c T&igrave;nh, đỉnh Putaleng, đỉnh Bạch Mộc Lương Tử, đỉnh Tả Li&ecirc;n Sơn&hellip;v&agrave; 27 di t&iacute;ch lịch sử văn h&oacute;a v&agrave; danh lam thắng cảnh được xếp hạng di t&iacute;ch cấp quốc gia v&agrave; cấp tỉnh&hellip; Lai Ch&acirc;u c&ograve;n l&agrave; nơi sinh sống của 20 d&acirc;n tộc với những n&eacute;t bản sắc văn h&oacute;a độc đ&aacute;o v&agrave; th&uacute; vị như: bản Sin Suối Hồ, bản V&agrave;ng Pheo, bản S&igrave; Th&acirc;u Chải, bản Hon, bản Lao Chải, bản Thẳm&hellip;</div>

<div class="item-content-content nopadding row">B&ecirc;n cạnh đ&oacute; l&agrave; những lễ hội truyền thống, phong tục tập qu&aacute;n, trang phục, l&agrave;n liệu d&acirc;n ca, những m&oacute;n ăn truyền thống hấp dẫn, những đặc sản kh&aacute;c biệt v&agrave; ấn tượng kh&oacute; c&oacute; thể t&igrave;m thấy ở nơi n&agrave;o kh&aacute;c&hellip;</div>

<div class="item-content-content nopadding row">&nbsp;</div>

<div class="item-content-content nopadding row">&nbsp;</div>
', N'AnhMacDinh.jpg', CAST(N'2022-05-11T21:29:13.960' AS DateTime), CAST(N'2022-05-11T21:36:42.717' AS DateTime), 0, 0, 2, N'Admin')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [AnhBia], [NgayDang], [NgayCapNhat], [LuotThich], [An], [MaTheLoai], [MaTaiKhoan]) VALUES (6, N'Du lịch Lai Châu: 10 điểm đến đẹp và những đặc sản ngon', N'<div class="content items-contents-scope items-contents-wrapper">
<h1><span style="font-size:18px">Đến&nbsp;Lai Ch&acirc;u l&agrave; đến với những đỉnh n&uacute;i đẹp h&ugrave;ng vĩ của đất nước, nơi đ&acirc;y c&oacute; hơn 20 d&acirc;n tộc sinh sống n&ecirc;n c&oacute; rất nhiều n&eacute;t kh&aacute;c biệt về văn h&oacute;a nơi đ&acirc;y.&nbsp;Du lịch Lai Ch&acirc;u bạn sẽ c&oacute; cơ hội kh&aacute;m ph&aacute; những đỉnh, đ&egrave;o nổi tiếng của nước ta. Ở đ&oacute;, bạn thấy m&igrave;nh với b&aacute;t ng&aacute;t thi&ecirc;n nhi&ecirc;n, h&ugrave;ng vĩ với những đỉnh n&uacute;i v&agrave; bồng bềnh với m&acirc;y trắng.</span></h1>

<div class="items-detail"><!--?xml encoding="utf-8" ?-->
<p style="text-align:justify"><strong>Du lịch Lai Ch&acirc;u: 10 điểm đến đẹp h&ugrave;ng vĩ</strong></p>

<p style="text-align:justify"><strong>1. Đ&egrave;o &Ocirc; Quy Hồ:&nbsp;</strong></p>

<p style="text-align:center"><a href="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/7.7.du_lich_Lai_Chau_1.jpg" target="_blank"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/7.7.du_lich_Lai_Chau_1.jpg" style="border-style:solid; border-width:1px; height:393px; width:700px" /></a></p>

<p style="text-align:center"><em>Đ&egrave;o &Ocirc; Quy Hồ</em></p>

<p style="text-align:justify">Cung đường đ&egrave;o d&agrave;i gần 50km, trong đ&oacute; 2/3 con đường thuộc địa phận huyện Tam Đường - Lai Ch&acirc;u, 1/3 c&ograve;n lại nằm ở ph&iacute;a Sa Pa - L&agrave;o Cai. Vượt qua cổng Vườn Quốc gia Ho&agrave;ng Li&ecirc;n chừng v&agrave;i c&acirc;y số l&agrave; tới đỉnh đ&egrave;o &Ocirc; Quy Hồ, đ&acirc;y cũng ch&iacute;nh l&agrave; điểm ranh giới giữa hai tỉnh miền n&uacute;i ph&iacute;a Bắc L&agrave;o Cai v&agrave; Lai Ch&acirc;u, uốn lượn quanh d&atilde;y n&uacute;i Ho&agrave;ng Li&ecirc;n, nơi c&oacute; đỉnh Phanxipan - n&oacute;c nh&agrave; Đ&ocirc;ng Dương lộng gi&oacute; tr&ecirc;n đỉnh cao 3.414m. Đ&egrave;o &Ocirc; Quy Hồ từ l&acirc;u đ&atilde; nổi tiếng kh&ocirc;ng chỉ v&igrave; vị tr&iacute; giao th&ocirc;ng quan trọng m&agrave; c&ograve;n bởi vẻ đẹp h&ugrave;ng vĩ bậc nhất <a href="https://dulichkhatvongviet.com/kinh-nghiem-du-lich-tay-bac/" target="_blank">T&acirc;y Bắc</a>.</p>

<p style="text-align:justify"><strong>2. Cao nguy&ecirc;n S&igrave;n Hồ</strong></p>

<p style="text-align:center"><a href="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/7.7.du_lich_Lai_Chau_2.jpg" target="_blank"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/7.7.du_lich_Lai_Chau_2.jpg" style="border-style:solid; border-width:1px; height:466px; width:700px" /></a></p>

<p style="text-align:center"><em>Cao nguy&ecirc;n S&igrave;n Hồ</em></p>

<p style="text-align:justify">C&aacute;ch trung t&acirc;m th&agrave;nh phố Lai Ch&acirc;u khoảng 60km, cao nguy&ecirc;n S&igrave;n Hồ nằm tr&ecirc;n độ cao hơn 1500m. Được xem như Sa Pa thứ hai của khu vực T&acirc;y Bắc, thời tiết trong ng&agrave;y ở đ&acirc;y mang đặc điểm của 4 m&ugrave;a trong năm, nhiệt độ trung b&igrave;nh năm khoảng 18 độ C. Với kh&iacute; hậu quanh năm m&aacute;t mẻ cao nguy&ecirc;n S&igrave;n Hồ rất th&iacute;ch hợp cho c&aacute;c loại c&acirc;y dược liệu như: tam thất, t&aacute;o m&egrave;o, astiso, c&acirc;y tắm l&aacute; thuốc&hellip;c&ugrave;ng nhiều giống rau, hoa quả &ocirc;n đới đặc sắc như mận, đ&agrave;o, l&ecirc;&hellip;ph&aacute;t triển.</p>

<p style="text-align:justify">Cao nguy&ecirc;n S&igrave;n Hồ nằm giữa trập tr&ugrave;ng n&uacute;i đ&aacute;, bạt ng&agrave;n rừng nguy&ecirc;n sinh, giữa biển m&acirc;y m&ugrave;, nơi đ&acirc;y với những thửa ruộng bậc thang uốn lượn, những bản l&agrave;ng nằm thấp tho&aacute;ng b&ecirc;n sườn n&uacute;i&hellip;</p>

<p style="text-align:justify">L&ecirc;n thăm cao nguy&ecirc;n S&igrave;n Hồ du kh&aacute;ch sẽ c&oacute; dịp được ngắm nh&igrave;n thi&ecirc;n nhi&ecirc;n h&ugrave;ng vĩ của n&uacute;i rừng, được kh&aacute;m ph&aacute; những phong tục tập qu&aacute;n độc đ&aacute;o trong đời sống sinh hoạt của b&agrave; con d&acirc;n bản v&agrave; đặc biệt l&agrave; được thưởng thức những m&oacute;n ăn mang đậm hương vị của n&uacute;i rừng như thịt tr&acirc;u quấn l&aacute; lốt, d&ecirc; hấp, lợn bản, c&aacute; suối, thắng cố, x&ocirc;i nếp nương &hellip;</p>

<p style="text-align:justify"><strong>3. Đồi ch&egrave; T&acirc;n Uy&ecirc;n</strong></p>

<p style="text-align:justify">Được trải d&agrave;i dọc theo quốc lộ 32, ch&egrave; c&oacute; tuổi đời từ 40 &ndash; 50 năm với quy m&ocirc; gần 2000 ha, nằm c&aacute;ch trung t&acirc;m thị trấn T&acirc;n Uy&ecirc;n kh&ocirc;ng xa, đồi ch&egrave; t&acirc;n Uy&ecirc;n hiện l&agrave; điểm đến y&ecirc;u th&iacute;ch của nhiều người khi đến với T&acirc;n Uy&ecirc;n.</p>

<p style="text-align:justify">Tới đ&acirc;y bạn sẽ được tận hưởng cảnh vật v&agrave; thi&ecirc;n nhi&ecirc;n trong l&agrave;nh. Đ&acirc;y cũng l&agrave; nơi nhiều người chọn để chụp ảnh cưới, hoặc thực hiện một bộ ảnh l&atilde;ng mạn trong đồng ch&egrave; xanh mướt, giữa lấp l&aacute;nh nắng v&agrave;ng. Ch&egrave; cũng l&agrave; một trong những c&acirc;y kinh tế ch&iacute;nh của thị trấn với sản phẩm ch&egrave; nổi tiếng khắp cả nước như ch&egrave; San Tuyết, &Ocirc; long, Thanh T&acirc;m....</p>

<p style="text-align:justify"><strong>4. Bạch Mộc&nbsp;Lương Tử</strong></p>

<p style="text-align:center"><a href="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/7.7.du_lich_Lai_Chau_3.jpg" target="_blank"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/7.7.du_lich_Lai_Chau_3.jpg" style="border-style:solid; border-width:1px; height:393px; width:700px" /></a></p>

<p style="text-align:center"><em>Bạch Mộc&nbsp;Lương Tử</em></p>

<p style="text-align:justify">Đỉnh Bạch Mộc Lương Tử thuộc địa phận x&atilde; Sin S&uacute;i Hồ. Với độ cao 3.045m so với mực nước biển, Bạch Mộc Lương Tử l&agrave; một trong 5 ngọn n&uacute;i cao nhất Việt Nam v&agrave; Đ&ocirc;ng Nam &Aacute; tr&ecirc;n địa b&agrave;n tỉnh Lai Ch&acirc;u. Chinh phục Bạch Mộc Lương Tử lu&ocirc;n l&agrave; một th&aacute;ch thức nhưng cũng đầy hấp dẫn đối với c&aacute;c phượt thủ. Kh&ocirc;ng phải l&agrave; đỉnh n&uacute;i cao nhất, nhưng Bạch Mộc Lương Tử được biết đến l&agrave; đỉnh n&uacute;i c&oacute; cảnh quan đẹp nhất, v&agrave; cung đường kh&aacute;m ph&aacute; th&uacute; vị nhất.</p>

<p style="text-align:justify"><strong>5. Đỉnh Pu Si Lung</strong></p>

<p style="text-align:justify">L&agrave; ngọn n&uacute;i hoang sơ, b&iacute; ẩn v&agrave; quyến rũ bậc nhất Việt Nam, đỉnh Pu Si Lung huyền thoại nằm ở bi&ecirc;n giới Việt Nam v&agrave; Trung Quốc thuộc x&atilde; Pa Vệ Sử, huyện Mường T&egrave;, tỉnh Lai Ch&acirc;u với độ cao 3083m được mệnh danh l&agrave; n&oacute;c nh&agrave; bi&ecirc;n giới lu&ocirc;n l&agrave; điểm đến trong mơ của c&aacute;c phượt thủ ưa kh&aacute;m ph&aacute;.</p>

<p style="text-align:justify"><strong>6. Khu bảo tồn thi&ecirc;n nhi&ecirc;n Mường T&egrave;</strong></p>

<p style="text-align:justify">Khu bảo tồn thi&ecirc;n nhi&ecirc;n Mường T&egrave; nằm tr&ecirc;n địa b&agrave;n 2 x&atilde; T&agrave; Tổng v&agrave; M&ugrave; Cả, l&agrave; nơi c&oacute; hệ thực vật v&agrave; thảm thực vật v&ocirc; c&ugrave;ng phong ph&uacute; v&agrave; đa dạng, nhất l&agrave; hệ sinh th&aacute;i rừng. Kết quả khảo s&aacute;t, điều tra của huyện Mường T&egrave; cho thấy c&oacute; 542 lo&agrave;i thực vật, trong đ&oacute; c&oacute; 57 lo&agrave;i thực vật qu&yacute; hiếm đ&atilde; được ghi trong s&aacute;ch đỏ Việt Nam v&agrave; 7 lo&agrave;i&nbsp;trong s&aacute;ch đỏ thế giới, đa số l&agrave; những lo&agrave;i thuốc qu&yacute; hiếm; 22 lo&agrave;i đặc hữu hẹp cho v&ugrave;ng T&acirc;y Bắc, 7 lo&agrave;i nằm trong Nghị định số 32 của Ch&iacute;nh phủ v&agrave; 6 lo&agrave;i đặc trưng cho v&ugrave;ng T&acirc;y Bắc: Tr&aacute;m đen, ch&ograve; nước, giổi xương, ch&ograve; n&acirc;u, đinh, sến, l&aacute;t hoa</p>

<p style="text-align:justify"><strong>7. Đỉnh Pu Ta Leng</strong></p>

<p style="text-align:justify">Nằm c&aacute;ch th&agrave;nh phố Lai Ch&acirc;u khoảng 20 km về ph&iacute;a Đ&ocirc;ng Bắc, Pu Ta Leng c&oacute; độ cao 3049 m. Nếu Fansipan được v&iacute; l&agrave; &ldquo;n&oacute;c nh&agrave; của Đ&ocirc;ng Dương&rdquo; th&igrave; Pu Ta Leng ch&iacute;nh l&agrave; n&oacute;c nh&agrave; thứ hai m&agrave; c&aacute;c phượt thủ hay c&aacute;c bạn trẻ ham m&ecirc; th&aacute;ch thức muốn chinh phục d&ugrave; chỉ một lần. H&agrave;ng năm, từ th&aacute;ng 10 đến th&aacute;ng 3 năm sau l&agrave; khoảng thời gian đẹp nhất m&agrave; du kh&aacute;ch n&ecirc;n lựa chọn để chinh phục đỉnh Pu Ta Leng bởi vẻ đẹp của thi&ecirc;n nhi&ecirc;n c&ugrave;ng c&aacute;c loại hoa rừng đặc biệt l&agrave; hoa đỗ quy&ecirc;n nở rộ từ khắp sườn n&uacute;i l&ecirc;n tới đỉnh.</p>

<p style="text-align:justify">Chinh phục đỉnh Pu Ta Leng du kh&aacute;ch sẽ phải vượt qua những khu rừng nguy&ecirc;n sinh, những th&aacute;c nước, khe suối hay những thảm thực vật phong ph&uacute;&hellip;để rồi khi l&ecirc;n tới đỉnh sẽ thấy những ốc đảo ẩn hiển giữa đại dương m&acirc;y tr&ecirc;n độ cao 3.049m.</p>

<p style="text-align:justify">Tầng tầng lớp lớp m&acirc;y trắng giữa m&agrave;u xanh dương của bầu trời v&agrave; m&agrave;u xanh l&aacute; của n&uacute;i rừng nơi đ&acirc;y giống như một bức tranh tuyệt vời. C&ugrave;ng với Pu Ta Leng, Lai Ch&acirc;u c&ograve;n sở hữu th&ecirc;m 5 đỉnh n&uacute;i kh&aacute;c trong Top 10 ngọn n&uacute;i cao nhất Việt Nam. Theo thứ tự sẽ l&agrave; Pu Si Lung (3.083m), Pu Ta Leng (3.049m), Bạch Mộc Lương Tử (3.045m), Khang Su Văn (3.012m), Tả Li&ecirc;n (2.993m), Bạch Mộc Lương (2.976m)</p>

<p style="text-align:justify"><strong>8. C&aacute;nh đồng Mường Than</strong></p>

<p style="text-align:justify">Mường Than l&agrave; 1 trong 4 c&aacute;nh đồng lớn nhất v&ugrave;ng T&acirc;y Bắc thuộc địa phận x&atilde; Mường Than huyện Than Uy&ecirc;n. C&aacute;nh đồng m&ecirc;nh m&ocirc;ng kh&ocirc;ng chỉ tạo vẻ đẹp n&ecirc;n thơ giữa n&uacute;i rừng h&ugrave;ng vĩ c&ograve;n l&agrave; nơi cho ra nhiều sản vật nổi tiếng của địa phương như: Ng&ocirc; non bao tử, khoai lang Ho&agrave;ng Long, gạo S&eacute;n C&ugrave;, gạo T&aacute;m...</p>

<p style="text-align:justify"><strong>9. Quần thể hang động Pu Sam C&aacute;p</strong></p>

<p style="text-align:justify">C&aacute;ch th&agrave;nh phố Lai Ch&acirc;u khoảng 6km, b&ecirc;n tỉnh lộ 129 nối th&agrave;nh phố Lai Ch&acirc;u với huyện S&igrave;n Hồ, quần thể hang động Pu Sam Cap được v&iacute; l&agrave; &ldquo;T&acirc;y Bắc đệ nhất động&rdquo;. Hiện Pu Sam Cap c&oacute; hai động đang đ&oacute;n kh&aacute;ch du lịch l&agrave; động Thi&ecirc;n M&ocirc;n v&agrave; động Thi&ecirc;n Đường với nhiều nhũ đ&aacute; kỳ ảo, huyền b&iacute;, ẩn chứa nhiều c&acirc;u chuyện cảm động của con người miền n&uacute;i. Pu Sam Cap lu&ocirc;n l&agrave; lời mời gọi hấp dẫn đối với mọi du kh&aacute;ch gần xa.</p>

<p style="text-align:justify"><strong>10. S&igrave; Th&acirc;u Chải</strong></p>

<p style="text-align:justify">Nằm c&aacute;ch trung t&acirc;m thị trấn Tam Đường 6km Bản S&igrave; Th&acirc;u Chải hiện ra thật thơ mộng, một bản nhỏ của người Dao với tr&ecirc;n 60 hộ d&acirc;n sinh sống, v&agrave;o những ng&agrave;y trời nhiều m&acirc;y, du kh&aacute;ch c&oacute; thể h&ograve;a m&igrave;nh c&ugrave;ng những đ&aacute;m m&acirc;y tr&ocirc;i lơ lửng. Bản S&igrave; Th&acirc;u Chải hiện ra thật thơ mộng đắm say m&agrave; kh&oacute; qu&ecirc;n. Đến S&igrave; Th&acirc;u Chải để trải nghiệm đời sống sinh hoạt, sản xuất, thưởng thức ẩm thực d&acirc;n tộc, tham gia tr&ograve; chơi d&acirc;n gian...</p>

<p style="text-align:justify"><em><strong>6 đặc sản n&ecirc;n thử khi du lịch Lai Ch&acirc;u</strong></em></p>

<p style="text-align:justify">- Lợn cắp n&aacute;ch: Lợn cắp n&aacute;ch l&agrave; loại lợn đặc sản của v&ugrave;ng cao T&acirc;y Bắc. Giống lợn n&agrave;y được b&agrave; con d&acirc;n tộc thả r&ocirc;ng trong rừng, tự đi kiếm ăn n&ecirc;n mỗi con chỉ nặng chừng 10 - 15 kg. Do ăn c&aacute;c loại l&aacute; c&acirc;y, rau cỏ trong rừng n&ecirc;n thịt của ch&uacute;ng rất chắc v&agrave; thơm ngon. Lợn cắp n&aacute;ch được chế biến th&agrave;nh nhiều m&oacute;n ngon như hấp, nướng, nấu giả cầy, hầm, nấu canh&hellip; M&oacute;n n&agrave;o cũng được tẩm ướp v&agrave; nấu c&ugrave;ng c&aacute;c loại l&aacute;, hạt mang phong vị n&uacute;i rừng, mang lại cảm gi&aacute;c lạ miệng, đặc biệt cho du kh&aacute;ch lần đầu thưởng thức.</p>

<p style="text-align:justify">- C&aacute; bống v&ugrave;i tro: Nếu c&oacute; dịp đến với huyện Phong Thổ, bạn chớ bỏ qua m&oacute;n c&aacute; bống v&ugrave;i tro - đặc sản của đồng b&agrave;o d&acirc;n tộc Th&aacute;i. C&aacute; bống c&oacute; sẵn ở c&aacute;c con s&ocirc;ng, suối, sau khi bắt về được sơ chế sạch sẽ v&agrave; tẩm ướp với c&aacute;c gia vị đ&atilde; được băm nhỏ như sả, ớt, gừng, hạt ti&ecirc;u, mắc kh&eacute;n, h&uacute;ng, hom&hellip; Sau khi ướp khoảng 15 - 30 ph&uacute;t, c&aacute; sẽ được g&oacute;i gọn trong l&aacute; dong v&agrave; v&ugrave;i v&agrave;o tro n&oacute;ng, khoảng 30 ph&uacute;t lại lật lại một lần, cứ như thế v&agrave;i lần c&aacute; sẽ ch&iacute;n.</p>

<p style="text-align:justify">- Pa Pỉnh Tộp: Pa pỉnh tộp (c&aacute; gập nướng) l&agrave; m&oacute;n ăn kh&aacute; cầu kỳ, thường được d&ugrave;ng trong c&aacute;c bữa ăn khi gia đ&igrave;nh c&oacute; kh&aacute;ch qu&yacute;. Người ta chọn những con c&aacute; ch&eacute;p tươi, c&ograve;n nguy&ecirc;n con để nướng. Sau khi s&aacute;t qua ch&uacute;t muối c&ugrave;ng ớt bột kh&ocirc; để khử m&ugrave;i tanh cho c&aacute;, người l&agrave;m tẩm ướp gia vị l&agrave; c&aacute;c loại rau thơm như quả mắc kh&eacute;n (một loại hạt ti&ecirc;u rừng), gừng, tỏi, sả, h&agrave;nh, rau thơm rừng, ớt bột... băm nhỏ, trộn lẫn với nhau v&agrave; s&aacute;t đều l&ecirc;n m&igrave;nh, đồng thời nhồi v&agrave;o trong bụng c&aacute;.</p>

<p style="text-align:center"><a href="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/7.7.du_lich_Lai_Chau_4.jpg" target="_blank"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/7.7.du_lich_Lai_Chau_4.jpg" style="border-style:solid; border-width:1px; height:526px; width:700px" /></a></p>

<p style="text-align:center"><em>X&ocirc;i t&iacute;m</em></p>

<p style="text-align:justify">- X&ocirc;i t&iacute;m: L&agrave; m&oacute;n ăn truyền thống của người d&acirc;n tộc v&ugrave;ng cao Lai Ch&acirc;u, x&ocirc;i t&iacute;m thể hiện sự kh&eacute;o l&eacute;o của đ&ocirc;i b&agrave;n tay trong c&aacute;ch chế biến của người phụ nữ. Gạo nếp nương được ng&acirc;m kỹ từ 6 -8 tiếng trước khi đem đồ. M&agrave;u t&iacute;m đặc trưng v&agrave; hấp dẫn của x&ocirc;i được nhuộm bằng loại c&acirc;y c&oacute; t&ecirc;n l&agrave; &quot;khẩu cắm&quot; (một loại l&aacute; rừng).</p>

<p style="text-align:justify">- R&ecirc;u đ&aacute; nướng: R&ecirc;u đ&aacute; l&agrave; loại rau sạch của người d&acirc;n Lai Ch&acirc;u. Người ta phải rất kỳ c&ocirc;ng khi lấy ch&uacute;ng về từ c&aacute;c tảng đ&aacute; b&ecirc;n suối để chế biến th&agrave;nh c&aacute;c m&oacute;n ăn ngon cho gia đ&igrave;nh như nấu canh, nướng, x&agrave;o... Khi sơ chế r&ecirc;u, người l&agrave;m cần vớt r&ecirc;u cho v&agrave;o rổ, rửa qua nước sạch nhằm loại bỏ c&aacute;t v&agrave; c&aacute;c chất bẩn, bỏ l&ecirc;n một tảng đ&aacute; to, hoặc thớt rồi d&ugrave;ng một kh&uacute;c gỗ to để đập, cứ l&agrave;m như thế v&agrave;i lần th&igrave; mới c&oacute; thể đem nấu.</p>

<p style="text-align:justify">- Nộm rau dớn: Rau dớn mọc ở khắp nơi trong vườn nh&agrave;, bờ ao, bờ suối n&ecirc;n thường c&oacute; mặt trong bữa cơm hằng ng&agrave;y của người Th&aacute;i ở Lai Ch&acirc;u. C&aacute;ch l&agrave;m m&oacute;n n&agrave;y cũng kh&aacute; đơn giản: chọn những ngọn non rửa sạch, phơi nắng cho kh&ocirc; rồi đồ ch&iacute;n, sau đ&oacute; trộn đều c&ugrave;ng rau thơm, ớt, gừng, tỏi, m&igrave; ch&iacute;nh, muối v&agrave; vắt th&ecirc;m ch&uacute;t chanh tươi.&nbsp;</p>

<p style="text-align:right"><strong>BTV</strong></p>
</div>
</div>
', N'Gioi-thieu-Lai-Chau-1.jpg', CAST(N'2022-05-11T21:56:46.703' AS DateTime), CAST(N'2022-05-11T22:14:05.883' AS DateTime), 0, 0, 3, N'Admin')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [AnhBia], [NgayDang], [NgayCapNhat], [LuotThich], [An], [MaTheLoai], [MaTaiKhoan]) VALUES (19, N'Du lịch Lai Châu: 10 điểm đến đẹp và những đặc sản ngon', N'<p>a</p>
', N'Thuy-dien-LC-24.jpg', CAST(N'1999-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:43:44.950' AS DateTime), 0, 0, 3, N'Admin')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [AnhBia], [NgayDang], [NgayCapNhat], [LuotThich], [An], [MaTheLoai], [MaTaiKhoan]) VALUES (20, N'Lai Châu - điểm dừng chân thú vị của du khách', N'<div class="content items-contents-scope items-contents-wrapper">
<h1>Nằm kẹp giữa hai d&atilde;y n&uacute;i cao Ho&agrave;ng Li&ecirc;n Sơn (ph&iacute;a Đ&ocirc;ng) v&agrave; Pu Sam C&aacute;p (ph&iacute;a T&acirc;y), dọc theo quốc lộ 4D, th&agrave;nh phố Lai Ch&acirc;u mấy năm gần đ&acirc;y trở th&agrave;nh điểm dừng ch&acirc;n th&uacute; vị của nhiều du kh&aacute;ch.</h1>

<div class="items-detail"><!--?xml encoding="utf-8" ?-->
<p style="text-align:justify">Th&agrave;nh phố cao nguy&ecirc;n miền T&acirc;y Bắc - Lai Ch&acirc;u được th&agrave;nh lập từ ng&agrave;y 27/12/2013. T&ocirc;i đ&atilde; nhiều lần qua lại v&ugrave;ng đất n&agrave;y, từ khi n&oacute; c&ograve;n l&agrave; một thị trấn nhỏ thuộc huyện Phong Thổ tỉnh Lai Ch&acirc;u cũ (bao gồm cả tỉnh Điện Bi&ecirc;n ng&agrave;y nay). Khi Lai Ch&acirc;u chia l&agrave;m hai, thị x&atilde; tỉnh lỵ tỉnh Lai Ch&acirc;u mới được chuyển về đ&acirc;y, rồi to&agrave; ngang d&atilde;y dọc được dựng x&acirc;y, đường x&aacute; phong quang, nh&agrave; cửa mọc l&ecirc;n san s&aacute;t, cũng chỉ lướt qua m&agrave; kh&ocirc;ng c&oacute; dịp nghỉ lại. Cho đến đầu th&aacute;ng 5/2020, trong chuyến đi Mường T&egrave; (thuộc tỉnh Lai Ch&acirc;u) mới thực sự được hưởng trọn vẹn một đ&ecirc;m y&ecirc;n tĩnh ở th&agrave;nh phố trẻ n&agrave;y.</p>

<p style="text-align:justify">Bạn b&egrave; rủ nhau ra phố, loanh quanh mấy đoạn đường gần khu vực quảng trường lớn v&agrave; c&ocirc;ng vi&ecirc;n, nơi c&oacute; hồ nước rộng trong vắt, ban đ&ecirc;m đ&egrave;n trang tr&iacute; thắp s&aacute;ng như ng&agrave;y hội. Ngồi tr&ecirc;n vỉa h&egrave; tho&aacute;ng m&aacute;t rộng r&atilde;i, thong thả thưởng thức c&aacute;c loại m&aacute;t-cha - sản phẩm của c&acirc;y ch&egrave; Lai Ch&acirc;u. C&aacute;c bạn đồng nghiệp hồ hởi khoe rằng giờ đ&acirc;y thương hiệu ch&egrave; &ldquo;M&aacute;t-cha Tam Đường&rdquo; đ&atilde; trở n&ecirc;n nổi tiếng. Những b&uacute;p ch&egrave; sạch sản xuất theo c&ocirc;ng nghệ Nhật Bản chắp c&aacute;nh cho hai tiếng &ldquo;Lai Ch&acirc;u&rdquo; bay xa.</p>

<p style="text-align:center"><a href="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/14.12._Diem_dung_chan_thu_vi_cua_du_khach_1.jpg" target="_blank"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/14.12._Diem_dung_chan_thu_vi_cua_du_khach_1.jpg" style="border-style:solid; border-width:1px; height:465px; width:700px" /></a></p>

<p style="text-align:center"><em>Đường v&agrave;o bản S&ugrave;ng Ph&agrave;i, Lai Ch&acirc;u.</em></p>

<p style="text-align:justify">Đ&ecirc;m th&agrave;nh phố thanh b&igrave;nh qu&aacute;. Xe m&aacute;y để tr&ecirc;n vỉa h&egrave; kh&ocirc;ng cần kho&aacute;. Những chiếc xe m&aacute;y, &ocirc; t&ocirc; ngược xu&ocirc;i tr&ecirc;n đường, gặp t&iacute;n hiệu đ&egrave;n đỏ l&agrave; dừng lại d&ugrave; đoạn đường rộng r&atilde;i, vắng tanh. Những camera giao th&ocirc;ng đặt ở c&aacute;c ng&atilde; tư đường l&agrave;m thay c&ocirc;ng việc người cảnh s&aacute;t. Ngo&agrave;i những thương hiệu c&agrave; ph&ecirc;, nước giải kh&aacute;t nổi tiếng phổ biến ở H&agrave; Nội, th&agrave;nh phố Hồ Ch&iacute; Minh&hellip; th&agrave;nh phố Lai Ch&acirc;u tự h&agrave;o c&oacute; th&ecirc;m c&aacute;c lọai ch&egrave; v&agrave; tr&agrave; ch&iacute;nh hiệu Lai Ch&acirc;u, kh&ocirc;ng thua k&eacute;m bất cứ đất ch&egrave; n&agrave;o ở to&agrave;n quốc.</p>

<p style="text-align:justify">Nhưng c&aacute;i kh&ocirc;ng gian thưởng tr&agrave; c&ograve;n l&agrave; điều quan trọng hơn v&agrave; kh&ocirc;ng phải ở nơi n&agrave;o cũng c&oacute; được. M&agrave; th&agrave;nh phố Lai Ch&acirc;u th&igrave; c&oacute;.</p>

<p style="text-align:justify">Tối 2/12/2020, thực hiện lời hứa quay trở lại, t&ocirc;i được bạn b&egrave; dẫn l&ecirc;n một kh&ocirc;ng gian thưởng tr&agrave; thật tuyệt diệu: &ldquo;Tam Đường TEA&rdquo; ở lưng chừng dốc N&ugrave;ng N&agrave;ng. D&ugrave; trời lạnh v&agrave; sương rơi ướt vai &aacute;o, nhưng ai cũng muốn ngồi ở ngo&agrave;i trời để ngắm nh&igrave;n to&agrave;n cảnh th&agrave;nh phố Lai Ch&acirc;u lung linh huyền ảo b&ecirc;n dưới. Nam thanh nữ t&uacute; cũng nhiều v&agrave; quả thật, chỉ khi mấy c&ocirc; cậu thốt ra th&agrave;nh lời mới biết rằng c&oacute; kh&ocirc;ng &iacute;t con em đồng b&agrave;o bản địa, người Th&aacute;i, người M&ocirc;ng&hellip; c&oacute; mặt nơi đ&acirc;y. V&agrave; người Th&aacute;i B&igrave;nh nữa chứ! Gặp rất nhiều d&acirc;n Th&aacute;i B&igrave;nh, con em của những cư d&acirc;n Th&aacute;i B&igrave;nh l&ecirc;n x&acirc;y dựng T&acirc;y Bắc những năm 60-70 của thế kỷ trước. Rồi người v&ugrave;ng trung du ph&iacute;a Bắc, người miền Trung, v&agrave; cả d&acirc;n Nam Bộ thứ thiệt cũng t&igrave;m đến v&ugrave;ng đất mới n&agrave;y.</p>

<p style="text-align:justify">Vậy m&agrave; th&agrave;nh phố vẫn vắng, gần 100 km2 chỉ hơn 40.000 d&acirc;n. Một bạn trẻ thốt l&ecirc;n: &quot;th&agrave;nh phố vắng như H&agrave; Nội s&aacute;ng m&ugrave;ng một Tết&quot;. Hơi &iacute;ch kỷ, t&ocirc;i y&ecirc;u c&aacute;i thanh vắng của th&agrave;nh phố n&agrave;y v&agrave; ước ao &ldquo;Lai Ch&acirc;u phố&rdquo; sẽ c&oacute; mật độ cư d&acirc;n vừa phải, để sống v&agrave; chia sẻ. Kiểu như khi ch&uacute;ng t&ocirc;i v&agrave;o một qu&aacute;n ăn nhỏ, thấy thực kh&aacute;ch &ldquo;ngần ngại&rdquo; kh&ocirc;ng muốn d&ugrave;ng nguy&ecirc;n một chai rượu, c&ocirc; chủ qu&aacute;n đon đả r&oacute;t rượu ra mấy ch&eacute;n con &ldquo;em mời c&aacute;c b&aacute;c cho thơm miệng&rdquo;&hellip;</p>

<p style="text-align:center"><a href="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/14.12._Diem_dung_chan_thu_vi_cua_du_khach_1.jpg" target="_blank"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/14.12._Diem_dung_chan_thu_vi_cua_du_khach_2.jpg" style="border-style:solid; border-width:1px; height:465px; width:700px" /></a></p>

<p style="text-align:center"><em>Một đoạn đường v&agrave;o bản Sin Chải v&agrave; S&ugrave;ng Ph&agrave;i (x&atilde; S&ugrave;ng Ph&agrave;i)</em></p>

<p style="text-align:justify">Thực sự t&ocirc;i &ldquo;y&ecirc;u&rdquo; th&agrave;nh phố n&agrave;y. Th&agrave;nh phố với những đường phố v&agrave; vỉa h&egrave; rộng, vắng lặng, c&acirc;y xanh rợp b&oacute;ng. Th&agrave;nh phố c&oacute; những c&ocirc;ng d&acirc;n trẻ chăm chỉ với c&ocirc;ng việc của m&igrave;nh. Đa phần c&aacute;n bộ, c&ocirc;ng chức, vi&ecirc;n chức l&agrave;m tại c&aacute;c cơ quan doanh nghiệp&hellip; l&agrave; người trẻ tuổi. Rất &iacute;t cảnh người &ldquo;ăn kh&ocirc;ng ngồi rồi&rdquo; v&agrave;o những giờ đ&aacute;ng phải đi l&agrave;m. V&agrave; v&igrave; &ldquo;y&ecirc;u&rdquo; n&oacute; n&ecirc;n t&ocirc;i vẫn muốn t&igrave;m hiểu rằng b&agrave; con c&aacute;c d&acirc;n tộc thiểu số trong v&ugrave;ng c&oacute; thực sự được hưởng những &nbsp;&ldquo;th&agrave;nh quả&rdquo; n&agrave;y kh&ocirc;ng? Để khỏi bị ph&ecirc; gần ph&ecirc; xa rằng &ldquo;th&agrave;nh phố chỉ d&agrave;nh cho người dưới xu&ocirc;i&rdquo;, c&ograve;n cư d&acirc;n bản địa, người Th&aacute;i, Người M&ocirc;ng, Người Dao, người Gi&aacute;y&hellip; kh&ocirc;ng được sung sướng như thế.</p>

<p style="text-align:justify">Gặp Chủ tịch Uỷ ban nh&acirc;n d&acirc;n th&agrave;nh phố Lương Chiến C&ocirc;ng, t&ocirc;i n&oacute;i thẳng những băn khoăn của m&igrave;nh. Chủ tịch Lương Chiến C&ocirc;ng n&oacute;i ngay rằng b&acirc;y giờ t&igrave;m những bản Th&aacute;i thật kh&oacute;, v&igrave; người Th&aacute;i đ&atilde; sống ho&agrave; quyện với người Kinh v&agrave; th&agrave;nh phố đang lo rằng những sinh hoạt đậm chất văn ho&aacute; Th&aacute;i đang dần mai một đi. T&ocirc;i ngỏ &yacute; muốn đi đến mấy bản người M&ocirc;ng thuộc x&atilde; S&ugrave;ng Ph&agrave;i vốn thuộc huyện Tam Đường, mới chuyển về th&agrave;nh phố đầu năm 2020. Đ&oacute; l&agrave; c&aacute;c bản S&ugrave;ng Ph&agrave;i, Sin Chải, Can C&acirc;u, Trung Chải, Tả Chải, Suối Thầu A, Suối Thầu B, Củ Nha La. Nghe n&oacute;i đường đi kh&oacute; lắm&hellip;</p>

<p style="text-align:justify">&ldquo;Vậy ta bắt đầu từ nơi đường x&aacute; thuận tiện nh&eacute;&rdquo;. Chủ tịch C&ocirc;ng mời v&agrave; giao Đỗ Văn Khoa, một c&aacute;n bộ trẻ ở Ban quản l&yacute; c&aacute;c dự &aacute;n th&agrave;nh phố Lai Ch&acirc;u, dẫn đi. Theo đường V&otilde; Nguy&ecirc;n Gi&aacute;p, ch&uacute;ng t&ocirc;i rẽ v&agrave;o con đường b&ecirc; t&ocirc;ng, men theo c&aacute;c bản l&agrave;ng, đồng ruộng m&agrave; đi, m&ugrave;a n&agrave;y hoa c&uacute;c quỳ v&agrave;ng rực tr&ecirc;n mọi nẻo đường. Đang l&agrave; m&ugrave;a kh&ocirc;, lại gặp mấy h&ocirc;m trời kh&ocirc;ng mưa, nhưng c&aacute;c vệt c&acirc;y vệt hoa sạch bong. Kh&ocirc;ng kh&iacute; trong l&agrave;nh qu&aacute;.</p>

<p style="text-align:justify">Qua đoạn ng&atilde; ba lối rẽ v&agrave;o tỉnh lộ 129 đi S&igrave;n Hồ, ch&uacute;ng t&ocirc;i đến bản Gia Kh&acirc;u 1. C&aacute;c nh&agrave; đều vắng người. Trong s&acirc;n mỗi nh&agrave; đều c&oacute; những đống củi kh&ocirc; được che đậy cẩn thận. Đ&oacute; l&agrave; củi d&ugrave;ng cho m&ugrave;a đ&ocirc;ng. Thuận đ&agrave;, xe ch&uacute;ng t&ocirc;i chạy tới s&aacute;t ch&acirc;n n&uacute;i, nơi c&oacute; đường l&ecirc;n khu vực hang động thuộc d&atilde;y n&uacute;i Pu Sam Cap v&agrave; l&agrave; điểm m&agrave; kh&aacute;ch du lịch hay lui tới.</p>

<p style="text-align:justify">Một ng&ocirc;i nh&agrave; nhỏ l&agrave; nơi l&agrave;m việc của &ldquo;Ban quản l&yacute;&rdquo; khu du lịch. Gọi l&agrave; &ldquo;ban&rdquo; cho oai, thực ra chỉ c&oacute; hai chị em. L&uacute;i h&uacute;i dọn dẹp ngo&agrave;i vườn, D&igrave; Thị Lan một trong 2 người trong ban nghe tiếng ch&uacute;ng t&ocirc;i hỏi, mới tạm dừng c&ocirc;ng việc, đon đả mời ch&uacute;ng t&ocirc;i v&agrave;o nh&agrave;. Nghe chừng đ&atilde; quen với kh&aacute;ch lạ, mấy con đ&agrave; điểu cao to nu&ocirc;i trong vườn k&ecirc;u th&agrave;nh tiếng, quanh quẩn gần h&agrave;ng r&agrave;o &yacute; chừng mong được cho ăn.</p>

<p style="text-align:center"><a href="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/14.12._Diem_dung_chan_thu_vi_cua_du_khach_1.jpg" target="_blank"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/14.12._Diem_dung_chan_thu_vi_cua_du_khach_3.jpg" style="border-style:solid; border-width:1px; height:465px; width:700px" /></a></p>

<p style="text-align:center"><em>Ng&ocirc;i nh&agrave; của vợ chồng anh Th&agrave;o A C&aacute; (bản Gia Kh&acirc;u 1) đ&oacute;n kh&aacute;ch du lịch.</em></p>

<p style="text-align:justify">D&igrave; Thị Lan kể: bản Gia Kh&acirc;u 1 chủ yếu l&agrave; người M&ocirc;ng từ Phong Thổ về định cư ở đ&acirc;y đ&atilde; l&acirc;u, thuộc x&atilde; Nậm Loỏng. Nay nhập v&agrave;o với mấy bản người M&ocirc;ng ở Tam Đường mới về th&agrave;nh phố, mang t&ecirc;n l&agrave; x&atilde; S&ugrave;ng Ph&agrave;i. Mấy năm gần đ&acirc;y, ngo&agrave;i l&agrave;m ruộng, b&agrave; con c&ograve;n ph&aacute;t triển c&aacute;c điểm du lịch cộng đồng, đ&oacute;n kh&aacute;ch du lịch tới ăn nghỉ tại nh&agrave;. Dĩ nhi&ecirc;n đường x&aacute; được đổ b&ecirc; t&ocirc;ng quang đ&atilde;ng sạch sẽ. Chuồng nu&ocirc;i gia s&uacute;c phải dời xa nh&agrave; ở. Đoạn đường n&agrave;o cũng c&oacute; xe đựng r&aacute;c. Nh&agrave; phải c&oacute; hệ thống nước sạch, nh&agrave; tắm, nh&agrave; vệ sinh. Đỗ Văn Khoa kể: trước kia đường trong bản, hay từ nh&agrave; n&agrave;y sang nh&agrave; kh&aacute;c ngập ngụa b&ugrave;n đất lẫn với ph&acirc;n gia s&uacute;c. Nguy&ecirc;n c&aacute;i việc vận động d&acirc;n bỏ r&aacute;c v&agrave;o th&ugrave;ng cũng mất kh&ocirc;ng &iacute;t c&ocirc;ng sức.</p>

<p style="text-align:justify">Giờ th&igrave; Gia Kh&acirc;u 1 đ&atilde; kh&aacute; nhiều rồi. V&agrave;o thăm gia đ&igrave;nh vợ chồng anh chị Th&agrave;o A C&aacute; v&agrave; Gi&agrave;ng Thị Lia, thấy quả đ&uacute;ng như vậy. D&igrave; Thị Lan bộc bạch: em vốn l&agrave; người M&ocirc;ng ở D&agrave;o San huyện Phong Thổ, lấy chồng về qu&ecirc; chồng ở. Ch&uacute;ng t&ocirc;i hỏi đ&ugrave;a &ldquo;thế c&oacute; bị &ldquo;bắt&rdquo; về kh&ocirc;ng?&rdquo;. Lan cười rất tươi: kh&ocirc;ng, ch&uacute;ng em quen nhau qua mạng. Em học hết lớp 12, đ&atilde; từng đi l&agrave;m cho một C&ocirc;ng ty của Nhật. C&ograve;n chồng em đ&atilde; học hết Đại học, đang đi học tiếp tại Th&aacute;i Nguy&ecirc;n. Quần b&ograve; &aacute;o bu d&ocirc;ng, đi giầy vải, n&oacute;i tiếng Việt rất s&otilde;i. Nh&igrave;n Lan thật kh&oacute; m&agrave; nhận ra đ&acirc;y l&agrave; một c&ocirc; g&aacute;i người M&ocirc;ng.</p>

<p style="text-align:justify">Đường đến bản Gia Kh&acirc;u 1 thuận tiện bao nhi&ecirc;u th&igrave; đường đến c&aacute;c bản M&ocirc;ng mới từ Tam Đường chuyển về kh&oacute; bấy nhi&ecirc;u. Tuy rằng c&ugrave;ng nằm trong một x&atilde; với Gia Kh&acirc;u 1 nhưng lại đi đường kh&aacute;c (x&atilde; S&ugrave;ng Ph&agrave;i rộng tới 20 ki-l&ocirc;-m&eacute;t vu&ocirc;ng). Từ trung t&acirc;m th&agrave;nh phố, vừa rời đoạn đường L&ecirc; Duẩn to rộng bằng phẳng l&agrave; gặp dốc v&agrave; cứ thế m&agrave; leo dốc. Xe &ocirc; t&ocirc; chỉ leo được đến ng&atilde; ba bản Trung Chải, nơi c&oacute; trạm biến thế điện mới x&acirc;y dựng. Ch&uacute;ng t&ocirc;i phải đi xe m&aacute;y.</p>

<p style="text-align:justify">Đoạn đường b&ecirc; t&ocirc;ng mới đổ đi c&aacute;c bản S&ugrave;ng Ph&agrave;i, Sin Chải, Can C&acirc;u&hellip; chỉ vừa đủ cho một chiều xe đi. Một b&ecirc;n l&agrave; v&aacute;ch n&uacute;i, một b&ecirc;n l&agrave; vực s&acirc;u, thi thoảng mới gặp một nương ch&egrave; hay một rừng vầu, c&ograve;n hai b&ecirc;n đường l&agrave; những bụi hoa c&uacute;c quỳ v&agrave;ng rực. Điểm mới l&agrave; những đ&ocirc;i cột điện b&ecirc; t&ocirc;ng cốt th&eacute;p ly t&acirc;m mới dựng, đang chờ lắp sứ k&eacute;o d&acirc;y.</p>

<p style="text-align:justify">Nguyễn Văn Qu&yacute;, kỹ sư Thuỷ lợi vừa mới ra trường hơn một năm, l&agrave; một trong những tay l&aacute;i cứng của Ban quản l&yacute; dự &aacute;n đưa t&ocirc;i đi, t&acirc;m sự: &ldquo;cho&aacute;ng&rdquo; nhất l&agrave; đường ra. Đo&agrave;n thanh ni&ecirc;n ch&uacute;ng em đỡ đầu cho mấy bản trong n&agrave;y, nhiều buổi v&agrave;o l&agrave;m việc b&agrave; con &ldquo;bắt&rdquo; uống rượu tối mịt mới được về m&agrave; kh&ocirc;ng uống kh&ocirc;ng được.</p>

<p style="text-align:center"><a href="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/14.12._Diem_dung_chan_thu_vi_cua_du_khach_1.jpg" target="_blank"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/14.12._Diem_dung_chan_thu_vi_cua_du_khach_4.jpg" style="border-style:solid; border-width:1px; height:465px; width:700px" /></a></p>

<p style="text-align:center"><em>Một g&oacute;c khu vườn du lịch ở x&atilde; Gia Kh&acirc;u 1.</em></p>

<p style="text-align:justify">Kh&aacute;c với c&aacute;c nếp nh&agrave; ngay h&agrave;ng thẳng lối, ven đường đi ở Gia Kh&acirc;u 1, ở mấy bản mới về nh&agrave; nọ chen nh&agrave; kia lộn xộn, đường x&aacute; gập ghềnh, ph&acirc;n gia s&uacute;c đầy tr&ecirc;n c&aacute;c lối đi. M&agrave; người đ&acirc;u vắng? Chỉ thấy kh&aacute; nhiều phụ nữ ngồi phơi nắng hoặc th&ecirc;u th&ugrave;a. Hỏi thăm đến nh&agrave; &ocirc;ng trưởng bản S&ugrave;ng Ph&agrave;i, gặp vợ &ocirc;ng c&ugrave;ng c&ocirc; con g&aacute;i v&agrave; đứa ch&aacute;u ngoại đang ngồi ngo&agrave;i s&acirc;n. Ở nh&agrave; b&ecirc;n cạnh, mấy người đ&agrave;n &ocirc;ng lắp một bồn nước tr&ecirc;n n&oacute;c nh&agrave; tắm. Phần lớn c&aacute;c nh&agrave; đều đ&atilde; treo bồn chứa nước tr&ecirc;n cao v&agrave; c&oacute; chảo nhỏ để thu truyền h&igrave;nh. Nhiều nh&agrave; c&oacute; xe m&aacute;y để ngo&agrave;i s&acirc;n. Qua tr&ograve; chuyện, mọi người tỏ &yacute; hy vọng rằng th&agrave;nh phố tiếp tục l&agrave;m đường để b&agrave; con dễ th&ocirc;ng thương với b&ecirc;n ngo&agrave;i hơn.</p>

<p style="text-align:justify">Ở bản S&ugrave;ng Ph&agrave;i c&oacute; một điểm trường 4 c&ocirc; gi&aacute;o với c&aacute;c lớp 1-2 v&agrave; 3. C&ograve;n ở bản Sin Chải c&oacute; một lớp mầm non gần 40 ch&aacute;u đi học. Lớp học l&agrave; một gian nh&agrave; gạch khang trang, c&oacute; s&acirc;n chơi v&agrave; mấy đồ chơi đơn giản, nhưng đường v&agrave;o cả hai ph&iacute;a đều lổn nhổn những đ&aacute; l&agrave; đ&aacute;, kh&uacute;c khuỷu gập gềnh. C&ocirc; gi&aacute;o mầm non Phạm Thị H&agrave; người T&agrave;y Phong Thổ kể rằng buổi đầu vận động c&aacute;c gia đ&igrave;nh đưa con em đến học cũng kh&aacute; vất vả, nay th&igrave; c&aacute;c ch&aacute;u đ&atilde; quen rồi. Cả năm c&ocirc; gi&aacute;o đều ở dưới th&agrave;nh phố, đi v&agrave; về bằng xe m&aacute;y. Cứ nghĩ đến những đoạn đường dốc đứng quanh co ch&uacute;ng t&ocirc;i vừa qua m&agrave; vừa thương vừa cảm phục những tấm l&ograve;ng v&igrave; trẻ thơ v&ugrave;ng cao của c&aacute;c c&ocirc;.</p>

<p style="text-align:justify">Chiều miền n&uacute;i tối rất nhanh. Như để giới thiệu th&ecirc;m cố gắng của th&agrave;nh phố, lượt ra Nguyễn Anh Qu&yacute; đưa ch&uacute;ng t&ocirc;i đi theo đường kh&aacute;c, gặp những đoạn đường b&ecirc; t&ocirc;ng mới đổ xong một hai ng&agrave;y, những r&atilde;nh tho&aacute;t nước ven sườn n&uacute;i m&aacute;y x&uacute;c vừa m&uacute;c th&agrave;nh vệt, Qu&yacute; cứ xu&yacute;t xoa: trời tối mau qu&aacute;, kh&ocirc;ng đưa c&aacute;c anh v&agrave;o bản Can C&acirc;u được. Đ&acirc;y l&agrave; bản ở xa nhất v&agrave; kh&oacute; nhất S&ugrave;ng Ph&agrave;i đấy.</p>

<p style="text-align:justify">Chủ tịch th&agrave;nh phố Lai Ch&acirc;u Lương Chiến C&ocirc;ng vẫn chờ ch&uacute;ng t&ocirc;i ở ph&ograve;ng l&agrave;m việc. Nghe ch&uacute;ng t&ocirc;i n&oacute;i về cảm tưởng sau một ng&agrave;y đi đến mấy bản M&ocirc;ng. Lương Chiến C&ocirc;ng b&agrave;y tỏ: đấy l&agrave; mấy bản thuộc diện ngh&egrave;o nhất của Tam Đường. Về với th&agrave;nh phố cũng kh&ocirc;ng phải b&agrave; con kh&ocirc;ng c&oacute; t&acirc;m tư v&igrave; trước kia Nh&agrave; nước bao cấp nhiều. Nhưng ch&uacute;ng t&ocirc;i x&aacute;c định phải gỡ rối dần. Năm 2020 v&agrave; sang năm, trọng t&acirc;m l&agrave; đầu tư cho 7 bản mới về. Trước hết l&agrave; l&agrave;m đường v&agrave;o. Cứng ho&aacute; đường nội đồng v&agrave; l&agrave;m k&ecirc;nh mương thuỷ lợi. Rồi k&eacute;o điện lưới v&agrave; gi&uacute;p b&agrave; con c&oacute; một lưới điện ổn định, đ&uacute;ng quy chuẩn. Sắp xếp lại đường đi lối lại trong c&aacute;c bản, đưa chuồng trại nu&ocirc;i gia s&uacute;c ra xa. Rồi nước sạch, nh&agrave; vệ sinh.</p>

<p style="text-align:justify">Trước mắt trong năm 2021 n&acirc;ng cấp mấy trường học. Th&agrave;nh phố giao rất cụ thể cho từng ban ng&agrave;nh kết nghĩa với c&aacute;c bản, l&ecirc;n danh s&aacute;ch c&aacute;c hộ ngh&egrave;o v&agrave; cận ngh&egrave;o, t&igrave;m sinh kế cho b&agrave; con, gi&uacute;p d&acirc;n x&acirc;y dựng cuộc sống mới. Khu vực ấy c&oacute; nhiều nương ch&egrave; trồng giống ch&egrave; &Ocirc; Long, đường v&agrave;o đường ra cảnh đều đẹp tuy đường c&ograve;n hơi chật nhưng tiềm năng ph&aacute;t triển du lịch l&agrave; c&oacute;. C&aacute;i ch&uacute;ng t&ocirc;i muốn gi&uacute;p b&agrave; con ch&iacute;nh l&agrave; tạo điều kiện để b&agrave; con sống bằng b&agrave;n tay v&agrave; khối &oacute;c của m&igrave;nh.</p>

<p style="text-align:justify">Gia Kh&acirc;u 1 l&agrave; một h&igrave;nh mẫu m&agrave; c&aacute;c bản M&ocirc;ng mới của th&agrave;nh phố học tập. Nghe Chủ tịch Lương Chiến C&ocirc;ng giới thiệu về những giải ph&aacute;p gi&uacute;p d&acirc;n m&agrave; l&ograve;ng th&ecirc;m vui. Chợt nhớ tới t&acirc;m sự của ch&agrave;ng kỹ sư trẻ Nguyễn Anh Qu&yacute;: em qu&ecirc; ở Ph&uacute; Thọ. Cũng định l&agrave;m ở Lai Ch&acirc;u mấy năm rồi xin về qu&ecirc;. Nhưng nay em nghĩ kh&aacute;c rồi: c&oacute; lẽ em sẽ chọn đ&acirc;y l&agrave;m qu&ecirc; hương thứ hai. Thấy t&ocirc;i gặng hỏi &ldquo;v&igrave; sao?&rdquo;, Qu&yacute; tủm tỉm: em đang y&ecirc;u một c&ocirc; bạn, gia đ&igrave;nh ở tr&ecirc;n n&agrave;y cả.</p>

<p style="text-align:justify">Th&igrave; ra l&agrave; vậy. Những mong th&agrave;nh phố trẻ Lai Ch&acirc;u c&oacute; th&ecirc;m nhiều cặp uy&ecirc;n ương chọn l&agrave;m nơi x&acirc;y tổ ấm. Tho&aacute;ng vọng l&ecirc;n trong t&ocirc;i một c&acirc;u h&aacute;t xưa &ldquo;Ho&agrave;ng Li&ecirc;n Sơn qu&ecirc; t&ocirc;i, b&oacute;ng ngựa in lưng trời&hellip; cả một dải bi&ecirc;n cương, đ&acirc;u cũng l&agrave; qu&ecirc; hương&rdquo;./.</p>
</div>
</div>
', N'14.12._Diem_dung_chan_thu_vi_cua_du_khach_1.jpg', CAST(N'2022-05-12T00:48:15.997' AS DateTime), CAST(N'2022-05-12T00:49:05.593' AS DateTime), 0, 0, 4, N'Admin')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [AnhBia], [NgayDang], [NgayCapNhat], [LuotThich], [An], [MaTheLoai], [MaTaiKhoan]) VALUES (21, N'Nhiều giải pháp kích cầu du lịch Lai Châu', N'<div class="content items-contents-scope items-contents-wrapper">
<h1>C&aacute;c chuy&ecirc;n gia cho rằng, Lai Ch&acirc;u cần t&igrave;m sản phẩm cốt l&otilde;i để thổi hồn, tạo điểm nhấn nhằm thu h&uacute;t kh&aacute;ch du lịch</h1>

<div class="items-detail"><!--?xml encoding="utf-8" ?-->
<p style="text-align:justify">Ng&agrave;y&nbsp;22/6, UBND tỉnh Lai Ch&acirc;u tổ chức Hội thảo đ&aacute;nh gi&aacute; kết quả khảo s&aacute;t sản phẩm du lịch tỉnh, với sự tham gia của gần 100 chuy&ecirc;n gia, c&aacute;n bộ v&agrave; doanh nghiệp du lịch tr&ecirc;n cả nước.</p>

<p style="text-align:justify">Sau khi tham quan, khảo s&aacute;t c&aacute;c điểm du lịch tr&ecirc;n địa b&agrave;n tỉnh Lai Ch&acirc;u, c&aacute;c đại biểu đ&atilde; đ&aacute;nh gi&aacute; về tiềm năng, thế mạnh của c&aacute;c điểm du lịch, sản phẩm du lịch. Đồng thời, đưa ra những tồn tại v&agrave; c&aacute;c giải ph&aacute;p nhằm đẩy mạnh thu h&uacute;t kh&aacute;ch du lịch trong thời gian tới.</p>

<p style="text-align:center"><a href="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/23.6.Nhieu_giai_phap_kich_cau_du_lich_Lai_Chau.jpg" target="_blank"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/23.6.Nhieu_giai_phap_kich_cau_du_lich_Lai_Chau.jpg" style="border-style:solid; border-width:1px; height:466px; width:700px" /></a></p>

<p style="text-align:center"><em>C&aacute;c đơn vị, địa phương tỉnh Lai Ch&acirc;u cam kết tạo điều kiện thuận lợi nhất cho c&aacute;c c&ocirc;ng ty, doanh nghiệp hoạt động trong lĩnh vực du dịch ph&aacute;t triển</em></p>

<p style="text-align:justify">Nhiều chuy&ecirc;n gia cho rằng, Lai Ch&acirc;u cần t&igrave;m sản phẩm cốt l&otilde;i để thổi hồn, tạo điểm nhấn nhằm thu h&uacute;t kh&aacute;ch du lịch. C&aacute;c điểm du lịch cần bổ sung c&aacute;c biển chỉ dẫn để kh&aacute;ch du lịch lẻ đi qua dễ d&agrave;ng t&igrave;m đến. Chợ đ&ecirc;m San Th&agrave;ng cần được duy tr&igrave;, tổ chức thường ni&ecirc;n v&agrave; &nbsp;huy động đ&ocirc;ng đảo b&agrave; con nh&acirc;n d&acirc;n địa phương tham gia, tạo sự lan tỏa đến với kh&aacute;ch du lịch cả nước. Đồng thời x&acirc;y dựng th&ecirc;m những sản phẩm du lịch như th&ecirc;u dệt vải, nghề chạm bạc của người M&ocirc;ng để tạo th&agrave;nh sản phẩm thu h&uacute;t kh&aacute;ch du lịch&hellip;</p>

<p style="text-align:justify">Ngo&agrave;i ra c&aacute;c danh thắng như cung đường đ&egrave;o &Ocirc; Qu&yacute; Hồ, nơi kh&aacute;ch du lịch th&iacute;ch trải nghiệm mạo hiểm, địa phương cần tận dụng để đưa nơi đ&acirc;y trở th&agrave;nh sản phẩm du lịch c&oacute; gi&aacute; trị. Đầu tư th&ecirc;m c&aacute;c hoạt động trải nghiệm ban đ&ecirc;m ở c&aacute;c điểm du lịch cộng đồng để kh&aacute;ch du lịch c&oacute; thể lưu tr&uacute; l&acirc;u d&agrave;i, gắn c&aacute;c c&ocirc;ng việc h&agrave;ng ng&agrave;y, nghề truyền thống l&agrave;m sản phẩm du lịch...</p>

<p style="text-align:justify">&Ocirc;ng Trần Trung Hiếu, Ph&oacute; Gi&aacute;m đốc Sở Du lịch th&agrave;nh phố H&agrave; Nội cho biết: Sở Du lịch H&agrave; Nội sẽ tiếp tục đẩy mạnh tăng cường li&ecirc;n kết du lịch Lai Ch&acirc;u &ndash; H&agrave; Nội; tiếp tục đưa c&aacute;c đo&agrave;n khảo s&aacute;t, c&aacute;c đơn vị kinh doanh du lịch v&agrave; kh&aacute;ch du lịch đến với Lai Ch&acirc;u. Đặc biệt, tập trung x&acirc;y dựng c&aacute;c sản phẩm li&ecirc;n kết, quảng b&aacute;, tuy&ecirc;n truyền hai chiều H&agrave; Nội - Lai Ch&acirc;u; tăng cường c&ocirc;ng t&aacute;c quản l&yacute; để c&aacute;c doanh nghiệp thuận lợi hợp t&aacute;c c&ugrave;ng ph&aacute;t triển, nhằm đưa c&aacute;c sản phẩm du lịch tốt nhất đến du kh&aacute;ch&hellip;</p>

<p style="text-align:justify">Về ph&iacute;a tỉnh Lai Ch&acirc;u, đại diện l&atilde;nh đạo, c&aacute;c sở, ng&agrave;nh li&ecirc;n quan v&agrave; c&aacute;c doanh nghiệp tr&ecirc;n địa b&agrave;n tỉnh đ&atilde; cảm ơn c&aacute;c &yacute; kiến đ&aacute;nh gi&aacute;, gợi mở những giải ph&aacute;p của đo&agrave;n khảo s&aacute;t v&agrave; mong muốn thời gian tới c&aacute;c doanh nghiệp hoạt động du lịch Lai Ch&acirc;u kết nối v&agrave; hợp t&aacute;c với c&aacute;c doanh nghiệp du lịch của tỉnh nhiều hơn.</p>

<p style="text-align:justify">Để du lịch ph&aacute;t triển, hiện địa phương đang khắc phục c&aacute;c hạn chế về giao th&ocirc;ng, trong đ&oacute; đang thực hiện dự &aacute;n đường nối cao tốc Nội B&agrave;i - L&agrave;o Cai với Lai Ch&acirc;u. C&ugrave;ng với đ&oacute;, Lai Ch&acirc;u đang tiếp tục khắc phục c&aacute;c l&agrave;ng nghề c&oacute; thế mạnh của c&aacute;c d&acirc;n tộc, c&aacute;c sản phẩm lễ hội, cảnh quan thế mạnh..., cam kết tạo c&aacute;c điều kiện thuận lợi nhất cho c&aacute;c doanh nghiệp v&agrave; kh&aacute;ch du lịch đến với Lai Ch&acirc;u./.</p>

<p style="text-align:right">&nbsp;</p>
</div>
</div>
', N'23.6.Nhieu_giai_phap_kich_cau_du_lich_Lai_Chau.jpg', CAST(N'2022-05-12T00:51:07.210' AS DateTime), CAST(N'2022-05-12T00:51:27.550' AS DateTime), 0, 0, 15, N'Admin')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [AnhBia], [NgayDang], [NgayCapNhat], [LuotThich], [An], [MaTheLoai], [MaTaiKhoan]) VALUES (22, N'Khai mạc Tuần Du lịch - Văn hoá Lai Châu 2016', N'<div class="main-container-inner-page" style="display:flex">
<div class="col-12 col-lg-12 col-md-12 col-sm-12 main-content">
<div class="content items-contents-scope items-contents-wrapper">
<h1>- Tối ng&agrave;y 27/4/2016, lễ khai mạc Tuần Du lịch - Văn ho&aacute; Lai Ch&acirc;u năm 2016 đ&atilde; long trọng diễn ra tại Quảng trường Nh&acirc;n d&acirc;n TP. Lai Ch&acirc;u.</h1>

<div class="items-detail"><!--?xml encoding="utf-8" ?-->
<p style="text-align:center"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2016/anhTITC/Thang4/274-KhaimactuanVHLaiChau-pb.jpg" style="border-style:solid; border-width:1px; height:337px; width:500px" /></p>

<p style="text-align:center"><span style="color:#0000cd"><span style="font-family:Arial; font-size:small">&Ocirc;ng Tống Thanh Hải, Ph&oacute; Chủ tịch UBND tỉnh Lai Ch&acirc;u tuy&ecirc;n bố khai mạc Tuần Du lịch - Văn ho&aacute; Lai Ch&acirc;u năm 2016</span></span></p>

<p><span style="font-family:Arial; font-size:small">Đ&acirc;y l&agrave; lần đầu ti&ecirc;n Lai Ch&acirc;u tổ chức Tuần Du lịch - Văn ho&aacute; với mục đ&iacute;ch quảng b&aacute;, giới thiệu tiềm năng thế mạnh của du lịch Lai Ch&acirc;u, đồng thời t&ocirc;n vinh những gi&aacute; trị văn ho&aacute;, vẻ đẹp của mảnh đất v&agrave; con người Lai Ch&acirc;u.</span></p>

<p><span style="font-family:Arial; font-size:small">Lễ khai mạc c&oacute; sự hiện diện của &ocirc;ng L&ograve; Văn Gi&agrave;ng - Ph&oacute; Trưởng ban D&acirc;n vận Trung ương, nguy&ecirc;n Uỷ vi&ecirc;n Trung ương Đảng, nguy&ecirc;n B&iacute; thư Tỉnh ủy tỉnh Lai Ch&acirc;u; &ocirc;ng Nguyễn Hữu To&agrave;n - Ph&oacute; Chủ nhiệm Văn ph&ograve;ng Quốc hội; b&agrave; Ho&agrave;ng Thị Hạnh - Ph&oacute; Trưởng ban Chỉ đạo T&acirc;y Bắc; &ocirc;ng Nguyễn Quốc Hưng - Ph&oacute; Tổng cục trưởng Tổng cục Du lịch; l&atilde;nh đạo c&aacute;c Cục, Vụ chức năng thuộc Bộ VHTTDL; đại diện l&atilde;nh đạo tỉnh Lai Ch&acirc;u, L&agrave;o Cai; đại diện l&atilde;nh đạo Sở VHTTDL c&aacute;c tỉnh Trung du miền n&uacute;i ph&iacute;a Bắc; đại diện c&aacute;c cơ quan th&ocirc;ng tấn b&aacute;o ch&iacute; Trung ương v&agrave; địa phương c&ugrave;ng đ&ocirc;ng đảo nh&acirc;n d&acirc;n địa phương, du kh&aacute;ch trong nước v&agrave; quốc tế.</span></p>

<p><span style="font-family:Arial; font-size:small">Thay mặt l&atilde;nh đạo tỉnh, &ocirc;ng Tống Thanh Hải - Uỷ vi&ecirc;n Ban thường vụ Tỉnh ủy, Ph&oacute; Chủ tịch UBND tỉnh Lai Ch&acirc;u đ&atilde; tuy&ecirc;n bố khai mạc Tuần Du lịch - Văn ho&aacute; Lai Ch&acirc;u năm 2016 với chủ đề &quot;Lai Ch&acirc;u - Bản t&igrave;nh ca của những sắc m&agrave;u&quot;.</span></p>

<p><span style="font-family:Arial; font-size:small">Đến với lễ khai mạc, kh&aacute;n giả đ&atilde; được thưởng thức chương tr&igrave;nh nghệ thuật đặc sắc với sự tham dự của hơn 1000 nghệ sĩ chuy&ecirc;n v&agrave; kh&ocirc;ng chuy&ecirc;n biểu diễn. Chương tr&igrave;nh nghệ thuật đ&atilde; giới thiệu đến kh&aacute;n giả lịch sử h&igrave;nh th&agrave;nh mảnh đất gi&agrave;u truyền thống Lai Ch&acirc;u, gi&aacute; trị lịch sử, văn ho&aacute;, du lịch, khơi gợi l&ograve;ng tự h&agrave;o, y&ecirc;u mến Lai Ch&acirc;u, đồng thời quảng b&aacute; du lịch để thu h&uacute;t th&ecirc;m du kh&aacute;ch v&agrave; c&aacute;c nh&agrave; đầu tư chiến lược.</span></p>

<p><span style="font-family:Arial; font-size:small">Lai Ch&acirc;u l&agrave; tỉnh miền n&uacute;i ph&iacute;a Bắc với văn ho&aacute; đa sắc m&agrave;u của 20 d&acirc;n tộc thiểu số c&ugrave;ng sinh sống. C&ugrave;ng với cảnh quan thi&ecirc;n nhi&ecirc;n h&ugrave;ng vĩ, đ&acirc;y l&agrave; điều kiện thuận lợi để tỉnh đẩy mạnh ph&aacute;t triển du lịch kh&aacute;m ph&aacute;, du lịch sinh th&aacute;i, du lịch cộng đồng&hellip;</span></p>

<p><span style="font-family:Arial; font-size:small">Diễn ra từ 27/4 đến 30/4, trong khu&ocirc;n khổ Tuần Du lịch - Văn ho&aacute; Lai Ch&acirc;u 2016 sẽ c&oacute; nhiều hoạt động được tổ chức như lễ hội ẩm thực, hội thi gi&atilde; b&aacute;nh d&agrave;y, chương tr&igrave;nh nghệ thuật đương đại v&agrave; d&acirc;n gian c&aacute;c d&acirc;n tộc Lai Ch&acirc;u, hội thảo đ&aacute;nh gi&aacute; sản phẩm du lịch...</span></p>

<p><em><span style="color:#000000"><span style="font-family:Arial; font-size:small"><span style="font-family:Arial; font-size:small">Một số h&igrave;nh ảnh trong đ&ecirc;m khai mạc:</span></span></span></em></p>

<p style="text-align:center"><span style="font-family:Arial; font-size:small"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2016/anhTITC/Thang4/274-KhaimactuanVHLaiChau-vnghe1.jpg" style="border-style:solid; border-width:1px; height:334px; width:500px" /></span></p>

<p style="text-align:center"><span style="font-family:Arial; font-size:small"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2016/anhTITC/Thang4/274-KhaimactuanVHLaiChau-vnghe3.jpg" style="border-style:solid; border-width:1px; height:322px; width:500px" /></span></p>

<p style="text-align:center"><span style="font-family:Arial; font-size:small"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2016/anhTITC/Thang4/274-KhaimactuanVHLaiChau-vnghe4.jpg" style="border-style:solid; border-width:1px; height:338px; width:500px" /></span></p>

<p style="text-align:center"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/2016/anhTITC/Thang4/274-KhaimactuanVHLaiChau-vnghe2.jpg" style="border-style:solid; border-width:1px; font-family:Arial; font-size:small; height:340px; line-height:24px; width:500px" /></p>

<p><strong>Trung t&acirc;m Th&ocirc;ng tin du lịch</strong></p>
</div>

<div class="items-tags">
<div class="title">&nbsp;</div>
</div>
</div>
</div>
</div>
', N'274-KhaimactuanVHLaiChau-pb.jpg', CAST(N'2022-05-12T00:54:32.813' AS DateTime), CAST(N'2022-05-12T00:54:57.817' AS DateTime), 0, 0, 15, N'Admin')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [AnhBia], [NgayDang], [NgayCapNhat], [LuotThich], [An], [MaTheLoai], [MaTaiKhoan]) VALUES (23, N'Triển khai Kế hoạch tổ chức Hội nghị Xúc tiến Đầu tư và Quảng bá Du lịch', N'<div class="content items-contents-scope items-contents-wrapper">
<h1>S&aacute;ng ng&agrave;y 16/3, UBND tỉnh Lai Ch&acirc;u đ&atilde; tổ chức họp Tổ C&ocirc;ng t&aacute;c tổ chức Hội nghị X&uacute;c tiến Đầu tư v&agrave; Quảng b&aacute; du lịch tỉnh Lai Ch&acirc;u lần thứ nhất. Đồng ch&iacute; L&ecirc; Trọng Quảng, Ph&oacute; Chủ tịch UBND tỉnh chủ tr&igrave; buổi họp.</h1>

<div class="items-detail"><!--?xml encoding="utf-8" ?-->
<p style="text-align:center"><img alt="" src="https://images.vietnamtourism.gov.vn/vn/images/HoinghiLaiChau1.jpg" style="border-style:solid; border-width:1px; height:282px; width:500px" /></p>

<p style="text-align:justify"><span style="font-family:Arial; font-size:small">Tại buổi họp UBND tỉnh đ&atilde; th&ocirc;ng b&aacute;o kết quả buổi l&agrave;m việc giữa tỉnh Lai Ch&acirc;u v&agrave; BIDV (l&agrave; nh&agrave; tư vấn, đơn vị đồng tổ chức Hội nghị); th&ocirc;ng qua Quyết định th&agrave;nh lập Tổ C&ocirc;ng t&aacute;c; triển khai Kế hoạch tổ chức tổ chức Hội nghị X&uacute;c tiến Đầu tư v&agrave; Quảng b&aacute; du lịch tỉnh Lai Ch&acirc;u lần thứ nhất.</span></p>

<p style="text-align:justify"><span style="font-family:Arial; font-size:small">Theo đ&oacute;, Hội nghị X&uacute;c tiến Đầu tư v&agrave; Quảng b&aacute; du lịch tỉnh Lai Ch&acirc;u lần thứ nhất với quy m&ocirc; Hội nghị cấp Quốc gia, do UBND tỉnh Lai Ch&acirc;u phối hợp với Ban Chỉ đạo T&acirc;y Bắc, Bộ Kế hoạch v&agrave; Đầu tư, Bộ Văn h&oacute;a, Thể thao v&agrave; Du lịch, Ng&acirc;n h&agrave;ng TMCP Đầu tư Ph&aacute;t triển Việt Nam đồng tổ chức.</span></p>

<p style="text-align:justify"><span style="font-family:Arial; font-size:small">Dự kiến sẽ được tổ chức v&agrave;o khoảng thời gian cuối th&aacute;ng 4 hoặc đầu th&aacute;ng 5 năm 2016, tại Trung t&acirc;m Hội nghị Văn h&oacute;a tỉnh Lai Ch&acirc;u. Hội nghị dự kiến sẽ c&oacute; khoảng 400 đại biểu tham gia; trong đ&oacute; c&oacute; l&atilde;nh đạo Ch&iacute;nh phủ, c&aacute;c cơ quan bộ, ban, ng&agrave;nh Trung ương v&agrave; c&aacute;c tỉnh, cơ quan ngoại giao v&agrave; c&aacute;c tổ chức quốc tế... Mục đ&iacute;ch Hội nghị nhằm giới thiệu về tiềm năng, thế mạnh, định hướng ph&aacute;t triển của tỉnh Lai Ch&acirc;u; cơ hội đầu tư của c&aacute;c nh&agrave; đầu tư; cơ chế, ch&iacute;nh s&aacute;ch ưu đ&atilde;i đối với c&aacute;c nh&agrave; đầu tư v&agrave; cam kết của l&atilde;nh đạo tỉnh Lai Ch&acirc;u; quảng b&aacute; du lịch tỉnh Lai Ch&acirc;u.</span></p>
</div>

<div class="items-source">Nguồn: : laichau.gov.vn</div>

<div class="items-tags">
<div class="title">&nbsp;</div>
</div>
</div>
', N'HoinghiLaiChau1.jpg', CAST(N'2022-05-12T00:56:00.093' AS DateTime), CAST(N'2022-05-12T00:56:35.987' AS DateTime), 0, 0, 15, N'Admin')
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [SoLuongTheLoai]) VALUES (1, N'Tin Tức, Sự Kiện', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [SoLuongTheLoai]) VALUES (2, N'Giới Thiệu', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [SoLuongTheLoai]) VALUES (3, N'Sản Phẩm Du Lịch', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [SoLuongTheLoai]) VALUES (4, N'Dịch Vụ Du Lịch', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [SoLuongTheLoai]) VALUES (5, N'Cơ Chế Chính Sách', 0)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [SoLuongTheLoai]) VALUES (6, N'Thông Tin Cần Thiết', 0)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (1, N'Ban Quản Trị', N'Quản lý website')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa]) VALUES (2, N'Người Dùng', N'Khách hàng truy cập vào hệ thống website')
SET IDENTITY_INSERT [dbo].[Quyen] OFF
GO
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [SDT], [MaQuyen]) VALUES (N'Admin', N'abc123', N'Ban Quản trị', CAST(N'1995-02-02T00:00:00.000' AS DateTime), 0, N'Hà Nội', N'0123456789', 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [SDT], [MaQuyen]) VALUES (N'Customer', N'abc123', N'Khách Hàng', CAST(N'1991-02-02T00:00:00.000' AS DateTime), 0, N'TP. Hồ Chí Minh', N'0346738752', 2)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [SDT], [MaQuyen]) VALUES (N'Minh', N'abc123', N'Trần Ngọc Minh', CAST(N'1997-11-12T00:00:00.000' AS DateTime), 0, N'Lai Châu', N'0123476548', 1)
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (1, N'Video Về Lai Châu', 0, 2)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (2, N'Khái Quát Về Lai Châu', 3, 2)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (3, N'Bài Viết Về Lai Châu', 1, 2)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (4, N'Danh Lam Thắng Cảnh', 1, 3)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (5, N'Di Tích Lịch Sử', 0, 3)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (6, N'Nghề Truyền Thống', 0, 3)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (7, N'Lễ Hội Truyền Thống', 0, 3)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (8, N'Ẩm Thực Lai Châu', 0, 3)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (9, N'Phong Tục Tập Quán', 0, 3)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (10, N'Chợ Phiên Vùng Cao', 0, 3)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (11, N'Các Bản Du Lịch', 0, 3)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (12, N'Thư Viện Ảnh', 0, 3)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (13, N'Sản Vật - Đặt Sản', 0, 3)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (14, N'Các Cơ Sở Lưu Trú', 0, 4)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (15, N'Doanh Nghiệp Lữ Hành', 3, 4)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (16, N'Nhà Hàng', 0, 4)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (17, N'Điểm Vui Chơi Giải Trí', 0, 4)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (18, N'Điểm Mua Sắm', 0, 4)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (19, N'Thu Hút Đầu Tư', 0, 5)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (20, N'Thủ Tục Hành Chính', 0, 5)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (21, N'Văn Bản Pháp Quy', 0, 5)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (22, N'Tour Du Lịch Quốc Tế', 0, 6)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (23, N'Bản Đồ Du Lịch', 0, 6)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (24, N'Các Số Điện Thoại Cần Thiết', 0, 6)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (25, N'Giá Cả Thị Trường', 0, 6)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (26, N'Thời Tiết', 0, 6)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (27, N'Hệ Thống Ngân Hàng', 0, 6)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (28, N'Tour Du Lịch Nội Tỉnh', 0, 6)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (29, N'Tour Du Lịch Liên Tỉnh', 0, 6)
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai], [SoLuongBaiViet], [MaDanhMuc]) VALUES (30, N'Demo', 0, 3)
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
ALTER TABLE [dbo].[BaiViet] ADD  DEFAULT ((0)) FOR [LuotThich]
GO
ALTER TABLE [dbo].[BaiViet] ADD  DEFAULT ((0)) FOR [An]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[TheLoai]  WITH CHECK ADD FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
USE [master]
GO
ALTER DATABASE [TravelDB] SET  READ_WRITE 
GO
