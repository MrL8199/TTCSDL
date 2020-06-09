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
go
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
go
create proc themTheLoai
(@makesach int, @Tentheloai nvarchar(100))
as
begin
   if exists (select *from KESACH,THELOAI where KESACH.MaKeSach = @makesach and THELOAI.MaKeSach=@makesach)
   begin
     INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES (@makesach,@Tentheloai)
   end
end
go
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
 go
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

 go
-- DELETE
-- Delete all
-- Xoa Tac gia 
alter proc xoaTG 
(@maTg int)
as 
begin 
if exists (select *from TACGIA where MaTacGia=@maTg)
begin
  delete from SACH_TACGIA where MaTacGia=@maTg
end
if exists (select *from SACH_TACGIA where MaTacGia=@maTg)
begin 
  
  delete from TACGIA where MaTacGia=@maTg
end 
end
go
exec xoaTG 18576
go
-- Xóa đầu sách có mã NXB thuộc vào NXB cần xóa
alter Proc deleteDauSach_NXB @maNXB int
as
begin
	if exists(select * from DAUSACH where MaNXB=@maNXB)
	begin
		DECLARE @maDS int
		DECLARE CurDS_NXB CURSOR FOR  
		SELECT MaDauSach FROM DAUSACH  
		where MaNXB=@maNXB
		OPEN  CurDS_NXB               
		FETCH NEXT FROM  CurDS_NXB     
			  INTO @maDS
		WHILE @@FETCH_STATUS = 0     
		BEGIN
			Execute deleteDausach @maDS
			FETCH NEXT FROM  CurDS_NXB
				  INTO @maDS
		END
		CLOSE  CurDS_NXB             
		DEALLOCATE  CurDS_NXB
	end
end
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
	execute deleteDauSach_NXB @maNXB
    delete from NXB where MaNXB=@maNXB
 end
 end
end
go
exec deleteNXB 552
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
			delete from CT_PHIEUMUON where MaCuonSach=@macuonsach
		 end
		if exists (select *from CT_PHIEUTRA where MaCuonSach=@macuonsach)
	    begin
			 delete from CT_PHIEUTRA where MaCuonSach=@macuonsach
		end
		 delete from CUONSACH where MaCuonSach=@macuonsach
		end
	 end
 go
 -- Xóa cuốn sách có mã đâu sách thuộc đầu sách cần xóa
alter proc delCuonSach_Dausach @mads int
as 
begin 
 if exists (select *from CUONSACH where MaDauSach=@mads)
 begin 
    DECLARE @macs int
		DECLARE CurCS_DS CURSOR FOR  
		SELECT MaCuonSach FROM CUONSACH
		where MaDauSach=@mads
		OPEN CurCS_DS  
		-- trỏ đến bản ghi tiếp theo đến hết.             
		FETCH NEXT FROM CurCS_DS     
			  INTO @macs
		WHILE @@FETCH_STATUS = 0     
		BEGIN
			Execute deleteCuonSach @macs
			FETCH NEXT FROM CurCS_DS
				  INTO @macs
		END
		CLOSE CurCS_DS             
		DEALLOCATE CurCS_DS
 end
end 
go

go
-- Xóa Đầu Sách
 alter proc deleteDausach 
 (@maDausach int)
as 
begin
if exists (select *from DAUSACH where MaDauSach=@maDausach)
  begin
    if exists (select *from SACH_TACGIA where MaDauSach=@maDausach)
	  begin 
	      delete from SACH_TACGIA where MaDauSach=@maDausach
	  end  
	    if exists (select *from PHIEUNHAP where MaDauSach=@maDausach)
		begin 
		   delete from PHIEUNHAP where MaDauSach=@maDausach
	    end 
		 if exists (select *from CUONSACH where MaDauSach=@maDausach)
		begin
		    execute delCuonSach_Dausach @maDausach
		end
			
			delete from DAUSACH where MaDauSach=@maDausach
			
		   end
		end
	  
go
execute deleteDausach 95
go
--------------------------------

  -- Update 
-- Update Tac gia
go
alter proc update_TG
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

--------------------------------

