<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head">
<%@ include file="fragments/header.jsp"%>
</head>
<body>
	<%@ include file="fragments/nav.jsp"%>



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
																	placeholder="Tìm công việc">
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
																	placeholder="Tìm theo địa điểm">
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
			<h4 style="margin-top: -20px">
				Kết quả tìm kiếm cho : <span>${param.keySearch}</span>
			</h4>
			<div class="row">
				<div class="col-lg-12 pr-lg-5">

					<c:if test="${searchList.size() > 0}">
						<c:forEach var="recruitment" items="${searchList}">
							<div class="row">
								<div class="col-md-12 ">
									<div
										class="job-post-item p-4 d-block d-lg-flex align-items-center">
										<div class="one-third mb-4 mb-md-0">
											<div class="job-post-item-header align-items-center">
												<span class="subadge">${recruitment.type}</span>
												<h2 class="mr-3 text-black">
													<a
														href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id}">${recruitment.title}</a>
												</h2>
											</div>
											<div class="job-post-item-body d-block d-md-flex">
												<div class="mr-3">
													<span class="icon-layers"></span> <a
														href="${pageContext.request.contextPath}/company/${recruitment.company.id}">${recruitment.company.nameCompany}</a>
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
					</c:if>
					<c:if test="${searchList.size() == 0}">
						<div style="text-align: center">
							<p class="alert alert-danger">Không có kết quả nào</p>
						</div>
					</c:if>

					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<!-- <ul>
                                <li th:if="${numberPage>0}"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${list.number - 1})}">&lt;</a></li>
                                <th:block th:each="recruitment,state  : ${recruitmentList}">
                                    <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                                </th:block>
                                <li th:if="${numberPage<list.totalPages - 1}"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${list.number + 1})}">&gt;</a></li>
                            </ul> -->
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<%@ include file="fragments/script.jsp"%>
	<%@ include file="fragments/footer.jsp"%>


</body>
</html>