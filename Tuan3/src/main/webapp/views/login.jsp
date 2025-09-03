<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    body {
        background-color: #f5f5f5;
    }
    .login-box {
        max-width: 400px;
        margin: 60px auto;
        padding: 25px;
        background: #fff; 
        border-radius: 10px;
        box-shadow: 0px 2px 10px rgba(0,0,0,0.1);
    }
</style>
</head>
<body>
	<div class="container">
		<div class="login-box">
			<h2 class="text-center">Đăng nhập tài khoản</h2>

			<c:if test="${alert != null}">
				<div class="alert alert-danger text-center">${alert}</div>
			</c:if>

			<form action="login" method="post">
				<div class="form-group">
					<label for="username">Tài khoản</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
						<input type="text" id="username" name="username" class="form-control"
							placeholder="Nhập tài khoản" required />
					</div>
				</div>

				<div class="form-group">
					<label for="password">Mật khẩu</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<input type="password" id="password" name="password" class="form-control"
							placeholder="Nhập mật khẩu" required />
					</div>
					<div class="text-right" style="margin-top: 5px;">
						<a href="${pageContext.request.contextPath}/forgot">Quên mật khẩu?</a>
					</div>
				</div>

				<button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>

				<p class="text-center" style="margin-top: 15px;">
					Chưa có tài khoản? 
					<a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>
