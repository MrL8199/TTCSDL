USE QuanLyThuVien

GO

-- Insert TACGIA
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18576','Minh Ngọc ');
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18577','Huỳnh Khải Vệ ');
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18578','Phạm Anh Thư ');
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18579','Nguyễn Nhật Ánh');
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18580','Ki Ju Lee');
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18581','John C. Maxwell');
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18582','Tô Văn Ban');
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18583','Phạm Văn Ất');
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18584','Lương Duyên Bình');
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18585','Robin Sharma');
INSERT INTO TACGIA (MaTacGia,TenTacGia) VALUES ('18586','Paulo Coelho');

-- Insert KESACH
INSERT INTO KESACH (MaKeSach,TenKeSach) VALUES ('1110','Kệ Sách A ');
INSERT INTO KESACH (MaKeSach,TenKeSach) VALUES ('1111','Kệ Sách B ');
INSERT INTO KESACH (MaKeSach,TenKeSach) VALUES ('1112','Kệ Sách C1');
INSERT INTO KESACH (MaKeSach,TenKeSach) VALUES ('1113','Kệ Sách C2');
INSERT INTO KESACH (MaKeSach,TenKeSach) VALUES ('1114','Kệ Sách E');
INSERT INTO KESACH (MaKeSach,TenKeSach) VALUES ('1115','Kệ Sách F');
INSERT INTO KESACH (MaKeSach,TenKeSach) VALUES ('1116','Kệ Sách G');
INSERT INTO KESACH (MaKeSach,TenKeSach) VALUES ('1117','Kệ Sách H');
INSERT INTO KESACH (MaKeSach,TenKeSach) VALUES ('1118','Kệ Sách I');
INSERT INTO KESACH (MaKeSach,TenKeSach) VALUES ('1119','Kệ Sách K');


-- Insert THELOAI
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1110','Truyện Ngắn - Tản Văn');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1111','Tiểu Thuyết ');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1112','Chính Trị - Pháp Luật ');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1113','Văn Học Nghệ Thuật ');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1114','Khoa Học Công Nghệ ');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1110','Sách Công Nghệ Thông Tin');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1111','Sách Giáo Khoa - Giáo Trình ');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1112','Sách Học Ngoại Ngữ');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1113','Sách Kiến Thức Tổng Hợp');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1114','Sách Tham Khảo');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1110','Sách Thường Thức - Gia Đình');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1111','Sách Tâm lý - Giới tính');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1112','Sách Y Học');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1113','Sách kỹ năng sống');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1114','Sách kinh tế ');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1110','Sách thiếu nhi');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1111','Sách Lịch sử');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1112','Sách Văn Hóa - Địa Lý - Du Lịch');
INSERT INTO THELOAI (MaKeSach,TenTheLoai) VALUES ('1113','Sách Tôn Giáo - Tâm Linh');

-- Insert KHO
INSERT INTO KHO (MaKho,TenKho,DiaChiKho) VALUES ('221','Kho 1A','Phòng 301 , Tầng 3, Tòa H2 ');
INSERT INTO KHO (MaKho,TenKho,DiaChiKho) VALUES ('222','Kho 1B','Phòng 302 , Tầng 3, Tòa H2 ');
INSERT INTO KHO (MaKho,TenKho,DiaChiKho) VALUES ('331','Kho 2A','Phòng 401 , Tầng 4, Tòa H2 ');
INSERT INTO KHO (MaKho,TenKho,DiaChiKho) VALUES ('332','Kho 2B ','Phòng 402 , Tầng 4, Tòa H2 ');
INSERT INTO KHO (MaKho,TenKho,DiaChiKho) VALUES ('433','Kho C ','Phòng 403,Tầng 4 ,Tòa H2 ');
INSERT INTO KHO (MaKho,TenKho,DiaChiKho) VALUES ('1','Kho X1','Tầng 1, Thư viện Khu B, HVKTQS');
INSERT INTO KHO (MaKho,TenKho,DiaChiKho) VALUES ('2','Kho X2','Tầng 2, Thư viện Khu B, HVKTQS');
INSERT INTO KHO (MaKho,TenKho,DiaChiKho) VALUES ('3','Kho V1','Phòng 101, Thư viện cs Vĩnh Yên, HVKTQS');
INSERT INTO KHO (MaKho,TenKho,DiaChiKho) VALUES ('4','Kho V2','Phòng 102, Thư viện cs Vĩnh Yên, HVKTQS');
INSERT INTO KHO (MaKho,TenKho,DiaChiKho) VALUES ('5','Kho V3','Phòng 103, Thư viện cs Vĩnh Yên, HVKTQS');

