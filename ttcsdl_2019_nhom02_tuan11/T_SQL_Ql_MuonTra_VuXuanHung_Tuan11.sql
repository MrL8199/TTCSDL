use QuanLyThuVien
go
--  Show phieumuon
create view PhieuMuon_View as
select PHIEUMUON.MaPhieuMuon as 'Mã Phiếu Mượn', DOCGIA.MaThe  'Mã Thẻ', PHIEUMUON.NgayMuon 'Ngày Mượn', PHIEUMUON.NgayHanTra 'Ngày Hẹn Trả',
CT_PHIEUMUON.MaCuonSach 'Mã Cuốn Sách' ,QUANLYMUONSACH.MaNhanVien 'Mã Nhân Viên' 
from PHIEUMUON,CT_PHIEUMUON, QUANLYMUONSACH, DOCGIA, CUONSACH
where PHIEUMUON.MaThe = DOCGIA.MaThe
and   PHIEUMUON.MaPhieuMuon =  CT_PHIEUMUON.MaPhieuMuon
and   PHIEUMUON.MaPhieuMuon =  QUANLYMUONSACH.MaPhieuMuon
and   CT_PHIEUMUON.MaCuonSach = CUONSACH.MaCuonSach
and   CUONSACH.TinhTrangCuonSach = N'Đã mượn'
group by PHIEUMUON.MaPhieuMuon , DOCGIA.MaThe , PHIEUMUON.NgayMuon , PHIEUMUON.NgayHanTra ,
CT_PHIEUMUON.MaCuonSach  ,QUANLYMUONSACH.MaNhanVien 

go
select * from PhieuMuon_View


select MaCuonSach  from CUONSACH where TinhTrangCuonSach = N'Chưa mượn'

go

-- Show phiếu trả
create view PhieuTra_View as
select PHIEUTRA.MaPHIEUTRA as 'Mã Phiếu Trả', DOCGIA.MaThe  'Mã Thẻ', PHIEUTRA.NgayTra 'Ngày Trả',
CT_PHIEUTRA.MaCuonSach 'Mã Cuốn Sách', QUANLYTRASACH.MaNhanVien 'Mã Nhân Viên' 
from PHIEUTRA,CT_PHIEUTRA, QUANLYTRASACH, DOCGIA, CUONSACH
where PHIEUTRA.MaThe = DOCGIA.MaThe
and   PHIEUTRA.MaPHIEUTRA =  CT_PHIEUTRA.MaPHIEUTRA
and   PHIEUTRA.MaPHIEUTRA =  QUANLYTRASACH.MaPHIEUTRA
and   CT_PHIEUTRA.MaCuonSach = CUONSACH.MaCuonSach
and   CUONSACH.TinhTrangCuonSach = N'Chưa mượn'
group by PHIEUTRA.MaPHIEUTRA , DOCGIA.MaThe  , PHIEUTRA.NgayTra ,
CT_PHIEUTRA.MaCuonSach , QUANLYTRASACH.MaNhanVien 
go
select * from PhieuTra_View
go
-- Thoong tin sach

select TenSach, SoTrang,TinhTrangCuonSach,MaDauSach,MaKeSach 
from CUONSACH 

go
select * from CUONSACH
go
-- Các chức năng of form Phiếu Mượn Sách
-- Chức năng mượn

CREATE PROC ThemPhieuMuon
    (
    @NgayMuon datetime,
    @NgayHanTra datetime,
    @MaThe int,
	@MaCuonSach int,
	@MaNhanVien int
)
AS
BEGIN
    DECLARE @temp INT, @i INT, @j INT, @k INT
    IF((SELECT COUNT(MaPhieuMuon)
    FROM PHIEUMUON) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaPhieuMuon AS INT))
    FROM PHIEUMUON )
    SET @temp=@temp+1
    SET @i=@temp
    INSERT INTO PHIEUMUON
        (MaPhieuMuon,NgayMuon,NgayHanTra,MaThe)
    VALUES
        (@i, @NgayMuon, @NgayHanTra, @MaThe);
		--Relate-CuonSach
    
    INSERT INTO CT_PHIEUMUON
        ( MaCuonSach,MaPhieuMuon)
    VALUES
        (@MaCuonSach, @i);
		--Relate-NhanVien
    
    INSERT INTO QUANLYMUONSACH
        ( MaNhanVien,MaPhieuMuon)
    VALUES
        (@MaNhanVien, @i);
	UPDATE CUONSACH
	SET TinhTrangCuonSach = N'Đã mượn'
	WHERE MaCuonSach = @MaCuonSach
