﻿USE QuanLyNhanSu
GO

--Tao Stored Procedure Insert, Update, Delete cho bang PhongBan
IF (OBJECT_ID('SP_PhongBan') IS NOT NULL)
  DROP PROCEDURE SP_PhongBan
GO
CREATE PROCEDURE SP_PhongBan
(
	@MaPB varchar(5),
	@TenPB nvarchar(50),
	@StatementType char(6)
)
AS
	IF @StatementType = 'Insert'
		BEGIN
			INSERT INTO PhongBan VALUES(@MaPB, @TenPB)
		END
	IF @StatementType = 'Update'
		BEGIN
			UPDATE PhongBan 
			SET TenPB = @TenPB
			WHERE MaPB = @MaPB
		END
	IF @StatementType = 'Delete'
		BEGIN
			DELETE FROM PhongBan WHERE MaPB = @MaPB
		END
GO

--Tao Stored Procedure Insert, Update, Delete cho bang ChucVu
IF (OBJECT_ID('SP_ChucVu') IS NOT NULL)
  DROP PROCEDURE SP_ChucVu
GO
CREATE PROCEDURE SP_ChucVu
(
	@MaCV varchar(5),
	@TenCV nvarchar(50),
	@PhuCap real,
	@StatementType char(6)
)
AS
	IF @StatementType = 'Insert'
		BEGIN
			INSERT INTO ChucVu VALUES(@MaCV, @TenCV, @PhuCap)
		END
	IF @StatementType = 'Update'
		BEGIN
			UPDATE ChucVu 
			SET TenCV = @TenCV, PhuCap = @PhuCap
			WHERE MaCV = @MaCV
		END
	IF @StatementType = 'Delete'
		BEGIN
			DELETE FROM ChucVu WHERE MaCV = @MaCV
		END
GO

--Tao Stored Procedure Insert, Update, Delete cho bang NhanVien
IF (OBJECT_ID('SP_NhanVien') IS NOT NULL)
  DROP PROCEDURE SP_NhanVien
GO

CREATE PROCEDURE SP_NhanVien
(
	@MaNV varchar(10),
	@HoTen nvarchar(50),
	@GioiTinh bit,
	@NgaySinh date,
	@SoCM varchar(10),
	@DienThoai varchar(10),
	@Email varchar(50),
	@DiaChi nvarchar(max),
	@Hinh varchar(max),
	@TrinhDoHV nvarchar(30),
	@MaHD varchar(10),
	@MaCV varchar(5),
	@MaPB varchar(5),
	@NgayVaoLam date,
	@NgayKetThuc date,
	@HeSoLuong real,
	@TrangThai bit,
	@StatementType char(6)
)
AS
	IF @StatementType = 'Insert'
		BEGIN
			INSERT INTO NhanVien VALUES(@MaNV, @HoTen, @GioiTinh, @NgaySinh, @SoCM, 
				@DienThoai, @MaNV + '@cty.com.vn', @DiaChi, @Hinh, @TrinhDoHV, @MaHD, @MaCV, @MaPB, 
				@NgayVaoLam, @NgayKetThuc, @HeSoLuong, @TrangThai)
		END
	IF @StatementType = 'Update'
		BEGIN
			UPDATE NhanVien 
			SET HoTen = @HoTen, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, SoCM = @SoCM,
				DienThoai = @DienThoai, Email = @Email, DiaChi = @DiaChi, Hinh = @Hinh, TrinhDoHV = @TrinhDoHV,
				MaHD = @MaHD, MaCV = @MaCV, MaPB = @MaPB, NgayVaoLam = @NgayVaoLam, 
				NgayKetThuc = @NgayKetThuc, HeSoLuong = @HeSoLuong, TrangThai = @TrangThai
			WHERE MaNV = @MaNV
		END
	IF @StatementType = 'Delete'
		BEGIN
			DELETE FROM NhanVien WHERE MaNV = @MaNV
		END
GO


--Tao Stored Procedure Insert, Update, Delete cho bang TaiKhoan
IF (OBJECT_ID('SP_TaiKhoan') IS NOT NULL)
  DROP PROCEDURE SP_TaiKhoan
GO
CREATE PROCEDURE SP_TaiKhoan
(
	@TaiKhoan varchar(20),
	@MatKhau varchar(20),
	@MaNV varchar(10),
	@StatementType char(6)
)
AS
	IF @StatementType = 'Insert'
		BEGIN
			INSERT INTO TaiKhoan VALUES(@TaiKhoan, @MatKhau, @MaNV)
		END
	IF @StatementType = 'Update'
		BEGIN
			UPDATE TaiKhoan 
			SET MatKhau = @MatKhau, MaNV = @MaNV
			WHERE TaiKhoan = @TaiKhoan
		END
	IF @StatementType = 'Delete'
		BEGIN
			DELETE FROM TaiKhoan WHERE TaiKhoan = @TaiKhoan
		END
GO