-- Insert Nhà cung cấp - NCC
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4441','Skybooks','Số 50 đường 5, TTF 361 An Dương, Tây Hồ, Hà Nội','437172838');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4442','Công ty cổ phần MTV Hà Nội','38, ngách 88b, ngõ 49, phố Thúy Lĩnh, Phường Lĩnh Nam,  Hoàng Mai, Hà Nội','2436805252');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4443','NXB Trẻ ','161B Lý Chính Thắng, Phường 7,Quận 3,Hồ Chí Minh.','2839316289');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4444','Nhà Sách Trí Việt ','234 Tây Sơn, Trung Liệt, Đống Đa, Hà Nội','983928269');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4445','Thiên Long ','Số 7/33 Ngõ 199 Hồ Tùng Mậu - Phường Cầu Diễn - Quận Nam Từ Liêm - Hà Nội','969318982');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4446','Tiki Trading','52 Út Tịch, phường 4, quận Tân Bình, thành phố Hồ Chí Minh','19006035');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4447','Nhà sách Fahasa','60 - 62 Lê Lợi, Quận 1, TP. HCM, Việt Nam','1900636467');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4448','Nhà sách Thanh Hà','Thanh Hà Books NV5.36 khu đô thị Viglacera phường Tây Mỗ quận Nam Từ Liêm, Từ Liêm','0388 553 222');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4449',' ALPHA BOOKS','176 Thái Hà, Trung Liệt, Đống Đa, Hà Nội',' 093 232 99 59');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4450',' AZ VIỆT NAM','Số 56 - Đường 5 - Khu tập thể F361 - phố An Dương - P. Yên Phụ - Q.Tây Hồ - HN','2432567333');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4451','FIRST NEWS TRÍ VIỆT','11H Nguyễn Thị Minh Khai, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','2838227979');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4452',' Văn Hóa Văn Lang','06 Nguyễn Trung Trực, P.5, Q. Bình Thạnh, TP.HCM',' 02838242157 ');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4453','Nhà sách Thái Hà','119 C5 Tô Hiệu, Khu tập thể Nghĩa Tân, Cầu Giấy, Hà Nội','024 6281 3638');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4454','TÂN VIỆT',' 449 Bạch Mai - Hai Bà Trưng - Hà Nội','2439728108');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4455',' CTY CP MTV HÀ NỘI','số 17 Ngô Quyền – 34 Tràng Tiền, phường Tràng Tiền, quận Hoàn Kiếm, TP Hà Nội','43934063');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4456','PANDA BOOKS','B8/20 Đầm Trấu, Hai Bà Trưng, Hà Nội., Bạch Đằng, Hai Bà Trưng, Hà Nội','024 3856 9432');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4457',' SÁCH MINH LONG','Nhà Số 1, Lô A7, Khu Đô Thị Đầm Trấu, Phường Bạch Đằng, Quận Hai Bà Trưng, Thành Phố Hà Nội','024 6294 3819');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4458','Vinabook JSC','44 Xô Viết Nghệ Tĩnh, Phường 19, Quận Bình Thạnh, TP. Hồ Chí Minh','028 35140632');
INSERT INTO NCC (MaNCC,TenNCC,DiaChiNCC,SDT_NCC) VALUES ('4459','Nhà Sách Sao Mai','71 Đông Hồ, phường 8, quận Tân Bình, Thành phố Hồ Chí Minh','08 62 935 574');

