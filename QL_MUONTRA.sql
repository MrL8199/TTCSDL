
-- xem tất cả thông tin thẻ thư viện/độc giả
SELECT * FROM THETHUVIEN
FULL JOIN DOCGIA ON DOCGIA.MaThe = THETHUVIEN.MaThe


--xem tất cả thông tin phiếu mượn
SELECT * FROM PHIEUMUON
FULL JOIN DOCGIA ON DOCGIA.MaThe = PHIEUMUON.MaThe

-- tìm kiếm phiếu mượn theo ngày mượn: Mã phiếu mượn,Mã thẻ, Họ và tên, Lớp, Ngày mượn, Số điện thoại
SELECT PHIEUMUON.MaPhieuMuon AS [Mã phiếu mượn], DOCGIA.MaThe AS [Mã thẻ], DOCGIA.HoTenDocGia AS [Họ tên],
DOCGIA.Lop AS [Lớp], PHIEUMUON.NgayMuon AS [Ngày mượn], DOCGIA.SDT AS [Số điện thoại] 
FROM PHIEUMUON, DOCGIA
WHERE PHIEUMUON.MaThe = DOCGIA.MaThe
AND PHIEUMUON.NgayMuon = '2020-03-11'

-- tìm kiếm phiếu mượn theo mã thẻ
SELECT PHIEUMUON.MaPhieuMuon AS [Mã phiếu mượn], DOCGIA.MaThe AS [Mã thẻ], DOCGIA.HoTenDocGia AS [Họ tên],
DOCGIA.Lop AS [Lớp], PHIEUMUON.NgayMuon AS [Ngày mượn], DOCGIA.SDT AS [Số điện thoại] 
FROM PHIEUMUON, DOCGIA
WHERE PHIEUMUON.MaThe = DOCGIA.MaThe
AND PHIEUMUON.MaThe LIKE '%171500%'

-- sửa ngày hẹn trả của mã thẻ ''
UPDATE PHIEUMUON
SET NgayHanTra = '2020-02-26'
WHERE PHIEUMUON.MaThe = '17150020'
-- xóa phiếu mượn của mã thẻ
DELETE PHIEUMUON
WHERE PHIEUMUON.MaThe = '17150003'

-- đưa ra tên nhân viên, mã nhân viên của nhân viên quản lý ngày ''
SELECT NHANVIEN.MaNhanVien AS [Mã nhân viên], NHANVIEN.TenNhanVien AS [Tên nhân viên]
FROM NHANVIEN, PHIEUMUON, QUANLYMUONSACH
WHERE NHANVIEN.MaNhanVien = QUANLYMUONSACH.MaNhanVien
AND PHIEUMUON.MaPhieuMuon = QUANLYMUONSACH.MaPhieuMuon
AND PHIEUMUON.NgayMuon = '2020-03-11'

-- đưa ra tên cuốn sách, mã thẻ, tên độc giả mượn sách ngày ''
SELECT CUONSACH.TenSach AS [Tên cuốn sách ], PHIEUMUON.MaThe AS [Mã thẻ ],DOCGIA.HoTenDocGia AS [Họ tên]
FROM CUONSACH,PHIEUMUON, CT_PHIEUMUON, DOCGIA
WHERE CUONSACH.MaCuonSach = CT_PHIEUMUON.MaCuonSach
AND PHIEUMUON.MaThe = DOCGIA.MaThe
AND PHIEUMUON.MaPhieuMuon = CT_PHIEUMUON.MaPhieuMuon
AND PHIEUMUON.NgayMuon = '2020-03-11'

-- đưa ra những đọc giả đã trả đúng hạn
SELECT PHIEUMUON.MaThe, DOCGIA.HoTenDocGia
FROM PHIEUMUON,PHIEUTRA, DOCGIA
WHERE PHIEUMUON.MaThe = DOCGIA.MaThe
AND PHIEUMUON.NgayHanTra = PHIEUTRA.NgayTra
GROUP BY PHIEUMUON.MaThe, DOCGIA.HoTenDocGia

-- đưa ra những đọc giả chưa trả sách
SELECT DOCGIA.MaDocGia, DOCGIA.HoTenDocGia, DOCGIA.Lop FROM DOCGIA
EXCEPT
SELECT distinct DOCGIA.MaDocGia, DOCGIA.HoTenDocGia, DOCGIA.Lop FROM DOCGIA
JOIN PHIEUMUON ON PHIEUMUON.MaThe = DOCGIA.MaThe
JOIN PHIEUTRA ON PHIEUMUON.MaThe = PHIEUTRA.MaThe
JOIN CT_PHIEUMUON ON PHIEUMUON.MaPhieuMuon = CT_PHIEUMUON.MaPhieuMuon
JOIN CT_PHIEUTRA ON PHIEUTRA.MaPhieuTra = CT_PHIEUTRA.MaPhieuTra
WHERE CT_PHIEUMUON.MaCuonSach = CT_PHIEUTRA.MaCuonSach

--  Đếm số phiếu mượn mà mỗi độc giả mượn
SELECT count(MaPhieuMuon) AS [ Số lượt mượn] , DOCGIA.HoTenDocGia
FROM DOCGIA, PHIEUMUON
WHERE DOCGIA.MaThe = PHIEUMUON.MaThe
GROUP BY  DOCGIA.HoTenDocGia

--	Đưa ra tất cả các bạn sinh viên mượn sách lớn hơn 2 lần

SELECT   DOCGIA.MaThe, HoTenDocGia, COUNT(Ngaymuon) AS [Số lượt mượn]

FROM CT_PHIEUMUON, DocGia , PhieuMuon
WHERE CT_PHIEUMUON.MaPhieuMuon = PhieuMuon.MaPhieuMuon
AND DOCGIA.MaThe = PHIEUMUON.MaThe
GROUP BY DOCGIA.MaThe,HoTenDocGia
HAVING   COUNT(Ngaymuon) >2

