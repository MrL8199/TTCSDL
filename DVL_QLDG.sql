USE QuanLyThuVien

GO

-- Thêm độc giả:
-- Logic: Thêm thẻ thư viện, sau đó thêm thông tin độc giả với mã thẻ thư viện vừa thêm.
DECLARE @temp INT, @i INT, @j INT
IF((SELECT COUNT(MaThe)
FROM THETHUVIEN) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaThe AS INT))
FROM THETHUVIEN )
SET @temp=@temp+1
SET @i=@temp
INSERT INTO THETHUVIEN
    (MaThe,TrangThai,NgayHetHan,SoLanGiaHan)
VALUES
    (@i, N'Còn Hạn', '2022-04-17', '0');
IF((SELECT COUNT(MaDocGia)
FROM DOCGIA) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaDocGia AS INT))
FROM DOCGIA )
SET @temp=@temp+1
SET @j=@temp
INSERT INTO DOCGIA
    (MaDocGia,HoTenDocGia,Lop,NgaySinh, DiaChi, SDT, MaThe)
VALUES
    (@j, N'Nguyễn Vũ hải Anh ', N'CNTT16A', '4/13/1999', N'Hà Nội', '367069763', @i);

-- xem tất cả thông tin thẻ thư viện/độc giả
SELECT *
FROM THETHUVIEN
    INNER JOIN DOCGIA ON DOCGIA.MaThe = THETHUVIEN.MaThe

-- tìm kiếm độc giả theo mã thẻ
SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT, DOCGIA.DiaChi, THETHUVIEN.TrangThai, THETHUVIEN.NgayHetHan
FROM THETHUVIEN
    INNER JOIN DOCGIA ON DOCGIA.MaThe = THETHUVIEN.mathe
WHERE THETHUVIEN.MaThe LIKE '%171500%'

-- tìm kiếm độc giả có tên LỰc:
SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT, DOCGIA.DiaChi, THETHUVIEN.TrangThai, THETHUVIEN.NgayHetHan
FROM THETHUVIEN
    INNER JOIN DOCGIA ON DOCGIA.MaThe = THETHUVIEN.mathe
WHERE DOCGIA.HoTenDocGia LIKE N'%Lực%'

-- Sửa địa chỉ độc giả có mã thẻ 17150150:
UPDATE DOCGIA
SET [DiaChi] = N'HÀ NỘI'
WHERE DOCGIA.MaThe = '17150150'

-- xóa độc giả có mã thẻ 17150003
-- Notice: Khi xóa 1 độc giả (thẻ thư viện) ta phải
-- xóa những trường mà có liên kết khóa ngoại với bảng docgia/thethuvien
-- khi ấy sẽ làm mất dữ liệu đang có,
-- vậy nên ta sẽ set null cho các giá trị.
-- Example: delete thethuvien where thethuvien.mathe = '17150003'
-- -> delete trường dữ liệu thẻ thư viện đó, set NULL tại mathe ở các bảng: PhieuMuon, PHieutra
-- -> delete trường dữ liệu có mathe = 17150003 ở bảng docgia, ViPham
UPDATE PHIEUMUON
SET [MaThe] = NULL
WHERE PHIEUMUON.MaThe = '17150003'
GO
UPDATE PHIEUTRA
SET [MaThe] = NULL
WHERE PHIEUTRA.MaThe = '17150003'
GO
DELETE DOCGIA
WHERE DOCGIA.MaThe = '17150003'
GO
DELETE VIPHAM
WHERE VIPHAM.MaThe = '17150003'
GO
DELETE THETHUVIEN
WHERE THETHUVIEN.MaThe = '17150003'
GO


SELECT *
FROM PHIEUMUON
    INNER JOIN THETHUVIEN ON PHIEUMUON.MaThe = THETHUVIEN.MaThe

-- xem tất cả vi phạm và tên độc giả, mã thẻ độc giả vi phạm
SELECT VIPHAM.TenViPham AS [Tên vi phạm], VIPHAM.MaThe AS [Mã thẻ], DOCGIA.HoTenDocGia AS [Họ tên]
FROM VIPHAM, DOCGIA
WHERE VIPHAM.MaThe = DOCGIA.MaThe

-- thêm vi phạm:
DECLARE @temp INT, @i INT
IF((SELECT COUNT(MaViPham)
FROM VIPHAM) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaViPham AS INT))
FROM ViPham )
SET @temp=@temp+1
SET @i=@temp
INSERT INTO VIPHAM
    (MaViPham,TenViPham,GhiChu,MaThe)