-- Insert Nhà xuất bản  - NXB
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('551','NXB Phụ Nữ','39 Hàng Chuối, Q. Hai Bà Trưng, Hà Nội','2439710717');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('552','NXB Lao Động ','175 Giảng Võ, Đống Đa, Hà Nội175 Giảng Võ, Đống Đa, Hà Nội','2438515380');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('553','NXB Trẻ','62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP.HCM','2838225340');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('554','NXB Kim Đồng ','55 Quang Trung, Hai Bà Trưng, Hà Nội','2439434730');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('555','NXB Hà Nội','Số 4, phố Tống Duy Tân, quận Hoàn Kiếm, thành phố Hà Nội','438252916');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('556','NXB Tổng hợp thành phố Hồ Chí Minh','62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP.HCM','028 38 225 340');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('557','NXB chính trị quốc gia sự thật','Số 6/86 Duy Tân, Cầu Giấy, Hà Nội; ','28049221');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('558','NXB giáo dục','81 Trần Hưng Đạo, Hà Nội','2438220801');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('559','NXB Hội Nhà văn','Số 65 Nguyễn Du, Hà Nội','2438222135');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('560','NXB Tư pháp','Số 35 Trần Quốc Toản, Hoàn Kiếm, Hà Nội','2462632078');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('561','NXB thông tin và truyền thông','Tầng 6, Tòa nhà Cục Tần số Vô tuyến điện, số 115 Trần Duy Hưng, Hà Nội ','024 35772145');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('562','NXB giao thông vận tải','80B Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','024 3942334');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('563','NXB Đại học Quốc Gia Hà Nội','16 Hàng Chuối, Phạm Đình Hổ, Hai Bà Trưng, Hà Nội',' 024 3971 4896');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('564','NXB Đại học Quốc gia Thành phố Hồ Chí Minh','Khu phố 6, P. Linh Trung, Q. Thủ Đức, TP. HCM','028 6681 7058');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('565','NXB Văn Học','18, Nguyễn Trường Tộ, Trúc Bạch, Ba Đình, Hà Nội','');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('566','NXB Đại học Oxford','Đại học Oxford','');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('567','NXB Đại học Cambridge','Đại học Cambridge','');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('568','NXB Hồng Đức','65, Tràng Thi, Hà Nội','');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('569','NXB Tri Thức','Tầng 1, Tòa nhà VUSTA, 53, Nguyễn Du, Hai Bà Trưng, Hà Nội','024 3945 4661');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('570','NXB QUÂN ĐỘI NHÂN DÂN ','23 Lý Nam Đế, Hoàn Kiếm, Hà Nội','2438455766');
INSERT INTO NXB (MaNXB,TenNXB,DiaChiNXB,SDT_NXB) VALUES ('571','NXB Thế giới','46 Trần Hưng Đạo, Hàng Bài, Hoàn Kiếm, Hà Nội ','024 3825 3841');

