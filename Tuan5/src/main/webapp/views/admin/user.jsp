<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h1 class="mt-4">Quản lý Người dùng</h1>

<!-- Thanh công cụ: tìm kiếm -->
<div class="d-flex justify-content-between align-items-center mb-3">
    <form action="${pageContext.request.contextPath}/admin/user/search" method="get" class="d-flex">
        <input type="text" name="keyword" class="form-control me-2" placeholder="Nhập tên người dùng...">
        <button type="submit" class="btn btn-primary">
            <i class="bi bi-search"></i> Tìm
        </button>
    </form>
    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addUserModal">
        <i class="bi bi-plus-circle-fill me-1"></i> Thêm mới
    </button>
</div>

<div class="card shadow-sm">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>#</th>
                        <th>Ảnh đại diện</th>
                        <th>Tên đăng nhập</th>
                        <th>Họ tên</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Quyền</th>
                        <th>Ngày tạo</th>
                        <th class="text-center" style="width:300px;">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${users}" varStatus="st">
                        <tr>
                            <td>${st.index + 1}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty u.avatar}">
                                        <img src="${u.avatar}" class="rounded-circle"
                                             style="width:50px; height:50px; object-fit:cover;">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://via.placeholder.com/50" class="rounded-circle bg-light">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${u.userName}</td>
                            <td>${u.fullName}</td>
                            <td>${u.email}</td>
                            <td>${u.phone}</td>
                            <td>${u.roleid}</td>
                            <td>${u.createdDate}</td>
                            <td class="text-center">
                                <button class="btn btn-info btn-sm text-white me-2"
                                        data-bs-toggle="modal" data-bs-target="#editUserModal"
                                        data-id="${u.id}" data-username="${u.userName}"
                                        data-fullname="${u.fullName}" data-email="${u.email}"
                                        data-phone="${u.phone}" data-role="${u.roleid}" data-avatar="${u.avatar}"
                                        onclick="populateEditUser(this)">
                                    <i class="bi bi-pencil-square"></i> Sửa
                                </button>
                                <a href="${pageContext.request.contextPath}/admin/user/delete?id=${u.id}"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?')">
                                    <i class="bi bi-trash3-fill"></i> Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${empty users}">
            <div class="alert alert-warning text-center mt-3">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>Không tìm thấy người dùng nào.
            </div>
        </c:if>
    </div>
</div>

<!-- Modal thêm -->
<div class="modal fade" id="addUserModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/admin/user/create" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm Người dùng mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Tên đăng nhập</label>
                        <input type="text" name="userName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Họ tên</label>
                        <input type="text" name="fullName" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mật khẩu</label>
                        <input type="password" name="passWord" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số điện thoại</label>
                        <input type="text" name="phone" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Quyền</label>
                        <select name="roleid" class="form-select">
                            <option value="5">USER</option>
                            <option value="1">ADMIN</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Link ảnh đại diện</label>
                        <input type="text" name="avatar" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Thêm mới</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal sửa -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="editUserForm" action="${pageContext.request.contextPath}/admin/user/update" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Chỉnh sửa Người dùng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="edit_id">
                    <div class="mb-3">
                        <label class="form-label">Tên đăng nhập</label>
                        <input type="text" name="userName" id="edit_userName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Họ tên</label>
                        <input type="text" name="fullName" id="edit_fullName" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" id="edit_email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số điện thoại</label>
                        <input type="text" name="phone" id="edit_phone" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Quyền</label>
                        <select name="roleid" id="edit_roleid" class="form-select">
                            <option value="5">USER</option>
                            <option value="1">ADMIN</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Link ảnh đại diện</label>
                        <input type="text" name="avatar" id="edit_avatar" class="form-control">
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

<script>
    function populateEditUser(button) {
        document.getElementById('edit_id').value = button.getAttribute('data-id');
        document.getElementById('edit_userName').value = button.getAttribute('data-username');
        document.getElementById('edit_fullName').value = button.getAttribute('data-fullname');
        document.getElementById('edit_email').value = button.getAttribute('data-email');
        document.getElementById('edit_phone').value = button.getAttribute('data-phone');
        document.getElementById('edit_roleid').value = button.getAttribute('data-role');
        document.getElementById('edit_avatar').value = button.getAttribute('data-avatar');
    }
</script>
