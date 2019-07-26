﻿USE master
GO
IF EXISTS(select * from sys.databases where name='QuanLyNhanSu')
DROP DATABASE QuanLyNhanSu
GO

CREATE DATABASE QuanLyNhanSu
GO

USE QuanLyNhanSu
GO

CREATE TABLE PhongBan
(
	MaPB varchar(5) PRIMARY KEY,
	TenPB nvarchar(50) not null,
)
GO

CREATE TABLE ChucVu
(
	MaCV varchar(5) PRIMARY KEY,
	TenCV nvarchar(20) not null,
	PhuCap real not null
)
GO

CREATE TABLE NhanVien
(
	MaNV varchar(10) PRIMARY KEY,
	HoTen nvarchar(50) not null,
	GioiTinh bit not null,
	NgaySinh date not null,
	SoCM varchar(10) not null,
	DienThoai varchar(10) not null,
	Email varchar(50) not null,
	DiaChi nvarchar(max) not null,
	Hinh varchar(max),
	TrinhDoHV nvarchar(30) not null,
	MaHD varchar(10) not null,
	MaCV varchar(5) not null,
	MaPB varchar(5),
	NgayVaoLam date not null,
	NgayKetThuc date,
	HeSoLuong real not null,
	TrangThai bit not null,

	UNIQUE(SoCM, MaHD),
	FOREIGN KEY (MaCV) REFERENCES ChucVu(MaCV),
	FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)
)
GO


CREATE TABLE TaiKhoan
(
	TaiKhoan varchar(20) PRIMARY KEY,
	MatKhau varchar(20) not null,
	MaNV varchar(10) UNIQUE,
	

	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
GO
CREATE TABLE ThanNhan
(
	MaTN int identity(1,1) PRIMARY KEY,
	HoTen nvarchar(50),
	NgheNghiep nvarchar(50),
	MoiQuanHe nvarchar(20),
	MaNV varchar(10),
	GiamTruPhuThuoc bit
	
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
GO
CREATE TABLE ChamCong
(
	MaNV varchar(10) not null,
	Ngay date not null,
	TinhTrang bit not null,

	PRIMARY KEY (MaNV, Ngay),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
GO

CREATE TABLE BangLuong
(
	MaNV varchar(10),
	NgayPhatLuong date not null,
	LuongChinh int not null,
	NgayCong int not null,
	PC_TrachNhiem int not null,
	ThuNhap int not null,
	BHXH int not null,
	BHYT int not null,
	BHTN int not null,
	PhuThuoc int not null,
	ThueTNCN int not null,
	ThucLanh int not null,
	TrangThai bit not null

	PRIMARY KEY (MaNV, NgayPhatLuong),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
GO
CREATE TABLE GiaTriTinhLuong
(
	TenGiaTri nvarchar(50) PRIMARY KEY,
	GiaTri real not null
)
GO

CREATE TABLE BacThueTNCN
(
	Luong int PRIMARY KEY,
	Thue real not null
)
GO