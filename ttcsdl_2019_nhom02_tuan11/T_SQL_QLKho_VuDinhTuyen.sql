
use QuanLyThuVien
go

-- Thủ tục Tìm kiếm thông tin nhân viên theo Tên Nhân Viên

alter procedure TKTEN_NHANVIEN(@TenNhanVien nvarchar)
as
begin
declare @a nvarchar(30)
set @a = @TenNhanVien + '%'
select * from NHANVIEN
where NHANVIEN.TenNhanVien like @a
end


-- Thủ tục Tìm kiếm thông tin nhân viên theo Mã Nhân Viên
go
alter procedure TKMA_NHANVIEN(@MaNhanVien int)
as
begin
select * from NHANVIEN
where NHANVIEN.MaNhanVien like @MaNhanVien
end

-- thủ tục thêm nhân viên mới 
go
alter procedure THEM_NHANVIEN(@MaNhanVien int,@TenNhanVien nvarchar(100), @MaKho int)
as
begin
	INSERT INTO NHANVIEN(MaNhanVien,TenNhanVien,MaKho) 
	values (@MaNhanVien, @TenNhanVien, @MaKho)
end 

-- Sửa thông tin nhân viên
go
alter procedure UPDATE_NHANVIEN(@MaNhanVien int,@TenNhanVien nvarchar(100),@MaKho int = 0)
as
begin
UPDATE NHANVIEN
SET [TenNhanVien] = @TenNhanVien, [MaKho] =  @MaKho
WHERE NHANVIEN.MaNhanVien = @MaNhanVien
end

-- xóa nhân viên có mã thẻ được nhập vào
go
alter TRIGGER DEL_NHANVIEN ON NHANVIEN
instead of DELETE
AS
BEGIN
	
	DELETE FROM dbo.QUANLYMUONSACH WHERE MaNhanVien IN
	( SELECT deleted.MaNhanVien FROM  deleted)
	DELETE FROM dbo.QUANLYTRASACH WHERE MaNhanVien IN
	( SELECT deleted.MaNhanVien  FROM  deleted)
	DELETE FROM dbo.NHANVIEN WHERE MaNhanVien IN
	( SELECT deleted.MaNhanVien  FROM  deleted)
	
END
GO
alter procedure DELETE_NHANVIEN(@MaNhanVien int)
as
begin
delete from NHANVIEN where NHANVIEN.MaNhanVien = @MaNhanVien
end

----------------------------    NHÀ CUNG CẤP       -------------------------------------

-- Tìm kiếm thông tin nhà cung cấp theo Mã nhà cung cấp
go
alter procedure TKMA_NCC(@MaNCC int)
as
begin
select * from NCC
where NCC.MaNCC like @MaNCC
end

--- Tìm kiếm thông tin theo tên Nhà cung cấp
go
alter procedure TKTEN_NCC(@TenNCC nvarchar(100))
as
begin
declare @b nvarchar(30)
set @b = '%' + @TenNCC + '%'
select * from NCC
where NCC.TenNCC like @b
end

-- thủ tục thêm nhà cung cấp
go
alter procedure THEM_NCC(@MaNCC int,@TenNCC nvarchar(100),@DiaChiNCC nvarchar(200), @SDT int)
as
begin
	INSERT INTO NCC(MaNCC,TenNCC,DiaChiNCC,SDT_NCC) 
	values (@MaNCC, @TenNCC, @DiaChiNCC,@SDT)
end 

-- Sửa thông tin nhà cung cấp theo Mã NCC 
go
alter procedure UPDATE_NCC(@MaNCC int, @TenNCC nvarchar(100), @DiaChiNCC nvarchar(200), @SDT_NCC int)
as
begin
UPDATE NCC
SET [TenNCC] = @TenNCC, [DiaChiNCC] = @DiaChiNCC, [SDT_NCC] = @SDT_NCC
WHERE NCC.MaNCC = @MaNCC
select * from NCC
where NCC.MaNCC = @MaNCC
end

-- xóa nhà cung cấp có mã nhà cung cấp được nhập vào
go
alter trigger DEL_NCC on NCC
instead of DELETE 
as
begin
	DELETE FROM dbo.CT_PHIEUNHAP where MaNCC in
	(SELECT deleted.MaNCC from deleted)
	DELETE FROM dbo.NCC where MaNCC in
	(select deleted.MaNCC from deleted)
end
go
alter proc DELETE_NCC(@MaNCC int)
as
begin
	delete from NCC where NCC.MaNCC = @MaNCC
