use QuanLyThuVien
go 
-- Thu Tuc 
-- Insert 
-- Them Tac Gia
create proc ThemTacGia(@matg int, @tentg nvarchar(100))
   as 
   begin 
       if not exists (select *from TACGIA where MaTacGia=@matg)
	   begin 
	    insert into TACGIA(MaTacGia,TenTacGia) values(@matg,@tentg)
		end
   end
--Them NXB 
create proc ThemNXB
(@maNXB int ,
@TenNXB nvarchar(100),
@addNXB nvarchar(200),
@sdtNXB int)
as
begin 
  if not exists (select *from NXB where MaNXB=@maNXB)
    begin
	 insert into NXB(MaNXB,TenNXB,DiaChiNXB,SDT_NXB) values (@maNXB,@TenNXB,@addNXB,@sdtNXB)
	end 
end
--Them the loai
create proc themTheLoai
(@makesach int, @Tentheloai nvarchar(100))
as
begin
   if exists (select *from KESACH,THELOAI where KESACH.MaKeSach = @makesach and THELOAI.MaKeSach=@makesach)
   begin
     INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES (@makesach,@Tentheloai)
   end
end
-- Them dau sach
create proc themDauSach
(@maDausach int,
@Tendausach nvarchar(100),
@maNXB int)
as
begin 
   if not exists (select *from DAUSACH where MaDauSach=@maDausach)
   begin
    if  exists (select *from NXB where MaNXB=@maNXB)
	begin
	  INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES (@maDausach,@Tendausach,@maNXB)
	end
   end
 end
-- Them cuon sach
 create proc themCuonSach
 (@macuonsach int ,
 @Tensach nvarchar(100),
 @page int,
 @tinhtrang nvarchar(50),
 @madausach int,
 @makesach int)
 as
 begin 
  if not exists (select *from CUONSACH where MaCuonSach=@macuonsach)
  begin
     if exists (select *from DAUSACH where MaDauSach=@madausach)
	 begin 
	    if exists (select *from KESACH where MaKeSach=@makesach)
		  begin 
INSERT INTO CUONSACH (MaCuonSach,TenSach,SoTrang,TinhTrangCuonSach,MaDauSach,MaKeSach)
 VALUES (@macuonsach,@Tensach,@page,@tinhtrang,@madausach,@makesach)
 		  end
	 end
  end
 end


-- Delete
-- Delete all
-- Xoa Tac gia 
alter proc xoaTG 
(@maTg int)
as 
begin 
if exists (select *from TACGIA where MaTacGia=@maTg)
begin
if exists (select *from SACH_TACGIA where MaTacGia=@maTg)
begin 
  delete from SACH_TACGIA where MaTacGia=@maTg
  delete from TACGIA where MaTacGia=@maTg
end 
end
end
go
exec xoaTG 18576
go
 -- Xoa NXB 
 alter proc deleteNXB
(@maNXB int)
as
begin
 if exists (select *from NXB where MaNXB=@maNXB)
 begin
 if exists (select *from DAUSACH where MaNXB=@maNXB)
 begin
    delete from DAUSACH where MaNXB=@maNXB
    delete from NXB where MaNXB=@maNXB
 end
 end
end

go
exec deleteNXB 551
go
-- Xoa The Loai
alter proc deleteTheLoai
(@makesach int)
as 
begin 
if exists (select *from THELOAI where MaKeSach=@makesach)
begin
   delete from THELOAI where MaKeSach=@makesach
end
end

go
exec deleteTheLoai 1113
go
-- Xoa Cuon Sach 
alter proc deleteCuonSach
(@macuonsach int)
 as
 begin 
   if exists (select *from CUONSACH where MaCuonSach=@macuonsach)
   begin
     if exists (select *from CT_PHIEUMUON where MaCuonSach=@macuonsach)
	 begin
	   if exists (select *from CT_PHIEUTRA where MaCuonSach=@macuonsach)
	    begin
		  delete from CT_PHIEUTRA where MaCuonSach=@macuonsach
		  delete from CT_PHIEUMUON where MaCuonSach=@macuonsach
		  delete from CUONSACH where MaCuonSach=@macuonsach
		end
	 end
   end
 end
 
 go
 exec deleteCuonSach 10001000
 go
 -- Xoa Dau Sach 
 alter proc deleteDausach 
 (@maDausach int)
as 
begin
if exists (select *from DAUSACH where MaDauSach=@maDausach)
  begin
    if exists (select *from SACH_TACGIA where MaDauSach=@maDausach)
	  begin 
	    if exists (select *from PHIEUNHAP where MaDauSach=@maDausach)
		begin 
		 if exists (select *from CUONSACH where MaDauSach=@maDausach)
		   begin
		    delete from CUONSACH where MaDauSach=@maDausach
			delete from PHIEUNHAP where MaDauSach=@maDausach
			delete from SACH_TACGIA where MaDauSach=@maDausach
			delete from DAUSACH where MaDauSach=@maDausach
		   end
		end
	  end
  end
end

go

