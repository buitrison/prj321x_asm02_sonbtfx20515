<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Profile: ${user.fullName}</title>
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
	<%@ include file="fragments/nav.jsp"%>



	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<h1 class="mb-3 bread">Hồ sơ</h1>
					<div class="form-group">
						<label class="btn btn-primary btn-md btn-file"> Chọn ảnh<input
							type="file" name="file" id="fileUpload" hidden>
						</label>
					</div>
					<div style="margin-left: 0px" id="divImage">
						<img id="avatar" height="100" width="100"
							style="border-radius: 50px"
							src="${user.image != null ? user.image : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- HOME -->
	<c:if test="${user.status == 0}">
		<div class="container-fluid" style="text-align: center">
			<p
				style="font-size: 20px; font-weight: bold; color: #aaa; margin-top: 10px">Xác
				thực email đăng nhập</p>
			<c:if test="${confirm == null}">
				<div
					style="width: 600px; height: 400px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto; padding: 15px">
					<p style="line-height: 35px; font-size: 16px">
						Xin chào, <span>${user.fullName}</span> và làm theo hướng dẫn
						trong email. Trường hợp không nhận được email, bạn vui lòng bấm
						nút Nhận email xác thực dưới đây.
					</p>
					<div class="row form-group">
						<form
							action="${pageContext.request.contextPath}/user/confirm-account"
							method="post" class="col-md-12">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="hidden"
								value="${user.email}" name="email"
								class="btn px-4 btn-primary text-white"> <input
								type="submit" value="Nhận email xác thực"
								class="btn px-4 btn-primary text-white">
						</form>
					</div>
					<p>
						Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br>
					</p>
					- Điện thoại:<span style="color: #5f80ec">(024) 6680 5588</span><br>
					- Email: <a href="#" style="color: #5f80ec"> hotro@workcv.vn</a>
				</div>
			</c:if>
			<c:if test="${confirm != null}">
				<div
					style="width: 600px; height: 400px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto; padding: 15px">
					<p style="line-height: 35px; font-size: 16px">
						Xin chào, <span>${user.fullName}</span> .Bạn đã gửi yêu cầu xác
						thực thành công, vui lòng kiểm tra mail để xác thực.Cảm ơn bạn!!!
					</p>
					<p>
						Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br>
					</p>
					- Điện thoại:<span style="color: #5f80ec">(024) 6680 5588</span><br>
					- Email: <a href="#" style="color: #5f80ec"> hotro@workcv.vn</a>
				</div>
			</c:if>
		</div>
	</c:if>
	<c:if test="${user.status == 1}">
		<security:authorize access="hasRole('USER')">
			<section class="site-section" style="margin-top: 10px">
				<div class="container">
					<form enctype="multipart/form-data">
						<div class="row align-items-center mb-5">
							<div class="col-lg-8 ">
								<div class="d-flex align-items-center">
									<div class="form-group" style="margin-top: 15px">
										<label class="btn btn-primary btn-md btn-file"> Chọn
											cv (pdf)<input type="file" name="file" id="fileUpload1"
											required hidden>
										</label>
									</div>
								</div>
								<c:if test="${cv != null}">
									<p id="cvName">${cv != null ? cv.fileName :'Chưa cập nhập'}</p>
								</c:if>
								<c:if test="${cv == null}">
									<p id="cvName"></p>
								</c:if>
								<c:if test="${cv != null}">
									<a id="nameCv"
										href="${pageContext.request.contextPath}/resources/uploads/${cv.fileName}">Xem
										cv</a>
								</c:if>
								<c:if test="${cv == null}">
									<a id="nameCv" href=""></a>
								</c:if>
								<c:if test="${cv != null}">
									<a style="color: red; margin-left: 20px" data-toggle="modal"
										data-target="#exampleModal">Xóa cv</a>
								</c:if>
								<c:if test="${cv == null}">
									<a style="color: red; margin-left: 20px" id="xoa"
										data-toggle="modal" data-target="#exampleModal"></a>
								</c:if>
							</div>

							<div class="col-lg-4">
								<div class="row">
									<!--                        <div class="col-6">-->
									<!--                            <button type="submit" id="myBtn" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>Cập nhật cv</button>-->
									<!--                        </div>-->
								</div>
							</div>
						</div>
					</form>

					<form
						action="${pageContext.request.contextPath}/user/update-profile/${user.id}"
						method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="row align-items-center mb-5">
							<div class="col-lg-8 mb-4 mb-lg-0">
								<div class="d-flex align-items-center">
									<div>
										<h2>Cập nhật thông tin</h2>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="row">

									<div class="col-6">
										<button type="submit" class="btn btn-block btn-primary btn-md">Lưu
											thông tin</button>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-5">
							<div class="col-lg-12">
								<div class="p-4 p-md-5 border rounded">
									<h3 class="text-black mb-5 border-bottom pb-2">Thông tin
										chi tiết</h3>
									<div class="form-group">
										<label for="email">Email</label> <input type="email"
											class="form-control" id="email" name="email"
											value="${user.email}" required
											placeholder="you@yourdomain.com">
									</div>
									<div class="form-group">
										<label for="job-title">Full name</label> <input type="text"
											class="form-control" name="fullName" value="${user.fullName}"
											required id="job-title" placeholder="Full name">
									</div>
									<div class="form-group">
										<label for="job-location">Địa chỉ</label> <input type="text"
											name="address" value="${user.address}" class="form-control"
											id="job-location" required placeholder="e.g. New York">
									</div>
									<div class="form-group">
										<label for="job-location">Số điện thoại</label> <input
											type="text" name="phoneNumber" value="${user.phoneNumber}"
											class="form-control" id="job-location" required
											placeholder="+ 84">
									</div>
									<div class="form-group">
										<label for="job-location">Mô tả bản thân</label>
										<textarea name="description" class="form-control" id="editor"
											placeholder="Mô tả">${user.description}</textarea>
									</div>

								</div>

							</div>

						</div>
					</form>
				</div>
			</section>
		</security:authorize>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc
							chắn muốn xóa ?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						Cv : <span id="cvXoa">${cv.fileName}</span>
						<form action="${pageContext.request.contextPath}/user/delete-cv"
							method="post">
							<div class="modal-footer mt-1">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<c:if test="${cv != null}">
									<input type="hidden" name="idCv" value="${cv.id}">
								</c:if>
								<button type="submit" class="btn btn-secondary"
									data-dismiss="modal">Đóng</button>
								<button type="submit" class="btn btn-danger">Xóa</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

		<security:authorize access="hasRole('HR')">
			<section class="site-section" style="margin-top: 10px">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 mb-5">
							<h2 class="mb-4">Thông tin cá nhân</h2>
							<form
								action="${pageContext.request.contextPath}/user/update-profile/${user.id}"
								method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="row mb-5">
									<div class="col-lg-12">
										<div class="p-4 p-md-5 border rounded">
											<div class="form-group">
												<label for="email">Email</label> <input type="email"
													class="form-control" id="email" name="email"
													value="${user.email}" required
													placeholder="you@yourdomain.com">
											</div>
											<div class="form-group">
												<label for="job-title">Họ và tên</label> <input type="text"
													class="form-control" name="fullName"
													value="${user.fullName}" id="job-title" required
													placeholder="Full name">
											</div>
											<div class="form-group">
												<label for="job-location">Địa chỉ</label> <input type="text"
													name="address" value="${user.address}" required
													class="form-control" id="job-location"
													placeholder="e.g. New York">
											</div>
											<div class="form-group">
												<label for="job-location">Số điện thoại</label> <input
													type="text" name="phoneNumber" value="${user.phoneNumber}"
													required class="form-control" id="job-location"
													placeholder="+ 84">
											</div>
											<div class="form-group">
												<label for="job-location">Mô tả bản thân</label>
												<textarea name="description" class="form-control"
													id="editor" placeholder="Mô tả">${user.description}</textarea>
											</div>
											<div class="row form-group">
												<div class="col-md-12">
													<input type="submit" value="Lưu thông tin"
														class="btn px-4 btn-primary text-white">
												</div>
											</div>
										</div>

									</div>

								</div>
							</form>
						</div>
						<div class="col-lg-6">
							<h2 class="mb-4">Thông tin công ty</h2>
							<div class="form-group">
								<label for="company-website-tw d-block1">Cập nhật Logo</label> <br>
								<label class="btn btn-primary btn-md btn-file"> Chọn
									logo<input type="file" name="file" id="fileUpload2" required
									hidden>
								</label>
								<div id="divLogo">
									<img id="avatar1" height="100" width="100"
										style="border-radius: 50px"
										src="${company.logo != null ? company.logo : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}">
								</div>
							</div>
							<form
								action="${pageContext.request.contextPath}/user/update-company/${user.id}"
								method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

								<div class="row mb-5">
									<div class="col-lg-12">
										<div class="p-4 p-md-5 border rounded">
											<div class="form-group">
												<label for="email">Email</label> <input type="text"
													class="form-control" required id="email1" name="email"
													value="${company.email}" placeholder="you@yourdomain.com">
											</div>
											<div class="form-group">
												<label for="job-title">Tên công ty</label> <input
													type="text" class="form-control" name="nameCompany"
													value="${company.nameCompany}" id="job-title"
													placeholder="Full name" required> <input
													type="hidden" class="form-control" name="user_id"
													value="${user.id}" id="job-title" placeholder="Full name">
												<input type="hidden" class="form-control" name="id"
													value="${company.id}" id="job-title"
													placeholder="Full name">

											</div>
											<div class="form-group">
												<label for="job-location">Địa chỉ</label> <input type="text"
													name="address" value="${company.address}" required
													class="form-control" id="job-location"
													placeholder="e.g. New York">
											</div>
											<div class="form-group">
												<label for="job-location">Số điện thoại công ty</label> <input
													type="text" name="phoneNumber"
													value="${company.phoneNumber}" required
													class="form-control" id="job-location" placeholder="+ 84">
											</div>
											<div class="form-group">
												<label for="job-location">Mô tả công ty</label>
												<textarea name="description" class="form-control"
													id="editorN" placeholder="Mô tả">${company.description}</textarea>
											</div>

											<c:if test="${company.logo != null}">
												<div style="margin-left: 0px" id="divImag1">
													<img id="avatar" height="100" width="100"
														style="border-radius: 50px; margin-bottom: 15px"
														src="${company.logo}">
												</div>
											</c:if>
											<div class="row form-group">
												<div class="col-md-12">
													<input type="submit" value="Lưu thông tin"
														class="btn px-4 btn-primary text-white">
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</security:authorize>
	</c:if>
	<script>
    ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
