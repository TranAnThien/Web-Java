<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5; /* nền xám nhạt */
        }
        .register-box {
            max-width: 500px;
            margin: 60px auto;
            padding: 25px;
            background: #fff; /* nền trắng */
            border-radius: 10px; /* bo góc */
            box-shadow: 0px 2px 10px rgba(0,0,0,0.1); /* bóng đổ nhẹ */
        }
        .register-box h2 {
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="register-box">
        <h2>Đăng ký tài khoản</h2>

        <c:if test="${alert != null}">
            <div class="alert alert-danger text-center">${alert}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="post">

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" class="form-control" placeholder="Nhập email" required>
            </div>

            <div class="form-group">
                <label>Tài khoản</label>
                <input type="text" name="username" class="form-control" placeholder="Nhập tài khoản" required>
            </div>

            <div class="form-group">
                <label>Họ tên</label>
                <input type="text" name="fullname" class="form-control" placeholder="Nhập họ tên" required>
            </div>

            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required>
            </div>

            <div class="form-group">
                <label>Số điện thoại</label>
                <input type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại" required>
            </div>

            <button type="submit" class="btn btn-success btn-block">Đăng ký</button>
        </form>

        <p class="text-center" style="margin-top: 15px;">
            Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập ngay</a>
        </p>
    </div>
</div>
</body>
</html>