VALUES
    (@i, N'Mất Sách ', N'', '16150180');
-- sửa vi phạm
-- Sửa tên vi phạm của vi phạm có MaViPham = 7878:
UPDATE VIPHAM
SET [TenViPham]= N'Mất sách'
WHERE VIPHAM.MaThe = '7878'
-- xóa vi phạm
-- Xóa vi phạm với ID 7891:
DELETE VIPHAM
WHERE VIPHAM.MaViPham = '7891'

-- tìm kiếm vi phạm
-- tìm kiếm vi phạm theo mã thẻ
SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, VIPHAM.TenViPham, VIPHAM.GhiChu
FROM DOCGIA, THETHUVIEN
    INNER JOIN VIPHAM ON VIPHAM.MaThe = THETHUVIEN.mathe
WHERE THETHUVIEN.MaThe LIKE '%171500%'
    AND DOCGIA.MaThe = THETHUVIEN.MaThe

-- tìm kiếm vi phạm có tên mất:
SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, VIPHAM.TenViPham, VIPHAM.GhiChu
FROM DOCGIA, THETHUVIEN
    INNER JOIN VIPHAM ON VIPHAM.MaThe = THETHUVIEN.mathe
WHERE VIPHAM.TenViPham LIKE N'%mất%'
    AND DOCGIA.MaThe = THETHUVIEN.MaThe

-- đưa ra những sách đã mượn mà chưa trả
GO
SELECT *
FROM CUONSACH
WHERE CUONSACH.TinhTrangCuonSach LIKE N'%Đã mượn%'

-- đưa ra thông tin độc giả và cuốn sách mà độc giả mượn chưa trả


-- cuốn sách đã trả sau khi mượn:
SELECT *
FROM CUONSACH, CT_PHIEUTRA
WHERE CUONSACH.MaCuonSach = CT_PHIEUTRA.MaCuonSach

-- đưa ra tên từng cuốn sách và tên những thằng mượn
SELECT CUONSACH.TenSach, DOCGIA.HoTenDocGia
FROM PHIEUMUON, CT_PHIEUMUON, DOCGIA, CUONSACH
WHERE PHIEUMUON.MaThe = DOCGIA.MaThe
    AND PHIEUMUON.MaPhieuMuon = CT_PHIEUMUON.MaPhieuMuon
    AND CT_PHIEUMUON.MaCuonSach = CUONSACH.MaCuonSach

-- những thằng đã trả cuốn sách đã mượn
SELECT *
FROM DOCGIA
    JOIN PHIEUMUON ON PHIEUMUON.MaThe = DOCGIA.MaThe
    JOIN PHIEUTRA ON PHIEUMUON.MaThe = PHIEUTRA.MaThe
    JOIN CT_PHIEUMUON ON PHIEUMUON.MaPhieuMuon = CT_PHIEUMUON.MaPhieuMuon
    JOIN CT_PHIEUTRA ON PHIEUTRA.MaPhieuTra = CT_PHIEUTRA.MaPhieuTra
WHERE CT_PHIEUMUON.MaCuonSach = CT_PHIEUTRA.MaCuonSach

-- những thằng chưa trả sách:


-- thống kê số lượng sách của mỗi đầu sách
SELECT TenDauSach AS [Tên đầu sách], COUNT(*) AS [Số lượng]
FROM DAUSACH
    JOIN CUONSACH ON CUONSACH.MaDauSach = DAUSACH.MaDauSach
GROUP BY DAUSACH.TenDauSach

-- thống kê số lượng sách đã mượn của từng độc giả
select THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT, count(*) as [So Luong]
from THETHUVIEN
    inner join PHIEUMUON on PHIEUMUON.MaThe = THETHUVIEN.MaThe
    inner join DOCGIA on DOCGIA.MaThe = THETHUVIEN.MaThe
group by THETHUVIEN.MaThe, DOCGIA.HoTenDocGia,DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT
-- thống kê số lần vi phạm của mỗi độc giả
select THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT, count(*) as [So Lan vi pham]
from THETHUVIEN
    inner join VIPHAM on VIPHAM.MaThe = THETHUVIEN.MaThe
    inner join DOCGIA on DOCGIA.MaThe = THETHUVIEN.MaThe
group by THETHUVIEN.MaThe, DOCGIA.HoTenDocGia,DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT

