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

	<security:authorize access="hasRole('HR')">
		<div class="hero-wrap hero-wrap-2"
			style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-end justify-content-start">
					<div class="col-md-12 text-center mb-5">
						<p class="breadcrumbs mb-0">
							<span class="mr-3"><a href="index.html">Trang chủ <i
									class="ion-ios-arrow-forward"></i></a></span>Danh sách <span></span>
						</p>
						<h1 class="mb-3 bread">Danh sách bài đăng</h1>
					</div>
				</div>
			</div>
		</div>
	</security:authorize>

	<security:authorize access="!hasRole('HR')">
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
	<security:authorize access="hasRole('HR')">
		<section class="ftco-section bg-light">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 pr-lg-4">
						<div class="row">
							<div class="row form-group">
								<div class="col-md-12">
									<a href="${pageContext.request.contextPath}/recruitment/post"
										class="btn px-4 btn-primary text-white">Đăng tuyển</a>
								</div>
							</div>

							<c:if test="${list.size() == 0}">
								<div class="col-md-12 text-center mb-5">
									<h4 class="alert alert-danger mb-3 bread">Danh sách trống!</h4>
								</div>
							</c:if>
							<c:if test="${list.size() != 0}">
								<c:forEach var="recruitment" items="${list}">
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
														<span class="icon-layers"></span> <a href="#">${recruitment.company.nameCompany}</a>
													</div>
													<div>
														<span class="icon-my_location"></span> <span>${recruitment.address}</span>
													</div>
												</div>
											</div>

											<div
												class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"
												style="width: 330px !important;">
												<!--                                    <div>-->
												<!--                                        <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">-->
												<!--                                            <span class="icon-heart"></span>-->
												<!--                                        </a>-->
												<!--                                    </div>-->
												<a
													href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id}"
													class="btn btn-primary py-2 ml-2">Xem chi tiết</a> <a
													href="${pageContext.request.contextPath}/recruitment/edit-post/${recruitment.id}"
													class="btn btn-warning py-2 ml-2">Cập nhật</a> <a
													class="btn btn-danger py-2 ml-2" href=""
													data-toggle="modal"
													data-target="#exampleModal${recruitment.id}">Xóa</a>

											</div>
										</div>
									</div>
									<!-- end -->

									<!-- Modal -->
									<div class="modal fade" id="exampleModal${recruitment.id}"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Bạn có
														chắc chắn muốn xóa ?</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													Bài đăng : <span>${recruitment.title}</span>
													<form
														action="${pageContext.request.contextPath}/recruitment/delete"
														method="post">
														<input type="hidden" name="${_csrf.parameterName}"
															value="${_csrf.token}" /> <input type="hidden"
															class="form-control" id="id" name="id"
															value="${recruitment.id}">
														<div class="modal-footer mt-1">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Đóng</button>
															<button type="submit" class="btn btn-danger">Xóa</button>
														</div>
													</form>
												</div>

											</div>
										</div>
									</div>
									<!-- Modal -->
								</c:forEach>
							</c:if>

						</div>
						<div class="row mt-5">
							<div class="col text-center">
								<div class="block-27">
									<ul>
										<%-- <li th:if="${numberPage>0}"><a th:href="@{${pageContext.request.contextPath}/user/list-post(page = ${list.size() - 1})}">&lt;</a></li>
                                <th:block th:each="recruitment,state  : ${recruitmentList}">
<!--                                    <th:block th:if="${numberPage == 0}">-->
<!--                                        <li th:class="${numberPage == 0 ? 'active' : null }"><a th:href="@{/user/list-post(page = ${state.index})}" th:text="${state.index + 1}"></a></li>-->
<!--                                    </th:block>-->
                                        <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{${pageContext.request.contextPath}/user/list-post(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                                </th:block>
                                <li th:if="${numberPage<list.size()- 1}"><a th:href="@{${pageContext.request.contextPath}/user/list-post(page = ${list.size() + 1})}">&gt;</a></li> --%>
									</ul>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
	</security:authorize>



	<script>
    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
</script>

	<%@ include file="fragments/footer.jsp"%>
</body>
</html>