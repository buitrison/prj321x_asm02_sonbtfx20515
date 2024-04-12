<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head">
<title>Work CV</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap"
	rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/jquery.timepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/css/bootstrap-reboot.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/css/mixins/_text-hide.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap-grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap-reboot.css">

<!-- JS -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery-migrate-3.0.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.easing.1.3.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.stellar.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/aos.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.animateNumber.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/scrollax.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/google-map.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<!-- BEGIN NAV -->
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

					<c:if test="${user != null}">
						<li class="nav-item"><span class="nav-link">
								${user.fullName} <security:authentication
									property="principal.authorities" />
						</span>
							<ul class="dropdown">
								<li><a
									href="${pageContext.request.contextPath}/user/profile/${user.id}">Hồ
										Sơ</a></li>
								<security:authorize access="hasRole('USER')">
									<li><a
										href="${pageContext.request.contextPath}/save-job/get-list">Công
											việc đã lưu</a></li>
								</security:authorize>
								<security:authorize access="hasRole('HR')">
									<li><a
										href="${pageContext.request.contextPath}/user/list-post">Danh
											sách bài đăng</a></li>
								</security:authorize>
								<security:authorize access="hasRole('USER')">
									<li><a
										href="${pageContext.request.contextPath}/user/get-list-apply">Công
											việc đã ứng tuyển</a></li>
								</security:authorize>
								<security:authorize access="hasRole('USER')">
									<li><a
										href="${pageContext.request.contextPath}/user/get-list-company">Công
											ty đã theo dõi</a></li>
								</security:authorize>
								<li><a
									href="${pageContext.request.contextPath}/auth/logout">Đăng
										xuất</a></li>
							</ul></li>
						<li></li>
						<security:authorize access="hasRole('HR')">
							<li class="nav-item cta mr-md-1"><a
								href="${pageContext.request.contextPath}/recruitment/post"
								class="nav-link">Đăng tuyển</a></li>
						</security:authorize>
					</c:if>
					<c:if test="${user == null}">
						<li class="nav-item cta cta-colored"><a
							href="${pageContext.request.contextPath}/auth/login"
							class="nav-link">Đăng nhập</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END NAV -->

	<!-- Xu li Alert -->
	<c:if test="${msg_success != null}">
		<div class="toast" data-delay="2000"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
			<script>
				swal({
					title : '${msg_success}',
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
		<div class="toast" data-delay="2000"
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
	<!-- END -->

	<div class="hero-wrap img"
		style="background-image: url(user/assets/images/bg_1.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-10 d-flex align-items-center ">
					<div class="text text-center pt-5 mt-md-5">
						<p class="breadcrumbs mb-0">
							<span class="mr-3"><a href="/">Trang chủ <i
									class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span>
						</p>
						<h1 class="mb-3 bread">Danh sách công việc</h1>
						<div class="ftco-search my-md-5">
							<div class="row">
								<div class="col-md-12 nav-link-wrap">
									<div class="nav nav-pills text-center" id="v-pills-tab"
										role="tablist" aria-orientation="vertical">
										<a class="nav-link active mr-md-1" id="v-pills-1-tab"
											data-toggle="pill" href="#v-pills-1" role="tab"
											aria-controls="v-pills-1" aria-selected="true">Tìm công
											việc</a> <a class="nav-link" id="v-pills-2-tab"
											data-toggle="pill" href="#v-pills-2" role="tab"
											aria-controls="v-pills-2" aria-selected="false">Tìm ứng
											cử viên</a> <a class="nav-link" id="v-pills-3-tab"
											data-toggle="pill" href="#v-pills-3" role="tab"
											aria-controls="v-pills-3" aria-selected="false">Tìm theo
											địa điểm</a>

									</div>
								</div>
								<div class="col-md-12 tab-wrap">

									<div class="tab-content p-4" id="v-pills-tabContent">

										<div class="tab-pane fade show active" id="v-pills-1"
											role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
											<form action="/recruitment/search" method="post"
												class="search-job">
												<div class="row no-gutters">

													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" name="keySearch" class="form-control"
																	placeholder="Tìm kiếm công việc">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-primary">Tìm kiếm</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>

										<div class="tab-pane fade" id="v-pills-2" role="tabpanel"
											aria-labelledby="v-pills-performance-tab">
											<form action="/user/search" method="post" class="search-job">
												<div class="row no-gutters">

													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" name="keySearch" class="form-control"
																	placeholder="Tìm kiếm ứng cử viên">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-primary">Tìm kiếm</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
										<div class="tab-pane fade" id="v-pills-3" role="tabpanel"
											aria-labelledby="v-pills-performance-tab">
											<form action="/recruitment/searchaddress" method="post"
												class="search-job">
												<div class="row no-gutters">

													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" name="keySearch" class="form-control"
																	placeholder="Tìm kiếm theo địa điểm">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-primary">Tìm kiếm</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 pr-lg-5">
					<div class="row">
						<th:block th:each="recruitment : ${list.content}">
							<div class="col-md-12 ">
								<div
									class="job-post-item p-4 d-block d-lg-flex align-items-center">
									<div class="one-third mb-4 mb-md-0">
										<div class="job-post-item-header align-items-center">
											<span class="subadge" th:text="${recruitment.type}"></span>
											<h2 class="mr-3 text-black">
												<a th:text="${recruitment.title}"
													th:href="${'/recruitment/detail/'} +${recruitment.id}"></a>
											</h2>
										</div>
										<div class="job-post-item-body d-block d-md-flex">
											<div class="mr-3">
												<span class="icon-layers"></span> <a href="#"
													th:text="${recruitment.Company.nameCompany}"></a>
											</div>
											<div>
												<span class="icon-my_location"></span> <span
													th:text="${recruitment.address}"></span>
											</div>
										</div>
									</div>
									<input type="hidden" th:id="${'idRe'}+${recruitment.id}"
										th:value="${recruitment.id}">
									<div th:if="${session.user}"
										class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
										<div th:if="${session.user.role.id == 1}">
											<a th:onclick="'save(' +${recruitment.id}+ ')'"
												class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
												<span class="icon-heart"></span>
											</a>
										</div>
										<a th:if="${session.user.role.id == 1}" data-toggle="modal"
											th:data-target="${'#exampleModal'}+${recruitment.id}"
											class="btn btn-primary py-2">Apply Job</a>
									</div>
									<div th:unless="${session.user}"
										class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
										<div>
											<a th:onclick="'save(' +${recruitment.id}+ ')'"
												class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
												<span class="icon-heart"></span>
											</a>
										</div>
										<a data-toggle="modal"
											th:data-target="${'#exampleModal'}+${recruitment.id}"
											class="btn btn-primary py-2">Apply Job</a>
									</div>
								</div>
							</div>
							<!-- end -->
							<!-- Modal -->
							<div class="modal fade"
								th:id="${'exampleModal'}+${recruitment.id}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">
												Ứng tuyển: <span th:text="${recruitment.title}"></span>
											</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" action="/user/apply-job">
											<div class="modal-body">
												<div class="row">
													<div class="col-12">
														<select th:id="${'choose'}+${recruitment.id}"
															th:onchange="'choosed(' +${recruitment.id}+ ')'"
															class="form-control" aria-label="Default select example">
															<option selected>Chọn phương thức nộp</option>
															<option value="1">Dùng cv đã cập nhật</option>
															<option value="2">Nộp cv mới</option>
														</select>
													</div>
													<div th:id="${'loai1'}+${recruitment.id}"
														style="display: none" class="col-12">
														<label for="fileUpload" class="col-form-label">Giới
															thiệu:</label>
														<textarea rows="10" cols="3" class="form-control"
															th:id="${'text'}+${recruitment.id}">

                                                    </textarea>
													</div>
													<div th:id="${'loai2'}+${recruitment.id}"
														style="display: none" class="col-12">

														<label for="fileUpload" class="col-form-label">Chọn
															cv:</label> <input type="file" class="form-control"
															th:id="${'fileUpload'}+${recruitment.id}" name="file"
															required> <label for="fileUpload"
															class="col-form-label">Giới thiệu:</label>
														<textarea rows="10" cols="3" class="form-control"
															th:id="${'text'}+${recruitment.id}">

                                                    </textarea>
													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Đóng</button>
													<button type="button"
														th:id="${'button1'}+${recruitment.id}"
														style="display: none"
														th:onclick="'apply1(' +${recruitment.id}+ ')'"
														class="btn btn-primary">Nộp</button>
													<button type="button"
														th:id="${'button2'}+${recruitment.id}"
														style="display: none"
														th:onclick="'apply(' +${recruitment.id}+ ')'"
														class="btn btn-primary">Nộp</button>
												</div>
											</div>
										</form>



									</div>
								</div>
							</div>
						</th:block>

					</div>
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
									<li th:if="${numberPage>0}"><a
										th:href="@{/recruitment/index(page = ${list.number - 1})}">&lt;</a></li>
									<th:block th:each="recruitment,state  : ${recruitmentList}">
										<li
											th:class="${numberPage == state.index  ? 'active' : null }"><a
											th:href="@{/recruitment/index(page = ${state.index})}"
											th:text="${state.index + 1}"></a></li>
									</th:block>
									<li th:if="${numberPage<list.totalPages - 1}"><a
										th:href="@{/recruitment/index(page = ${list.number + 1})}">&gt;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 sidebar">
					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ">
							<h2 class="mb-4">Công ty nổi bật</h2>
						</div>
					</div>
					<th:block th:each="companies : ${companies}">
						<div class="sidebar-box">
							<div class="">
								<a th:href="${'/user/detail-company/'}+${companies[0]}"
									class="company-wrap"><img th:src="${companies[2]}"
									class="img-fluid" alt="Colorlib Free Template"></a>
								<div class="text p-3">
									<h3>
										<a th:href="${'/user/detail-company/'}+${companies[0]}"
											th:text="${companies[1]}"></a>
									</h3>
									<p>
										<span class="number" style="color: black"
											th:text="${companies[3]}"></span> <span>Vị trí ứng
											tuyển</span>
									</p>
								</div>
							</div>
						</div>
					</th:block>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="fragments/script.jsp"%>
	<%@ include file="fragments/footer.jsp"%>


	<!-- loader -->
	<!--<div th:replace="public/fragments :: loading" id="ftco-loader" class="show fullscreen"></div>-->

</body>
</html>