</script>
	<script>
    $(function () {
        $('#fileUpload').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload').get(0);
                var files = fileUpload.files;
                var email = $("#email").val();
                var formData = new FormData();
                formData.append('file', files[0]);
                formData.append('email', email);
                if(files[0] == null){
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/user/upload',
                            contentType: false,
                            processData: false,
                            data: formData,
                            beforeSend: function(xhr) {
                                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                            },
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "Error"){
                                    document.getElementById("change").style.backgroundColor = 'red';
                                    swal({
                                        title: 'Cập nhật ảnh đại diện thất bại!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    $("#divImage").css("display","block")
                                }else{
                                    $('#avatar').attr('src', urlImage)
                                    swal({
                                        title: 'Cập nhật ảnh đại diện thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                console.log(err);
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
</script>

	<script>
    $(function () {
        $('#fileUpload2').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload2').get(0);
                var files = fileUpload.files;
                var email = $("#email").val();
                var formData = new FormData();
                formData.append('file', files[0]);
                formData.append('email', email);
                if(files[0] == null){
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/user/upload-company/',
                            contentType: false,
                            processData: false,
                            data: formData,
                            beforeSend: function(xhr) {
                                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                            },
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "Error"){
                                    document.getElementById("change").style.backgroundColor = 'red';
                                    swal({
                                        title: 'Cập nhật logo thất bại!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    $("#divLogo").css("display","block")
                                }else  {
                                    $('#avatar1').attr('src', urlImage)
                                    swal({
                                        title: 'Cập nhật logo thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
</script>

	<script>
    $(function () {
        $('#fileUpload1').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload1').get(0);
                var files = fileUpload.files;
                var formData = new FormData();
                formData.append('file', files[0]);
                if(files[0] == null){
//                    document.getElementById("change").style.backgroundColor = 'red';
//                    $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                	formData.append('_charset_', 'UTF-8');
                    $.ajax(
                        {
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/user/upload-cv',
                            contentType: false,
                            processData: false,
                            data: formData,
                            beforeSend: function(xhr) {
                                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                            },
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "false"){
                                    // document.getElementById("change").style.backgroundColor = 'red';

                                    swal({
                                        title: 'Cần chọn đúng loại file (PDF)!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    // $("#divImage").css("display","block")
                                }else if(urlImage == "Error") {
                                	swal({
                                        title: 'Cap nhat CV that bai!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                	
                          		} else{
                                    // $('#avatar').attr('src', urlImage)
                                    $('#nameCv').attr('href','${pageContext.request.contextPath}/resources/uploads/'+urlImage);
                                    $('#nameCv').html('Xem cv');
                                    $('#xoa').html('Xóa cv');
                                    $('#cvName').html(urlImage);
                                    $('#cvXoa').html(urlImage);
/*                                     document.getElementById('nameCv').innerHTML = 'Xem cv';
                                    document.getElementById('nameCv').href = "http://localhost:8080/resources/uploads/"+urlImage ; //or grab it by tagname etc
                                    document.getElementById('xoa').innerHTML = 'Xóa cv';
                                    document.getElementById("cvName").innerHTML = urlImage;
                                    document.getElementById("cvXoa").innerHTML = urlImage; */
                                 // Tải lại trang hiện tại
                                    swal({
                                        title: 'Cập nhật CV thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                    setTimeout(function(){
                                    	window.location.reload();
                                    }, 2000);
                                    
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
</script>

	<%@ include file="fragments/footer.jsp"%>
</body>
</html>