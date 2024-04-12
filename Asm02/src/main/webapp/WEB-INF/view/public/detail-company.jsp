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
	<%@ include file="fragments/nav.jsp"%>



	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a
							href="${pageContext.request.contextPath}/">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span>
					</p>
					<h1 class="mb-3 bread">Chi tiết công ty</h1>
				</div>
			</div>
		</div>
	</div>

	<section style="margin-top: 10px" class="site-section">
		<div class="container">
			<div class="row align-items-center mb-5">
				<div class="col-lg-8 mb-4 mb-lg-0">
					<div class="d-flex align-items-center">
						<div class="border p-2 d-inline-block mr-3 rounded">
							<img width="100" height="100"
								src="${company.logo != null ? company.logo : 'https://uxwing.com/wp-content/themes/uxwing/download/business-professional-services/company-enterprise-icon.png'}"
								alt="Image">
						</div>
						<div>
							<h2>${company.nameCompany}</h2>
							<div>
								<span class="icon-briefcase mr-2"></span><span
									class="ml-0 mr-2 mb-2">${company.email}</span> <span
									class="icon-room mr-2"></span><span class="m-2">${company.address}</span>

							</div>
							<input type="hidden" id="idCompany" value="${company.id}">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="row">
						<c:if test="${user != null}">
							<div class="col-6">
								<security:authorize access="hasRole('USER')">
									<a onclick="follow()" class="btn btn-block btn-light btn-md"><span
										class="icon-heart-o mr-2 text-danger"></span>Theo dõi</a>
								</security:authorize>
							</div>
						</c:if>
						<c:if test="${user == null}">
							<div class="col-6">
								<a onclick="follow()" class="btn btn-block btn-light btn-md"><span
									class="icon-heart-o mr-2 text-danger"></span>Theo dõi</a>
							</div>
						</c:if>
						<div class="col-6"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<div class="mb-5">

						<h3 class="h5 d-flex align-items-center mb-4 text-primary">
							<span class="icon-align-left mr-3"></span>Mô tả công việc
						</h3>
						<p>${company.description}</p>
					</div>

				</div>
				<div class="col-lg-4">
					<div class="bg-light p-3 border rounded mb-4">
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công
							việc</h3>
						<ul class="list-unstyled pl-3 mb-0">

							<li class="mb-2"><strong class="text-black">Email
									công ty: </strong> <span>${company.email}</span></li>
							<li class="mb-2"><strong class="text-black">Số điện
									thoại: </strong> <span>${company.phoneNumber}</span></li>
							<li class="mb-2"><strong class="text-black">Đại
									chỉ: </strong> <span>${company.address}</span></li>
						</ul>
					</div>

					<div class="bg-light p-3 border rounded">
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
						<div class="px-3">
							<a href="#" class="pt-3 pb-3 pr-3 pl-0"><span
								class="icon-facebook"></span></a> <a href="#"
								class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
							<a href="#" class="pt-3 pb-3 pr-3 pl-0"><span
								class="icon-linkedin"></span></a> <a href="#"
								class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
						</div>
					</div>

				</div>
			</div>
		</div>
		<script>
			function follow() {
				var name = "#idCompany";
				var idCompany = $(name).val();
				var formData = new FormData();
				formData.append('idCompany', idCompany);
				$
						.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/user/follow-company/',
							contentType : false,
							processData : false,
							data : formData,
							beforeSend : function(xhr) {
								xhr.setRequestHeader('${_csrf.headerName}',
										'${_csrf.token}');
							},
							success : function(data) {
								if (data == "false") {
									swal({
										title : 'Bạn cần phải đăng nhập!',
										/* text: 'Redirecting...', */
										icon : 'error',
										timer : 3000,
										buttons : true,
										type : 'error'
									})
								} else if (data == "exist") {
									swal({
										title : 'Bỏ theo dõi thành công!',
										/* text: 'Redirecting...', */
										icon : 'success',
										timer : 3000,
										buttons : true,
										type : 'success'
									})
								} else if (data == "true") {
									swal({
										title : 'Theo dõi thành công!',
										/* text: 'Redirecting...', */
										icon : 'success',
										timer : 3000,
										buttons : true,
										type : 'success'
									})
								} else {
									swal({
										title : 'Lỗi!',
										/* text: 'Redirecting...', */
										icon : 'error',
										timer : 3000,
										buttons : true,
										type : 'error'
									})
								}
							},
							error : function(err) {
								alert(err);
							}
						})
			}
		</script>
	</section>

	<%@ include file="fragments/footer.jsp"%>
</body>
</html>