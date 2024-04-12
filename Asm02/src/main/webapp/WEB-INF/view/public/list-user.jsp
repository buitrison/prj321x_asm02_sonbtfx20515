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
							href="{pageContext.request.contextPath}/">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span>
					</p>
					<h1 class="mb-3 bread">Danh sách ứng cử viên</h1>
				</div>
			</div>
		</div>
	</div>
	<security:authorize access="!hasRole('HR')">
		<section class="ftco-section bg-light">
			<div class="container">
				<div class="row no-gutters align-items-end justify-content-start">
					<div class="col-md-12 text-center mb-5">
						<h1 class="mb-3">Bạn không có quyền xem trang này!</h1>
					</div>
				</div>
			</div>
		</section>
	</security:authorize>
	<security:authorize access="hasRole('HR')">
		<section class="ftco-section bg-light">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 pr-lg-5">

						<c:if test="${applyList.size() != 0}">
							<c:forEach var="applyUser" items="${applyList}">
								<div class="row">
									<div class="col-md-12"
										style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto;">
										<div class="team d-md-flex p-4 bg-white">
											<div class="img"
												style="background-image: url(${applyUser.image != null ? applyUser.image : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'});"></div>
											<div class="text pl-md-4">
												<p class="location mb-0"
													style="display: block; color: black">${applyUser.address}</p>
												<h3 class="mb-0">${applyUser.fullName}</h3>
												<span class="position" style="display: block; color: black">${applyUser.email}</span>
												<p class="mb-4" style="width: 700px">${applyUser.description}</p>
												<c:if test="${applyUser.cv != null}">
													<div style="margin-left: 1px" class="row">
														<p>
															<a
																href="${pageContext.request.contextPath}/resources/uploads/${applyUser.cv.fileName}"
																class="btn btn-primary">Xem cv</a>
														</p>
													</div>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${applyList.size() == 0 or applyList == null}">
							<div style="text-align: center">
								<p class="alert alert-danger">Không có kết quả nào</p>
							</div>
						</c:if>

						<div class="row mt-5">
							<div class="col text-center">
								<div class="block-27">
									<ul>
										<li th:if="${numberPage>0}"><a
											th:href="@{'/user/list-candidate/'(page = ${list.number - 1})}">&lt;</a></li>
										<th:block th:each="recruitment,state  : ${recruitmentList}">
											<li
												th:class="${numberPage == state.index  ? 'active' : null }"><a
												th:href="@{'/user/list-candidate/'(page = ${state.index})}"
												th:text="${state.index + 1}"></a></li>
										</th:block>
										<li th:if="${numberPage<list.totalPages - 1}"><a
											th:href="@{'/user/list-candidate/' (page = ${list.number + 1})}">&gt;</a></li>
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