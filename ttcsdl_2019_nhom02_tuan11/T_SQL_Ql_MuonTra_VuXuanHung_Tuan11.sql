-- Thêm Phieu Muon
CREATE PROC ThemPhieuMuon
    (
    @NgayMuon datetime,
    @NgayHanTra datetime,
    @MaThe int
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
    IF((SELECT COUNT(MaCuonSach)
    FROM CT_PHIEUMUON) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaCuonSach AS INT))
    FROM CT_PHIEUMUON )
    SET @temp=@temp+1
    SET @j=@temp
    INSERT INTO CT_PHIEUMUON
        ( MaCuonSach,MaPhieuMuon)
    VALUES
        (@j, @i);
		--Relate-NhanVien
    IF((SELECT COUNT(MaNhanVien)
    FROM QUANLYMUONSACH) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaNhanVien AS INT))
    FROM QUANLYMUONSACH )
    SET @temp=@temp+1
    SET @k=@temp
    INSERT INTO QUANLYMUONSACH
        ( MaNhanVien,MaPhieuMuon)
    VALUES
        (@k, @i);
END
GO

-- Sửa Phieu Muon
CREATE PROC SuaPhieuMuon
    (
    @Ma int,
    @NgayMuon datetime,
    @NgayHanTra datetime,
    @MaThe int,

	@MaCuonSach int,
	@MaNhanVien int
)
AS
BEGIN
    UPDATE PhieuMuon
	SET NgayMuon=@NgayMuon, NgayHanTra=@NgayHanTra, @MaThe=@MaThe
	WHERE MaPhieuMuon = @Ma

	UPDATE CT_PHIEUMUON
	SET  MaCuonSach=@MaCuonSach
	WHERE MaPhieuMuon = @Ma

	UPDATE QUANLYMUONSACH
	SET  MaNhanVien=@MaNhanVien
	WHERE MaPhieuMuon = @Ma
END

GO
-- Xóa Phieu Muon
CREATE PROC XoaPhieuMuon
    (
    @Ma int
)
AS
BEGIN
    DELETE FROM PHIEUMUON
    WHERE MaPhieuMuon = @Ma

	DELETE FROM CT_PHIEUMUON
    WHERE MaPhieuMuon = @Ma

	DELETE FROM QUANLYMUONSACH 
    WHERE MaPhieuMuon = @Ma
END
GO

-- Tìm kiếm
CREATE PROC TimPhieuMuon
    (
    @MaThe varchar(20),
    @NgayMuon datetime,
    @TypeSearch int
--type == 0: search theo mã thẻ || == 1: seatch theo ngay muon              
)
AS
BEGIN
    IF (@TypeSearch = 0)
BEGIN
        -- tìm kiếm độc giả theo mã thẻ
        SELECT PHIEUMUON.MaPhieuMuon,NgayMuon,NgayHanTra,MaCuonSach,MaNhanVien
        FROM PHIEUMUON
            INNER JOIN CT_PHIEUMUON ON CT_PHIEUMUON.MaPhieuMuon = PHIEUMUON.MaPhieuMuon
			INNER JOIN QUANLYMUONSACH ON QUANLYMUONSACH.MaPhieuMuon = PHIEUMUON.MaPhieuMuon
        WHERE PHIEUMUON.MaThe LIKE '%'+@MaThe+'%'

    END
ELSE
BEGIN
        -- tìm kiếm độc giả có tên @NgayMuon:
        SELECT PHIEUMUON.MaPhieuMuon,NgayMuon,NgayHanTra,MaCuonSach,MaNhanVien
        FROM PHIEUMUON
            INNER JOIN CT_PHIEUMUON ON CT_PHIEUMUON.MaPhieuMuon = PHIEUMUON.MaPhieuMuon
			INNER JOIN QUANLYMUONSACH ON QUANLYMUONSACH.MaPhieuMuon = PHIEUMUON.MaPhieuMuon
        WHERE PHIEUMUON.MaPhieuMuon = @NgayMuon
    END
END
GO

