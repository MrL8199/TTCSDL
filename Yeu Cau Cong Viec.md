## Note phần chức năng:

Kho <-> NCC
quan hệ: cung cấp
thông tin: số lượng, ngày nhập, 

- Khi nhập sách từ NCC về KHO: update THÊM sách vào bảng DAUSACH


table CUONSACH: lưu thông tin những sách trên kệ (không lưu thông tin sách trong kho);
cột MaPhieuMuon + MaPhieuTra
MaPhieuTra để trống nếu độc giả chưa trả, thông tin cuốn sách: đã mượn
Thông tin cuốn sách: chưa mượn => có đủ thông tin mã phiếu trả và mã phiếu mượn or Trống cả 2

## Công việc tối nay 4/4/2020:
- xóa -> tạo lại database theo code sql trên github
- thử insert dữ liệu vào db. nếu có lỗi thì ae báo lên để fix 
- có chỗ nào mà chưa hợp lý thì ae góp ý để sửa