USE [master]
GO
/****** Object:  Database [webDatLich]    Script Date: 14/03/2021 00:54:04 ******/
CREATE DATABASE [webDatLich]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webDatLich', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\webDatLich.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'webDatLich_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\webDatLich_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [webDatLich] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webDatLich].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webDatLich] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webDatLich] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webDatLich] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webDatLich] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webDatLich] SET ARITHABORT OFF 
GO
ALTER DATABASE [webDatLich] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [webDatLich] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [webDatLich] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webDatLich] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webDatLich] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webDatLich] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webDatLich] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webDatLich] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webDatLich] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webDatLich] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webDatLich] SET  ENABLE_BROKER 
GO
ALTER DATABASE [webDatLich] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webDatLich] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webDatLich] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webDatLich] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webDatLich] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webDatLich] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webDatLich] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webDatLich] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [webDatLich] SET  MULTI_USER 
GO
ALTER DATABASE [webDatLich] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webDatLich] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webDatLich] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webDatLich] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [webDatLich]
GO
/****** Object:  StoredProcedure [dbo].[checkAcccount]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkAcccount]
	@matkhau nvarchar(255),
	@TaiKhoan nvarchar(255)
	as
	select * from tblNguoiDung where spass = @matkhau and susername = @TaiKhoan;

GO
/****** Object:  StoredProcedure [dbo].[get_thongtintaikhoan]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_thongtintaikhoan]
	@Taikhoan nvarchar(255),
	@Matkhau nvarchar(255)
as
	begin
		select * from tblNguoiDung
		where susername like @Taikhoan and spass = @Matkhau
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_baoBaoTheoNgay]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_baoBaoTheoNgay]
@ngayDau datetime,
@ngayCuoi dateTime
as
select ck.iMaChuyenKhoa, ck.stenchuyenkhoa,ISNULL( kq.luotKham,0) as luotKham, ISNULL(kq.tongTien ,0) as tongTien from tblchuyenkhoa ck LEFT  join 
(select g.iMaChuyenKhoa, count(a.iMaPhieuKham) as luotKham, SUM(b.iSoLuong * c.iTienPhi) as tongTien from tblPhieuKhamBenh a, tblChiTietPhieuKham b, tblDichVuYTe c, tblLichHenKham d, tblNguoiDung g
where a.iMaPhieuKham = b.iMaPhieuKham and b.iMaDichVu = c.iMaDichVu and a.iMaLichHen = d.iMaLichHenKham and d.iMaBacSi = g.iMaNguoiDung
 and a.dThoiGianTao >= @ngayDau and a.dThoiGianTao <= @ngayCuoi and g.iMaChuyenKhoa !=1 group by g.iMaChuyenKhoa) kq on ck.iMaChuyenKhoa = kq.iMaChuyenKhoa and ck.iMaChuyenKhoa != 1
GO
/****** Object:  StoredProcedure [dbo].[sp_capNhatDichVu]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_capNhatDichVu]
@id int,
@ten nvarchar(60),
@tien int
as
update tblDichVuYTe set sTenDichVu = @ten, iTienPhi=@tien where iMaDichVu = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_capnhattk]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_capnhattk]
@id int,
@ten nvarchar(35),
@gt bit,
@maquyen int,
@dt varchar(20),
@mail varchar(20), 
@chuyenKhoa int
as
update tblNguoiDung set shoten = @ten,bGioiTinh = @gt,iMaQuyen = @maquyen,sSDT = @dt,sEmail= @mail
where iMaNguoiDung = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachDichVu]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_danhSachDichVu]
as
select * from tblDichVuYTe
GO
/****** Object:  StoredProcedure [dbo].[sp_dichVuYte]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_dichVuYte]
	@tendichvu nvarchar(40),
	@tienphi int
	as
	insert into tblDichVuYTe(stendichvu, itienphi) values
(@tendichvu, @tienphi)
GO
/****** Object:  StoredProcedure [dbo].[sp_dsBacSi]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_dsBacSi]
as
select * from tblNguoiDung, tblChuyenKhoa where tblNguoiDung.iMaChuyenKhoa = tblChuyenKhoa.iMaChuyenKhoa
and tblNguoiDung.iMaQuyen = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_dsLichKham]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dsLichKham]
@ngay date
as
select * from tblBenhNhan a, tblChuyenKhoa b, tblLichHenKham c , tblNguoiDung d where
a.iMaBenhNhan = c.iMaBenhNhan and c.iMaBacSi = d.iMaNguoiDung and d.iMaChuyenKhoa = b.iMaChuyenKhoa
and c.dThoiGianHen = @ngay
GO
/****** Object:  StoredProcedure [dbo].[sp_dsLichKhamTheoBS]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dsLichKhamTheoBS]
@ngay date,
@id int
as
select * from tblBenhNhan a, tblChuyenKhoa b, tblLichHenKham c , tblNguoiDung d where
a.iMaBenhNhan = c.iMaBenhNhan and c.iMaBacSi = d.iMaNguoiDung and d.iMaChuyenKhoa = b.iMaChuyenKhoa
and c.dThoiGianHen = @ngay and c.iMaBacSi = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_layDSChuyenKhoa]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layDSChuyenKhoa]
as
select * from tblchuyenkhoa where iMaChuyenKhoa !=  1
GO
/****** Object:  StoredProcedure [dbo].[sp_layDSPhieuKham]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_layDSPhieuKham]
@ngay date
as
select a.iMaPhieuKham,a.dThoiGianTao, d.shoten, g.sTenBenhNhan,  sum(b.iSoLuong * e.iTienPhi) as tienPhi from tblPhieuKhamBenh a, tblChiTietPhieuKham b, tblLichHenKham c, tblNguoiDung d, tblDichVuYTe e, tblBenhNhan g
where a.iMaPhieuKham = b.iMaPhieuKham and a.iMaLichHen = c.iMaLichHenKham and c.iMaBacSi = d.iMaNguoiDung
and CAST(a.dThoiGianTao as DATE) = @ngay
and b.iMaDichVu = e.iMaDichVu and g.iMaBenhNhan = c.iMaBenhNhan group by a.iMaPhieuKham,a.dThoiGianTao, d.shoten, g.sTenBenhNhan

GO
/****** Object:  StoredProcedure [dbo].[sp_layDSPhieuKhamTheoBacSi]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layDSPhieuKhamTheoBacSi]
@ngay date,
@id int
as
select a.iMaPhieuKham,a.dThoiGianTao, d.shoten, g.sTenBenhNhan,  sum(b.iSoLuong * e.iTienPhi) as tienPhi from tblPhieuKhamBenh a, tblChiTietPhieuKham b, tblLichHenKham c, tblNguoiDung d, tblDichVuYTe e, tblBenhNhan g
where a.iMaPhieuKham = b.iMaPhieuKham and a.iMaLichHen = c.iMaLichHenKham and c.iMaBacSi = d.iMaNguoiDung
and CAST(a.dThoiGianTao as DATE) = @ngay and d.iMaNguoiDung = @id
and b.iMaDichVu = e.iMaDichVu and g.iMaBenhNhan = c.iMaBenhNhan group by a.iMaPhieuKham,a.dThoiGianTao, d.shoten, g.sTenBenhNhan


GO
/****** Object:  StoredProcedure [dbo].[sp_layDVyteCuaPhieuKham]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_layDVyteCuaPhieuKham]
@id int
as
select tblDichVuYTe.sTenDichVu, tblDichVuYTe.iTienPhi, tblChiTietPhieuKham.iSoLuong, sum(tblChiTietPhieuKham.iSoLuong * tblDichVuYTe.iTienPhi) as iTongTien from tblChiTietPhieuKham, tblDichVuYTe where tblChiTietPhieuKham.iMaPhieuKham = @id and
tblChiTietPhieuKham.iMaDichVu = tblDichVuYTe.iMaDichVu
group by  tblDichVuYTe.sTenDichVu, tblDichVuYTe.iTienPhi, tblChiTietPhieuKham.iSoLuong
GO
/****** Object:  StoredProcedure [dbo].[sp_layGiaDV]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layGiaDV] 
@id int
as
select * from tblDichVuYTe where iMaDichVu = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_layPhieuKham]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layPhieuKham]
@id int
as
select a.iMaPhieuKham,a.dThoiGianTao, d.shoten, g.sTenBenhNhan,  sum(b.iSoLuong * e.iTienPhi) as tienPhi from tblPhieuKhamBenh a, tblChiTietPhieuKham b, tblLichHenKham c, tblNguoiDung d, tblDichVuYTe e, tblBenhNhan g
where a.iMaPhieuKham = b.iMaPhieuKham and a.iMaLichHen = c.iMaLichHenKham and c.iMaBacSi = d.iMaNguoiDung
--and a.iMaPhieuKham = @id
and b.iMaDichVu = e.iMaDichVu and g.iMaBenhNhan = c.iMaBenhNhan group by a.iMaPhieuKham,a.dThoiGianTao, d.shoten, g.sTenBenhNhan
GO
/****** Object:  StoredProcedure [dbo].[sp_laySoLuongKham]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_laySoLuongKham]
@id int,
@ngay datetime
as
select * from tblLichHenKham where iMaBacSi = @id
and CAST(dThoiGianHen as DATE) =  CAST(@ngay as DATE)
and iTrangThai != 2
GO
/****** Object:  StoredProcedure [dbo].[sp_layTTbenhNhan]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layTTbenhNhan] 
@id int
as
select * from tblLichHenKham, tblBenhNhan where tblBenhNhan.iMaBenhNhan = tblLichHenKham.iMaBenhNhan
and tblLichHenKham.iMaLichHenKham = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_layTTphieuKham]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layTTphieuKham]
@id int
as
select * from tblPhieuKhamBenh a, tblLichHenKham b , tblBenhNhan c, tblNguoiDung d
where a.iMaLichHen = b.iMaLichHenKham and b.iMaBenhNhan = c.iMaBenhNhan and b.iMaBacSi = d.iMaNguoiDung
and a.iMaPhieuKham = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_themBN]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themBN]
@ten nvarchar(30),
@diachi nvarchar(50),
@sdt nvarchar(15),
@bh nvarchar(20),
@ns date,
@gt bit,
@id int out
as
insert into tblBenhNhan (sTenBenhNhan, sDiaChi,sSDT,sMBH,dNgaySinh,bgioitinh) OUTPUT INSERTED.iMaBenhNhan as id values
(@ten,@diachi,@sdt,@bh,@ns,@gt)
 set @id = SCOPE_IDENTITY()
return @id;
GO
/****** Object:  StoredProcedure [dbo].[sp_themLichKham]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themLichKham]
@nguoiTao int,
@bacSi int,
@thoigiantao datetime,
@benhnhan int,
@sphongkham nvarchar(80),
@ngayhen datetime
as
insert into tblLichHenKham (iMaNguoiTao, iMaBacSi, dThoiGianTao, dThoiGianHen, iMaBenhNhan, sPhongKham, iTrangThai )
values (@nguoitao, @bacsi, @thoigiantao, @ngayhen, @benhnhan, @sphongkham, 0)
GO
/****** Object:  StoredProcedure [dbo].[sp_themPhieuKham]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_themPhieuKham]
@maLichHen int,
@thoigian datetime,
@chuandoan nvarchar(200),
@canlamsang nvarchar(200),
@tieusu nvarchar(200),
@dieutri nvarchar(200),
@id int out
as
update tblLichHenKham set iTrangThai=1 where iMaLichHenKham = @maLichHen
insert into tblPhieuKhamBenh (iMaLichHen,dThoiGianTao,sChuanDoan,sTieuSuBenh,sCanLamSang,sHuongDieuTri)
 OUTPUT INSERTED.iMaPhieuKham as id 
values (@maLichHen,@thoigian,@chuandoan,@tieusu,@canlamsang,@dieutri)
set @id = SCOPE_IDENTITY()
return @id;

GO
/****** Object:  StoredProcedure [dbo].[sp_themtk]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_themtk]
@user nvarchar(30),
@pass nvarchar(100),
@ten nvarchar(35),
@gt bit,
@maquyen int,
@dt varchar(20),
@mail varchar(20),
@chuyenKhoa int
as
insert into tblNguoiDung (susername,spass,shoten,bGioiTinh,iMaQuyen,sSDT,sEmail,iMaChuyenKhoa) values
(@user,@pass,@ten,@gt,@maquyen,@dt,@mail,@chuyenKhoa)
GO
/****** Object:  StoredProcedure [dbo].[updatePassWord]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[updatePassWord]
	@matkhau nvarchar(255),
	@TaiKhoan nvarchar(255)
	as
	update tblNguoiDung set spass = @matkhau where susername = @TaiKhoan;
GO
/****** Object:  Table [dbo].[tblBenhNhan]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBenhNhan](
	[iMaBenhNhan] [int] IDENTITY(1,1) NOT NULL,
	[sTenBenhNhan] [nvarchar](40) NULL,
	[sDiaChi] [nvarchar](80) NULL,
	[sSDT] [nvarchar](20) NULL,
	[sMBH] [nvarchar](20) NULL,
	[iTienPhi] [int] NULL,
	[dNgaySinh] [date] NULL,
	[bgioitinh] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaBenhNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChiTietPhieuKham]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietPhieuKham](
	[iMaPhieuKham] [int] NOT NULL,
	[iMaDichVu] [int] NOT NULL,
	[iSoLuong] [int] NULL,
 CONSTRAINT [PK_HNHH] PRIMARY KEY CLUSTERED 
(
	[iMaPhieuKham] ASC,
	[iMaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChuyenKhoa]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChuyenKhoa](
	[iMaChuyenKhoa] [int] IDENTITY(1,1) NOT NULL,
	[stenchuyenkhoa] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaChuyenKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDichVuYTe]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDichVuYTe](
	[iMaDichVu] [int] IDENTITY(1,1) NOT NULL,
	[sTenDichVu] [nvarchar](70) NULL,
	[iTienPhi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLichHenKham]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLichHenKham](
	[iMaLichHenKham] [int] IDENTITY(1,1) NOT NULL,
	[iMaNguoiTao] [int] NOT NULL,
	[iMaBacSi] [int] NOT NULL,
	[dThoiGianTao] [datetime] NULL,
	[dThoiGianHen] [datetime] NULL,
	[iMaBenhNhan] [int] NOT NULL,
	[sPhongKham] [nvarchar](80) NULL,
	[iTrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaLichHenKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNguoiDung]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNguoiDung](
	[iMaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[susername] [nvarchar](35) NULL,
	[spass] [nvarchar](100) NULL,
	[shoten] [nvarchar](35) NULL,
	[bGioiTinh] [bit] NULL,
	[iMaQuyen] [int] NOT NULL,
	[sSDT] [varchar](20) NULL,
	[sEmail] [varchar](20) NULL,
	[iMaChuyenKhoa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPhieuKhamBenh]    Script Date: 14/03/2021 00:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieuKhamBenh](
	[iMaPhieuKham] [int] IDENTITY(1,1) NOT NULL,
	[iMaLichHen] [int] NOT NULL,
	[dThoiGianTao] [datetime] NULL,
	[sChuanDoan] [nvarchar](200) NULL,
	[sCanLamSang] [nvarchar](200) NULL,
	[sTieuSuBenh] [nvarchar](200) NULL,
	[sHuongDieuTri] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaPhieuKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblBenhNhan] ON 

INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (1, N'243', N'4234', N'234', N'324433', NULL, CAST(0x22420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (2, N'13', N'1232', N'12312', N'2312', NULL, CAST(0x26420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (3, N'ba', N'423', N'42342343', N'34234', NULL, CAST(0x1F420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (4, N'543', N'5435', N'534534', N'5345', NULL, CAST(0x2F420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (5, N'rưer', N'rưe', N'234324', N'ưerew', NULL, CAST(0x19420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (6, N'4234', N'4234', N'23423', N'23423', NULL, CAST(0x18420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (7, N'234', N'23432', N'4234324', N'23423', NULL, CAST(0x0C420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (8, N'1234', N'1234', N'511232', N'123', NULL, CAST(0x1F420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (9, N'323', N'423423', N'2423432', N'4234', NULL, CAST(0x21420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (10, N'4234', N'4234', N'423423', N'4234', NULL, CAST(0x3B420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (11, N'5345', N'5345', N'345345', N'5345', NULL, CAST(0x18420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (12, N'23423', N'4234', N'23432', N'34234', NULL, CAST(0x27420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (13, N'4342', N'4234', N'42342343', N'4324', NULL, CAST(0x1F420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (14, N'avc', N'ava', N'534534', N'4234234', NULL, CAST(0x4B420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (15, N'123', N'123', N'312312', N'3123', NULL, CAST(0x42420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (16, N'312', N'312', N'511232', N'312', NULL, CAST(0x3B420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (17, N'1234', N'123', N'511232312', N'312', NULL, CAST(0x3B420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (18, N'123', N'123', N'3123', N'3123', NULL, CAST(0x3B420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (19, N'Nguyễn Lê', N'Hà NỘi', N'0695656562', N'111326595955659', NULL, CAST(0x58420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (20, N'Bùi Tiến', N'Hà NỘi', N'0986525565', N'09656596595959', NULL, CAST(0x52420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (21, N'Nguyễn Bá Lan', N'Hà NỘi', N'0695656562', N'111326595955659', NULL, CAST(0x59420B00 AS Date), 1)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (22, N'Trần Hoa Anh', N'Hà NỘi', N'0695656562', N'111326595955659', NULL, CAST(0x4B420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (23, N'Trần Hoa A', N'Hà NỘi', N'0695656562', N'111326595955659', NULL, CAST(0x57420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (24, N'Lê Hà B', N'Hà NỘi', N'0695656562', N'111326595955659', NULL, CAST(0x57420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (25, N'Lê Hà BN', N'Hà NỘi', N'0695656562', N'111326595955659', NULL, CAST(0x59420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (26, N'Trần Hoa W', N'Hà NỘi', N'0695656562', N'111326595955659', NULL, CAST(0x62420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (27, N'Bùi Tiến', N'Hà NỘi', N'0695656562', N'111326595955659', NULL, CAST(0x57420B00 AS Date), 0)
INSERT [dbo].[tblBenhNhan] ([iMaBenhNhan], [sTenBenhNhan], [sDiaChi], [sSDT], [sMBH], [iTienPhi], [dNgaySinh], [bgioitinh]) VALUES (28, N'Bùi Tiến', N'Hà NỘi', N'0695656562', N'', NULL, CAST(0x58420B00 AS Date), 0)
SET IDENTITY_INSERT [dbo].[tblBenhNhan] OFF
INSERT [dbo].[tblChiTietPhieuKham] ([iMaPhieuKham], [iMaDichVu], [iSoLuong]) VALUES (7, 1, 1)
INSERT [dbo].[tblChiTietPhieuKham] ([iMaPhieuKham], [iMaDichVu], [iSoLuong]) VALUES (7, 2, 1)
INSERT [dbo].[tblChiTietPhieuKham] ([iMaPhieuKham], [iMaDichVu], [iSoLuong]) VALUES (8, 1, 1)
INSERT [dbo].[tblChiTietPhieuKham] ([iMaPhieuKham], [iMaDichVu], [iSoLuong]) VALUES (9, 1, 1)
INSERT [dbo].[tblChiTietPhieuKham] ([iMaPhieuKham], [iMaDichVu], [iSoLuong]) VALUES (10, 2, 4)
INSERT [dbo].[tblChiTietPhieuKham] ([iMaPhieuKham], [iMaDichVu], [iSoLuong]) VALUES (11, 1, 1)
INSERT [dbo].[tblChiTietPhieuKham] ([iMaPhieuKham], [iMaDichVu], [iSoLuong]) VALUES (11, 3, 1)
SET IDENTITY_INSERT [dbo].[tblChuyenKhoa] ON 

INSERT [dbo].[tblChuyenKhoa] ([iMaChuyenKhoa], [stenchuyenkhoa]) VALUES (1, N'None')
INSERT [dbo].[tblChuyenKhoa] ([iMaChuyenKhoa], [stenchuyenkhoa]) VALUES (2, N'Khoa Tai - Mũi - Họng')
INSERT [dbo].[tblChuyenKhoa] ([iMaChuyenKhoa], [stenchuyenkhoa]) VALUES (3, N'Khoa Tim Mạch')
INSERT [dbo].[tblChuyenKhoa] ([iMaChuyenKhoa], [stenchuyenkhoa]) VALUES (4, N'Khoa Ngoại')
INSERT [dbo].[tblChuyenKhoa] ([iMaChuyenKhoa], [stenchuyenkhoa]) VALUES (5, N'Khoa Nhi')
INSERT [dbo].[tblChuyenKhoa] ([iMaChuyenKhoa], [stenchuyenkhoa]) VALUES (6, N'Khoa Nam Học')
SET IDENTITY_INSERT [dbo].[tblChuyenKhoa] OFF
SET IDENTITY_INSERT [dbo].[tblDichVuYTe] ON 

INSERT [dbo].[tblDichVuYTe] ([iMaDichVu], [sTenDichVu], [iTienPhi]) VALUES (1, N'Khám Tổng Quát 1', 60000)
INSERT [dbo].[tblDichVuYTe] ([iMaDichVu], [sTenDichVu], [iTienPhi]) VALUES (2, N'Châm cứu', 40000)
INSERT [dbo].[tblDichVuYTe] ([iMaDichVu], [sTenDichVu], [iTienPhi]) VALUES (3, N'Siêu Âm', 80000)
INSERT [dbo].[tblDichVuYTe] ([iMaDichVu], [sTenDichVu], [iTienPhi]) VALUES (4, N'Điện Tâm Đồ', 90000)
INSERT [dbo].[tblDichVuYTe] ([iMaDichVu], [sTenDichVu], [iTienPhi]) VALUES (5, N'Nội Soi', 75000)
INSERT [dbo].[tblDichVuYTe] ([iMaDichVu], [sTenDichVu], [iTienPhi]) VALUES (6, N'Chụp X Quang', 75000)
SET IDENTITY_INSERT [dbo].[tblDichVuYTe] OFF
SET IDENTITY_INSERT [dbo].[tblLichHenKham] ON 

INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (3, 2, 2, CAST(0x0000A87B00000000 AS DateTime), CAST(0x0000A87B00000000 AS DateTime), 1, N'abcx', 0)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (10, 2, 5, CAST(0x0000ACDD018B6D4A AS DateTime), CAST(0x0000ACDD00000000 AS DateTime), 13, N'423', 0)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (11, 2, 5, CAST(0x0000ACDF01165C35 AS DateTime), CAST(0x0000ACF200000000 AS DateTime), 14, N'4324234', 1)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (12, 2, 5, CAST(0x0000ACE200A43EA1 AS DateTime), CAST(0x0000ACF000000000 AS DateTime), 15, N'2123', 0)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (13, 2, 5, CAST(0x0000ACE200A4C376 AS DateTime), CAST(0x0000ACEA00000000 AS DateTime), 16, N'3123', 0)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (15, 2, 5, CAST(0x0000ACE40087B161 AS DateTime), CAST(0x0000ACE400000000 AS DateTime), 18, N'32132', 1)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (16, 2, 7, CAST(0x0000ACE60099E9D1 AS DateTime), CAST(0x0000ACF200000000 AS DateTime), 19, N'abc', 1)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (17, 2, 5, CAST(0x0000ACE6009A5016 AS DateTime), CAST(0x0000ACF200000000 AS DateTime), 20, N'abc', 0)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (19, 10, 7, CAST(0x0000ACE70099D3EC AS DateTime), CAST(0x0000ACE400000000 AS DateTime), 22, N'abc', 2)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (20, 2, 5, CAST(0x0000ACE800861DCB AS DateTime), CAST(0x0000ACF200000000 AS DateTime), 23, N'abc', 0)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (21, 2, 5, CAST(0x0000ACE800865526 AS DateTime), CAST(0x0000ACDE00000000 AS DateTime), 24, N'abc', 0)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (22, 2, 5, CAST(0x0000ACE800869DF8 AS DateTime), CAST(0x0000ACDE00000000 AS DateTime), 25, N'abc', 0)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (23, 2, 5, CAST(0x0000ACE80086CE6E AS DateTime), CAST(0x0000ACDE00000000 AS DateTime), 26, N'dac', 0)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (24, 2, 5, CAST(0x0000ACE800870859 AS DateTime), CAST(0x0000ACDE00000000 AS DateTime), 27, N'123', 0)
INSERT [dbo].[tblLichHenKham] ([iMaLichHenKham], [iMaNguoiTao], [iMaBacSi], [dThoiGianTao], [dThoiGianHen], [iMaBenhNhan], [sPhongKham], [iTrangThai]) VALUES (25, 2, 5, CAST(0x0000ACE801244FC1 AS DateTime), CAST(0x0000ACE800000000 AS DateTime), 28, N'', 0)
SET IDENTITY_INSERT [dbo].[tblLichHenKham] OFF
SET IDENTITY_INSERT [dbo].[tblNguoiDung] ON 

INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail], [iMaChuyenKhoa]) VALUES (2, N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', N'admin', 1, 3, N'089788884', N'mac23@gmail.com', 1)
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail], [iMaChuyenKhoa]) VALUES (3, N'usaaaa123', N'466BD066EAEA252F4853611938852CFC', N'admin1222', 1, 2, N'089788885', N'mac24@gmail.com', 1)
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail], [iMaChuyenKhoa]) VALUES (4, N'usaaaa124', N'466BD066EAEA252F4853611938852CFC', N'admin12443', 1, 2, N'089788888', N'12ad@mail.com', 1)
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail], [iMaChuyenKhoa]) VALUES (5, N'bacsi', N'E10ADC3949BA59ABBE56E057F20F883E', N'Nguyễn Lâm', 0, 1, N'098256446222', N'bacsi312@gmail.com', 5)
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail], [iMaChuyenKhoa]) VALUES (6, N'adminn', N'E10ADC3949BA59ABBE56E057F20F883E', N'adminn', 1, 3, N'089788886', N'bacsi6412@gmail.com', 1)
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail], [iMaChuyenKhoa]) VALUES (7, N'bacsi2', N'E10ADC3949BA59ABBE56E057F20F883E', N'Lê Hà', 1, 1, N'0982659565', N'bs123q@gmail.com', 2)
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail], [iMaChuyenKhoa]) VALUES (8, N'bacsi3', N'E10ADC3949BA59ABBE56E057F20F883E', N'Trần Hoa', 1, 1, N'0982659565', N'bs12saa3q@gmail.com', 3)
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail], [iMaChuyenKhoa]) VALUES (9, N'bacsi4', N'E10ADC3949BA59ABBE56E057F20F883E', N'Nguyễn Bá', 1, 1, N'0982659565', N'bsqq3q@gmail.com', 3)
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail], [iMaChuyenKhoa]) VALUES (10, N'admin2', N'E10ADC3949BA59ABBE56E057F20F883E', N'admin2', 1, 2, N'0982659565', N'admin23q@gmail.com', 1)
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail], [iMaChuyenKhoa]) VALUES (11, N'bacsi3', N'E10ADC3949BA59ABBE56E057F20F883E', N'Lê Thanh Giang', 1, 1, N'099566523', N'bs121@gmail.com', 5)
SET IDENTITY_INSERT [dbo].[tblNguoiDung] OFF
SET IDENTITY_INSERT [dbo].[tblPhieuKhamBenh] ON 

INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (1, 3, CAST(0x0000ACE2009CF8F5 AS DateTime), N'', N'', N'', N'')
INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (2, 3, CAST(0x0000ACE2009D9E22 AS DateTime), N'', N'', N'', N'')
INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (3, 3, CAST(0x0000ACE2009DE680 AS DateTime), N'', N'', N'', N'')
INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (4, 3, CAST(0x0000ACE2009E1142 AS DateTime), N'', N'', N'', N'')
INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (5, 3, CAST(0x0000ACE2009E5294 AS DateTime), N'', N'', N'', N'')
INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (6, 3, CAST(0x0000A87B00000000 AS DateTime), N'', N'', N'', N'')
INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (7, 3, CAST(0x0000ACE2009F88B7 AS DateTime), N'1', N'2', N'3', N'4')
INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (8, 12, CAST(0x0000ACE200A46C47 AS DateTime), N'2', N'32', N'123', N'2')
INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (9, 11, CAST(0x0000ACE200A4E1DE AS DateTime), N'eqw', N'ewq', N'qưe', N'qưe')
INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (10, 15, CAST(0x0000ACE40087DDBA AS DateTime), N'32', N'321', N'123', N'12')
INSERT [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham], [iMaLichHen], [dThoiGianTao], [sChuanDoan], [sCanLamSang], [sTieuSuBenh], [sHuongDieuTri]) VALUES (11, 16, CAST(0x0000ACEB000E244A AS DateTime), N'Bệnh nhân bị hen xuyễn mãn tĩnh', N'Huyết Áp 130 / 110', N'Bệnh nhân từng bị hen xuyễn', N'Thuốc astripassa 2v/  ngày
Thuốc pasanokooo 2v sáng + chiều')
SET IDENTITY_INSERT [dbo].[tblPhieuKhamBenh] OFF
ALTER TABLE [dbo].[tblChiTietPhieuKham]  WITH CHECK ADD  CONSTRAINT [FK_1] FOREIGN KEY([iMaPhieuKham])
REFERENCES [dbo].[tblPhieuKhamBenh] ([iMaPhieuKham])
GO
ALTER TABLE [dbo].[tblChiTietPhieuKham] CHECK CONSTRAINT [FK_1]
GO
ALTER TABLE [dbo].[tblChiTietPhieuKham]  WITH CHECK ADD  CONSTRAINT [FK_2] FOREIGN KEY([iMaDichVu])
REFERENCES [dbo].[tblDichVuYTe] ([iMaDichVu])
GO
ALTER TABLE [dbo].[tblChiTietPhieuKham] CHECK CONSTRAINT [FK_2]
GO
ALTER TABLE [dbo].[tblLichHenKham]  WITH CHECK ADD  CONSTRAINT [dasqsa] FOREIGN KEY([iMaBenhNhan])
REFERENCES [dbo].[tblBenhNhan] ([iMaBenhNhan])
GO
ALTER TABLE [dbo].[tblLichHenKham] CHECK CONSTRAINT [dasqsa]
GO
ALTER TABLE [dbo].[tblLichHenKham]  WITH CHECK ADD  CONSTRAINT [dasqsass] FOREIGN KEY([iMaBacSi])
REFERENCES [dbo].[tblNguoiDung] ([iMaNguoiDung])
GO
ALTER TABLE [dbo].[tblLichHenKham] CHECK CONSTRAINT [dasqsass]
GO
ALTER TABLE [dbo].[tblNguoiDung]  WITH CHECK ADD  CONSTRAINT [dasq] FOREIGN KEY([iMaChuyenKhoa])
REFERENCES [dbo].[tblChuyenKhoa] ([iMaChuyenKhoa])
GO
ALTER TABLE [dbo].[tblNguoiDung] CHECK CONSTRAINT [dasq]
GO
ALTER TABLE [dbo].[tblPhieuKhamBenh]  WITH CHECK ADD  CONSTRAINT [dassqsass] FOREIGN KEY([iMaLichHen])
REFERENCES [dbo].[tblLichHenKham] ([iMaLichHenKham])
GO
ALTER TABLE [dbo].[tblPhieuKhamBenh] CHECK CONSTRAINT [dassqsass]
GO
USE [master]
GO
ALTER DATABASE [webDatLich] SET  READ_WRITE 
GO
