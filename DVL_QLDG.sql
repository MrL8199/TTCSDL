USE QuanLyThuVien

GO

-- Thêm độc giả:
-- Logic: Thêm thẻ thư viện, sau đó thêm thông tin độc giả với mã thẻ thư viện vừa thêm.
-- Insert rows into table 'THETHUVIEN'
INSERT INTO THETHUVIEN
( -- columns to insert data into
 [MaThe], [TrangThai], [SoLanGiaHan], [NgayHetHan]
)
VALUES
( -- first row: values for the columns in the list above
 Column1_Value, Column2_Value, Column3_Value
),
( -- second row: values for the columns in the list above
 Column1_Value, Column2_Value, Column3_Value
)
-- add more rows here
GO

-- xem tất cả thông tin thẻ thư viện/độc giả
SELECT * FROM THETHUVIEN
INNER JOIN DOCGIA ON DOCGIA.MaThe = THETHUVIEN.MaThe

-- tìm kiếm độc giả theo mã thẻ
SELECT * FROM THETHUVIEN
FULL JOIN DOCGIA ON DOCGIA.MaThe = THETHUVIEN.mathe
WHERE THETHUVIEN.MaThe LIKE '%171500%'

-- tìm kiếm độc giả có tên LỰc:
SELECT * FROM THETHUVIEN
FULL JOIN DOCGIA ON DOCGIA.MaThe = THETHUVIEN.mathe
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
-- -> delete trường dữ liệu thẻ thư viện đó, set null tại mathe ở các bảng: PhieuMuon, PHieutra
-- -> delete trường dữ liệu có mathe = 17150003 ở bảng docgia, ViPham
UPDATE PHIEUMUON
SET [MaThe] = N''
WHERE PHIEUMUON.MaThe = '17150003'
GO
UPDATE PHIEUTRA
SET [MaThe] = N''
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


SELECT * FROM PHIEUMUON
INNER JOIN THETHUVIEN ON PHIEUMUON.MaThe = THETHUVIEN.MaThe

-- xem tất cả vi phạm và tên độc giả, mã thẻ độc giả vi phạm
SELECT VIPHAM.TenViPham AS [Tên vi phạm], VIPHAM.MaThe AS [Mã thẻ], DOCGIA.HoTenDocGia AS [Họ tên] FROM VIPHAM, DOCGIA
WHERE VIPHAM.MaThe = DOCGIA.MaThe

-- thêm vi phạm:

-- sửa vi phạm

-- xóa vi phạm

-- tìm kiếm vi phạm

-- đưa ra những sách đã mượn mà chưa trả
GO
SELECT * FROM CUONSACH
WHERE CUONSACH.TinhTrangCuonSach LIKE N'%Đã mượn%'

-- đưa ra thông tin độc giả và cuốn sách mà độc giả mượn chưa trả


-- cuốn sách đã trả sau khi mượn:
SELECT * FROM CUONSACH, CT_PHIEUTRA
WHERE CUONSACH.MaCuonSach = CT_PHIEUTRA.MaCuonSach

-- đưa ra tên từng cuốn sách và tên những thằng mượn
SELECT CUONSACH.TenSach, DOCGIA.HoTenDocGia FROM PHIEUMUON, CT_PHIEUMUON, DOCGIA, CUONSACH
WHERE PHIEUMUON.MaThe = DOCGIA.MaThe
AND PHIEUMUON.MaPhieuMuon = CT_PHIEUMUON.MaPhieuMuon
AND CT_PHIEUMUON.MaCuonSach = CUONSACH.MaCuonSach

-- những thằng đã trả cuốn sách đã mượn
SELECT * FROM DOCGIA
JOIN PHIEUMUON ON PHIEUMUON.MaThe = DOCGIA.MaThe
JOIN PHIEUTRA ON PHIEUMUON.MaThe = PHIEUTRA.MaThe
JOIN CT_PHIEUMUON ON PHIEUMUON.MaPhieuMuon = CT_PHIEUMUON.MaPhieuMuon
JOIN CT_PHIEUTRA ON PHIEUTRA.MaPhieuTra = CT_PHIEUTRA.MaPhieuTra
WHERE CT_PHIEUMUON.MaCuonSach = CT_PHIEUTRA.MaCuonSach

-- những thằng chưa trả sách:


-- thống kê số lượng sách của mỗi đầu sách
SELECT TenDauSach AS [Tên đầu sách], COUNT(*) AS [Số lượng] FROM DAUSACH
JOIN CUONSACH ON CUONSACH.MaDauSach = DAUSACH.MaDauSach
GROUP BY DAUSACH.TenDauSach