-- Insert THETHUVIEN
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150001','Còn Hạn ','2/9/2022','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150002','Còn Hạn ','8/4/2022','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150003','Còn Hạn ','5/3/2023','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150004','Còn Hạn ','12/12/2023','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150230','Còn Hạn ','11/13/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150169','Còn Hạn ','2/9/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150232','Còn Hạn ','8/4/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150172','Còn Hạn ','5/3/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150173','Còn Hạn ','12/12/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150174','Còn Hạn ','11/13/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150233','Còn Hạn ','2/9/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150171','Còn Hạn ','8/4/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150234','Còn Hạn ','5/3/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150238','Còn Hạn ','12/12/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150003','Còn Hạn ','11/13/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150085','Còn Hạn ','2/9/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150175','Còn Hạn ','12/12/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16150084','Còn Hạn ','11/13/2022','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150179','Còn Hạn ','2/9/2022','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16150229','Còn Hạn ','12/12/2023','4');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('15150015','Còn Hạn ','11/13/2022','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150123','Còn Hạn ','2/9/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150187','Còn Hạn ','3/17/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150188','Còn Hạn ','11/6/2021','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150185','Còn Hạn ','5/28/2023','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17151004','Còn Hạn ','10/25/2021','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150248','Còn Hạn ','5/12/2021','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150249','Còn Hạn ','10/23/2023','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150181','Còn Hạn ','9/27/2023','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150008','Còn Hạn ','3/14/2021','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150424','Còn Hạn ','8/28/2021','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150010','Còn Hạn ','3/15/2021','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150183','Còn Hạn ','6/27/2023','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150246','Còn Hạn ','11/22/2022','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150189','Còn Hạn ','8/28/2022','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150020','Còn Hạn ','9/29/2021','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150190','Còn Hạn ','2/23/2023','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16150100','Còn Hạn ','6/6/2021','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150255','Còn Hạn ','1/22/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150256','Còn Hạn ','5/28/2021','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150257','Còn Hạn ','9/1/2021','4');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17151003','Còn Hạn ','11/26/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150111','Còn Hạn ','7/27/2021','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150028','Còn Hạn ','5/31/2021','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150139','Còn Hạn ','11/4/2021','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('14150503','Còn Hạn ','8/13/2023','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('15151019','Còn Hạn ','9/8/2023','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150029','Còn Hạn ','2/10/2023','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150031','Còn Hạn ','8/16/2021','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150193','Còn Hạn ','8/12/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150266','Còn Hạn ','2/17/2023','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('15150830','Còn Hạn ','7/11/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('15150004','Còn Hạn ','8/16/2022','4');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150123','Còn Hạn ','5/11/2022','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16151459','Còn Hạn ','1/14/2023','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150142','Còn Hạn ','5/8/2021','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16150330','Còn Hạn ','8/12/2022','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150194','Còn Hạn ','11/18/2023','4');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150196','Còn Hạn ','7/12/2021','4');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150132','Còn Hạn ','4/27/2021','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150198','Còn Hạn ','7/11/2021','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150199','Còn Hạn ','3/29/2021','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16150116','Còn Hạn ','1/25/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150202','Còn Hạn ','10/28/2022','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16150180','Còn Hạn ','7/31/2022','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16150776','Còn Hạn ','10/9/2022','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150150','Còn Hạn ','3/29/2021','4');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16150120','Còn Hạn ','2/17/2022','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('15151042','Còn Hạn ','9/12/2021','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150206','Còn Hạn ','1/5/2021','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16151466','Còn Hạn ','7/5/2023','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150342','Còn Hạn ','12/26/2023','0');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150049','Còn Hạn ','12/22/2023','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('15151183','Còn Hạn ','1/20/2021','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16151649','Còn Hạn ','9/18/2023','4');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150163','Còn Hạn ','7/15/2021','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150052','Còn Hạn ','7/22/2021','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150208','Còn Hạn ','6/25/2022','2');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16150190','Còn Hạn ','4/2/2022','3');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('17150504','Còn Hạn ','5/21/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('16150345','Còn Hạn ','3/2/2023','1');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150211','Còn Hạn ','6/17/2022','4');
INSERT INTO THETHUVIEN (MaThe,TrangThai,NgayHetHan,SoLanGiaHan) VALUES ('18150212','Còn Hạn ','7/24/2022','0');


-- Insert VIPHAM
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7878','Mất Sách ','','17150023');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7879','Giữ sách quá hạn','','16150020');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7890','Mất, hỏng tem mã vạch ','','18150465');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7891','Rách bìa, bung bìa ','','18150673');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7892','Bẩn sách','','15150511');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7893','Mất Sách ','','16150190');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7894','Rách trang','','18150198');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7895','Rách trang','','18150246');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7896','Giữ sách quá hạn','','15151183');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7897','Giữ sách quá hạn','','18150179');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7898','Giữ sách quá hạn','','15150015');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7899','Giữ sách quá hạn','','18150234');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7900','Giữ sách quá hạn','','17150132');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7901','Giữ sách quá hạn','','18150142');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7902','Mất mã vạch','','17150123');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7903','Mất Sách ','','18150246');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7904','Mất Sách ','','18150248');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7905','Giữ sách quá hạn','','16150100');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7906','Giữ sách quá hạn','','17150085');
INSERT INTO VIPHAM (MaViPham,TenViPham,GhiChu,MaThe) VALUES ('7907','Giữ sách quá hạn','','16151466');

