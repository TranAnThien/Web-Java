<h1 align="center">Lập trình Web </h1>

# Bài tập Tuần 1 - Login bằng Cookie và Session

## Mô tả
Bài tập tuần 1 (Java Servlet).  
- Đăng nhập bằng Cookie.
- Đăng nhập bằng Session.

## Tài khoản test
- Username: `thien`
- Password: `123456`

## Kết quả mong đợi

### Login bằng Cookie
- Nhập đúng tài khoản: Tạo Cookie lưu username, chuyển sang trang Hello.
- Nhập sai tài khoản: Hiển thị thông báo lỗi và cung cấp nút quay về trang đăng nhập.
- Cookie hết hạn sau 30 giây: Yêu cầu đăng nhập lại.

### Login bằng Session
- Nhập đúng tài khoản: Chuyển sang trang Profile, hiển thị "Chào mừng, [username]" và nút đăng xuất.
- Nhập sai tài khoản: Quay lại trang đăng nhập và hiển thị thông báo đăng nhập thất bại.
- Bấm "Đăng xuất": Huỷ session, quay về trang đăng nhập.

---
