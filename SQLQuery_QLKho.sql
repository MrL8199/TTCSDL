USE QuanLyThuVien

GO

-- Tìm kiếm thông tin nhân viên có tên nhân viên là 'Nguyễn Hữu Đa'
select * from NHANVIEN
where NHANVIEN.TenNhanVien like N'%Nguyễ%'


-- Sửa thông tin nhân viên có mã là '2209'
UPDATE NHANVIEN
SET [TenNhanVien] = N'Vũ Văn Vũ'
WHERE NHANVIEN.MaNhanVien = '2209'

-- xóa nhân viên có mã thẻ 2020
DELETE NHANVIEN
WHERE NHANVIEN.MaNhanVien = '2020'

-- Tìm kiếm thông tin nhà cung cấp có Mã nhà cung cấp là '4449'
select * from NCC
where NCC.MaNCC like '4449'

-- Sửa địa chỉ nhà cung cấp có mã là '4449'
UPDATE NCC
SET [DiaChiNCC] = N'Xóm Bến, Nam Định'
WHERE NCC.MaNCC = '4449'
select * from NCC
where NCC.MaNCC = 4449


-- Tìm kiếm các cuốn sách có trong kệ sách G
select CUONSACH.TenSach, CUONSACH.TinhTrangCuonSach, KESACH.TenKeSach from CUONSACH
Inner join KESACH on KESACH.MaKeSach = CUONSACH.MaKeSach
where KESACH.TenKeSach = N'Kệ Sách G'

-- Tìm kiếm thông tin nhập kho ngày 2020-02-14 
 select * from PHIEUNHAP
 inner join KHO on KHO.MaKho = PHIEUNHAP.MaKho
 where PHIEUNHAP.NgayNhap = '2020-02-14'

-- Tìm kiếm thông tin xuất kho ngày 2020-02-14
select * from PHIEUXUAT
inner join KHO on KHO.MaKho = PHIEUXUAT.MaKho
where PHIEUXUAT.NgayXuat = '2020-02-14'

-- Xem thông tin kiểm kê kho ngày 2020-02-15
select * from PHIEUKIEMKE
where PHIEUKIEMKE.NgayKiemKe = '2020-02-15'

-- xem thông tin xuất kho của kho có mã = 5 trong tháng 4 
select * from PHIEUXUAT
inner join KHO on KHO.MaKho = PHIEUXUAT.MaKho 
where KHO.MaKho = 5
and PHIEUXUAT.NgayXuat like '2020-04%'

-- xem thông tin nhập kho của kho có mã = 2 trong tháng 2
select * from PHIEUNHAP
inner join KHO on KHO.MaKho = PHIEUNHAP.MaKho 
where KHO.MaKho = 2
and PHIEUNHAP.NgayNhap like '2020-02%'