--Tao Stored Procedure Insert, Update, Delete cho bang ThanNhan
IF (OBJECT_ID('SP_ThanNhan') IS NOT NULL)
  DROP PROCEDURE SP_ThanNhan
GO
CREATE PROCEDURE SP_ThanNhan
(
	@MaTN int,
	@HoTen nvarchar(50),
	@NgheNghiep nvarchar(50),
	@MoiQuanHe nvarchar(20),
	@MaNV varchar(10),
	@GiamTruPhuThuoc bit,
	@StatementType char(6)
)
AS
	IF @StatementType = 'Insert'
		BEGIN
			INSERT INTO ThanNhan VALUES(@HoTen, @NgheNghiep, @MoiQuanHe, @MaNV, @GiamTruPhuThuoc)
		END
	IF @StatementType = 'Update'
		BEGIN
			UPDATE ThanNhan 
			SET HoTen = @HoTen, NgheNghiep = @NgheNghiep, MoiQuanHe = @MoiQuanHe, MaNV = @MaNV, GiamTruPhuThuoc = @GiamTruPhuThuoc
			WHERE MaTN = @MaTN
		END
	IF @StatementType = 'Delete'
		BEGIN
			DELETE FROM ThanNhan WHERE MaTN = @MaTN
		END
GO

--Tao Stored Procedure Insert, Update, Delete cho bang ChamCong
IF (OBJECT_ID('SP_ChamCong') IS NOT NULL)
  DROP PROCEDURE SP_ChamCong
GO

CREATE PROCEDURE SP_ChamCong
(
	@MaNV varchar(10),
	@Ngay date,
	@TinhTrang bit,
	@StatementType char(6)
)
AS
	IF @StatementType = 'Insert'
		BEGIN
			IF @Ngay is null
				BEGIN
					SET @Ngay = (SELECT CAST(getdate() AS date))
				END
			INSERT INTO ChamCong VALUES(@MaNV, @Ngay, @TinhTrang)
		END
	IF @StatementType = 'Update'
		BEGIN
			UPDATE ChamCong 
			SET TinhTrang = @TinhTrang
			WHERE MaNV = @MaNV AND Ngay = @Ngay
		END
	IF @StatementType = 'Delete'
		BEGIN
			DELETE FROM ChamCong WHERE MaNV = @MaNV AND Ngay = @Ngay
		END
GO

--Tao Stored Procedure Insert, Update, Delete cho bang GiaTriTinhLuong
IF (OBJECT_ID('SP_GiaTriTinhLuong') IS NOT NULL)
  DROP PROCEDURE SP_GiaTriTinhLuong
GO

CREATE PROCEDURE SP_GiaTriTinhLuong
(
	@TenGiaTri nvarchar(50),
	@GiaTri real,
	@StatementType char(6)
)
AS
	IF @StatementType = 'Insert'
		BEGIN
			INSERT INTO GiaTriTinhLuong VALUES(@TenGiaTri, @GiaTri)
		END
	IF @StatementType = 'Update'
		BEGIN
			UPDATE GiaTriTinhLuong 
			SET GiaTri = @GiaTri
			WHERE TenGiaTri = @TenGiaTri
		END
	IF @StatementType = 'Delete'
		BEGIN
			DELETE FROM GiaTriTinhLuong WHERE TenGiaTri = @TenGiaTri
		END
GO

--Tao Stored Procedure Insert, Update, Delete cho bang ThueTNCN
IF (OBJECT_ID('SP_BacThueTNCN') IS NOT NULL)
  DROP PROCEDURE SP_BacThueTNCN
GO

CREATE PROCEDURE SP_BacThueTNCN
(
	@Luong int,
	@Thue real,
	@StatementType char(6)
)
AS
	IF @StatementType = 'Insert'
		BEGIN
			INSERT INTO BacThueTNCN VALUES(@Luong, @Thue)
		END
	IF @StatementType = 'Update'
		BEGIN
			UPDATE BacThueTNCN 
			SET Thue = @Thue
			WHERE Luong = @Luong
		END
	IF @StatementType = 'Delete'
		BEGIN
			DELETE FROM BacThueTNCN WHERE Luong = @Luong
		END
GO

--Tao cac Function lay Gia tri de Insert cho BangLuong

--Tao Function lay Gia tri tu bang GiaTriTinhLuong
IF (OBJECT_ID('FN_SelectGiaTri') IS NOT NULL)
  DROP FUNCTION FN_SelectGiaTri
GO
CREATE FUNCTION FN_SelectGiaTri
(
	@TenGiaTri nvarchar(50)
)
RETURNS real
AS
	BEGIN
		DECLARE @GiaTri real
		SET @GiaTri = (SELECT GiaTri FROM GiaTriTinhLuong WHERE TenGiaTri = @TenGiaTri)
		RETURN @GiaTri
	END
GO

--Tao Function tinh luong chinh
IF (OBJECT_ID('FN_LuongChinh') IS NOT NULL)
  DROP FUNCTION FN_LuongChinh
