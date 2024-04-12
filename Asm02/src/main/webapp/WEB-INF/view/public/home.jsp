<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html">
<head>
<%@ include file="fragments/header.jsp"%>
</head>
<body>
	<%@ include file="fragments/nav.jsp"%>
	<c:if test="${msg_login_success != null}">
		<div class="toast" data-delay="2000"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
			<script>
        swal({
            title: '${msg_login_success}',
            /* text: 'Redirecting...', */
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
		</div>
	</c:if>
	<div class="hero-wrap img"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-10 d-flex align-items-center ">
					<div class="text text-center pt-5 mt-md-5">
						<p class="mb-4">Tìm việc làm, Cơ hội việc làm và Nghề nghiệp</p>
						<h1 class="mb-5">Cách dễ dàng nhất để có được công việc mới
							của bạn</h1>
						<div class="ftco-counter ftco-no-pt ftco-no-pb">
							<div class="row">
								<div class="col-md-4 d-flex justify-content-center counter-wrap">
									<div class="block-18">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-visitor"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="${userNumber}">${userNumber}</strong>
												<span>Ứng cử viên</span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 d-flex justify-content-center counter-wrap">
									<div class="block-18 text-center">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-visitor"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="${companyNumber}">${companyNumber}</strong>
												<span>Công ty</span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 d-flex justify-content-center counter-wrap">
									<div class="block-18 text-center">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-resume"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="${recruitmentNumber}">${recruitmentNumber}</strong>
												<span>Tuyển dụng</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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
											aria-controls="v-pills-2" aria-selected="false">Tìm theo
											công ty</a> <a class="nav-link" id="v-pills-3-tab"
											data-toggle="pill" href="#v-pills-3" role="tab"
											aria-controls="v-pills-3" aria-selected="false">Tìm theo
											địa điểm</a>

									</div>
								</div>
								<div class="col-md-12 tab-wrap">

									<div class="tab-content p-4" id="v-pills-tabContent">

										<div class="tab-pane fade show active" id="v-pills-1"
											role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
											<form
												action="${pageContext.request.contextPath}/search/search-job"
												method="post" class="search-job">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
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
											<form
												action="${pageContext.request.contextPath}/search/search-company"
												method="post" class="search-job">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
												<div class="row no-gutters">

													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" name="keySearch" class="form-control"
																	placeholder="Tìm theo công ty">
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
											<form
												action="${pageContext.request.contextPath}/search/search-by-address"
												method="post" class="search-job">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
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

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5">

				<div style="display: block"
					class="col-md-7 heading-section text-center">
					<span class="subheading">Danh mục công việc</span>
					<h2 class="mb-0">Top Danh Mục</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach var="category" items="${categories}" begin="0" end="3">
					<div class="col-md-3">
						<ul class="category text-center">
							<li><a style="text-decoration: none !important;"
								href="${pageContext.request.contextPath}/recruitment/category/${category.id}">
									<p>${category.name}</p> <span class="number">${category.numberChoose}</span>
									<span>Vị trí</span> <i class="ion-ios-arrow-forward"></i>
							</a></li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<section class="ftco-section services-section">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-resume"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Tìm kiếm hàng triệu việc làm</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-team"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Dễ dàng quản lý công việc</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-career"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Top Nghề nghiệp</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-employees"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Ứng viên Chuyên gia Tìm kiếm</h3>
							<p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung
								cấp của họ.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 pr-lg-5">
					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ">
							<span class="subheading">CÔNG VIỆC ĐƯỢC NHIỀU NGƯỜI ỨNG
								TUYỂN</span>
							<h2 class="mb-4">Các bài đăng về việc làm nổi bật</h2>

						</div>
					</div>
					<div class="row">
						<c:if test="${bestList.size() > 0}">
							<c:forEach var="best" items="${bestList}">
								<div class="col-md-12 ">
									<div
										class="job-post-item p-4 d-block d-lg-flex align-items-center">
										<div class="one-third mb-4 mb-md-0">
											<div class="job-post-item-header align-items-center">
												<span class="subadge">${best.recruitment.type}</span>
												<h2 class="mr-3 text-black">
													<a
														href="${pageContext.request.contextPath}/recruitment/detail/${best.recruitment.id}">${best.recruitment.title}</a>
												</h2>
											</div>
											<div class="job-post-item-body d-block d-md-flex">
												<div class="mr-3">
													<span class="icon-layers"></span> <a
														href="${pageContext.request.contextPath}/company/${best.recruitment.company.id}">${best.recruitment.company.nameCompany}</a>
												</div>
												<div>
													<span class="icon-my_location"></span> <span>${best.recruitment.address}</span>
												</div>
											</div>
										</div>
										<input type="hidden" id="idRe${best.recruitment.id}"
											value="${best.recruitment.id}">

										<c:if test="${not empty user and user.role.id == 1}">
											<div
												class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
												<div>
													<a onclick="save(${best.recruitment.id})"
														class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
														<span class="icon-heart"></span>
													</a>
												</div>

												<a data-toggle="modal"
													data-target="#exampleModal${best.recruitment.id}"
													class="btn btn-primary py-2">Apply Job</a>
											</div>
										</c:if>
										<c:if test="${empty user}">
											<div
												class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
												<div>
													<a onclick="save(${best.recruitment.id})"
														class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
														<span class="icon-heart"></span>
													</a>
												</div>
												<a data-toggle="modal"
													data-target="#exampleModal${best.recruitment.id}"
													class="btn btn-primary py-2">Apply Job</a>
											</div>
										</c:if>
									</div>
								</div>
								<!-- end -->
								<!-- Modal -->
								<div class="modal fade" id="exampleModal${best.recruitment.id}"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
													Ứng tuyển: <span>${best.recruitment.title}</span>
												</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<form method="post"
												action="${pageContext.request.contextPath}/user/apply-job">
												<div class="modal-body">
													<div class="row">
														<div class="col-12">
															<select id="choose${best.recruitment.id}"
																onchange="choosed(${best.recruitment.id})"
																class="form-control" aria-label="Default select example">
																<option selected>Chọn phương thức nộp</option>
																<option value="1">Dùng cv đã cập nhật</option>
																<option value="2">Nộp cv mới</option>
															</select>
														</div>
														<div id="loai1${best.recruitment.id}"
															style="display: none" class="col-12">
															<label for="fileUpload" class="col-form-label">Giới
																thiệu:</label>
															<textarea rows="10" cols="3" class="form-control"
																id="text${best.recruitment.id}"></textarea>
														</div>

														<div id="loai2${best.recruitment.id}"
															style="display: none" class="col-12">

															<label for="fileUpload" class="col-form-label">Chọn
																cv:</label> <input type="file" class="form-control"
																id="fileUpload${best.recruitment.id}" name="file"
																required> <label for="fileUpload"
																class="col-form-label">Giới thiệu:</label>
															<textarea rows="10" cols="3" class="form-control"
																id="text${best.recruitment.id}"> </textarea>
														</div>

													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Đóng</button>
														<button type="button" id="button1${best.recruitment.id}"
															style="display: none"
															onclick="apply1(${best.recruitment.id})"
															class="btn btn-primary">Nộp</button>
														<button type="button" id="button2${best.recruitment.id}"
															style="display: none"
															onclick="apply(${best.recruitment.id})"
															class="btn btn-primary">Nộp</button>
													</div>
												</div>
											</form>


										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${bestList.size() < 1}">
							<div>
								<p class="alert alert-danger">Danh sách trống!</p>
							</div>
						</c:if>
					</div>
				</div>
				<div class="col-lg-3 sidebar">
					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ">
							<h2 class="mb-4">Công ty nổi bật</h2>
						</div>
					</div>
					<div class="sidebar-box">
						<div class="">
							<a
								href="${pageContext.request.contextPath}/company/${bestCompany.companyId}"
								class="company-wrap"><img
								src="${bestCompany.company.logo != null ? bestCompany.company.logo: 'https://uxwing.com/wp-content/themes/uxwing/download/business-professional-services/company-enterprise-icon.png'}"
								class="img-fluid" alt="Colorlib Free Template"></a>
							<div class="text p-3">
								<h3>
									<a
										href="${pageContext.request.contextPath}/company/${bestCompany.companyId}">${bestCompany.company.nameCompany}</a>
								</h3>
								<p>
									<span class="number" style="color: black">${bestCompany.num != null?bestCompany.num:0}</span>
									<span>Vị trí ứng tuyển</span>
								</p>
							</div>
						</div>
					</div>
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