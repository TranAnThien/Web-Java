<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5; /* nền xám nhạt */
        }
        .forgot-box {
            max-width: 400px;
            margin: 60px auto;
            padding: 25px;
            background: #fff; /* nền trắng */
            border-radius: 10px; /* bo góc */
            box-shadow: 0px 2px 10px rgba(0,0,0,0.1); /* bóng đổ nhẹ */
        }
        .forgot-box h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="forgot-box">
        <h2 class="text-center">Quên mật khẩu</h2>

        <c:if test="${not empty message}">
            <div class="alert alert-info text-center">${message}</div>
        </c:if>

        <c:if test="${step eq 'checkEmail'}">
            <form action="forgot" method="post">
                <input type="hidden" name="action" value="checkEmail"/>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" placeholder="Nhập email của bạn" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Kiểm tra</button>
            </form>
        </c:if>

        <c:if test="${step eq 'resetPassword'}">
            <form action="forgot" method="post">
                <input type="hidden" name="action" value="resetPassword"/>
                <input type="hidden" name="email" value="${email}"/>
                <div class="form-group">
                    <label>Mật khẩu mới</label>
                    <input type="password" name="newPassword" class="form-control" placeholder="Nhập mật khẩu mới" required>
                </div>
                <div class="form-group">
                    <label>Xác nhận mật khẩu mới</label>
                    <input type="password" name="confirmPassword" class="form-control" placeholder="Nhập lại mật khẩu mới" required>
                </div>
                <button type="submit" class="btn btn-success btn-block">Đặt lại mật khẩu</button>
            </form>
        </c:if>
    </div>
</div>
</body>
</html>