end


	------------------------------------------- NHẬP KHO ------------------

---- Xem thoong tin chi tiết Nhập kho theo Mã phiếu nhập 
go
alter VIEW VIEW_CTPHIEUNHAP AS
	SELECT ctpn.MaPN,ctpn.MaCTPN, k.TenKho,k.MaKho, ncc.TenNCC,ncc.MaNCC,ds.MaDauSach, ds.TenDauSach,ctpn.SoLuong
	FROM CT_PHIEUNHAP as ctpn
	INNER JOIN KHO as k on k.MaKho = ctpn.MaKho
	INNER JOIN NCC as ncc on ncc.MaNCC = ctpn.MaNCC
	INNER JOIN DAUSACH as ds on ds.MaDauSach = ctpn.MaDauSach
	GROUP BY ctpn.MaPN,ctpn.MaCTPN, k.TenKho, ncc.TenNCC, ds.TenDauSach,ctpn.SoLuong, k.MaKho,ncc.MaNCC,ds.MaDauSach
go
alter procedure XEM_CTPHIEUNHAP(@MaPN int)
	as
	begin
	select * from VIEW_CTPHIEUNHAP 
	where  VIEW_CTPHIEUNHAP.MaPN = @MaPN
end

-- Tìm kiếm thông tin nhập kho ngày 2020-02-14 
go
alter procedure TKNGAY_PHIEUNHAP(@NgayNhap varchar(100))
as
begin
 select * from CT_PHIEUNHAP
 inner join KHO on KHO.MaKho = CT_PHIEUNHAP.MaKho
 inner join PHIEUNHAP on PHIEUNHAP.MaPN = CT_PHIEUNHAP.MaPN
 where PHIEUNHAP.NgayNhap like @NgayNhap
end


-- Thủ tục nhập dữ liệu cho Phiếu Nhập Mới 
go
alter procedure THEM_CT_PHIEUNHAP(@MaPN int, @MaKho int, @MaNCC int, @SoLuong int, @MaDauSach int)
as
begin
	INSERT INTO CT_PHIEUNHAP(MaPN,MaKho,MaNCC,SoLuong,MaDauSach) output inserted.MaCTPN
	values (@MaPN, @MaKho, @MaNCC, @SoLuong, @MaDauSach)
end 


-- Sửa thông tin CHI TIẾT PHIẾU NHẬP
go
alter procedure UPDATE_CTPHIEUNHAP(@MaCTPN int,@MaPN int, @MaKho int, @MaNCC int, @SoLuong int,@MaDauSach int = 0)
as
begin
UPDATE CT_PHIEUNHAP
SET [MaPN] = @MaPN, [MaKho] =  @MaKho, [MaNCC] = @MaNCC, [SoLuong] = @SoLuong, [MaDauSach] = @MaDauSach
WHERE CT_PHIEUNHAP.MaCTPN = @MaCTPN
end

-- xóa Chi tiết phiếu nhập
go
alter procedure DELETE_CTPHIEUNHAP(@MaCTPN int)
as
begin
delete from CT_PHIEUNHAP where CT_PHIEUNHAP.MaCTPN = @MaCTPN
end

----------------------------------------------------------  XUẤT KHO  ------------------------

---- xem thông tin chi tiết xuất kho theo Mã Phiếu Xuất 
go
alter VIEW VIEW_CTPHIEUXUAT AS
	SELECT ctpx.MaPX,ctpx.MaCTPX, k.TenKho, ks.TenKeSach, ds.TenDauSach,ctpx.SoLuong
	FROM CT_PHIEUXUAT as ctpx
	INNER JOIN KHO as k on k.MaKho = ctpx.MaKho
	INNER JOIN KESACH as ks on ks.MaKeSach = ctpx.MaKeSach
	INNER JOIN DAUSACH as ds on ds.MaDauSach = ctpx.MaDauSach
	GROUP BY ctpx.MaPX,ctpx.MaCTPX, k.TenKho, ks.TenKeSach, ds.TenDauSach,ctpx.SoLuong
go
alter procedure XEM_CTPHIEUXUAT(@MaPX int)
	as
	begin
	select * from VIEW_CTPHIEUXUAT 
	where  VIEW_CTPHIEUXUAT.MaPX = @MaPX
end

