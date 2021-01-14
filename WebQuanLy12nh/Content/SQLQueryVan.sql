
create database webTinTuc1;
--drop database bao_2_Van

drop database webTinTuc

create table tblLoaiBai
(
iMaLoaiBai int IDENTITY(1,1) NOT NULL PRIMARY KEY,
stenloaibai nvarchar (50)
)

create table tblquyen
(
pk_iquyenid int IDENTITY(1,1) NOT NULL PRIMARY KEY,
stenquyen nvarchar(20)
)




create table tblNguoiDung
(
iMaNguoiDung int IDENTITY(1,1) NOT NULL PRIMARY KEY,
susername nvarchar(35),
spass nvarchar(10),
shoten nvarchar(35),
bGioiTinh bit,
--btrangThai bit default 1,
--dngaysinh datetime,
iMaQuyen int not null,
sSDT varchar(20),
sEmail varchar(20)
)


select * from tblNguoiDung

select * from tblquyen

create proc sp_themtk
@user nvarchar(30),
@pass nvarchar(10),
@ten nvarchar(35),
@gt bit,
@maquyen int,
@dt varchar(20),
@mail varchar(20)
as
insert into tblNguoiDung (susername,spass,shoten,bGioiTinh,iMaQuyen,sSDT,sEmail) values
(@user,@pass,@ten,@gt,@maquyen,@dt,@mail)

alter table tblNguoiDung drop column btrangThai  btrangThai varchar(20)
alter table tblbaiviet add foreign key (imanguoidung) tblnguoidung (imanguoidung);

--alter table tbluser alter column pk_iuserid int IDENTITY (1,1) NOT NULL PRIMARY KEY

create table tblBaiViet
(
iMaBaiViet int IDENTITY(1,1) NOT NULL PRIMARY KEY,
stieude nvarchar(150),
snoidung nvarchar(max),
bduyet bit default 0,
ilanxem int default 0,
dngaydang datetime,
iMaNguoiDang int,
dngayduyet datetime,
imanguoiDuyet int,
btrangthai bit default 1,
iMaLoaiBai int not null,
smota nvarchar(150),
surlanh varchar(150)
)



alter table tblBaiViet add constraint fk_theloa232i 
Foreign key (iMaLoaiBai) references tblLoaiBai (iMaLoaiBai)

alter table tblBaiViet add constraint fk_thelưaoai 
Foreign key (iMaNguoiDang) references tblNguoidung (iMaNguoiDung)

alter table tblBaiViet  add surlanh varchar(150)
CREATE procedure [dbo].[get_thongtintaikhoan]
	@Taikhoan nvarchar(255),
	@Matkhau nvarchar(255)
as
	begin
		select * from tblNguoiDung
		where susername like @Taikhoan and spass = @Matkhau
	end


	alter proc sp_DuyetBai
	@idBai int,
	@idNguoiDung int,
	@thoigian datetime
	as
	update tblBaiViet set imanguoiDuyet = @idNguoiDung, bduyet = 1,dngaydang = @thoigian where iMaBaiViet = @idBai


	create proc [dbo].[checkAcccount]
	@matkhau nvarchar(255),
	@TaiKhoan nvarchar(255)
	as
	select * from tblNguoiDung where spass = @matkhau and susername = @TaiKhoan;


	create proc [dbo].[updatePassWord]
	@matkhau nvarchar(255),
	@TaiKhoan nvarchar(255)
	as
	update tblNguoiDung set spass = @matkhau where susername = @TaiKhoan;

	select * from tblBaiViet

create proc select_Baibao_daduyet
 as
 select * from tblBaiViet,tblLoaiBai where tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai
 and bduyet = 1

exec select_Baibao_daduyet


---chua sua
create proc select_Theloai_ByPK
@ma int
as
select stentheloai from tblTheLoai where pk_itheloai = @ma

select * from tblUSer

create proc select_Users_by_ID
@ma int
as
select * from tblUSer where tblUSer.pk_iuserid = @ma

alter proc select_All_Users
as
select * from tblUSer, tblquyen where tblUSer.imaquyen = tblquyen.pk_iquyenid

alter

exec select_All_Users

exec select_Users_by_ID

create proc insert_Users
@username nvarchar(35),
@pass varchar(10),
@hoten nvarchar(35),
@gt bit ,
@ns datetime,
@quyen int
as
insert into tblUSer values (@username,@pass,@hoten,@gt,0,@ns,@quyen)

