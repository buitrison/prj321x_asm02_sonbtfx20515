<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function choosed(id) {
		var name = '#choose' + id;
		var name1 = 'loai1' + id;
		var name2 = 'loai2' + id;
		var button1 = 'button1' + id;
		var button2 = 'button2' + id;
		var giaitri = $(name).val();
		if (giaitri == 1) {
			document.getElementById(name1).style.display = 'block'
			document.getElementById(name2).style.display = 'none'
			document.getElementById(button1).style.display = 'block'
			document.getElementById(button2).style.display = 'none'
		} else {
			document.getElementById(name2).style.display = 'block'
			document.getElementById(name1).style.display = 'none'
			document.getElementById(button2).style.display = 'block'
			document.getElementById(button1).style.display = 'none'
		}
	}

	function apply(id) {
		var name = "#idRe" + id;
		var nameModal = "#exampleModal" + id;
		var nameFile = "#fileUpload" + id;
		var nameText = "#text" + id;
		var idRe = $(name).val();
		var textvalue = $(nameText).val();
		var fileUpload = $(nameFile).get(0);
		var files = fileUpload.files;
		var formData = new FormData();
		formData.append('file', files[0]);
		formData.append('idRe', idRe);
		formData.append('text', textvalue);
		if (files[0] == null) {
			swal({
				title : 'Bạn cần phải chọn cv!',
				/* text: 'Redirecting...', */
				icon : 'error',
				timer : 3000,
				buttons : true,
				type : 'error'
			})
		} else {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/apply-job',
				contentType : false,
				processData : false,
				data : formData,
				beforeSend : function(xhr) {
					xhr.setRequestHeader('${_csrf.headerName}',
							'${_csrf.token}');
				},
				success : function(data) {
					if (data == "false") {
						swal({
							title : 'Bạn cần phải đăng nhập!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
					} else if (data == "error") {
						swal({
							title : 'Upload không thành công!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
					} else if (data == "true") {
						swal({
							title : 'Ứng tuyển thành công!',
							/* text: 'Redirecting...', */
							icon : 'success',
							timer : 3000,
							buttons : true,
							type : 'success'
						})
						$(nameModal).modal('hide');
						$('#fileUpload').val("");

					} else if (data == "typeFalse") {
						swal({
							title : 'Dinh dang file phai la PDF!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
					} else {
						swal({
							title : 'Bạn đã ứng tuyển công việc này!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
						$(nameModal).modal('hide');
						$('#fileUpload').val("");
					}
				},
				error : function(err) {
					alert(err);
				}
			})
		}

	}
	function apply1(id) {
		var name = "#idRe" + id;
		var nameModal = "#exampleModal" + id;
		var nameFile = "#fileUpload" + id;
		var nameText = "#text" + id;
		var idRe = $(name).val();
		var textvalue = $(nameText).val();
		var formData = new FormData();
		formData.append('idRe', idRe);
		formData.append('text', textvalue);
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/apply-job1/',
			contentType : false,
			processData : false,
			data : formData,
			beforeSend : function(xhr) {
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
			},
			success : function(data) {
				if (data == "false") {
					swal({
						title : 'Bạn cần phải đăng nhập!',
						/* text: 'Redirecting...', */
						icon : 'error',
						timer : 3000,
						buttons : true,
						type : 'error'
					})
				} else if (data == "true") {
					swal({
						title : 'Ứng tuyển thành công!',
						/* text: 'Redirecting...', */
						icon : 'success',
						timer : 3000,
						buttons : true,
						type : 'success'
					})
					$(nameModal).modal('hide');
					$('#fileUpload').val("");
				} else {
					swal({
						title : 'Bạn đã ứng tuyển công việc này!',
						/* text: 'Redirecting...', */
						icon : 'error',
						timer : 3000,
						buttons : true,
						type : 'error'
					})
					$(nameModal).modal('hide');
					$('#fileUpload').val("");
				}
			},
			error : function(err) {
				alert(err);
			}
		})

	}
</script>

<script>
	function save(id) {
		var name = "#idRe" + id;
		var idRe = $(name).val();
		var formData = new FormData();
		formData.append('idRe', idRe);
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/save-job/save/',
			contentType : false,
			processData : false,
			data : formData,
			beforeSend : function(xhr) {
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
			},
			success : function(data) {
				console.log(data);
				if (data == "false") {
					swal({
						title : 'Bạn cần phải đăng nhập!',
						/* text: 'Redirecting...', */
						icon : 'error',
						timer : 3000,
						buttons : true,
						type : 'error'
					})
				} else if (data == "true") {
					swal({
						title : 'Lưu thành công!',
						/* text: 'Redirecting...', */
						icon : 'success',
						timer : 3000,
						buttons : true,
						type : 'success'
					})
				} else if (data == "exist") {
					swal({
						title : 'Bỏ lưu thành công!',
						/* text: 'Redirecting...', */
						icon : 'success',
						timer : 3000,
						buttons : true,
						type : 'success'
					})
				} else {
					swal({
						title : 'Lỗi!',
						/* text: 'Redirecting...', */
						icon : 'error',
						timer : 3000,
						buttons : true,
						type : 'error'
					})
				}
			},
			error : function(err) {
				alert(err);
			}
		})
	}
</script>