-- View
-- Tạo view cho phần danh sách Độc giả, Danh sách độc giả vi phạm và Thống kê

-- View Danh Sách Độc Giả
CREATE VIEW DOCGIA_VIEW
AS
    SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT, DOCGIA.DiaChi, THETHUVIEN.TrangThai, THETHUVIEN.NgayHetHan
    FROM THETHUVIEN, DOCGIA
    WHERE DOCGIA.MaThe = THETHUVIEN.mathe
GO


-- view Danh sách Độc giả vi phạm
CREATE VIEW DOCGIA_VIEW
AS
    SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, VIPHAM.TenViPham, VIPHAM.GhiChu
    FROM DOCGIA, THETHUVIEN
        INNER JOIN VIPHAM ON VIPHAM.MaThe = THETHUVIEN.mathe
    WHERE DOCGIA.MaThe = THETHUVIEN.MaThe
GO


-- view Thống kê danh sách số lần vi phạm của độc giả
CREATE VIEW ThongKeVP_VIEW
AS
    select THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT, count(*) as [So Lan vi pham]
    from THETHUVIEN
        inner join VIPHAM on VIPHAM.MaThe = THETHUVIEN.MaThe
        inner join DOCGIA on DOCGIA.MaThe = THETHUVIEN.MaThe
    group by THETHUVIEN.MaThe, DOCGIA.HoTenDocGia,DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT
GO
-- select * from ThongKeVP_VIEW

-- view Thống kê số lượng sách đã mượn của từng độc giả
CREATE VIEW ThongKeSachMuonDG_VIEW
AS
    select THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT, count(*) as [So Luong]
    from THETHUVIEN
        inner join PHIEUMUON on PHIEUMUON.MaThe = THETHUVIEN.MaThe
        inner join DOCGIA on DOCGIA.MaThe = THETHUVIEN.MaThe
    group by THETHUVIEN.MaThe, DOCGIA.HoTenDocGia,DOCGIA.NgaySinh, DOCGIA.Lop, DOCGIA.SDT
GO

-- select * from ThongKeSachMuonDG_VIEW

GO
-- TSQL
-- Lợi ích khi chuyển các câu lệnh sql sang Stored Procedure:
-- + Khi lập trình tương tác với ứng dụng chỉ cần gọi thủ tục và truyền vào tham số
-- + Không phải viết lại cả một khối lệnh lớn trong lập trình ứng dụng

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
EXEC ThemDG N'Đào Bá Lộc', [Cầu Giấy, Hà Nội], 'CNTT17','0369669321', '05/02/2000'
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
EXEC SuaDG '17150123',N'Đào Bá Lộc', [Cầu Giấy, Hà Nội], 'CNTT17','0369669321', '05/02/2000'
GO
-- Xóa độc giả
-- Vì lý do ràng buộc dữ liệu nên có thể:
-- TH1: hoặc xóa tất cả các trường liên quan,
-- TH2: hoặc SET NULL tại trường chứa khóa ngoại, sau đó xóa trong DOCGIA+ THETHUVIEN,
-- TH3: hoặc không cho xóa và đưa ra thông báo "Không thể xóa trường có ràng buộc khóa ngoại"

-- Tạo trigger bắt hành động xóa một độc giả theo mã thẻ: (TH2: set null )
CREATE TRIGGER DEL_DOCGIA ON DOCGIA
FOR DELETE
AS
BEGIN
    UPDATE PHIEUMUON
    SET [MaThe] = NULL
    WHERE MaThe IN
	( SELECT deleted.MaThe
    FROM deleted)

    UPDATE PHIEUTRA
    SET [MaThe] = NULL
    WHERE MaThe IN
	( SELECT deleted.MaThe
    FROM deleted)

    DELETE DOCGIA
    WHERE MaThe IN
	( SELECT deleted.MaThe
    FROM deleted)

    DELETE VIPHAM
    WHERE MaThe IN
	( SELECT deleted.MaThe
    FROM deleted)

    DELETE THETHUVIEN
    WHERE MaThe IN
	( SELECT deleted.MaThe
    FROM deleted)

END
GO

-- Tạo proc xóa độc giả từ mã thẻ:

CREATE PROC XoaDG
    (
    @Ma int
)
AS
BEGIN
    DELETE FROM DOCGIA
    WHERE MaThe = @Ma
END
GO
EXEC XoaDG '17150120'
GO

GO

-- Tìm kiếm độc giả
CREATE PROC TimDG
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
EXEC TimDG '','Lực','1'
GO


-- QL Vi phạm
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
EXEC ThemVP [Mất sách], [Đã xử lý], '17150020'
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
EXEC SuaVP 1,[Mất sách], [Đã xử lý], '17150020'
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
EXEC XoaVP '1'
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
        -- tìm kiếm vi phạm có tên @TenVP:
        SELECT THETHUVIEN.MaThe, DOCGIA.HoTenDocGia, DOCGIA.NgaySinh, DOCGIA.Lop, VIPHAM.TenViPham, VIPHAM.GhiChu
        FROM DOCGIA, THETHUVIEN
            INNER JOIN VIPHAM ON VIPHAM.MaThe = THETHUVIEN.mathe
        WHERE VIPHAM.TenViPham LIKE N'%'+@TenVP+'%'
            AND DOCGIA.MaThe = THETHUVIEN.MaThe
    END
END
GO
EXEC TimVP '',[Mất],'1'
GO