-- Insert DOCGIA
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111110','Nguyễn Vũ hải Anh ','KTPM16','4/13/1999','Hà Nội','367069763','17150001');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111111','Phạm Đức Anh','KTPM16','7/15/1999','Ninh Bình','364974368','17150002');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111112','Phạm Hoàng Anh','KTPM16','4/8/1999','Hải Dương','966166821','17150003');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111113','Trần Đức Anh','KTPM16','1/26/1999','Hà Nội','971889405','17150004');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111114','Trần Tuấn Anh','KTPM16','7/9/1999','Hà Nội','397114855','17150005');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111115','CAO HẢI ANH','TDH17','11/29/2000','Quảng Ninh','957525471','18150230');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111116','ĐỖ ĐỨC ANH','DTVT17','5/1/2000','Kon Tum','1517936087','18150169');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111117','MAI QUANG VIỆT ANH','DKCN','11/11/2000','Bắc Ninh','905243600','18150232');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111118','PHẠM ĐỨC ANH','DTVT17','10/12/2000','Quảng Bình','979012411','18150172');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111119','TẠ NGỌC ANH','DTVT17','9/12/2000','Thừa Thiên Huế','989950469','18150173');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111120','TRẦN TIẾN ANH','DTVT17','9/20/2000','Vĩnh Long','989970469','18150174');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111121','NGUYỄN ĐĂNG NHẬT ANH','TDH17','11/13/2000','Ninh Thuận','','18150233');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111122','NGUYỄN THẾ ANH','DTVT17','9/8/2000','Cà Mau','','18150171');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111123','PHẠM THẾ ANH','DKCN','10/31/2000','Khánh Hòa','','18150234');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111124','TRỊNH XUÂN ANH','TDH17','3/28/2000','Đồng Nai','972755453','18150238');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111125','PHẠM HOÀNG ANH','KTPM16','4/8/1999','Vĩnh Phúc','','17150003');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111126','TRẦN THÁI BẢO','CNTT16A','3/14/1999','Phú Yên','983853567','17150085');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111127','NGUYỄN ĐỨC BẮC','DTVT17','11/14/1999','Trà Vinh','915361779','18150175');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111128','HOÀNG THỊ CHUNG','CNM15','8/7/1998','Thái Nguyên','','16150084');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111129','ĐẬU THÀNH VĂN CHƯƠNG','DTVT17','8/1/2000','Ninh Bình','','18150179');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111130','VŨ THÀNH CÔNG','HTTTQL15','3/16/1998','Thanh Hóa','','16150229');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111131','Ngô Mạnh Cường','GAM&MP14','6/9/1997','Hậu Giang','','15150015');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111132','NGUYỄN THÁI CƯỜNG','CDT17','7/9/2000','Hòa Bình','905629639','18150123');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111133','PHONG ĐỨC DUY','DTVT17','10/4/2000','Quảng Trị','','18150187');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111134','VŨ XUÂN DUY','DTVT17','12/5/2000','Vĩnh Long','977103776','18150188');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111135','TĂNG VIỆT DŨNG','DTVT17','6/29/2000','Bạc Liêu','979024505','18150185');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111136','NGUYỄN VĂN DŨNG','CNTT16A','11/23/1999','Đắk Nông','','17151004');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111137','BÙI TUẤN DƯƠNG','TDH17','2/28/2000','Bắc Giang','905484808','18150248');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111138','PHẠM HẢI DƯƠNG','DKCN','7/13/2000','Bắc Ninh','905484808','18150249');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111139','NGUYỄN TIẾN ĐẠT','DTVT17','5/16/2000','Đồng Nai','984864072','18150181');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111140','ĐẶNG QUANG ĐẠT','KTPM16','3/28/1999','Quảng Ninh','','17150008');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111141','LÊ TIẾN ĐẠT','TDH 16','2/12/1999','Phú Yên','1685349007','17150424');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111142','NGUYỄN THÀNH ĐẠT','KTPM16','11/4/1999','Long An','','17150010');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111143','LÊ XUÂN ĐÔNG','DTVT17','1/31/2000','Kiên Giang','1234377007','18150183');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111144','NGUYỄN MINH ĐỨC','TDH17','3/27/2000','Bình Dương','','18150246');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111145','ĐỖ THỊ HƯƠNG GIANG','DTVT17','11/21/2000','Cà Mau','905669673','18150189');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111146','NGUYỄN THỊ THU HÀ','KTPM16','2/7/1999','Cao Bằng','979793396','17150020');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111147','NGUYỄN QUÍ HẢI','DTVT17','11/9/2000','Hà Nội','982005331','18150190');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111148','ĐẶNG THỊ HIỀN','CNM15','2/24/1998','Tiền Giang','915003445','16150100');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111149','ĐINH ĐỨC HIẾU','TDH17','7/2/2000','Lạng Sơn','935228199','18150255');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111150','VŨ VĂN HIẾU','DKCN','5/5/2000','Cần Thơ','','18150256');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111151','NGUYỄN VĂN HIỆU','TDH17','11/1/2000','Hà Nam','','18150257');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111152','LỖ TRUNG HIẾU','CNTT16B','11/20/1999','Đồng Tháp','','17151003');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111153','NGUYỄN MINH HIẾU','CNTT16A','1/2/1999','Nam Định','','17150111');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111154','ĐINH THỊ HOÀI','KTPM16','11/3/1999','Ninh Thuận','0977632345 ','17150028');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111155','LÊ VIỆT HOÀNG','CDT17','8/28/2000','Thanh Hóa','','18150139');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111156','Lê Minh Hoàng','DPT13','4/30/1996','Vĩnh Long','935056206','14150503');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111157','Mai Nhật Hoàng','DDT14C','3/22/1997','Cần Thơ','933540599','15151019');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111158','NGUYỄN HOÀNG','KTPM16','7/23/1999','Nam Định','','17150029');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111159','THÁI VIỆT HOÀNG','KTPM16','9/13/1999','Nghệ An','988201498','17150031');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111160','DƯƠNG NGỌC HUY','DTVT17','9/2/2000','Sóc Trăng','935454511','18150193');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111161','NGUYỄN QUANG HUY','TDH17','6/13/2000','Kon Tum','946186886','18150266');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111162','Ngô Đình Huy','DTVT14','3/17/1997','Vĩnh Long','0946186898 ','15150830');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111163','Phan Ngọc Huy','GAM&MP14','1/26/1997','Phú Yên','915301065','15150004');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111164','ĐỒNG VĂN HÙNG','CNTT16A','8/20/1999','Vĩnh Long','983799417','17150123');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111165','NGUYỄN TUẤN HÙNG','CNPM15','1/15/1998','Bến Tre','1224207990','16151459');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111166','NGUYỄN QUANG HƯNG','CDT17','2/7/2000','Bình Dương','1666461274','18150142');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111167','NGUYỄN VĂN KHÁ','CNDL15','11/9/1998','Bình Thuận','914033933','16150330');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111168','CAO DUY KHANG','DTVT17','1/19/2000','Vĩnh Phúc','919083637','18150194');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111169','NGUYỄN QUỐC KHÁNH','DTVT17','9/7/2000','Lai Châu','989638138','18150196');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111170','ĐẶNG QUỐC KHÁNH','CNTT16B','7/1/1999','Bắc Kạn','979810948','17150132');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111171','VŨ VIỆT LÂM','DTVT17','3/3/2000','Sóc Trăng','','18150198');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111172','ĐẶNG THỊ LINH','DTVT17','6/12/2000','Quảng Ninh','1686688723','18150199');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111173','HOÀNG NGỌC LINH','CNM15','3/11/1997','Đắk Lắk','915050122','16150116');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111174','BÙI CÔNG LONG','DTVT17','9/4/2000','Sóc Trăng','914979516','18150202');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111175','NGUYỄN HOÀNG LONG','CNPM15','4/1/1998','Hòa Bình','972624052','16150180');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111176','NGUYỄN HỮU LỘC','CDT15B','7/31/1998','Quảng Bình','983211135','16150776');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111177','ĐINH VĂN LỰC','CNTT16B','10/8/1999','Sóc Trăng','','17150150');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111178','NGUYỄN HÙNG MẠNH','CNM15','5/7/1998','Quảng Ninh','942113606','16150120');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111179','Thái Đức Mạnh','DDT14B','10/21/1997','Kon Tum','','15151042');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111180','NGUYỄN THỊ MÂY','DTVT17','10/6/2000','Bắc Ninh','917679396','18150206');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111181','HOÀNG QUANG MINH','CNPM15','2/24/1998','Quảng Bình','','16151466');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111182','TRỊNH ĐỨC NHẬT MINH','DTVT16B','10/25/1999','Thừa Thiên Huế','905257433','17150342');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111183','BÙI THỊ TRÀ MY','KTPM16','6/17/1999','Vĩnh Long','988616588','17150049');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111184','Đoàn Quang Nam','ĐTYS14','9/13/1997','Ninh Thuận','','15151183');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111185','LÊ PHƯƠNG NAM','CNM15','1/22/1998','Cà Mau','','16151649');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111186','TRƯƠNG TUẤN NGHĨA','CNTT16A','5/21/1999','Khánh Hòa','919611828','17150163');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111187','PHÙNG THỊ NGỌC','KTPM16','4/14/1999','Đồng Nai','','17150052');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111188','ĐINH CÔNG PHONG','DTVT17','6/2/2000','Vĩnh Phúc','948192263','18150208');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111189','NGUYỄN VĂN PHONG','CNPM15','9/28/1998','Phú Yên','914111707','16150190');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111190','VŨ ĐÌNH QUANG','TDH 16','6/8/1999','Trà Vinh','','17150504');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111191','NGUYỄN MINH QUÂN','CN_CNDL15','11/27/1998','Thái Nguyên','914145414','16150345');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111192','NGUYỄN ĐÌNH NHƯ QUỲNH','DTVT17','3/8/2000','Ninh Bình','','18150211');
INSERT INTO DOCGIA (MaDocGia,HoTenDocGia,Lop,NgaySinh,DiaChi,SDT,MaThe) VALUES ('1111193','NGUYỄN XUÂN SƠN','DTVT17','9/5/2000','Thanh Hóa','982191252','18150212');

