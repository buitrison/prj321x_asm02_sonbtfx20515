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
						<span class="mr-3"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Job Post</span>
					</p>
					<h1 class="mb-3 bread">Browse Job</h1>
				</div>
			</div>
		</div>
	</div>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 heading-section text-center ">
					<span class="subheading">Job Categories</span>
					<h2 class="mb-0">Top Categories</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach var="cat" items="${categories}" varStatus="loop">
					<div class="col-md-3 ">
						<ul class="category text-center">
							<li><a href="recruitment/category/${cat.id}">${cat.name}
									<br> <span class="number">${cat.numberChoose} </span> <span>Open
										position</span><i class="ion-ios-arrow-forward"></i>
							</a></li>

						</ul>
					</div>
					<c:if test="${loop.index % 4 == 3 and not loop.last}">
			</div>
			<div class="row">
				</c:if>
				</c:forEach>


			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pb bg-light">
		<div class="container">
			<div class="row justify-content-center mb-4">
				<div class="col-md-7 text-center heading-section ">
					<span class="subheading">Browse Jobs</span>
					<h2 class="mb-4">Advance Search</h2>
				</div>
			</div>
			<div class="row">
				<div class="ftco-search">
					<div class="row">
						<div class="col-md-12 nav-link-wrap">
							<div class="nav nav-pills text-center" id="v-pills-tab"
								role="tablist" aria-orientation="vertical">
								<a class="nav-link active mr-md-1" id="v-pills-1-tab"
									data-toggle="pill" href="#v-pills-1" role="tab"
									aria-controls="v-pills-1" aria-selected="true">Find a Job</a> <a
									class="nav-link" id="v-pills-2-tab" data-toggle="pill"
									href="#v-pills-2" role="tab" aria-controls="v-pills-2"
									aria-selected="false">Find a Candidate</a>

							</div>
						</div>
						<div class="col-md-12 tab-wrap">

							<div class="tab-content p-4" id="v-pills-tabContent">

								<div class="tab-pane fade show active" id="v-pills-1"
									role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
									<form
										action="${pageContext.request.contextPath}/search/advance-search-job"
										class="search-job">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<div class="row no-gutters">
											<div class="col-md mr-md-2">
												<div class="form-group">
													<div class="form-field">
														<div class="icon">
															<span class="icon-briefcase"></span>
														</div>
														<c:if test="${param.keySearch == null}">
															<input type="text" name="keySearch" class="form-control"
																placeholder="eg. Garphic. Web Developer">
														</c:if>
														<c:if test="${param.keySearch != null}">
															<input type="text" name="keySearch" class="form-control"
																placeholder="eg. Garphic. Web Developer"
																value="${param.keySearch}">
														</c:if>
													</div>
												</div>
											</div>
											<div class="col-md mr-md-2">
												<div class="form-group">
													<div class="form-field">
														<div class="select-wrap">
															<div class="icon">
																<span class="ion-ios-arrow-down"></span>
															</div>
															<select name="type" id="" class="form-control">
																<c:if test="${param.type == null}">
																	<option value="" disabled selected>Category</option>
																</c:if>
																<c:if test="${param.type != null}">
																	<option value="${param.type}" selected>${param.type}</option>
																</c:if>
																<option value="Full Time">Full Time</option>
																<option value="Part Time">Part Time</option>
																<option value="Freelance">Freelance</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md mr-md-2">
												<div class="form-group">
													<div class="form-field">
														<div class="icon">
															<span class="icon-map-marker"></span>
														</div>
														<c:if test="${param.location == null}">
															<input type="text" name="location" class="form-control"
																placeholder="Location">
														</c:if>
														<c:if test="${param.location != null}">
															<input type="text" name="location" class="form-control"
																placeholder="Location" value="${param.location}">
														</c:if>
													</div>
												</div>
											</div>
											<div class="col-md">
												<div class="form-group">
													<div class="form-field">
														<button type="submit" class="form-control btn btn-primary">Search</button>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>

								<div class="tab-pane fade" id="v-pills-2" role="tabpanel"
									aria-labelledby="v-pills-performance-tab">
									<p class="alert alert-warning text-center">Coming soon!</p>
									<!-- <form action="#" class="search-job">
										<div class="row">
											<div class="col-md">
												<div class="form-group">
													<div class="form-field">
														<div class="icon">
															<span class="icon-user"></span>
														</div>
														<input type="text" class="form-control"
															placeholder="eg. Adam Scott">
													</div>
												</div>
											</div>
											<div class="col-md">
												<div class="form-group">
													<div class="form-field">
														<div class="select-wrap">
															<div class="icon">
																<span class="ion-ios-arrow-down"></span>
															</div>
															<select name="" id="" class="form-control">
																<option value="">Category</option>
																<option value="">Full Time</option>
																<option value="">Part Time</option>
																<option value="">Freelance</option>
																<option value="">Internship</option>
																<option value="">Temporary</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md">
												<div class="form-group">
													<div class="form-field">
														<div class="icon">
															<span class="icon-map-marker"></span>
														</div>
														<input type="text" class="form-control"
															placeholder="Location">
													</div>
												</div>
											</div>
											<div class="col-md">
												<div class="form-group">
													<div class="form-field border">
														<button type="submit" class="form-control btn btn-primary">Search</button>
													</div>
												</div>
											</div>
										</div>
									</form> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<c:if test="${searchList != null}">
				<h4 style="margin-top: -20px">
					Kết quả tìm kiếm: <span>${param.keySearch}</span>, <span>${param.type}</span>,
					<span>${param.location}</span>
				</h4>
			</c:if>
			<div class="row">
				<!-- -->
				<div class="col-lg-9 pr-lg-4">
					<c:if test="${searchList.size() > 0 or listRe.size() > 0}">
						<div class="row">
							<c:forEach var="re"
								items="${searchList != null? searchList:listRe}">
								<div class="col-md-12 ftco-animated">
									<div
										class="job-post-item p-4 d-block d-lg-flex align-items-center">
										<div class="one-third mb-4 mb-md-0">
											<div class="job-post-item-header align-items-center">
												<span class="subadge">${re.type}</span>
												<h2 class="mr-3 text-black">
													<a
														href="${pageContext.request.contextPath}/recruitment/detail/${re.id}">${re.title}</a>
												</h2>
											</div>
											<div class="job-post-item-body d-block d-md-flex">
												<div class="mr-3">
													<span class="icon-layers"></span> <a
														href="${pageContext.request.contextPath}/company/${re.company.id}">${re.company.nameCompany}</a>
												</div>
												<div>
													<span class="icon-my_location"></span> <span>${re.address}</span>
												</div>
											</div>
										</div>
										<input type="hidden" id="idRe${re.id}" value="${re.id}">
										<security:authorize access="!hasRole('HR')">
											<div
												class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
												<div>
													<a onclick="save(${re.id})"
														class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
														<span class="icon-heart"></span>
													</a>
												</div>
												<a data-toggle="modal" data-target="#exampleModal${re.id}"
													class="btn btn-primary py-2">Apply Job</a>
											</div>
										</security:authorize>
									</div>
								</div>
								<!-- end -->
								<!-- Modal -->
								<div class="modal fade" id="exampleModal${re.id}" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
													Ứng tuyển: <span>${re.title}</span>
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
															<select id="choose${re.id}" onchange="choosed(${re.id})"
																class="form-control" aria-label="Default select example">
																<option selected>Chọn phương thức nộp</option>
																<option value="1">Dùng cv đã cập nhật</option>
																<option value="2">Nộp cv mới</option>
															</select>
														</div>
														<div id="loai1${re.id}" style="display: none"
															class="col-12">
															<label for="fileUpload" class="col-form-label">Giới
																thiệu:</label>
															<textarea rows="10" cols="3" class="form-control"
																id="text${re.id}"></textarea>
														</div>

														<div id="loai2${re.id}" style="display: none"
															class="col-12">

															<label for="fileUpload" class="col-form-label">Chọn
																cv:</label> <input type="file" class="form-control"
																id="fileUpload${re.id}" name="file" required> <label
																for="fileUpload" class="col-form-label">Giới
																thiệu:</label>
															<textarea rows="10" cols="3" class="form-control"
																id="text${re.id}"> </textarea>
														</div>

													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Đóng</button>
														<button type="button" id="button1${re.id}"
															style="display: none" onclick="apply1(${re.id})"
															class="btn btn-primary">Nộp</button>
														<button type="button" id="button2${re.id}"
															style="display: none" onclick="apply(${re.id})"
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
					</c:if>

					<c:if test="${searchList.size() == 0}">
						<div class="row mt-5">
							<div class="col text-center">
								<div class="alert alert-danger">
									<p>Không tìm thấy kết quả mà bạn muốn tìm!</p>
								</div>
							</div>
						</div>
					</c:if>

					<c:if test="${listRe.size() == 0}">
						<div class="row mt-5">
							<div class="col text-center">
								<div class="alert alert-danger">
									<p>Danh sách trống!</p>
								</div>
							</div>
						</div>
					</c:if>

					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
									<li><a href="#">&lt;</a></li>
									<li class="active"><span>1</span></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&gt;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>


				<div class="col-lg-3 sidebar">
					<div class="sidebar-box bg-white p-4 ftco-animated">
						<h3 class="heading-sidebar">Browse Category</h3>
						<p class="alert alert-warning text-center">Coming soon!</p>
						<!-- <form action="#" class="search-form mb-3">
							<div class="form-group">
								<span class="icon icon-search"></span> <input type="text"
									class="form-control" placeholder="Search...">
							</div>
						</form> -->

						<!-- <form action="#" class="browse-form">
							<label for="option-job-1"><input type="checkbox"
								id="option-job-1" name="vehicle" value="" checked>
								Website &amp; Software</label><br> <label for="option-job-2"><input
								type="checkbox" id="option-job-2" name="vehicle" value="">
								Education &amp; Training</label><br> <label for="option-job-3"><input
								type="checkbox" id="option-job-3" name="vehicle" value="">
								Graphics Design</label><br> <label for="option-job-4"><input
								type="checkbox" id="option-job-4" name="vehicle" value="">
								Accounting &amp; Finance</label><br> <label for="option-job-5"><input
								type="checkbox" id="option-job-5" name="vehicle" value="">
								Restaurant &amp; Food</label><br> <label for="option-job-6"><input
								type="checkbox" id="option-job-6" name="vehicle" value="">
								Health &amp; Hospital</label><br>
						</form> -->
					</div>

					<div class="sidebar-box bg-white p-4 ftco-animated">
						<h3 class="heading-sidebar">Select Location</h3>
						<p class="alert alert-warning text-center">Coming soon!</p>
						<%-- <form action="#" class="search-form mb-3">
							<div class="form-group">
								<span class="icon icon-search"></span> <input type="text"
									class="form-control" placeholder="Search...">
							</div>
						</form>
						<form action="#" class="browse-form">
							<label for="option-location-1"><input type="checkbox"
								id="option-location-1" name="vehicle" value="" checked>
								Sydney, Australia</label><br> <label for="option-location-2"><input
								type="checkbox" id="option-location-2" name="vehicle" value="">
								New York, United States</label><br> <label for="option-location-3"><input
								type="checkbox" id="option-location-3" name="vehicle" value="">
								Tokyo, Japan</label><br> <label for="option-location-4"><input
								type="checkbox" id="option-location-4" name="vehicle" value="">
								Manila, Philippines</label><br> <label for="option-location-5"><input
								type="checkbox" id="option-location-5" name="vehicle" value="">
								Seoul, South Korea</label><br> <label for="option-location-6"><input
								type="checkbox" id="option-location-6" name="vehicle" value="">
								Western City, UK</label><br>
						</form> --%>
					</div>

					<div class="sidebar-box bg-white p-4 ftco-animated">
						<h3 class="heading-sidebar">Job Type</h3>
						<p class="alert alert-warning text-center">Coming soon!</p>
						<%-- <form action="#" class="browse-form">
							<label for="option-job-type-1"><input type="checkbox"
								id="option-job-type-1" name="vehicle" value="" checked>
								Partime</label><br> <label for="option-job-type-2"><input
								type="checkbox" id="option-job-type-2" name="vehicle" value="">
								Fulltime</label><br> <label for="option-job-type-3"><input
								type="checkbox" id="option-job-type-3" name="vehicle" value="">
								Intership</label><br> <label for="option-job-type-4"><input
								type="checkbox" id="option-job-type-4" name="vehicle" value="">
								Temporary</label><br> <label for="option-job-type-5"><input
								type="checkbox" id="option-job-type-5" name="vehicle" value="">
								Freelance</label><br> <label for="option-job-type-6"><input
								type="checkbox" id="option-job-type-6" name="vehicle" value="">
								Fixed</label><br>
						</form> --%>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section-parallax">
		<div class="parallax-img d-flex align-items-center">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div
						class="col-md-7 text-center heading-section heading-section-white ftco-animated">
						<h2>Subcribe to our Newsletter</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.
							Separated they live in</p>
						<div class="row d-flex justify-content-center mt-4 mb-4">
							<div class="col-md-12">
								<form action="#" class="subscribe-form">
									<div class="form-group d-flex">
										<input type="text" class="form-control"
											placeholder="Enter email address"> <input
											type="submit" value="Subscribe" class="submit px-3">
									</div>
								</form>
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