END
GO
exec ThemPhieuMuon '2020/05/06','2020/06/09','17150150', '10001072', '2204'
go

-- Sửa Phieu Muon
create PROC SuaPhieuMuon
    (
    @Ma int,
    @NgayMuon datetime,
    @NgayHanTra datetime,
    @MaThe int,

	@MaCuonSach int,
	@MaNhanVien int,
	@MaCuonSachNew int
)
AS
BEGIN
	UPDATE CT_PHIEUMUON
	SET  MaCuonSach=@MaCuonSachNew
	WHERE MaPhieuMuon = @Ma and MaCuonSach = @MaCuonSach

	UPDATE QUANLYMUONSACH
	SET  MaNhanVien=@MaNhanVien
	WHERE MaPhieuMuon = @Ma

    UPDATE PhieuMuon
	SET NgayMuon=@NgayMuon, NgayHanTra=@NgayHanTra, MaThe=@MaThe
	WHERE MaPhieuMuon = @Ma

	UPDATE CUONSACH
	SET TinhTrangCuonSach = N'Đã mượn'
	WHERE MaCuonSach = @MaCuonSachNew

	UPDATE CUONSACH
	SET TinhTrangCuonSach = N'Chưa mượn'
	WHERE MaCuonSach = @MaCuonSach
END
GO
-- Xoa phiếu mượn
create PROC XoaPhieuMuon
    (
    @Ma int
)
AS
BEGIN

	DELETE FROM CT_PHIEUMUON
    WHERE MaPhieuMuon = @Ma

	DELETE FROM QUANLYMUONSACH 
    WHERE MaPhieuMuon = @Ma

    DELETE FROM PHIEUMUON
    WHERE MaPhieuMuon = @Ma

	
END
GO
-- Tìm kiếm Phiếu Mượn
create PROC TimPhieuMuon
    (
    @MaThe varchar(20),
    @NgayMuon varchar(20),
    @TypeSearch int
)
AS
BEGIN
    IF (@TypeSearch = 0)
BEGIN
        -- tìm kiếm độc giả theo mã thẻ
		
       select PHIEUMUON.MaPhieuMuon as 'Mã Phiếu Mượn', DOCGIA.MaThe  'Mã Thẻ', PHIEUMUON.NgayMuon 'Ngày Mượn', PHIEUMUON.NgayHanTra 'Ngày Hẹn Trả',
		CT_PHIEUMUON.MaCuonSach 'Mã Cuốn Sách' ,QUANLYMUONSACH.MaNhanVien 'Mã Nhân Viên' 
		from PHIEUMUON,CT_PHIEUMUON, QUANLYMUONSACH, DOCGIA, CUONSACH
		where PHIEUMUON.MaThe = DOCGIA.MaThe
		and   PHIEUMUON.MaPhieuMuon =  CT_PHIEUMUON.MaPhieuMuon
		and   PHIEUMUON.MaPhieuMuon =  QUANLYMUONSACH.MaPhieuMuon
		and   CT_PHIEUMUON.MaCuonSach = CUONSACH.MaCuonSach
		and   CUONSACH.TinhTrangCuonSach = N'Đã mượn'
		and   PHIEUMUON.MaThe LIKE '%'+@MaThe+'%'
		group by PHIEUMUON.MaPhieuMuon , DOCGIA.MaThe , PHIEUMUON.NgayMuon , PHIEUMUON.NgayHanTra ,
		CT_PHIEUMUON.MaCuonSach  ,QUANLYMUONSACH.MaNhanVien 
        
    END