GO
-- TSQL
-- Thêm độc giả
CREATE PROC ThemDG
    (
    @TenDG nvarchar(100),
    @DiaChi nvarchar(200),
    @Lop nvarchar(100),
    @SDT int,
    @NgaySinh date
)
AS
BEGIN
    DECLARE @temp INT, @i INT, @j INT
    IF((SELECT COUNT(MaThe)
    FROM THETHUVIEN) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaThe AS INT))
    FROM THETHUVIEN )
    SET @temp=@temp+1
    SET @i=@temp
    INSERT INTO THETHUVIEN
        (MaThe,TrangThai,NgayHetHan,SoLanGiaHan)
    VALUES
        (@i, N'Còn Hạn', DATEADD(year, 1, GETDATE()), '0');
    IF((SELECT COUNT(MaDocGia)
    FROM DOCGIA) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaDocGia AS INT))
    FROM DOCGIA )
    SET @temp=@temp+1
    SET @j=@temp
    INSERT INTO DOCGIA
        (MaDocGia,HoTenDocGia,Lop,NgaySinh, DiaChi, SDT, MaThe)
    VALUES
        (@j, @TenDG, @Lop, @NgaySinh, @DiaChi, @SDT, @i);
END
GO

-- Sửa độc giả
CREATE PROC SuaDG
    (
    @Ma int,
    @TenDG nvarchar(100),
    @DiaChi nvarchar(200),
    @Lop nvarchar(100),
    @SDT int,
    @NgaySinh date
)
AS
BEGIN
    UPDATE DOCGIA
	SET HoTenDocGia=@TenDG, DiaChi=@DiaChi, Lop=@Lop, SDT=@SDT, NgaySinh=@NgaySinh
	WHERE MaThe = @Ma
END

GO
-- Xóa độc giả

-- Tìm kiếm độc giả
CREATE PROC SuaDG
    (
    @Ma int,
    @TenDG nvarchar(100),
    @DiaChi nvarchar(200),
    @Lop nvarchar(100),
    @SDT int,
    @NgaySinh date
)
AS
BEGIN
    UPDATE DOCGIA
	SET HoTenDocGia=@TenDG, DiaChi=@DiaChi, Lop=@Lop, SDT=@SDT, NgaySinh=@NgaySinh
	WHERE MaThe = @Ma
END
GO

-- THêm vi phạm
CREATE PROC ThemVP
    (
    @TenVP nvarchar(100),
    @GhiChu nvarchar(200),
    @MaThe int
)
AS
BEGIN
    DECLARE @temp INT, @i INT, @j INT
    IF((SELECT COUNT(MaViPham)
    FROM VIPHAM) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaViPham AS INT))
    FROM VIPHAM )
    SET @temp=@temp+1
    SET @i=@temp
    INSERT INTO VIPHAM
        (MaViPham, TenViPham, GhiChu, MaThe)
    VALUES
        (@i, @TenVP, @GhiChu, @MaThe);
END
GO

-- Sửa vi phạm
CREATE PROC SuaVP
    (
    @Ma int,
    @TenVP nvarchar(100),
    @GhiChu nvarchar(200),
    @MaThe int
)
AS
BEGIN
    UPDATE VIPHAM
	SET TenViPham=@TenVP, GhiChu=@GhiChu, MaThe=@MaThe
	WHERE MaViPham = @Ma
END
GO

-- Xóa vi phạm
CREATE PROC XoaVP
    (
    @Ma int
)
AS
BEGIN
    DELETE FROM VIPHAM
    WHERE MaViPham = @Ma
END
GO

-- Tìm kiếm vi phạm
CREATE PROC TimVP
    (
    @MaThe varchar(20),
    @TenVP nvarchar(100),
    @TypeSearch int  --type == 0: search theo mã thẻ || == 1: seatch theo tên vi phạm                 
)
AS
BEGIN
    IF (@TypeSearch = 0)
BEGIN
        -- tìm kiếm vi phạm theo mã thẻ
        SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, VIPHAM.TenViPham, VIPHAM.GhiChu
        FROM DOCGIA, THETHUVIEN
            INNER JOIN VIPHAM ON VIPHAM.MaThe = THETHUVIEN.mathe
        WHERE THETHUVIEN.MaThe LIKE '%'+@MaThe+'%'
            AND DOCGIA.MaThe = THETHUVIEN.MaThe

    END
ELSE
BEGIN
        -- tìm kiếm vi phạm có tên mất:
        SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, VIPHAM.TenViPham, VIPHAM.GhiChu
        FROM DOCGIA, THETHUVIEN
            INNER JOIN VIPHAM ON VIPHAM.MaThe = THETHUVIEN.mathe
        WHERE VIPHAM.TenViPham LIKE N'%'+@TenVP+'%'
            AND DOCGIA.MaThe = THETHUVIEN.MaThe
    END
END
GO