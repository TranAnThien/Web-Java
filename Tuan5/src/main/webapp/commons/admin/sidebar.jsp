<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Core</div>
				<a class="nav-link" href="${pageContext.request.contextPath}/admin?page=dashboard">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> Dashboard
				</a>
				<div class="sb-sidenav-menu-heading">Interface</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayouts" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> Layouts
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayouts"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin?page=layout-static">Static
							Navigation</a> <a class="nav-link" href="${pageContext.request.contextPath}/admin?page=layout-sidenav-light">Light
							Sidenav</a>
					</nav>
				</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapsePages" aria-expanded="false"
					aria-controls="collapsePages">
					<div class="sb-nav-link-icon">
						<i class="fas fa-book-open"></i>
					</div> Pages
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapsePages"
					aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav accordion"
						id="sidenavAccordionPages">
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#pagesCollapseAuth" aria-expanded="false"
							aria-controls="pagesCollapseAuth"> Authentication
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="pagesCollapseAuth"
							aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordionPages">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${pageContext.request.contextPath}/admin?page=login">Login</a> <a
									class="nav-link" href="${pageContext.request.contextPath}/admin?page=register">Register</a> <a
									class="nav-link" href="${pageContext.request.contextPath}/admin?page=password">Forgot Password</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#pagesCollapseError" aria-expanded="false"
							aria-controls="pagesCollapseError"> Error
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="pagesCollapseError"
							aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordionPages">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${pageContext.request.contextPath}/admin?page=401">401 Page</a> <a
									class="nav-link" href="${pageContext.request.contextPath}/admin?page=404">404 Page</a> <a
									class="nav-link" href="${pageContext.request.contextPath}/admin?page=500">500 Page</a>
							</nav>
						</div>
					</nav>
				</div>
				<div class="sb-sidenav-menu-heading">Addons</div>
				<a class="nav-link" href="${pageContext.request.contextPath}/admin?page=charts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-chart-area"></i>
					</div> Charts
				</a> 
				<a class="nav-link" href="${pageContext.request.contextPath}/admin?page=tables">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> Tables
				</a>
				
				<a class="nav-link" href="${pageContext.request.contextPath}/admin/categories">
					<div class="sb-nav-link-icon">
						<i class="fas fa-list"></i>
					</div> Category
				</a>
				<a class="nav-link" href="${pageContext.request.contextPath}/admin/users">
					<div class="sb-nav-link-icon">
						<i class="fas fa-users"></i>
					</div> User
				</a>
				<a class="nav-link" href="${pageContext.request.contextPath}/admin/videos">
					<div class="sb-nav-link-icon">
						<i class="fas fa-video"></i>
					</div> Video
				</a>
			</div>
		</div>
		<div class="sb-sidenav-footer">
			<div class="small">Logged in as:</div>
			Admin
		</div>
	</nav>
</div>