-- Xóa kệ sách 
create proc deleteKeSach
( @maks int, @tenks nvarchar(100))
as
begin
  if exists (select *from THELOAI where MaKeSach=@maks)
  begin
    delete from THELOAI where MaKeSach=@maks
  end
  if exists (select *from CUONSACH where MaKeSach=@maks)
  begin
    delete from CUONSACH where MaKeSach=@maks
  end
  if exists (select *from PHIEUXUAT where MaKeSach=@maks)
  begin
    delete from PHIEUXUAT where MaKeSach=@maks
  end
  delete from KESACH where MaKeSach=@maks
end
go
-- Delete 1 phần 
create proc delete_MaNXBDauSach ( @maNXB int )
as
begin 
 if exists (select *from DAUSACH where MaNXB=@maNXB)
 begin
   delete from DAUSACH where MaNXB=@maNXB
 end
end
--------------------------------
go
create proc delete_maDauSachCuonSach(@mads int)
as
begin
 if exists (select *from CUONSACH where MaDauSach=@mads)
 begin
   delete from CUONSACH where MaDauSach=@mads
 end
end
--------------------------------
go
create proc delete_maKeSachCuonSach(@maks int)
as
begin
 if exists (select *from CUONSACH where MaKeSach=@maks)
 begin
   delete from CUONSACH where MaKeSach=@maks
 end
end
  -- Update 
  -- Update all 
-- Update Tac gia
go
create proc update_TG
(@maTgcu int,@matgmoi int,
@tentgmoi nvarchar(100))
as 
begin 
 if not exists (select *from TACGIA where MaTacGia=@matgmoi)
 begin
    insert into TACGIA values (@matgmoi, @tentgmoi)
	update SACH_TACGIA set MaTacGia=@matgmoi where MaTacGia=@maTgcu
	delete from TACGIA where MaTacGia=@maTgcu

 end
 else
 update TACGIA set TenTacGia=@tentgmoi where MaTacGia=@matgmoi
end
-- Update NXB 
go
create proc updateNXB
(@maNXBcu int, @maNXBmoi int,
@tenNXBmoi nvarchar(100),
@addNXBmoi nvarchar (200),
@sdtNXBmoi int)
as
begin 
  if not exists (select *from NXB where MaNXB=@maNXBmoi)
  begin
    insert into NXB values (@maNXBmoi,@tenNXBmoi,@addNXBmoi,@sdtNXBmoi)
	update DAUSACH set MaNXB=@maNXBmoi where MaNXB=@maNXBcu 
	delete from NXB where MaNXB=@maNXBcu
  end
  else
  update NXB set TenNXB=@tenNXBmoi , DiaChiNXB=@addNXBmoi, SDT_NXB=@sdtNXBmoi where MaNXB=@maNXBmoi
 end
 -- Upadte The Loai
 go
create proc updateTHELOAI
(@makesach int,
@tentheloaimoi nvarchar(100))
as
begin 
	  update THELOAI set TenTheLoai=@tentheloaimoi where MaKeSach=@makesach
	
end
go
-- update Cuonsach 
create proc updateCuonSach
(@macuonsachcu int, @macuonsachmoi int,
 @Tensachmoi nvarchar(100),
 @pagemoi int,
 @tinhtrangmoi nvarchar(50),
 @madausachmoi int,
 @makesachmoi int)
 as
 begin
   if not exists (select *from CUONSACH where MaCuonSach=@macuonsachmoi)
   begin 
     insert into CUONSACH values( @macuonsachmoi, @Tensachmoi,@pagemoi,@tinhtrangmoi,@madausachmoi,@makesachmoi)
	 update CT_PHIEUTRA set MaCuonSach=@macuonsachmoi where MaCuonSach=@macuonsachcu
	 update CT_PHIEUMUON set MaCuonSach=@macuonsachmoi where MaCuonSach=@macuonsachcu
	 delete from CUONSACH where MaCuonSach= @macuonsachcu
   end
   else 
   update CUONSACH set TenSach=@Tensachmoi,SoTrang=@pagemoi, TinhTrangCuonSach=@tinhtrangmoi,MaDauSach=@madausachmoi,MaKeSach=@makesachmoi
     where MaCuonSach=@macuonsachmoi
 end
 go
-- update DauSach 
create proc update_DauSach 
(@maDausachcu int, @maDauSachmoi int,
@Tendausachmoi nvarchar(100),
@maNXBmoi int)
as 
begin
  if not exists (select *from DAUSACH where MaDauSach=@maDauSachmoi)
  begin
    insert into DAUSACH values ( @maDauSachmoi,@Tendausachmoi,@maNXBmoi)
	update PHIEUNHAP set MaDauSach=@maDauSachmoi where MaDauSach=@maDausachcu
	update SACH_TACGIA set MaDauSach=@maDauSachmoi where MaDauSach=@maDausachcu
	update CUONSACH set MaDauSach=@maDauSachmoi where MaDauSach=@maDausachcu
	delete from DAUSACH where MaDauSach=@maDausachcu
  end
  else
  update DAUSACH set TenDauSach=@Tendausachmoi,MaNXB=@maNXBmoi where MaDauSach=@maDauSachmoi
