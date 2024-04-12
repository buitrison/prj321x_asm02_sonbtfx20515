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
					<h1 class="mb-3 bread">Chi tiết công việc</h1>
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
								src="${recruitment.company.logo != null ? recruitment.company.logo : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}"
								alt="Image">
						</div>
						<div>
							<h2>${recruitment.title}</h2>
							<div>
								<span class="icon-briefcase mr-2"></span><a
									href="${pageContext.request.contextPath}/company/${recruitment.company.id}"
									class="ml-0 mr-2 mb-2">${recruitment.company.nameCompany} </a>
								<span class="icon-room mr-2"></span><span class="m-2">${recruitment.address}</span>
								<span class="icon-clock-o mr-2"></span><span class="m-2">${recruitment.type}</span>
							</div>
							<input type="hidden" id="idRe${recruitment.id}"
								value="${recruitment.id}">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<security:authorize access="!hasRole('HR')">
						<div class="row">
							<div class="col-6">
								<a onclick="save(${recruitment.id})"
									class="btn btn-block btn-light btn-md"><span
									class="icon-heart-o mr-2 text-danger"></span>Lưu</a>
							</div>
							<div class="col-6">
								<a data-toggle="modal" class="btn btn-block btn-primary btn-md"
									data-target="#applyModal">Ứng tuyển</a>
							</div>
						</div>
					</security:authorize>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<div class="mb-5">
						<h3 class="h5 d-flex align-items-center mb-4 text-primary">
							<span class="icon-align-left mr-3"></span>Mô tả công việc
						</h3>
						<p>${recruitment.description}</p>
					</div>

				</div>
				<div class="col-lg-4">
					<div class="bg-light p-3 border rounded mb-4">
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công
							việc</h3>
						<ul class="list-unstyled pl-3 mb-0">
							<li class="mb-2"><strong class="text-black">Ngày
									tạo: </strong> <span>${recruitment.createdAt}</span></li>
							<li class="mb-2"><strong class="text-black">Kiểu
									công việc: </strong> <span>${recruitment.category.name}</span></li>
							<li class="mb-2"><strong class="text-black">Loại
									công việc: </strong> <span>${recruitment.type}</span></li>
							<li class="mb-2"><strong class="text-black">Kinh
									nghiệm: </strong> <span>${recruitment.experience} </span></li>
							<li class="mb-2"><strong class="text-black">Điạ
									chỉ: </strong> <span> ${recruitment.address}</span></li>
							<li class="mb-2"><strong class="text-black">Lương:
							</strong> <span> ${recruitment.salary}</span></li>
							<li class="mb-2"><strong class="text-black">Số
									lượng: </strong><span>${recruitment.quantity}</span></li>
							<li class="mb-2"><strong class="text-black">Hạn nộp
									cv: </strong><span>${recruitment.deadline}</span></li>
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
	</section>

	<!-- Apply Modal -->
	<div class="modal fade" id="applyModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						Ứng tuyển: <span> ${recruitment.title} </span>
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
								<label for="fileUpload" class="col-form-label">Chọn cv:</label>
								<input type="file" class="form-control"
									id="fileUpload${recruitment.id}" name="file" required>
								<label for="fileUpload" class="col-form-label">Giới
									thiệu:</label>
								<textarea rows="10" cols="3" class="form-control"></textarea>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Đóng</button>
							<button type="button" onclick="apply(${recruitment.id})"
								class="btn btn-primary">Nộp</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>

	<!--  end -->


	<section class="site-section" id="next">
		<div class="container">
			<div class="row mb-5 justify-content-center">
				<div class="col-md-7 text-center">
					<security:authorize access="hasRole('HR')">
						<c:if test="${unlock != null}">
							<h2 class="section-title mb-2">Danh sách ứng viên ứng tuyển</h2>
						</c:if>
					</security:authorize>
					<security:authorize access="!hasRole('HR')">
						<h2 class="section-title mb-2">Những công việc liên quan</h2>
					</security:authorize>
				</div>
			</div>
			<security:authorize access="hasRole('HR')">
				<c:if test="${unlock != null}">
					<div class="row">
						<div class="col-lg-12 pr-lg-4">
							<div class="row">
								<c:if test="${applyList.size() > 0}">
									<c:forEach var="applyPost" items="${applyList}">
										<div class="col-md-12"
											style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto;">
											<div class="team d-md-flex p-4 bg-white">
												<IMG class="img"
													src="${applyPost.user.image != null ? applyPost.user.image : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}"></IMG>
												<div class="text pl-md-4">
													<H5 class="location mb-0">${applyPost.user.address}</H5>
													<p style="display: block; color: black">${applyPost.user.fullName}</p>
													<span class="position" style="display: block; color: black">${applyPost.user.email}</span>
													<p class="mb-4" style="width: 700px">${applyPost.user.description}</p>
													<div class="row">
														<c:if test="${applyPost.nameCv != null}">
															<p>
																<a class="btn btn-primary"
																	href="${pageContext.request.contextPath}/resources/uploads/${applyPost.nameCv}">Xem
																	cv</a>
															</p>
														</c:if>
														<c:if test="${applyPost.status == 0}">
															<!-- <p style="margin-left: 10px"><a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/user/approve/${applyPost.id}/${recruitment.id}" >Duyệt</a></p> -->
															<form method="post"
																action="${pageContext.request.contextPath}/user/approve/${applyPost.id}/${recruitment.id}"
																style="margin-left: 10px">
																<input type="hidden" name="${_csrf.parameterName}"
																	value="${_csrf.token}" />
																<button type="submit" class="btn btn-outline-primary">Duyệt</button>
															</form>
														</c:if>
														<c:if test="${applyPost.status == 1}">
															<p style="margin-left: 10px; margin-top: 15px">
																<span style="color: #1e7e34; font-weight: bold">Đã
																	duyệt</span>
															</p>
														</c:if>
													</div>

												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>

								<c:if test="${applyList.size() == 0}">
									<div class="col-lg-12 pr-lg-5">
										<div style="text-align: center">
											<p class="alert alert-danger">Chưa có ứng cử viên nào ứng
												tuyển!</p>
										</div>
									</div>
								</c:if>


							</div>
						</div>
					</div>
				</c:if>
			</security:authorize>

			<security:authorize access="!hasRole('HR')">
				<c:forEach var="rec" items="${sameList}">
					<div class="row">
						<div class="col-md-12">
							<div
								class="job-post-item p-4 d-block d-lg-flex align-items-center">
								<div class="one-third mb-4 mb-md-0">
									<div class="job-post-item-header align-items-center">
										<span class="subadge">${rec.type}</span>
										<h2 class="mr-3 text-black">
											<a
												href="${pageContext.request.contextPath}/recruitment/detail/${rec.id}">${rec.title}</a>
										</h2>
									</div>
									<div class="job-post-item-body d-block d-md-flex">
										<div class="mr-3">
											<span class="icon-layers"></span> <a
												href="${pageContext.request.contextPath}/company/${rec.company.id}">${rec.company.nameCompany}</a>
										</div>
										<div>
											<span class="icon-my_location"></span> <span>${rec.address}</span>
										</div>
									</div>
								</div>

								<input type="hidden" id="idRe${rec.id}" value="${rec.id}">
								<div
									class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">

									<div>
										<a onclick="save(${rec.id})"
											class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
											<span class="icon-heart"></span>
										</a>
									</div>
									<a data-toggle="modal" data-target="#applyModal"
										class="btn btn-primary py-2">Apply Job</a>
								</div>
							</div>
						</div>
						<!-- end -->
					</div>
				</c:forEach>
			</security:authorize>
		</div>
	</section>
	<%@ include file="fragments/script.jsp"%>



	<%@ include file="fragments/footer.jsp"%>
</body>
</html>