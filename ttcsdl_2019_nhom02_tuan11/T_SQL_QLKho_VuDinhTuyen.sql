
-- Thủ tục Tìm kiếm thông tin nhân viên theo Tên Nhân Viên

alter procedure TKTEN_NHANVIEN(@TenNhanVien nvarchar)
as
begin
declare @a nvarchar(30)
set @a = @TenNhanVien + '%'
select * from NHANVIEN
where NHANVIEN.TenNhanVien like @a
end

execute TKTEN_NHANVIEN 'V'


-- Thủ tục Tìm kiếm thông tin nhân viên theo Mã Nhân Viên

alter procedure TKMA_NHANVIEN(@MaNhanVien int)
as
begin
select * from NHANVIEN
where NHANVIEN.MaNhanVien like @MaNhanVien
end

execute TKMA_NHANVIEN 131

-- Sửa thông tin nhân viên
alter procedure UPDATE_NHANVIEN(@MaNhanVien int,@TenNhanVien nvarchar(100),@MaKho int = 0)
as
begin
UPDATE NHANVIEN
SET [TenNhanVien] = @TenNhanVien, [MaKho] =  @MaKho
WHERE NHANVIEN.MaNhanVien = @MaNhanVien
end

execute UPDATE_NHANVIEN 2212,N'Trần Đức Bo',3

-- xóa nhân viên có mã thẻ được nhập vào

create TRIGGER DEL_NHANVIEN ON NHANVIEN
for DELETE
AS
BEGIN
	
	DELETE FROM dbo.QUANLYMUONSACH WHERE MaNhanVien IN
	( SELECT deleted.MaNhanVien FROM  deleted)
	DELETE FROM dbo.QUANLYTRASACH WHERE MaNhanVien IN
	( SELECT deleted.MaNhanVien  FROM  deleted)
	
END
GO
alter procedure DELETE_NHANVIEN(@MaNhanVien int)
as
begin
delete from NHANVIEN where NHANVIEN.MaNhanVien = @MaNhanVien
end

execute DELETE_NHANVIEN 2209

-- Tìm kiếm thông tin nhà cung cấp theo Mã nhà cung cấp

create procedure TKMA_NCC(@MaNCC int)
as
begin
select * from NCC
where NCC.MaNCC like @MaNCC
end

execute TKMA_NCC 4455

--- Tìm kiếm thông tin theo tên Nhà cung cấp

alter procedure TKTEN_NCC(@TenNCC nvarchar(100))
as
begin
declare @b nvarchar(30)
set @b = '%' + @TenNCC + '%'
select * from NCC
where NCC.TenNCC like @b
end

execute TKTEN_NCC 'Thiên Long'

-- Sửa thông tin nhà cung cấp theo Mã NCC 

create procedure UPDATE_NCC(@MaNCC int, @TenNCC nvarchar(100), @DiaChiNCC nvarchar(200), @SDT_NCC int)
as
begin
UPDATE NCC
SET [TenNCC] = @TenNCC, [DiaChiNCC] = @DiaChiNCC, [SDT_NCC] = @SDT_NCC
WHERE NCC.MaNCC = @MaNCC
select * from NCC
where NCC.MaNCC = @MaNCC
end

execute UPDATE_NCC '4458',N'Nhà Sách Trí Tuệ',N'Đống Đa, Hà Nội','0987223112'

-- Tìm kiếm các cuốn sách có trong một kệ sách theo Mã Kệ Sách  

create procedure TKMA_KESACH(@MaKeSach int)
as
begin
select CUONSACH.TenSach, CUONSACH.TinhTrangCuonSach, KESACH.TenKeSach from CUONSACH
Inner join KESACH on KESACH.MaKeSach = CUONSACH.MaKeSach
where KESACH.MaKeSach = @MaKeSach
end

execute TKMA_KESACH 1113

-- Tìm kiếm thông tin nhập kho ngày 2020-02-14 

alter procedure TKNGAY_PHIEUNHAP(@NgayNhap date)
as
begin
 select * from CT_PHIEUNHAP
 inner join KHO on KHO.MaKho = CT_PHIEUNHAP.MaKho
 inner join PHIEUNHAP on PHIEUNHAP.MaPN = CT_PHIEUNHAP.MaPN
 where PHIEUNHAP.NgayNhap = @NgayNhap
end

execute TKNGAY_PHIEUNHAP '2020-02-13'

-- Thủ tục tìm kiếm thông tin xuất hàng theo ngày 

create procedure TKNGAY_PHIEUXUAT(@NgayXuat date)
as
begin
select * from CT_PHIEUXUAT
 inner join KHO on KHO.MaKho = CT_PHIEUXUAT.MaKho
 inner join PHIEUXUAT on PHIEUXUAT.MaPX= CT_PHIEUXUAT.MaPX
 where PHIEUXUAT.NgayXuat = @NgayXuat
 end

 execute TKNGAY_PHIEUXUAT '2020/04/11'


 -- Xem thông tin kiểm kê kho ngày 2020-02-15
 
alter VIEW VIEW_PHIEUKIEMKE AS
	SELECT pkk.MaPhieuKiemKe,pkk.NgayKiemKe, pkk.MaKho,SUM(pn.SoLuong) as 'SO LUONG VAO', SUM(px.SoLuong) as 'SO LUONG RA'
	FROM PHIEUKIEMKE as pkk
	INNER JOIN KHO as k on k.MaKho = pkk.MaKho
	INNER JOIN CT_PHIEUNHAP as pn on k.MaKho = pn.MaKho
	INNER JOIN CT_PHIEUXUAT as px on k.MaKho = px.MaKho
	GROUP BY pkk.MaPhieuKiemKe, pkk.NgayKiemKe, pkk.MaKho

	--having pkk.NgayKiemKe = '2020-03-01'

alter procedure TKNGAY_KIEMKE(@NgayKiemKe date)
	as
	begin
	select * from VIEW_PHIEUKIEMKE as vkk
	where vkk.NgayKiemKe = @NgayKiemKe
end
execute TKNGAY_KIEMKE '2020-03-01'

-- Thủ tục nhập dữ liệu cho Phiếu Nhập Mới 

alter procedure THEM_CT_PHIEUNHAP(@MaPN int, @MaKho int, @MaNCC int, @SoLuong int, @MaDauSach int)
as
begin
	INSERT INTO CT_PHIEUNHAP(MaPN,MaKho,MaNCC,SoLuong,MaDauSach) output inserted.MaCTPN
	values (@MaPN, @MaKho, @MaNCC, @SoLuong, @MaDauSach)
end 

execute THEM_CT_PHIEUNHAP 5,331,4448,20,100

-- Thủ tục nhập dữ liệu cho Phiếu Xuất Mới 

create procedure THEM_CT_PHIEUXUAT(@MaPX int, @MaKho int, @MaKeSach int, @SoLuong int, @MaDauSach int)
as
begin
	INSERT INTO CT_PHIEUXUAT(MaPX,MaKho,MaKeSach,SoLuong,MaDauSach) output inserted.MaCTPX
	values (@MaPX, @MaKho, @MaKeSach, @SoLuong, @MaDauSach)
end 

execute THEM_CT_PHIEUXUAT 9,331,1115,20,100






