ELSE
BEGIN
        -- tìm kiếm độc giả có  @NgayMuon:
        select PHIEUMUON.MaPhieuMuon as 'Mã Phiếu Mượn', DOCGIA.MaThe  'Mã Thẻ', PHIEUMUON.NgayMuon 'Ngày Mượn', PHIEUMUON.NgayHanTra 'Ngày Hẹn Trả',
		CT_PHIEUMUON.MaCuonSach 'Mã Cuốn Sách' ,QUANLYMUONSACH.MaNhanVien 'Mã Nhân Viên' 
		from PHIEUMUON,CT_PHIEUMUON, QUANLYMUONSACH, DOCGIA, CUONSACH
		where PHIEUMUON.MaThe = DOCGIA.MaThe
		and   PHIEUMUON.MaPhieuMuon =  CT_PHIEUMUON.MaPhieuMuon
		and   PHIEUMUON.MaPhieuMuon =  QUANLYMUONSACH.MaPhieuMuon
		and   CT_PHIEUMUON.MaCuonSach = CUONSACH.MaCuonSach
		and   CUONSACH.TinhTrangCuonSach = N'Đã mượn'
        and   PHIEUMUON.NgayMuon like '%'+@NgayMuon+'%'
    END
END
GO

EXEC TimPhieuMuon'1715','','0'
go
select * from PHIEUMUON where NgayMuon = '2020-02-26'
EXEC TimPhieuMuon'','2020-02-26','1'
go

-- Các chức năng của Phiếu Trả Sách
CREATE PROC ThemPhieuTra
    (
    @NgayTra datetime,
    @MaThe int,
	@MaCuonSach int,
	@MaNhanVien int
)
AS
BEGIN
    DECLARE @temp INT, @i INT, @j INT, @k INT
    IF((SELECT COUNT(MaPhieuTra)
    FROM PHIEUTra) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaPhieuTra AS INT))
    FROM PHIEUTra )
    SET @temp=@temp+1
    SET @i=@temp
    INSERT INTO PHIEUTra
        (MaPhieuTra,NgayTra,MaThe)
    VALUES
        (@i, @NgayTra, @MaThe);
		--Relate-CuonSach
    
    INSERT INTO CT_PHIEUTra
        ( MaCuonSach,MaPhieuTra)
    VALUES
        (@MaCuonSach, @i);
		--Relate-NhanVien
    
    INSERT INTO QUANLYTraSACH
        ( MaNhanVien,MaPhieuTra)
    VALUES
        (@MaNhanVien, @i);
	UPDATE CUONSACH
	SET TinhTrangCuonSach = N'Đã mượn'
	WHERE MaCuonSach = @MaCuonSach
END
GO
exec ThemPhieuTra '2020/05/06','17150150', '10001072', '2204'
go

-- Sửa Phieu Tra
create PROC SuaPhieuTra
    (
    @Ma int,
    @NgayTra datetime,
   
    @MaThe int,

	@MaCuonSach int,
	@MaNhanVien int,
	@MaCuonSachNew int
)
AS
BEGIN
	UPDATE CT_PHIEUTra
	SET  MaCuonSach=@MaCuonSachNew
	WHERE MaPhieuTra = @Ma and MaCuonSach = @MaCuonSach

	UPDATE QUANLYTraSACH
	SET  MaNhanVien=@MaNhanVien
	WHERE MaPhieuTra = @Ma

    UPDATE PhieuTra
	SET NgayTra=@NgayTra, MaThe=@MaThe
	WHERE MaPhieuTra = @Ma

	UPDATE CUONSACH
	SET TinhTrangCuonSach = N'Đã mượn'
	WHERE MaCuonSach = @MaCuonSachNew

	UPDATE CUONSACH
	SET TinhTrangCuonSach = N'Chưa mượn'
	WHERE MaCuonSach = @MaCuonSach
END
GO
-- Xoa phiếu trả
create PROC XoaPhieuTra
    (
    @Ma int
)
AS
BEGIN

	DELETE FROM CT_PHIEUTra
    WHERE MaPhieuTra = @Ma

	DELETE FROM QUANLYTraSACH 
    WHERE MaPhieuTra = @Ma

    DELETE FROM PHIEUTra
    WHERE MaPhieuTra = @Ma

	
END
GO
-- Tìm kiếm Phiếu Trả

create PROC TimPhieuTra
    (
    @MaThe varchar(20),
    @NgayTra varchar(20),
    @TypeSearch int
)
AS
BEGIN
    IF (@TypeSearch = 0)
