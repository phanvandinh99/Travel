create database TravelDB
go
use TravelDB
go
create table DanhMuc
(
	MaDanhMuc int identity(1,1) primary key,
	TenDanhMuc nvarchar(200) not null,
	SoLuongTheLoai int null,
)
insert into DanhMuc(TenDanhMuc, SoLuongTheLoai) values (N'Tin Tức, Sự Kiện', 0);
insert into DanhMuc(TenDanhMuc, SoLuongTheLoai) values (N'Giới Thiệu', 0);
insert into DanhMuc(TenDanhMuc, SoLuongTheLoai) values (N'Sản Phẩm Du Lịch', 0);
insert into DanhMuc(TenDanhMuc, SoLuongTheLoai) values (N'Dịch Vụ Du Lịch', 0);
insert into DanhMuc(TenDanhMuc, SoLuongTheLoai) values (N'Cơ Chế Chính Sách', 0);
insert into DanhMuc(TenDanhMuc, SoLuongTheLoai) values (N'Thông Tin Cần Thiết', 0);
go
create table TheLoai
(
	MaTheLoai int identity(1,1) primary key,
	TenTheLoai nvarchar(200) not null,
	SoLuongBaiViet int null,
	MaDanhMuc int,

	foreign key(MaDanhMuc) references DanhMuc(MaDanhMuc),
)
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Video Về Lai Châu', 0, 2);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Khái Quát Về Lai Châu', 0, 2);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Bài Viết Về Lai Châu', 0, 2);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Danh Lam Thắng Cảnh', 0, 3);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Di Tích Lịch Sử', 0, 3);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Nghề Truyền Thống', 0, 3);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Lễ Hội Truyền Thống', 0, 3);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Ẩm Thực Lai Châu', 0, 3);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Phong Tục Tập Quán', 0, 3);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Chợ Phiên Vùng Cao', 0, 3);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Các Bản Du Lịch', 0, 3);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Thư Viện Ảnh', 0, 3);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Sản Vật - Đặt Sản', 0, 3);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Các Cơ Sở Lưu Trú', 0, 4);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Doanh Nghiệp Lữ Hành', 0, 4);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Nhà Hàng', 0, 4);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Điểm Vui Chơi Giải Trí', 0, 4);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Điểm Mua Sắm', 0, 4);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Thu Hút Đầu Tư', 0, 5);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Thủ Tục Hành Chính', 0, 5);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Văn Bản Pháp Quy', 0, 5);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Tour Du Lịch Quốc Tế', 0, 6);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Bản Đồ Du Lịch', 0, 6);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Các Số Điện Thoại Cần Thiết', 0, 6);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Giá Cả Thị Trường', 0, 6);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Thời Tiết', 0, 6);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Hệ Thống Ngân Hàng', 0, 6);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Tour Du Lịch Nội Tỉnh', 0, 6);
insert into TheLoai (TenTheLoai, SoLuongBaiViet, MaDanhMuc) values (N'Tour Du Lịch Liên Tỉnh', 0, 6);

go
create table Quyen
(
	MaQuyen int identity(1,1) primary key,
	TenQuyen nvarchar(50) not null,
	MoTa nvarchar(100) null,
)
insert into Quyen (TenQuyen, MoTa) values (N'Ban Quản Trị', N'Quản lý website');
insert into Quyen (TenQuyen, MoTa) values (N'Người Dùng', N'Khách hàng truy cập vào hệ thống website');
go
create table TaiKhoan
(
	MaTaiKhoan varchar(50) primary key,
	MatKhau varchar(50) not null,
	HoTen nvarchar(100) not null,
	NgaySinh datetime null,
	GioiTinh int default(0) null, -- 0 Nam, 1 Nu
	QueQuan nvarchar(200) null,
	SDT varchar(12) not null,
	MaQuyen int, 

	foreign key(MaQuyen) references Quyen(MaQuyen),
)
insert into TaiKhoan (MaTaiKhoan, MatKhau, HoTen, NgaySinh, GioiTinh, QueQuan, SDT, MaQuyen)
values ('Admin', 'abc123', N'Ban Quản trị', '02/02/1995', 0, N'Hà Nội', '0123456789', 1);
insert into TaiKhoan (MaTaiKhoan, MatKhau, HoTen, NgaySinh, GioiTinh, QueQuan, SDT, MaQuyen)
values ('Minh', 'abc123', N'Trần Ngọc Minh', '11/12/1997', 0, N'Lai Châu', '0123476548', 1);
insert into TaiKhoan (MaTaiKhoan, MatKhau, HoTen, NgaySinh, GioiTinh, QueQuan, SDT, MaQuyen)
values ('Customer', 'abc123', N'Khách Hàng', '02/02/1991', 0, N'TP. Hồ Chí Minh', '0346738752', 2);
go
create table BaiViet
(
	MaBaiViet int identity(1,1) primary key,
	TenBaiViet nvarchar(200) not null,
	NoiDung nvarchar(max) not null,
	NgayDang datetime not null,
	NgayCapNhat datetime null,
	LuotThich int default(0) null,
	MaTheLoai int,
	MaTaiKhoan varchar(50),

	foreign key(MaTheLoai) references TheLoai(MaTheLoai),
	foreign key(MaTaiKhoan) references TaiKhoan(MaTaiKhoan),
)