-----------
-- Thêm Phieu Tra
CREATE PROC ThemPhieuTra
    (
    @NgayTra datetime,
    @MaThe int
)
AS
BEGIN
    DECLARE @temp INT, @i INT, @j INT, @k INT
    IF((SELECT COUNT(MaPhieuTra)
    FROM PHIEUTRA) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaPhieuTra AS INT))
    FROM PHIEUTRA )
    SET @temp=@temp+1
    SET @i=@temp
    INSERT INTO PHIEUTRA
        (MaPhieuTra,NgayTra,MaThe)
    VALUES
        (@i,  @NgayTra, @MaThe);
		--Relate-CuonSach
    IF((SELECT COUNT(MaCuonSach)
    FROM CT_PHIEUTRA) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaCuonSach AS INT))
    FROM CT_PHIEUTRA )
    SET @temp=@temp+1
    SET @j=@temp
    INSERT INTO CT_PHIEUTRA
        ( MaCuonSach,MaPhieuTra)
    VALUES
        (@j, @i);
		--Relate-NhanVien
    IF((SELECT COUNT(MaNhanVien)
    FROM QUANLYTRASACH) = 0)
		SET @temp=0
	ELSE 
		SET @temp=( SELECT MAX(CAST(MaNhanVien AS INT))
    FROM QUANLYTRASACH )
    SET @temp=@temp+1
    SET @k=@temp
    INSERT INTO QUANLYTRASACH
        ( MaNhanVien,MaPhieuTra)
    VALUES
        (@k, @i);
END
GO
-- Sửa Phieu Tra
CREATE PROC SuaPhieuTra
    (
    @Ma int,
    @NgayTra datetime,
    @MaThe int,

	@MaCuonSach int,
	@MaNhanVien int
)
AS
BEGIN
    UPDATE PHIEUTRA
	SET  NgayTra=@NgayTra, @MaThe=@MaThe
	WHERE MaPhieuTra = @Ma

	UPDATE CT_PHIEUTRA
	SET  MaCuonSach=@MaCuonSach
	WHERE MaPhieuTra = @Ma

	UPDATE QUANLYTRASACH
	SET  MaNhanVien=@MaNhanVien
	WHERE MaPhieuTra = @Ma
END
GO
-- Xóa Phieu Muon
CREATE PROC XoaPhieuTra
    (
    @Ma int
)
AS
BEGIN
    DELETE FROM PHIEUTRA
    WHERE MaPhieuTra = @Ma

	DELETE FROM CT_PHIEUTRA
    WHERE MaPhieuTra = @Ma

	DELETE FROM QUANLYTRASACH 
    WHERE MaPhieuTra = @Ma
END
GO

-- Tìm kiếm
CREATE PROC TimPhieuTra
    (
    @MaThe varchar(20),
    @NgayTra datetime,
    @TypeSearch int
--type == 0: search theo mã thẻ || == 1: seatch theo ngay tra               
)
AS
BEGIN
    IF (@TypeSearch = 0)
BEGIN
        -- tìm kiếm độc giả theo mã thẻ
        SELECT PHIEUTRA.MaPhieuTra,NgayTra,MaCuonSach,MaNhanVien
        FROM PHIEUTRA
            INNER JOIN CT_PHIEUTRA ON CT_PHIEUTRA.MaPhieuTra = PHIEUTRA.MaPhieuTra
			INNER JOIN QUANLYTRASACH ON QUANLYTRASACH.MaPhieuTra = PHIEUTRA.MaPhieuTra
        WHERE PHIEUTRA.MaThe LIKE '%'+@MaThe+'%'

    END
ELSE
BEGIN
        -- tìm kiếm độc giả có tên @NgayMuon:
        SELECT PHIEUTRA.MaPhieuTra,NgayTra,MaCuonSach,MaNhanVien
        FROM PHIEUTRA
            INNER JOIN CT_PHIEUTRA ON CT_PHIEUTRA.MaPhieuTra = PHIEUTRA.MaPhieuTra
			INNER JOIN QUANLYTRASACH ON QUANLYTRASACH.MaPhieuTra = PHIEUTRA.MaPhieuTra
        WHERE PHIEUTRA.MaPhieuTra = @NgayTra
    END
END
GO