------------------------------
go
-- Tìm Kiếm
-- Tìm kiếm Tác Giả
-- Theo Mã tác giả 
create function TimKiemTG1(@matg int)
returns table 
return 
select *from TACGIA where MaTacGia = @matg
go
-- Theo tên tác giả
create function TimKiemTG2(@Tentg nvarchar(100))
returns table 
return
select *from TACGIA where TenTacGia like '%'+@Tentg+'%'
go
-- Tìm Kiếm NXB
-- Theo mã NXB
create function TimKiemNXB1(@manxb int)
returns table 
return 
select *from NXB where MaNXB = @manxb
go
-- Theo Tên NXB
create function TimKiemNXB2(@Tennxb nvarchar(100))
returns table 
return
select *from NXB where TenNXB like '%'+@Tennxb+'%'
go
-- Tìm kiếm Thể loại 
create function TimKiemTheLoai ( @tentl nvarchar(100))
returns table 
return 
select *from THELOAI where TenTheLoai like '%'+@tentl+'%'
go
-- Tìm Kiếm Đầu Sách 
-- theo Mã đầu sách
create function TimKiemDS1(@mads int)
returns table 
return 
select *from DAUSACH where MaDauSach= @mads
go
-- theo tên đầu sách
create function TimKiemDS2 ( @tends nvarchar(100))
returns table 
return 
select *from DAUSACH where TenDauSach like '%'+@tends+'%'
go
-- Tìm kiếm cuốn sách 
-- Theo mã cuốn sách
create function TimKiemCS1(@macs int)
returns table 
return 
select *from CUONSACH where MaCuonSach= @macs
go
-- Theo tên cuốn sách
create function TimKiemCS2 ( @tencs nvarchar(100))
returns table 
return 
select *from CUONSACH where TenSach like '%'+@tencs+'%'

go
-- Thống Kê 
-- thống kê số lượng sách của mỗi NXB 
alter function ThongKe1()
returns table 
return 
select TenNXB ,count(*) as soluong from NXB as nxb, DAUSACH as ds, CUONSACH as cs
where cs.MaDauSach=ds.MaDauSach
and ds.MaNXB=nxb.MaNXB
group by TenNXB
go
select *from ThongKe1()
go
-- thống kê số lượng sách của mỗi đầu sách
alter function ThongKe2()
returns table 
return 
SELECT TenDauSach, COUNT(*) AS Soluong FROM DAUSACH, CUONSACH 
where CUONSACH.MaDauSach = DAUSACH.MaDauSach
GROUP BY DAUSACH.TenDauSach
go
select *from ThongKe2()
go
--Tạo View  
-- view cho giao diện tác giả 
create view TACGIA_View
as select MaTacGia,TenTacGia
from TACGIA;
go
-- View cho giao diện NXB
create view NXB_view
as select * from NXB;
go
-- view cho giao diện Thể loại 
create view THELOAI_view
as select * from THELOAI;
go
-- view cho giao diện đầu sách 
create view DAUSACH_view 
as select MaDauSach, TenDauSach, DAUSACH.MaNXB
from DAUSACH, NXB 
where DAUSACH.MaNXB=NXB.MaNXB;
go
-- view cho giao diện cuốn sách 
create view CUONSACH_View 
as select MaCuonSach, TenSach, SoTrang, TinhTrangCuonSach, DAUSACH.MaDauSach, KESACH.MaKeSach
from CUONSACH,DAUSACH,KESACH
where DAUSACH.MaDauSach=CUONSACH.MaDauSach and KESACH.MaKeSach=CUONSACH.MaKeSach;
go
-- view cho giao diện Thống Kê 
-- view thống kê số lượng sách của mỗi NXB 
create view ThongKe1_view
as
select TenNXB ,count(*) as soluong from NXB as nxb, DAUSACH as ds, CUONSACH as cs
where cs.MaDauSach=ds.MaDauSach
and ds.MaNXB=nxb.MaNXB
group by TenNXB;
go
-- view thống kê số lượng sách của mỗi đầu sách
create view ThongKe2_view
as
SELECT TenDauSach, COUNT(*) AS Soluong FROM DAUSACH, CUONSACH 
where CUONSACH.MaDauSach = DAUSACH.MaDauSach
GROUP BY DAUSACH.TenDauSach;
go
-- Trigger 
-- Bonus
go
create proc delCuonSach_KeSach @maks int
as
begin 
 if exists (select * from KESACH where MaKeSach = @maks)
 begin
 declare @macs int
      DECLARE Cur CURSOR FOR 
	  SELECT MaCuonSach from CUONSACH
	  where MaKeSach=@maks
	  open Cur 
	  fetch next from Cur 
	       into @maks
      while @@FETCH_STATUS = 0
	  begin 
	     Execute deleteCuonSach @macs 
		 fetch next from Cur
		     into @maks 
     end 
	  close Cur 
	  DEALLOCATE Cur 	  
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












