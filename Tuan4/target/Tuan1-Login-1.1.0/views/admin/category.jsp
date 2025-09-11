<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h1 class="mt-4">Quản lý Danh mục</h1>

<!-- Thanh công cụ: tìm kiếm + thêm mới -->
<div class="d-flex justify-content-between align-items-center mb-3">
    <form action="${pageContext.request.contextPath}/admin/category/search" method="get" class="d-flex">
        <input type="text" name="keyword" class="form-control me-2" placeholder="Nhập tên danh mục...">
        <button type="submit" class="btn btn-primary">
            <i class="bi bi-search"></i> Tìm
        </button>
    </form>
    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
        <i class="bi bi-plus-circle-fill me-1"></i> Thêm mới
    </button>
</div>

<div class="card shadow-sm">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th style="width:200px;">#</th>
                        <th style="width:300px;">Hình ảnh</th>
                        <th>Tên danh mục</th>
                        <th class="text-center" style="width:300px;">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cate" items="${categories}" varStatus="st">
                        <tr>
                            <td>${st.index + 1}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty cate.icons}">
                                        <img src="${cate.icons}" class="rounded"
                                             style="width:60px; height:60px; object-fit:cover;">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://via.placeholder.com/60" class="rounded bg-light">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${cate.cateName}</td>
                            <td class="text-center">
                                <button class="btn btn-info btn-sm text-white me-2"
                                        data-bs-toggle="modal" data-bs-target="#editCategoryModal"
                                        data-id="${cate.cateId}" data-name="${cate.cateName}" data-icon="${cate.icons}"
                                        onclick="populateEditModal(this)">
                                    <i class="bi bi-pencil-square"></i> Sửa
                                </button>
                                <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.cateId}"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?')">
                                    <i class="bi bi-trash3-fill"></i> Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${empty categories}">
            <div class="alert alert-warning text-center mt-3">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>Không tìm thấy danh mục nào.
            </div>
        </c:if>
    </div>
</div>

<!-- Modal Thêm -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/admin/category/create" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm Danh mục mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Tên danh mục</label>
                        <input type="text" name="cate_name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Link hình ảnh (tùy chọn)</label>
                        <input type="text" name="icons" class="form-control">
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

<!-- Modal Sửa -->
<div class="modal fade" id="editCategoryModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="editForm" action="${pageContext.request.contextPath}/admin/category/update" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Chỉnh sửa Danh mục</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="cate_id" id="edit_cate_id">
                    <div class="mb-3">
                        <label class="form-label">Tên danh mục</label>
                        <input type="text" name="cate_name" id="edit_cate_name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Link hình ảnh</label>
                        <input type="text" name="icons" id="edit_icons" class="form-control">
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
    function populateEditModal(button) {
        document.getElementById('edit_cate_id').value = button.getAttribute('data-id');
        document.getElementById('edit_cate_name').value = button.getAttribute('data-name');
        document.getElementById('edit_icons').value = button.getAttribute('data-icon');
    }
</script>