GO
CREATE FUNCTION FN_LuongChinh
(
	@MaNV varchar(10)
)
RETURNS int
AS
	BEGIN
		DECLARE @LuongChinh int
		SET @LuongChinh = (SELECT HeSoLuong FROM NhanVien WHERE MaNV = @MaNV)*[dbo].[FN_SelectGiaTri]('LuongCB')
		RETURN @LuongChinh
	END
GO

--Tao Function tinh so ngay cong theo thang/nam
IF (OBJECT_ID('FN_SoNgayCong') IS NOT NULL)
  DROP FUNCTION FN_SoNgayCong
GO
CREATE FUNCTION FN_SoNgayCong
(
	@MaNV varchar(10),
	@NgayDauThang date
)
RETURNS int
AS
	BEGIN
		DECLARE @NgayCong int
		SET @NgayCong = (SELECT COUNT(MaNV) FROM ChamCong WHERE MaNV = @MaNV AND 
				Ngay BETWEEN @NgayDauThang AND EOMONTH(@NgayDauThang))

		RETURN @NgayCong
	END
GO
select * from ChamCong where MaNV = 'it001'
select [dbo].[FN_SoNgayCong]('IT001', '2019-5-1')
--Tao Function tinh thue TNCN
IF (OBJECT_ID('FN_TinhThueTNCN') IS NOT NULL)
  DROP FUNCTION FN_TinhThueTNCN
GO
CREATE FUNCTION FN_TinhThueTNCN
(
	@ThuNhapChiuThue int
)
RETURNS int
AS
	BEGIN
		DECLARE @ThueTNCN int
		SET @ThueTNCN = @ThuNhapChiuThue*(SELECT TOP 1 Thue FROM BacThueTNCN WHERE Luong < 16000000 ORDER BY Luong DESC)
		IF @ThueTNCN < 0 SET @ThueTNCN = 0
		RETURN @ThueTNCN
	END
GO

--Tao Stored Procedure Insert cho bang BangLuong
IF (OBJECT_ID('SP_Insert_BangLuong') IS NOT NULL)
  DROP PROCEDURE SP_Insert_BangLuong
GO

CREATE PROCEDURE SP_Insert_BangLuong
(
	@MaNV varchar(10),
	@NgayPhatLuong date,
	@TrangThai bit
)
AS
	DECLARE	@Nam char(4),
			@Thang varchar(2),
			@NgayDauThang datetime,
			@LuongChinh int,
			@NgayCong int,
			@PC_TrachNhiem int,
			@ThuNhap int,
			@BHXH int,
			@BHYT int,
			@BHTN int,
			@GiamTruPhuThuoc int,
			@ThueTNCN int,			
			@ThucLanh int		
	SET @Nam = YEAR(@NgayPhatLuong)
	SET @Thang = MONTH(@NgayPhatLuong) - 1
	SET @LuongChinh = [dbo].[FN_LuongChinh](@MaNV)
	SET @NgayDauThang = CAST(@Nam + '-' + @Thang + '-' + '1' AS datetime)
	SET @NgayCong = [dbo].[FN_SoNgayCong]('IT001', @NgayDauThang)
	SET @PC_TrachNhiem = @LuongChinh*(SELECT PhuCap FROM ChucVu WHERE MaCV = (Select MaCV FROM NhanVien WHERE MaNV = @MaNV))
	SET @ThuNhap = @LuongChinh*@NgayCong/26 + @PC_TrachNhiem
	SET @BHXH = @LuongChinh*[dbo].[FN_SelectGiaTri]('BHXH')
	SET @BHYT = @LuongChinh*[dbo].[FN_SelectGiaTri]('BHYT')
	SET @BHTN = @LuongChinh*[dbo].[FN_SelectGiaTri]('BHTN')
	SET @GiamTruPhuThuoc = 3600000*(SELECT COUNT(MaTN) FROM ThanNhan WHERE MaNV = @MaNV AND GiamTruPhuThuoc = 1)
	SET @ThueTNCN = [dbo].[FN_TinhThueTNCN](@ThuNhap - @BHXH - @BHYT - @BHTN - @GiamTruPhuThuoc)
	SET @ThucLanh = @ThuNhap - @BHXH - @BHYT - @BHTN - @ThueTNCN

	INSERT INTO BangLuong VALUES(@MaNV, @NgayPhatLuong, @LuongChinh, @NgayCong, @PC_TrachNhiem,
					@ThuNhap, @BHXH, @BHYT, @BHTN, @GiamTruPhuThuoc, @ThueTNCN, @ThucLanh, @TrangThai)
GO


--Tao Stored Procedure update cho bang BangLuong
IF (OBJECT_ID('SP_Update_BangLuong') IS NOT NULL)
  DROP PROCEDURE SP_Update_BangLuong
GO

CREATE PROCEDURE SP_Update_BangLuong
(
	@MaNV varchar(10),
	@NgayPhatLuong date,
	@TrangThai bit
)
AS
	UPDATE BangLuong
	SET TrangThai = @TrangThai
	WHERE MaNV = @MaNV AND NgayPhatLuong = @NgayPhatLuong
GO