BEGIN
        -- tìm kiếm độc giả theo mã thẻ
		
        select PHIEUTRA.MaPHIEUTRA as 'Mã Phiếu Trả', DOCGIA.MaThe  'Mã Thẻ', PHIEUTRA.NgayTra 'Ngày Trả',
		CT_PHIEUTRA.MaCuonSach 'Mã Cuốn Sách', QUANLYTRASACH.MaNhanVien 'Mã Nhân Viên' 
		from PHIEUTRA,CT_PHIEUTRA, QUANLYTRASACH, DOCGIA, CUONSACH
		where PHIEUTRA.MaThe = DOCGIA.MaThe
		and   PHIEUTRA.MaPHIEUTRA =  CT_PHIEUTRA.MaPHIEUTRA
		and   PHIEUTRA.MaPHIEUTRA =  QUANLYTRASACH.MaPHIEUTRA
		and   CT_PHIEUTRA.MaCuonSach = CUONSACH.MaCuonSach
		and   CUONSACH.TinhTrangCuonSach = N'Chưa mượn'
		and PHIEUTra.MaThe LIKE '%'+@MaThe+'%'
		group by PHIEUTRA.MaPHIEUTRA , DOCGIA.MaThe  , PHIEUTRA.NgayTra ,
		CT_PHIEUTRA.MaCuonSach , QUANLYTRASACH.MaNhanVien 
        

    END
ELSE
BEGIN
        -- tìm kiếm độc giả có tên @NgayTra:
        select PHIEUTRA.MaPHIEUTRA as 'Mã Phiếu Trả', DOCGIA.MaThe  'Mã Thẻ', PHIEUTRA.NgayTra 'Ngày Trả',
		CT_PHIEUTRA.MaCuonSach 'Mã Cuốn Sách', QUANLYTRASACH.MaNhanVien 'Mã Nhân Viên' 
		from PHIEUTRA,CT_PHIEUTRA, QUANLYTRASACH, DOCGIA, CUONSACH
		where PHIEUTRA.MaThe = DOCGIA.MaThe
		and   PHIEUTRA.MaPHIEUTRA =  CT_PHIEUTRA.MaPHIEUTRA
		and   PHIEUTRA.MaPHIEUTRA =  QUANLYTRASACH.MaPHIEUTRA
		and   CT_PHIEUTRA.MaCuonSach = CUONSACH.MaCuonSach
		and   CUONSACH.TinhTrangCuonSach = N'Chưa mượn'
		and PHIEUTra.NgayTra LIKE '%'+@NgayTra+'%'
		group by PHIEUTRA.MaPHIEUTRA , DOCGIA.MaThe  , PHIEUTRA.NgayTra ,
		CT_PHIEUTRA.MaCuonSach , QUANLYTRASACH.MaNhanVien 
        
    END
END
GO

EXEC TimPhieuTra'','2020','0'
EXEC TimPhieutra'','2020-03-14','1'


-- Thống kê
-- Thống kê những đọc giả đã mượn sách
Create view ThongKeDaMuon_View
as
SELECT distinct DOCGIA.MaDocGia 'Mã Độc Giả', DOCGIA.HoTenDocGia 'Họ tên Đọc giả', DOCGIA.Lop 'Lớp' FROM DOCGIA 
JOIN PHIEUMUON ON PHIEUMUON.MaThe = DOCGIA.MaThe
JOIN PHIEUTRA ON PHIEUMUON.MaThe = PHIEUTRA.MaThe
JOIN CT_PHIEUMUON ON PHIEUMUON.MaPhieuMuon = CT_PHIEUMUON.MaPhieuMuon
JOIN CT_PHIEUTRA ON PHIEUTRA.MaPhieuTra = CT_PHIEUTRA.MaPhieuTra
WHERE CT_PHIEUMUON.MaCuonSach = CT_PHIEUTRA.MaCuonSach
go
select * from ThongKeDaMuon_View
-- Thống kê những đọc giả trả sách đúng hạn
go
create view ThongKeTraDungHan_View
as
SELECT PHIEUMUON.MaThe 'Mã Thẻ', DOCGIA.HoTenDocGia 'Họ tên Đọc giả', DOCGIA.Lop 'Lớp' 
FROM PHIEUMUON,PHIEUTRA, DOCGIA
WHERE PHIEUMUON.MaThe = DOCGIA.MaThe
AND PHIEUMUON.NgayHanTra = PHIEUTRA.NgayTra
GROUP BY PHIEUMUON.MaThe, DOCGIA.HoTenDocGia,DOCGIA.Lop
go
select *from ThongKeTraDungHan_View