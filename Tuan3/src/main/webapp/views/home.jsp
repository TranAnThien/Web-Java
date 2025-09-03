<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý danh mục</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
body {
	background-color: #f5f6fa;
}

.sidebar {
	background: #1976d2;
	height: 100vh;
	padding: 20px;
	color: #fff;
}

.sidebar h4 {
	margin-bottom: 20px;
	font-weight: bold;
}

.menu-item {
	background: #2196f3;
	padding: 12px;
	border-radius: 8px;
	margin-bottom: 15px;
	text-align: center;
	font-size: 16px;
}

.menu-item a {
	color: #fff;
	text-decoration: none;
	display: block;
}

.menu-item:hover {
	background: #0d6efd;
}

.content {
	padding: 30px;
}

.box {
	background: #fff;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 25px;
	box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
}

.table th, .table td {
	vertical-align: middle !important;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">

			<!-- Sidebar -->
			<div class="col-sm-3 sidebar">
				<h4>Xin chào, ${sessionScope.account.fullName}</h4>
				<div class="menu-item">
					<a href="${pageContext.request.contextPath}/home">Danh mục quần
						áo</a>
				</div>
				<div class="menu-item" style="background: #e53935;">
					<a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
				</div>
			</div>

			<!-- Main content -->
			<div class="col-sm-9 content">
				<h3>Bảng điều khiển</h3>

				<!-- Box: Thêm danh mục -->
				<div class="box">
					<h4>Thêm danh mục mới</h4>
					<form action="${pageContext.request.contextPath}/category/add"
						method="post" class="form-inline">
						<div class="form-group">
							<input type="text" name="cate_name" placeholder="Tên danh mục"
								class="form-control" required>
						</div>
						<div class="form-group" style="margin-left: 10px;">
							<input type="text" name="icons"
								placeholder="Link hình ảnh (tùy chọn)" class="form-control">
						</div>
						<button type="submit" class="btn btn-primary"
							style="margin-left: 10px;">Thêm</button>
					</form>
				</div>

				<!-- Box: Danh sách danh mục -->
				<div class="box">
					<h4>Danh sách danh mục</h4>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Hình ảnh</th>
								<th>Tên danh mục</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cate" items="${categories}" varStatus="st">
								<!-- View row -->
								<tr id="row-${cate.cateId}">
									<td>${st.index + 1}</td>
									<td><c:if test="${not empty cate.icons}">
											<img src="${cate.icons}" alt="icon"
												style="width: 50px; height: 50px; object-fit: cover;">
										</c:if></td>
									<td>${cate.cateName}</td>
									<td><a href="javascript:void(0)"
										class="btn btn-xs btn-info" onclick="showEdit(${cate.cateId})">Sửa</a>
										<a
										href="${pageContext.request.contextPath}/category/delete?id=${cate.cateId}"
										class="btn btn-xs btn-danger"
										onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a></td>
								</tr>

								<!-- Edit row -->
								<tr id="edit-${cate.cateId}" style="display: none;">
									<form action="${pageContext.request.contextPath}/category/edit"
										method="post">
										<input type="hidden" name="cate_id" value="${cate.cateId}" />
										<td>${st.index + 1}</td>
										<td><input type="text" name="icons" value="${cate.icons}"
											class="form-control" /></td>
										<td><input type="text" name="cate_name"
											value="${cate.cateName}" class="form-control" /></td>
										<td>
											<button type="submit" class="btn btn-xs btn-success">Lưu</button>
											<a href="javascript:void(0)" class="btn btn-xs btn-secondary"
											onclick="cancelEdit(${cate.cateId})">Hủy</a>
										</td>
									</form>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>

		</div>
	</div>

	<!-- Script để ẩn/hiện chế độ sửa -->
	<script>
function showEdit(id) {
    document.getElementById("row-" + id).style.display = "none";
    document.getElementById("edit-" + id).style.display = "";
}
function cancelEdit(id) {
    document.getElementById("edit-" + id).style.display = "none";
    document.getElementById("row-" + id).style.display = "";
}
</script>
</body>
</html>