-- Insert DAUSACH
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('90','Mình Về Hà Nội Để Thương Nhau','551');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('91','Tiếc Rằng Mình Chẳng Đợi Được Nhau ','551');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('92','Có Một Cô Gái Thầm Yêu Anh ','552');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('93','Tôi Thấy Hoa Vàng Trên Cỏ Xanh ','553');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('94','Nhiệt Độ Ngôn Ngữ ','555');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('95','Cô Gái Đến Từ Hôm Qua','553');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('96','Mắt Biếc','553');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('97','Cho Tôi Xin Một Vé Đi Tuổi Thơ','553');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('98','Có Hai Con Mèo Ngồi Bên Cửa Sổ','553');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('99','Tôi Là Bêtô','553');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('100','Ngồi Khóc Trên Cây: Truyện Dài','553');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('101',' 15 Nguyên Tắc Vàng Về Phát Triển Bản Thân','571');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('102','Thái Độ 101 – Những Điều Nhà Lãnh Đạo Cần Biết','571');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('103','Trở Thành Người Ảnh Hưởng','571');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('104','Mối Quan Hệ 101 – Những Điều Nhà Lãnh Đạo Cần Biết','571');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('105','Kỹ thuật lập trình C cơ bản và nâng cao','562');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('106','Xác suất thống kê','558');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('107','Giải tích 1','558');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('108','Giải tích 2','558');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('109','Lập trình hướng đối tượng','562');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('110','Vật Lý đại cương 1','558');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('111','Vật Lý đại cương 2','558');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('112','Đời ngắn đừng ngủ dài','553');
INSERT INTO DAUSACH (MaDauSach,TenDauSach,MaNXB) VALUES ('113','Nhà giả kim','565');

