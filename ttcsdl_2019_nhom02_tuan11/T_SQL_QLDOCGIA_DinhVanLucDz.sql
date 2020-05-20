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
CREATE PROC TimVP
    (
    @MaThe varchar(20),
    @TenDG nvarchar(100),
    @TypeSearch int
--type == 0: search theo mã thẻ || == 1: seatch theo tên độc giả                 
)
AS
BEGIN
    IF (@TypeSearch = 0)
BEGIN
        -- tìm kiếm độc giả theo mã thẻ
        SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT, DOCGIA.DiaChi, THETHUVIEN.TrangThai, THETHUVIEN.NgayHetHan
        FROM THETHUVIEN
            INNER JOIN DOCGIA ON DOCGIA.MaThe = THETHUVIEN.mathe
        WHERE THETHUVIEN.MaThe LIKE '%'+@MaThe+'%'

    END
ELSE
BEGIN
        -- tìm kiếm độc giả có tên @TenDG:
        SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT, DOCGIA.DiaChi, THETHUVIEN.TrangThai, THETHUVIEN.NgayHetHan
        FROM THETHUVIEN
            INNER JOIN DOCGIA ON DOCGIA.MaThe = THETHUVIEN.mathe
        WHERE DOCGIA.HoTenDocGia LIKE N'%'+@TenDG+'%'
    END
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
    @TypeSearch int
--type == 0: search theo mã thẻ || == 1: seatch theo tên vi phạm                 
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