<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="vn">
<head">
<meta charset="UTF-8">
<%@ include file="fragments/header.jsp"%>
</head>
<body>
	<%@ include file="fragments/nav.jsp"%>

	<security:authorize access="hasRole('HR')">
		<div class="hero-wrap hero-wrap-2"
			style="background-image: url('${pageContext.request.contextPath}/resources//assets/images/bg_1.jpg');"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-end justify-content-start">
					<div class="col-md-12 text-center mb-5">
						<p class="breadcrumbs mb-0">
							<span class="mr-3"><a
								href="${pageContext.request.contextPath}/">Trang chủ <i
									class="ion-ios-arrow-forward"></i></a></span> Cập nhập<span></span>
						</p>
						<h1 class="mb-3 bread">Cập nhật bài tuyển dụng</h1>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${msg_success != null}">
			<div class="toast" data-delay="2500"
				style="position: fixed; top: 100PX; left: 10PX; z-index: 2000; width: 300px">
				<div class="toast-header" style="background-color: #1c7430">
					<strong class="mr-auto" style="color: white">Thông báo</strong> <small
						style="color: white">Vừa xong</small>
					<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
						aria-label="Close">
						<span aria-hidden="true" style="color: white">&times;</span>
					</button>
				</div>
				<div class="toast-body">
					<p>✅${msg_success}</p>
				</div>
				<script>
    $(document).ready(function(){
      $('.toast').toast('show');
    });
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
						<h1 class="text-white font-weight-bold">Cập nhật</h1>
						<div class="custom-breadcrumbs">
							<a href="/user/list-post">Danh sách</a> <span class="mx-2 slash">/</span>
							<span class="text-white"><strong>Cập nhật bài
									tuyển dụng</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>
	</security:authorize>
	<security:authorize access="hasRole('USER')">
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
		<section class="site-section">
			<div class="container">
				<form:form
					action="${pageContext.request.contextPath}/recruitment/edit"
					method="post" modelAttribute="recruitment">
					<form:hidden class="form-control" id="job-location" path="id"
						value="${recruitment.id}" />
					<div class="row align-items-center mb-5">
						<div class="col-lg-8 mb-4 mb-lg-0">
							<div class="d-flex align-items-center">
								<div>
									<h2>Cập nhật bài đăng</h2>
								</div>
							</div>
						</div>
						<!--        <div class="col-lg-4">-->
						<!--          <div class="row">-->
						<!--            <div class="col-6">-->
						<!--              <a href="#" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>Preview</a>-->
						<!--            </div>-->
						<!--            <div class="col-6">-->
						<!--              <a href="#" class="btn btn-block btn-primary btn-md">Đăng</a>-->
						<!--            </div>-->
						<!--          </div>-->
						<!--        </div>-->
					</div>
					<div class="row mb-5">
						<div class="col-lg-12">
							<div class="p-4 p-md-5 border rounded" method="post">
								<h3 class="text-black mb-5 border-bottom pb-2">Chi tiết bài
									tuyển dụng</h3>

								<div class="form-group">
									<label for="email">Tiêu đề</label>
									<form:input type="text" class="form-control" id="email"
										path="title" required="true" value="${recruitment.title}" />
									<form:errors path="title" cssClass="badge alert-danger" />
								</div>
								<div class="form-group">
									<label for="job-location">Mô tả công việc</label>
									<form:textarea path="description" class="form-control"
										id="editorN" value="${recruitment.description}" />
									<form:errors path="description" cssClass="badge alert-danger" />
								</div>
								<div class="form-group">
									<label for="job-title">Kinh nghiệm</label>
									<form:input type="text" class="form-control" id="job-title"
										path="experience" value="${recruitment.experience}" />
									<form:errors path="experience" cssClass="badge alert-danger" />
								</div>
								<div class="form-group">
									<label for="job-title">Số người cần tuyển</label>
									<form:input type="number" class="form-control" id="job-title"
										path="quantity" value="${recruitment.quantity}" />
									<form:errors path="quantity" cssClass="badge alert-danger" />
								</div>
								<div class="form-group">
									<label for="job-location">Địa chỉ</label>
									<form:input type="text" class="form-control" id="job-location"
										path="address" value="${recruitment.address}" />
									<form:errors path="address" cssClass="badge alert-danger" />
								</div>
								<div class="form-group">
									<label for="job-location">Hạn ứng tuyển</label>
									<form:input type="date" class="form-control" id="job-location"
										path="deadline" value="${recruitment.deadline}" />
									<form:errors path="deadline" cssClass="badge alert-danger" />
								</div>
								<div class="form-group">
									<label for="job-location">Lương</label>
									<form:input type="text" class="form-control" id="job-location"
										path="salary" value="${recruitment.salary}" />
									<form:errors path="salary" cssClass="badge alert-danger" />
								</div>

								<div class="form-group">
									<label for="job-region">Loại công việc</label>
									<form:select class="form-control" path="type"
										aria-label="Default select example" required="true">
										<option selected disabled>${recruitment.type}</option>
										<form:option value="Part time" label="Part time" />
										<form:option value="Full time" label="Full time" />
										<form:option value="Freelancer" label="Freelancer" />
									</form:select>

								</div>
								<div class="form-group">
									<label for="job-region">Danh mục công việc</label>
									<form:select class="form-control" path="category.id"
										aria-label="Default select example" required="true">
										<option selected disabled>${recruitment.category.name}</option>
										<form:options items="${categories}" itemValue="id"
											itemLabel="name" />
									</form:select>
								</div>
							</div>
						</div>

					</div>
					<div class="row align-items-center mb-5">

						<div class="col-lg-4 ml-auto">
							<div class="row">
								<div class="col-6">
									<a href="#" class="btn btn-block btn-light btn-md"></a>
								</div>
								<div class="col-6">
									<button type="submit" class="btn btn-block btn-primary btn-md">Cập
										nhật</button>
								</div>
							</div>
						</div>
					</div>
				</form:form>
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