-- Insert SACH_TACGIA
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('90','18576');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('91','18577');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('92','18578');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('93','18579');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('94','18580');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('95','18579');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('96','18579');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('97','18579');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('98','18579');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('99','18579');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('100','18579');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('101','18580');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('102','18580');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('103','18580');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('104','18580');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('105','18583');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('106','18582');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('107','18582');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('108','18582');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('109','18580');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('110','18584');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('111','18584');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('112','18585');
INSERT INTO SACH_TACGIA (MaDauSach,MaTacGia) VALUES ('113','18586');

-- Insert PHIEUMUON

-- Insert PHIEUTRA

-- Insert CUONSACH

-- Insert PHIEUKIEMKE

-- Insert NHANVIEN
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2201','Nguyễn Thi Như Quỳnh ','221');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2202','Quách Văn Thắng','222');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2203','Lê Đình Tú','331');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2204','Nguyễn Ánh Dương','332');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2205','Trần Cao Thanh Tùng','433');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2206','Trương Anh Khoa','221');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2207','Đặng Quang Vũ','222');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2208','Nguyễn Bích Như','331');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2209','Vũ Kim Phượng','332');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2210','Nguyễn Phương Quyên','433');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2211','Phùng Ðức Bảo','221');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2212','Phạm Diệu Loan','332');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2213','Trần Ngọc Yến','222');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2214','Dương Thu Trang','221');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2215','Đoàn Bích Hằng','221');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2216','Võ Việt An','222');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2217','Nguyễn Khắc Duy','331');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2218','Phạm Phương Thảo','332');
INSERT INTO NHANVIEN (MaNhanVien,TenNhanVien,MaKho) VALUES ('2219','Hồ Ngọc Huệ','433');


-- Insert QUANLYMUONSACH

-- Insert QUANLYTRASACH

-- Insert PHIEUNHAP

-- Insert PHIEUXUAT