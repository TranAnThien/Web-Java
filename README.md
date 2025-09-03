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

# Bài tập Tuần 2 - Đăng ký, đăng nhập với Database

## Mô tả
Bài tập tuần 2 (Java Servlet + JDBC).  
- Đăng ký, đăng nhập với Database 
- Kiểm tra trùng lặp: email, username, số điện thoại.  
- Lưu thông tin vào cơ sở dữ liệu SQL Server.  
- Đăng nhập phân quyền theo `roleid`: admin, manager, user.  

## Tài khoản test sẵn trong database
| Username | Password | Roleid | Vai trò   |
|----------|----------|--------|-----------|
| admin    | 123456   | 1      | Admin     |
| manager  | 123456   | 2      | Manager   |
| home     | 123456   | 3      | Người dùng (User) |

## Chức năng

### Đăng ký tài khoản
- Nhập: `username`, `password`, `email`, `fullname`, `phone`.  
- Nếu email, username hoặc số điện thoại đã tồn tại → thông báo lỗi.  
- Nếu hợp lệ → thêm bản ghi vào bảng `Users` (roleid mặc định = 5, tức User).  
- Sau khi đăng ký thành công → chuyển về trang đăng nhập.

### Đăng nhập
- Đúng username & password → kiểm tra `roleid` và chuyển hướng:  
  - `roleid = 1` → `/admin/home` (Trang Admin).  
  - `roleid = 2` → `/manager/home` (Trang Quản lý).  
  - `roleid = 3` → `/home` (Trang Người dùng).  
- Sai username hoặc password → quay lại `login.jsp` và hiển thị lỗi.  

### Logout
- Xoá session.  
- Chuyển về trang `login.jsp`.  

## Kết quả mong đợi
- **Đăng ký**: Người dùng mới được thêm vào database, với `createdDate` tự động sinh.  
- **Đăng nhập**: Hệ thống phân quyền chính xác theo vai trò.  
- **Chạy thử**:
  - Đăng nhập với `admin/123456` → hiện Trang Admin.  
  - Đăng nhập với `manager/123456` → hiện Trang Manager.  
  - Đăng nhập với `home/123456` → hiện Trang Người dùng.  

---

# Bài tập Tuần 3 - Quên mật khẩu, Quản lý Category (CRUD)

## Mô tả
Bài tập tuần 3 (Java Servlet + JDBC + JSP).  
- Bổ sung chức năng **Quên mật khẩu**.  
- Thêm module **Quản lý Category (Danh mục)** với đầy đủ CRUD.  
- Dữ liệu Category gắn với từng User trong bảng `Users`.

## Tài khoản test
- Username: `home`
- Password: `123`

## Chức năng

### Quên mật khẩu
- Tại trang đăng nhập, có nút **Quên mật khẩu**.  
- Nhập email → kiểm tra trong database:  
  - Nếu không tồn tại → hiển thị lỗi.  
  - Nếu tồn tại → chuyển sang đặt lại mật khẩu mới.  
- Nhập mật khẩu mới và xác nhận mật khẩu → cập nhật trong bảng `Users`.  
- Sau khi đổi mật khẩu thành công → chuyển về trang đăng nhập.

### Quản lý Category (CRUD)
- **Thêm**: nhập `cateName`, `icons`, lưu vào bảng `Category` với `user_id` là người đang đăng nhập.  
- **Sửa**: chọn 1 category, hiển thị form sửa, cập nhật lại database.  
- **Xóa**: chọn 1 category, xác nhận xóa, databse xóa bản ghi.  
- **Danh sách**: hiển thị tất cả category thuộc user đang đăng nhập, gồm: STT, Icon, Tên danh mục, Hành động (Sửa/Xóa).

## Kết quả mong đợi

### Quên mật khẩu
- Nhập email hợp lệ → đặt lại mật khẩu thành công.  
- Nhập email không tồn tại → báo lỗi.  
- Nhập 2 mật khẩu không trùng → yêu cầu nhập lại.

### CRUD Category
- Đăng nhập bằng user `home/123` → vào `/home` hiển thị danh sách category đã có.  
- Thêm mới → danh mục hiển thị ngay.  
- Sửa → cập nhật dữ liệu trong database.  
- Xóa → bản ghi biến mất khỏi database.  

---