create proc select_Baibao
@ma int
as
select a.fk_itheloaiid, b.stentheloai, a.stieude, a.snoidung,a.smota,a.surlanh,a.dngaydang,
a.ilanxem, c.shoten  from tblBaiBao a, tbltheloai b,
tbluser c
 where pk_ibaivietid  = @ma and a.fk_itheloaiid = b.pk_itheloai and a.iuserdang = c.pk_iuserid

 exec  select_baiBao 1

create proc update_soluotxem
@ma int 
as
update  tblBaiBao set ilanxem = ilanxem +1 where pk_ibaivietid = @ma

alter proc search_Article
@tieude nvarchar(50)
as
select a.fk_itheloaiid, a.pk_ibaivietid, a.surlanh,a.smota, a.stieude from tblBaiBao a
where a.stieude like '%' + @tieude + '%'

exec search_Article '2'


alter table tblbaibao alter column surlanh varchar(100);

select * from tblbaiBao

create proc insert_BaiViet  --ok
@tieude nvarchar(150),
@noidung nvarchar(800),
@mota nvarchar(150),
@ngaydang datetime,
@manguoidang int,
@maLoaiBai int,
@urlanh varchar(150)
as
insert into tblBaiViet (stieude,snoidung,smota,dngaydang,imanguoidang, iMaLoaiBai,surlanh)
values(@tieude,@noidung,@mota,@ngaydang,@manguoidang,@maLoaiBai,@urlanh);
  

  --ok
alter proc update_BaiViet
@maBai int,
@stieude nvarchar(150),
@snoidung nvarchar(max),
@smota nvarchar(150),
@imaLoaiBai int,
@surlanh varchar(150)
as
update tblBaiViet set stieude = @stieude, snoidung = @snoidung , smota = @smota,
 iMaLoaiBai = @imaLoaiBai, surlanh = @surlanh
where iMaBaiViet = @maBai

exec 



alter proc update_BaiViet_khongAnh
@maBai int,
@stieude nvarchar(150),
@snoidung nvarchar(max),
@smota nvarchar(150),
@imaloaibai int
as
update tblBaiViet set stieude = @stieude, snoidung = @snoidung , smota = @smota,
 iMaLoaiBai = @imaloaibai where iMaBaiViet = @maBai
where iMaBaiViet = @maBai

create proc update_Baibao2
@tieude nvarchar(150),
@noidung nvarchar(600),
@mota nvarchar(150),
@matl int,
@ma int
as
update tblbaibao set stieude = @tieude, snoidung = @noidung , smota = @mota,
 fk_itheloaiid = @matl
where pk_ibaivietid = @ma

create proc update_Users
@ma int,
@hoten nvarchar(35),
@gt bit ,
@ns datetime,
@quyen int
as
update tbluser set shoten = @hoten , bGioitinh = @gt, dngaysinh = @ns, imaquyen = @quyen
where pk_iuserid = @ma

create proc delete_Baibao
@ma int
as
delete from tblBaiBao where pk_ibaivietid = @ma

create proc select_nhomquyen_by_user
as

create proc delete_Users
@ma int
as
delete from tblUSer where pk_iuserid = @ma

create proc select_Baibao_by_user
@ma int
as
select a.bduyet,a.fk_itheloaiid, b.stentheloai, a.stieude, a.snoidung,a.smota,a.surlanh,a.dngaydang,
a.ilanxem, c.shoten, a.btrangthai, a.pk_ibaivietid  from tblBaiBao a, tbltheloai b,
tbluser c
 where a.fk_itheloaiid = b.pk_itheloai and a.iuserdang = c.pk_iuserid and a.iuserdang  = @ma

 exec select_Baibao_by_user 1 

 select * from tbluser

 create proc select_quyen_by_uID
 @ma int 
 as
 select c.pk_inhomquyenid from tbluser a, tblUser_nhomquyen b , tblNhomquyen c
 where a.pk_iuserid = 1 and a.pk_iuserid = b.fk_iuserid and fk_inhomquyenid = pk_inhomquyenid

  select * from tbluser , tblUser_nhomquyen  
 where pk_iuserid = 1 and pk_iuserid = fk_iuserid

 exec select_quyen_by_uID 1

  select * from tblUser_nhomquyen  


 create proc select_unq_by_uID
 @ma int 
 as
 select c.pk_inhomquyenid from tbluser a, tblUser_nhomquyen b , tblNhomquyen c
 where a.pk_iuserid = @ma and a.pk_iuserid = b.fk_iuserid and fk_inhomquyenid = pk_inhomquyenid

 create proc select_nhomquyen_by_user
 @ma int 
 as
 select c.pk_inhomquyenid from tbluser a, tblUser_nhomquyen b , tblNhomquyen c
 where a.pk_iuserid = @ma and a.pk_iuserid = b.fk_iuserid and fk_inhomquyenid = pk_inhomquyenid


 exec select_unq_by_uID 1

 create proc select_Users_by_ID1
 as
 select * from tbluser

 alter proc select_Theloai_ByPK
 @ma int
 as
 select pk_itheloai, stentheloai from tblTheLoai

 create proc select_Baibao_by_Theloai
 @ma int
 as
 select a.fk_itheloaiid, b.stentheloai, a.stieude, a.snoidung,a.smota,a.surlanh,a.dngaydang,
