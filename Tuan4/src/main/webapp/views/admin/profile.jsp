<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h1 class="mt-4">Thông tin cá nhân</h1>
<div class="card mb-4 shadow-sm">
    <div class="card-body">
        <div class="row">
            <!-- Avatar -->
            <div class="col-md-3 text-center d-flex flex-column align-items-center justify-content-center">
                <div class="rounded-circle overflow-hidden mb-3"
                     style="width:150px; height:150px; border:3px solid #ddd; background:#f8f9fa;">
                    <c:choose>
                        <c:when test="${not empty sessionScope.account.avatar}">
                            <!-- Hiển thị avatar từ thư mục uploads -->
                            <img src="${pageContext.request.contextPath}/uploads/${sessionScope.account.avatar}"
                                 alt="Avatar"
                                 style="width:100%; height:100%; object-fit:cover;">
                        </c:when>
                        <c:otherwise>
                            <!-- Nếu chưa có avatar thì dùng ảnh mặc định -->
                            <img src="https://via.placeholder.com/150"
                                 alt="No Avatar"
                                 style="width:100%; height:100%; object-fit:cover;">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Thông tin -->
            <div class="col-md-9 position-relative">
                <p><strong>Họ và tên:</strong> ${sessionScope.account.fullName}</p>
                <p><strong>Email:</strong> ${sessionScope.account.email}</p>
                <p><strong>Số điện thoại:</strong> ${sessionScope.account.phone}</p>
                <p><strong>Tài khoản:</strong> ${sessionScope.account.userName}</p>
                <p><strong>Ngày tạo:</strong> ${sessionScope.account.createdDate}</p>

                <!-- Nút mở modal cập nhật -->
                <div class="text-end mt-4">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                        <i class="bi bi-pencil-square me-1"></i> Cập nhật
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal cập nhật Profile -->
<div class="modal fade" id="editProfileModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/admin/profile" 
                  method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title">Cập nhật thông tin cá nhân</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" value="${sessionScope.account.id}">

                    <div class="mb-3">
                        <label class="form-label">Họ và tên</label>
                        <input type="text" name="fullname" value="${sessionScope.account.fullName}" 
                               class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" value="${sessionScope.account.email}" 
                               class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mật khẩu</label>
                        <input type="password" name="password" value="${sessionScope.account.passWord}" 
                               class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số điện thoại</label>
                        <input type="text" name="phone" value="${sessionScope.account.phone}" 
                               class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Ảnh đại diện</label>
                        <input type="file" name="avatar" id="avatarInput" 
                               class="form-control" accept="image/*">
                        <!-- Preview ảnh trong modal -->
                        <c:choose>
                            <c:when test="${not empty sessionScope.account.avatar}">
                                <img id="preview"
                                     src="${pageContext.request.contextPath}/uploads/${sessionScope.account.avatar}"
                                     style="width:100px; margin-top:10px; border:1px solid #ddd; border-radius:8px;" />
                            </c:when>
                            <c:otherwise>
                                <img id="preview"
                                     src="https://via.placeholder.com/100"
                                     style="width:100px; margin-top:10px; border:1px solid #ddd; border-radius:8px;" />
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-success">Lưu thay đổi</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Script preview ảnh khi chọn file -->
<script>
document.getElementById("avatarInput").addEventListener("change", function (event) {
    const [file] = event.target.files;
    if (file) {
        document.getElementById("preview").src = URL.createObjectURL(file);
    }
});
</script>
