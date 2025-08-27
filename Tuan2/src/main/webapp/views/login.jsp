<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container" style="max-width: 400px; margin-top: 50px;">
    <h2 class="text-center">Đăng nhập tài khoản</h2>

    <!-- Thông báo lỗi -->
    <c:if test="${alert != null}">
        <div class="alert alert-danger text-center">${alert}</div>
    </c:if>

    <form action="login" method="post">
        <!-- Username -->
        <div class="form-group">
            <label for="username">Tài khoản</label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" id="username" name="username" class="form-control" placeholder="Nhập tài khoản" required />
            </div>
        </div>

        <!-- Password -->
        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required />
            </div>
        </div>

        <!-- Submit -->
        <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>

        <!-- Link -->
        <p class="text-center" style="margin-top: 15px;">
            Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a>
        </p>
    </form>
</div>
</body>
</html>