-- Thủ tục tìm kiếm thông tin xuất kho theo ngày 
go
alter procedure TKNGAY_PHIEUXUAT(@NgayXuat varchar(100))
as
begin
select * from CT_PHIEUXUAT
 inner join KHO on KHO.MaKho = CT_PHIEUXUAT.MaKho
 inner join PHIEUXUAT on PHIEUXUAT.MaPX= CT_PHIEUXUAT.MaPX
 where PHIEUXUAT.NgayXuat like @NgayXuat
 end

 -- Thủ tục nhập dữ liệu cho Phiếu Xuất Mới 
go
alter procedure THEM_CT_PHIEUXUAT(@MaPX int, @MaKho int, @MaKeSach int, @SoLuong int, @MaDauSach int)
as
begin
	INSERT INTO CT_PHIEUXUAT(MaPX,MaKho,MaKeSach,SoLuong,MaDauSach) output inserted.MaCTPX
	values (@MaPX, @MaKho, @MaKeSach, @SoLuong, @MaDauSach)
end 
go


-- Sửa thông tin CHI TIẾT PHIẾU XUẤT
go
alter procedure UPDATE_CTPHIEUXUAT(@MaCTPX int,@MaPX int, @MaKho int, @MaKeSach int, @SoLuong int,@MaDauSach int = 0)
as
begin
UPDATE CT_PHIEUXUAT
SET [MaPX] = @MaPX, [MaKho] =  @MaKho, [MaKeSach] = @MaKeSach, [SoLuong] = @SoLuong, [MaDauSach] = @MaDauSach
WHERE CT_PHIEUXUAT.MaCTPX = @MaCTPX
end

-- xóa Chi tiết phiếu xuất 
go
alter procedure DELETE_CTPHIEUXUAT(@MaCTPX int)
as
begin
delete from CT_PHIEUXUAT where CT_PHIEUXUAT.MaCTPX = @MaCTPX
end


 ------------------------------------ PHIEU KIEM KE -----------------------------------------


 -- Tìm kiếm thông tin kiểm kê kho ngày 2020-02-15
 go
alter VIEW VIEW_PHIEUKIEMKE AS
	SELECT pkk.MaPhieuKiemKe,pkk.NgayKiemKe,k.TenKho, pkk.MaKho,SUM(pn.SoLuong) as 'SO LUONG VAO', SUM(px.SoLuong) as 'SO LUONG RA'
	FROM PHIEUKIEMKE as pkk
	INNER JOIN KHO as k on k.MaKho = pkk.MaKho
	INNER JOIN CT_PHIEUNHAP as pn on k.MaKho = pn.MaKho
	INNER JOIN CT_PHIEUXUAT as px on k.MaKho = px.MaKho
	GROUP BY pkk.MaPhieuKiemKe, pkk.NgayKiemKe, pkk.MaKho, k.TenKho
go
alter procedure TKNGAY_KIEMKE(@NgayKiemKe date)
	as
	begin
	select * from VIEW_PHIEUKIEMKE as vkk
	where vkk.NgayKiemKe = @NgayKiemKe
end

---- Tìm kiếm thông tin kiểm kê theo mã phiếu kiểm kê
go
alter procedure TKMA_KIEMKE(@MaPhieuKiemKe int)
	as
	begin
	select * from VIEW_PHIEUKIEMKE as vkk
	where vkk.MaPhieuKiemKe = @MaPhieuKiemKe
end

 -- Thủ tục nhập dữ liệu cho Phiếu Kiểm Kê mới
 go
alter procedure THEM_CTPHIEUKIEMKE(@NgayKiemKe date, @MaKho int)
as
begin
	INSERT INTO PHIEUKIEMKE(NgayKiemKe,MaKho) output inserted.MaPhieuKiemKe
	values (@NgayKiemKe, @MaKho)
end 

-- Sửa thông tin CHI TIẾT PHIẾU Kiểm kê
go
alter procedure UPDATE_PHIEUKIEMKE(@MaPhieuKiemKe int, @NgayKiemKe date, @MaKho int)
as
begin
UPDATE PHIEUKIEMKE
SET [NgayKiemKe] = @NgayKiemKe, [MaKho] =@MaKho
WHERE PHIEUKIEMKE.MaPhieuKiemKe = @MaPhieuKiemKe
end

-- xóa Chi tiết phiếu kiểm kê
go
alter procedure DELETE_PHIEUKIEMKE(@MaPhieuKiemKe int)
as
begin
delete from PHIEUKIEMKE where PHIEUKIEMKE.MaPhieuKiemKe = @MaPhieuKiemKe
end
