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

	<security:authorize access="hasRole('USER')">
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
									class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span>
						</p>
						<h1 class="mb-3 bread">
							Danh sách công việc của công ty : <span>${company.nameCompany}</span>
						</h1>
					</div>
				</div>
			</div>
		</div>
	</security:authorize>
	<security:authorize access="hasRole('HR')">
		<div class="hero-wrap hero-wrap-2"
			style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-end justify-content-start">
					<div class="col-md-12 text-center mb-5">

						<h1 class="mb-3 bread">Không tìm thấy trang yêu cầu</h1>
					</div>
				</div>
			</div>
		</div>
	</security:authorize>

	<security:authorize access="hasRole('USER')">
		<section class="ftco-section bg-light">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 pr-lg-5">
						<div class="row">
							<c:forEach var="recruitment" items="${reList}">
								<div class="col-md-12 ">
									<div
										class="job-post-item p-4 d-block d-lg-flex align-items-center">
										<div class="one-third mb-4 mb-md-0">
											<div class="job-post-item-header align-items-center">
												<span class="subadge">${recruitment.type}</span>
												<h2 class="mr-3 text-black">
													<a href="/recruitment/detail/${recruitment.id}">${recruitment.title}</a>
												</h2>
											</div>
											<div class="job-post-item-body d-block d-md-flex">
												<div class="mr-3">
													<span class="icon-layers"></span> <a href="#">${recruitment.company.nameCompany}</a>
												</div>
												<div>
													<span class="icon-my_location"></span> <span>${recruitment.address}</span>
												</div>
											</div>
										</div>
										<input type="hidden" id="idRe${recruitment.id}"
											value="${recruitment.id}">
										<security:authorize access="!hasRole('HR')">
											<div
												class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
												<div>
													<a onclick="save(${recruitment.id})"
														class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
														<span class="icon-heart"></span>
													</a>
												</div>
												<a data-toggle="modal"
													data-target="#exampleModal${recruitment.id}"
													class="btn btn-primary py-2">Apply Job</a>
											</div>
										</security:authorize>
									</div>
								</div>
								<!-- end -->
								<!-- Modal -->
								<div class="modal fade" id="exampleModal${recruitment.id}"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
													Ứng tuyển: <span>${recruitment.title}</span>
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
															<select id="choose${recruitment.id}"
																onchange="choosed(${recruitment.id})"
																class="form-control" aria-label="Default select example">
																<option selected>Chọn phương thức nộp</option>
																<option value="1">Dùng cv đã cập nhật</option>
																<option value="2">Nộp cv mới</option>
															</select>
														</div>
														<div id="loai1${recruitment.id}" style="display: none"
															class="col-12">
															<label for="fileUpload" class="col-form-label">Giới
																thiệu:</label>
															<textarea rows="10" cols="3" class="form-control"
																id="text${recruitment.id}"></textarea>
														</div>

														<div id="loai2${recruitment.id}" style="display: none"
															class="col-12">

															<label for="fileUpload" class="col-form-label">Chọn
																cv:</label> <input type="file" class="form-control"
																id="fileUpload${recruitment.id}" name="file" required>
															<label for="fileUpload" class="col-form-label">Giới
																thiệu:</label>
															<textarea rows="10" cols="3" class="form-control"
																id="text${recruitment.id}"> </textarea>
														</div>

													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Đóng</button>
														<button type="button" id="button1${recruitment.id}"
															style="display: none" onclick="apply1(${recruitment.id})"
															class="btn btn-primary">Nộp</button>
														<button type="button" id="button2${recruitment.id}"
															style="display: none" onclick="apply(${recruitment.id})"
															class="btn btn-primary">Nộp</button>
													</div>
												</div>
											</form>


										</div>
									</div>
								</div>
								<!--  End Modal -->
							</c:forEach>

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

				</div>
			</div>
		</section>
	</security:authorize>
	<%@ include file="fragments/script.jsp"%>
	<%@ include file="fragments/footer.jsp"%>


	<!-- loader -->
	<!--<div th:replace="public/fragments :: loading" id="ftco-loader" class="show fullscreen"></div>-->

</body>
</html>