a.ilanxem, c.shoten, a.btrangthai, a.pk_ibaivietid  from tblBaiBao a, tbltheloai b,
tbluser c
 where a.fk_itheloaiid = b.pk_itheloai and a.iuserdang = c.pk_iuserid and b.pk_itheloai  = @ma

 select * from tblBaiBao
 select * from tblUSer


 create proc duyet_Baibao
 @ma int 
 as
 update tblBaiBao set bduyet = 1 where pk_ibaivietid = @ma


 --tim quyen theo id user
 create proc select_quyen_by_userid
 @ma int
 as
 select imaquyen from tbluser where pk_iuserid = @ma

 exec select_quyen_by_userid 1
 
 create proc select_quyen
 as
 select * from tblquyen


 select * from tblbaibao

create proc select_Baibao_daduyet_newsest
 as
 select top 5 * from tblBaiBao, tblTheLoai where pk_itheloai = fk_itheloaiid
 and bduyet =1
 order by dngaydang Desc

alter proc select_Baibao_daduyet
 as
 select * from tblBaiBao, tblTheLoai where
  pk_itheloai = fk_itheloaiid

  create proc sp_danhSachLoaiBai
  as
  select * from tblLoaiBai

  alter proc sp_themLoaiBai
  @loaiBai nvarchar(20)
  as
  insert into tblLoaiBai (stenloaibai) values (@loaiBai)

  create proc sp_XoaBaiDang
  @id int
  as
  delete from tblLoaiBai where iMaLoaiBai = @id

  select * from tblBaiViet

  alter proc sp_themBaiViet
  @smota nvarchar(150),
  @stieude nvarchar(150),
  @snoidung nvarchar(max),
  @imanguoidang int,
  @imaloaibai int,
  @surlanh varchar(30),
  @dngaydang datetime
  as
  insert into tblBaiViet (smota,snoidung, stieude, surlanh, iMaLoaiBai, iMaNguoiDang, dngaydang) values
  (@smota,@snoidung,@stieude,@surlanh,@imaloaibai,@imanguoidang,@dngaydang)

  select * from tblNguoiDung

    create proc sp_xemdanhsachbaidangbyidnguoidung
	@idnguoidung int
  as
  select * from tblBaiViet, tblLoaiBai, tblNguoiDung where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and tblBaiViet.iMaNguoiDang = @idnguoidung

  create proc sp_xemdanhsachbaidang
  as
  select * from tblBaiViet, tblLoaiBai, tblNguoiDung where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai 

  alter proc sp_danhSachBaiVietTheoID
  @id int
  as
  select * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 and tblLoaiBai.iMaLoaiBai = @id



   create proc sp_danhSach4BaiVietMoiNhat
  as
  select * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 order by dngaydang DESC

   exec sp_danhSach4BaiVietMoiNhat


   select * from tblBaiViet
   

   create proc sp_xemBaiVietID
   @id int
   as
   select * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 and tblBaiViet.iMaBaiViet = @id

     create proc sp_xemBaiVietCungLoai
   @id int
   as
   declare @maLoai int
   set @maLoai = (select iMaLoaiBai from tblBaiViet where iMaBaiViet = @id)

   select  top 5 * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 and tblBaiViet.iMaLoaiBai = @maLoai



   create proc sp_danhSachBaiVietTimKiem
   @tutimkiem nvarchar(40)
   as
   select * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 and tblBaiViet.stieude like '%' + @tutimkiem + '%'


  create proc sp_danhSachBaiVietTop4
  as
  select top 4 * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
  tblBaiViet.bduyet = 1 order by tblBaiViet.ilanxem DESC