end
-- Update 1 phần 
create proc update_maNXBDauSach
(@maNXBcu int, @maNXBmoi int)
as
begin
  if exists (select *from DAUSACH where MaNXB=@maNXBcu)
  begin
   update DAUSACH set MaNXB=@maNXBmoi where MaNXB=@maNXBcu
  end
end
--------------------------------
create proc update_maDauSachCuonSach
(@madscu int, @madsmoi int)
as
begin
 if exists (select *from CUONSACH where MaDauSach=@madscu)
 begin
   update CUONSACH set MaDauSach=@madsmoi where MaDauSach=@madscu
 end
end
------------------------------
create proc update_maKeSachCuonSach
(@makscu int, @maksmoi int)
as
begin
 if exists (select *from KESACH where MaKeSach=@makscu)
 begin
   update CUONSACH set MaKeSach=@maksmoi where MaKeSach=@makscu
 end
end
go 
-- Tìm Kiếm
-- Tìm kiếm Tác Giả
-- Theo Mã tác giả 
create function TimKiemTG1(@matg int)
returns table 
return 
select *from TACGIA where MaTacGia = @matg

-- Theo tên tác giả
create function TimKiemTG2(@Tentg nvarchar(100))
returns table 
return
select *from TACGIA where TenTacGia like '%'+@Tentg+'%'
-- Tìm Kiếm NXB
-- Theo mã NXB
create function TimKiemNXB1(@manxb int)
returns table 
return 
select *from NXB where MaNXB = @manxb
-- Theo Tên NXB
create function TimKiemNXB2(@Tennxb nvarchar(100))
returns table 
return
select *from NXB where TenNXB like '%'+@Tennxb+'%'
-- Tìm kiếm Thể loại 
create function TimKiemTheLoai ( @tentl nvarchar(100))
returns table 
return 
select *from THELOAI where TenTheLoai like '%'+@tentl+'%'
-- Tìm Kiếm Đầu Sách 
-- theo Mã đầu sách
create function TimKiemDS1(@mads int)
returns table 
return 
select *from DAUSACH where MaDauSach= @mads
-- theo tên đầu sách
create function TimKiemDS2 ( @tends nvarchar(100))
returns table 
return 
select *from DAUSACH where TenDauSach like '%'+@tends+'%'
-- Tìm kiếm cuốn sách 
-- Theo mã cuốn sách
create function TimKiemCS1(@macs int)
returns table 
return 
select *from CUONSACH where MaCuonSach= @macs
-- Theo tên cuốn sách
create function TimKiemCS2 ( @tencs nvarchar(100))
returns table 
return 
select *from CUONSACH where TenSach like '%'+@tencs+'%'


-- Thống Kê 
-- thống kê số lượng sách của mỗi NXB 
create function ThongKe1()
returns table 
return 
select TenNXB ,count(*) as soluong from NXB as nxb, DAUSACH as ds, CUONSACH as cs
where cs.MaDauSach=ds.MaDauSach
and ds.MaNXB=nxb.MaNXB
group by TenNXB

select *from ThongKe1()
-- thống kê số lượng sách của mỗi đầu sách
create function ThongKe2()
returns table 
return 
SELECT TenDauSach, COUNT(*) AS Soluong FROM DAUSACH, CUONSACH 
where CUONSACH.MaDauSach = DAUSACH.MaDauSach
GROUP BY DAUSACH.TenDauSach
select *from ThongKe2()
--Tạo View 
-- view cho giao diện tác giả 
create view TACGIA_View
as select MaTacGia,TenTacGia
from TACGIA;
-- View cho giao diện NXB
create view NXB_view
as select * from NXB;
-- view cho giao diện Thể loại 
create view THELOAI_view
as select * from THELOAI;
-- view cho giao diện đầu sách 
create view DAUSACH_view 
as select MaDauSach, TenDauSach, DAUSACH.MaNXB
from DAUSACH, NXB 
where DAUSACH.MaNXB=NXB.MaNXB;
-- view cho giao diện cuốn sách 
create view CUONSACH_View 
as select MaCuonSach, TenSach, SoTrang, TinhTrangCuonSach, DAUSACH.MaDauSach, KESACH.MaKeSach
from CUONSACH,DAUSACH,KESACH
where DAUSACH.MaDauSach=CUONSACH.MaDauSach and KESACH.MaKeSach=CUONSACH.MaKeSach;
-- view cho giao diện Thống Kê 
-- view thống kê số lượng sách của mỗi NXB 
create view ThongKe1_view
as
select TenNXB ,count(*) as soluong from NXB as nxb, DAUSACH as ds, CUONSACH as cs
where cs.MaDauSach=ds.MaDauSach
and ds.MaNXB=nxb.MaNXB
group by TenNXB;

-- view thống kê số lượng sách của mỗi đầu sách
create view ThongKe2_view
as
SELECT TenDauSach, COUNT(*) AS Soluong FROM DAUSACH, CUONSACH 
where CUONSACH.MaDauSach = DAUSACH.MaDauSach
GROUP BY DAUSACH.TenDauSach;













