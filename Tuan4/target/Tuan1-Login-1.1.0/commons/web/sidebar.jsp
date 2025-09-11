<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Core</div>
				<a class="nav-link" href="#">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> Dashboard
				</a>
				<div class="sb-sidenav-menu-heading">Home</div>
				<a class="nav-link" href="${pageContext.request.contextPath}/login">
					<div class="sb-nav-link-icon">
						<i class="fas fa-chart-area"></i>
					</div> Login
				</a> <a class="nav-link" href="${pageContext.request.contextPath}/register">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> Register
				</a>
			</div>
		</div>
	</nav>
</div>