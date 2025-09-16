<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h1 class="mt-4">Quản lý Video</h1>

<!-- Thanh công cụ -->
<div class="d-flex justify-content-between align-items-center mb-3">
    <form action="${pageContext.request.contextPath}/admin/video/search" method="get" class="d-flex">
        <input type="text" name="keyword" class="form-control me-2" placeholder="Nhập tiêu đề video...">
        <button type="submit" class="btn btn-primary">
            <i class="bi bi-search"></i> Tìm
        </button>
    </form>
    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addVideoModal">
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
                        <th>Poster</th>
                        <th>Tiêu đề</th>
                        <th>Mô tả</th>
                        <th>Danh mục</th>
                        <th>Lượt xem</th>
                        <th>Trạng thái</th>
                        <th class="text-center" style="width:250px;">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="v" items="${videos}" varStatus="st">
                        <tr>
                            <td>${st.index + 1}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty v.poster}">
                                        <img src="${v.poster}" class="rounded"
                                             style="width:60px; height:60px; object-fit:cover;">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://via.placeholder.com/60" class="rounded bg-light">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${v.title}</td>
                            <td>${v.description}</td>
                            <td>${v.category.cateName}</td>
                            <td>${v.views}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${v.active}">Hiển thị</c:when>
                                    <c:otherwise>Ẩn</c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center">
                                <!-- Nút sửa -->
                                <button class="btn btn-info btn-sm text-white me-2"
                                        data-bs-toggle="modal" data-bs-target="#editVideoModal"
                                        data-id="${v.videoId}"
                                        data-title="${v.title}"
                                        data-description="${v.description}"
                                        data-poster="${v.poster}"
                                        data-active="${v.active}"
                                        data-category="${v.category.cateId}">
                                    <i class="bi bi-pencil-square"></i> Sửa
                                </button>

                                <!-- Nút xóa -->
                                <a href="${pageContext.request.contextPath}/admin/video/delete?id=${v.videoId}"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa video này?')">
                                    <i class="bi bi-trash3-fill"></i> Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${empty videos}">
            <div class="alert alert-warning text-center mt-3">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>Không tìm thấy video nào.
            </div>
        </c:if>
    </div>
</div>

<!-- Modal thêm -->
<div class="modal fade" id="addVideoModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/admin/video/create" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm Video mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Tiêu đề</label>
                        <input type="text" name="title" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mô tả</label>
                        <textarea name="description" class="form-control"></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Poster</label>
                        <input type="text" name="poster" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Danh mục</label>
                        <select name="cate_id" class="form-select" required>
                            <c:forEach var="c" items="${categories}">
                                <option value="${c.cateId}">${c.cateName}</option>
                            </c:forEach>
                        </select>
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
<div class="modal fade" id="editVideoModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="editVideoForm" action="${pageContext.request.contextPath}/admin/video/update" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Chỉnh sửa Video</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="videoId" id="edit_videoId">

                    <div class="mb-3">
                        <label class="form-label">Tiêu đề</label>
                        <input type="text" name="title" id="edit_title" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mô tả</label>
                        <textarea name="description" id="edit_description" class="form-control"></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Poster</label>
                        <input type="text" name="poster" id="edit_poster" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Danh mục</label>
                        <select name="cate_id" id="edit_cate_id" class="form-select" required>
                            <c:forEach var="c" items="${categories}">
                                <option value="${c.cateId}">${c.cateName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Trạng thái</label>
                        <select name="active" id="edit_active" class="form-select">
                            <option value="true">Hiển thị</option>
                            <option value="false">Ẩn</option>
                        </select>
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
    // gán dữ liệu vào modal edit khi bấm nút "Sửa"
    var editVideoModal = document.getElementById('editVideoModal');
    editVideoModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;

        document.getElementById('edit_videoId').value = button.getAttribute('data-id');
        document.getElementById('edit_title').value = button.getAttribute('data-title');
        document.getElementById('edit_description').value = button.getAttribute('data-description');
        document.getElementById('edit_poster').value = button.getAttribute('data-poster');
        document.getElementById('edit_active').value = button.getAttribute('data-active');
        document.getElementById('edit_cate_id').value = button.getAttribute('data-category');
    });
</script>
