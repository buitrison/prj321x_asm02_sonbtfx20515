<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head">
<%@ include file="fragments/header.jsp"%>
</head>

<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container-fluid px-md-4	">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">SonBT
				- FX20515</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a
						href="${pageContext.request.contextPath}/" class="nav-link">Trang
							chủ</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/list-job"
						class="nav-link">Công việc</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/list-user"
						class="nav-link">Ứng cử viên</a></li>
					<li class="nav-item cta cta-colored"><a
						href="${pageContext.request.contextPath}/auth/login"
						class="nav-link">Đăng nhập</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END NAV -->

	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a
							href="${pageContext.request.contextPath}/">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span> đăng nhập<span></span>
					</p>
					<h1 class="mb-3 bread">Đăng nhập / Đăng kí</h1>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${msg_success != null}">
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
			<script>
				swal({
					title : '${msg_success}!',
					/* text: 'Redirecting...', */
					icon : 'success',
					timer : 3000,
					buttons : true,
					type : 'success'
				})
			</script>
		</div>
	</c:if>
	<c:if test="${msg_error != null}">
		<div class="toast" data-delay="2500"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
			<script>
				swal({
					title : '${msg_error}',
					/* text: 'Redirecting...', */
					icon : 'error',
					timer : 3000,
					buttons : true,
					type : 'error'
				})
			</script>
		</div>
	</c:if>
	
	<!-- HOME -->
	<section class="section-hero overlay inner-page bg-image"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/hero_1.jpg');"
		id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-white font-weight-bold">Đăng kí / đăng nhập</h1>
					<div class="custom-breadcrumbs">
						<a href="#">Trang chủ</a> <span class="mx-2 slash">/</span> <span
							class="text-white"><strong>Đăng nhập</strong></span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5">
					<h2 class="mb-4">Đăng kí</h2>
					<form:form
						action="${pageContext.request.contextPath}/auth/register"
						modelAttribute="user" method="post" class="p-4 border rounded">

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Email</label>
								<form:input type="email" id="email" path="email"
									class="form-control" placeholder="Email" />
								<br>
								<form:errors path="email" cssClass="alert alert-danger" />
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Họ và tên</label>
								<form:input type="text" id="email" path="fullName"
									class="form-control" placeholder="Họ và tên" />
								<br>
								<form:errors path="fullName" cssClass="alert alert-danger" />
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Mật khẩu</label>
								<form:input type="password" id="" path="password"
									class="form-control" placeholder="Mật khẩu" />
								<br>
								<form:errors path="password" cssClass="alert alert-danger" />
							</div>
						</div>
						<div class="row form-group mb-4">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Nhập lại mật khẩu</label>
								<form:input type="password" id="fname" path="confirmPassword"
									class="form-control" placeholder="Nhập lại mật khẩu" />
								<br>
								<form:errors path="confirmPassword"
									cssClass="alert alert-danger" />
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Vai trò</label>
								<form:select class="form-control" path="role.id"
									aria-label="Default select example" required="true">
									<option disabled>Chọn vai trò</option>
									<form:options items="${roles}" itemValue="id"
										itemLabel="roleName" />
								</form:select>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<input type="submit" value="Đăng kí"
									class="btn px-4 btn-primary text-white">
							</div>
						</div>
					</form:form>
				</div>
				<div class="col-lg-6">
					<h2 class="mb-4">Đăng nhập</h2>
					<form:form
						action="${pageContext.request.contextPath}/authenticateUser"
						method="post" class="p-4 border rounded">
						<div class="form-group">
							<div class="col-xs-15">
								<div>

									<!-- Check for login error -->

									<c:if test="${param.error != null}">

										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											Invalid username and password.</div>

									</c:if>

									<!-- Check for logout -->

									<c:if test="${param.logout != null}">

										<div class="alert alert-success col-xs-offset-1 col-xs-10">
											You have been logged out.</div>

									</c:if>

								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Email</label> <input
									type="email" id="fname" name="username" class="form-control"
									placeholder="Email" required>
							</div>
						</div>
						<div class="row form-group mb-4">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Mật khẩu</label> <input
									type="password" id="fname" name="password" class="form-control"
									placeholder="Mật khẩu" required>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<input type="submit" value="Đăng nhập"
									class="btn px-4 btn-primary text-white">
							</div>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="fragments/footer.jsp"%>
</body>
</html>