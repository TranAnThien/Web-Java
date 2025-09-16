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

# Bài tập Tuần 4 - SiteMesh + Bootstrap và Cập nhật Profile

## Mô tả
Bài tập tuần 4 (Java Servlet + JSP + JPA + SiteMesh + Bootstrap).  
- Tích hợp **SiteMesh** để quản lý layout (header, sidebar, footer) dùng chung.  
- Áp dụng **Bootstrap** để thiết kế giao diện quản trị.  
- Xây dựng chức năng **Cập nhật Profile**.  

## Tài khoản test
- Username: `admin`  
- Password: `123456`  

## Chức năng

### SiteMesh + Bootstrap
- Tích hợp **SiteMesh 3** để định nghĩa layout chung qua decorator:  
  - `header.jsp`: thanh điều hướng trên.  
  - `sidebar.jsp`: menu chức năng bên trái.  
  - `footer.jsp`: phần chân trang.  
- Toàn bộ trang trong `/admin/*` đều render qua layout này.  
- Giao diện được xây dựng bằng **Bootstrap 5**, sử dụng các template: Dashboard, Charts, Tables, Login.  

### Cập nhật Profile
- Người dùng chỉnh sửa thông tin cá nhân: `fullname`, `email`, `phone`, `avatar`.  
- **Upload avatar**:  
  - Chọn ảnh từ máy tính.  
  - Ảnh lưu trong thư mục `uploads/`.  
  - CSDL cập nhật đường dẫn ảnh.  
  - Trang Profile hiển thị ảnh mới ngay sau khi lưu thay đổi.  
- Giới hạn kích thước ảnh: tối đa 10MB.  

## Kết quả mong đợi

### SiteMesh + Bootstrap
- Các trang quản trị có giao diện đồng bộ, header/sidebar/footer được dùng chung.  
- Giao diện trực quan, responsive nhờ Bootstrap.  

### Cập nhật Profile
- Người dùng cập nhật thông tin thành công, dữ liệu lưu trong database.  
- Ảnh đại diện hiển thị đúng ảnh vừa upload.  
- Nếu upload file sai định dạng hoặc vượt dung lượng → báo lỗi.  

---

# Bài tập Tuần 5 - CRUD User và Video bằng JPA trong role Admin

## Mô tả
Bài tập tuần 5 (Java Servlet + JSP + JPA + SiteMesh + Bootstrap).  
- Xây dựng module **Quản lý Người dùng (User)** và **Quản lý Video (Video)**.  
- Thực hiện đầy đủ các thao tác CRUD (Create, Read, Update, Delete).  

## Tài khoản test
- Username: `admin`  
- Password: `123456`  

## Chức năng

### Quản lý User (CRUD)
- **Danh sách**: hiển thị toàn bộ người dùng với các thông tin: Avatar, Username, Fullname, Email, Phone, Role, CreatedDate.  
- **Thêm**: nhập thông tin User mới (username, password, fullname, email, phone, avatar, roleid), lưu vào bảng `Users`.  
- **Sửa**: cập nhật thông tin người dùng (trừ ngày tạo). Có thể thay đổi role, avatar, mật khẩu.  
- **Xóa**: xóa người dùng khỏi database.  
- **Tìm kiếm**: tìm theo `username`.  

### Quản lý Video (CRUD)
- **Danh sách**: hiển thị toàn bộ video với các thông tin: Poster, Tiêu đề, Mô tả, Danh mục (Category), Lượt xem, Trạng thái.  
- **Thêm**: nhập tiêu đề, mô tả, poster, chọn category từ combobox, lưu vào bảng `Videos`.  
- **Sửa**: chỉnh sửa thông tin video (tiêu đề, mô tả, poster, trạng thái, category).  
- **Xóa**: xóa video khỏi database.  
- **Tìm kiếm**: tìm video theo tiêu đề.  

## Kết quả mong đợi

### Quản lý User
- Vào menu **User** trong sidebar → hiển thị danh sách người dùng.  
- Thêm mới → User được lưu vào database, hiển thị ngay trong danh sách.  
- Sửa → dữ liệu thay đổi chính xác trong database.  
- Xóa → bản ghi người dùng biến mất khỏi danh sách.  
- Tìm kiếm → hiển thị danh sách user phù hợp với từ khóa.  

### Quản lý Video
- Vào menu **Video** trong sidebar → hiển thị danh sách video.  
- Thêm mới → video được thêm vào database, hiển thị đúng category.  
- Sửa → cập nhật thông tin video thành công.  
- Xóa → video bị xóa khỏi database.  
- Tìm kiếm → hiển thị danh sách video khớp tiêu đề tìm kiếm.  

---
