<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container-fluid px-md-4	">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/">SonBT - FX20515</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
          <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active"><a href="${pageContext.request.contextPath}/" class="nav-link">Trang chủ</a></li>
              <li class="nav-item"><a href="${pageContext.request.contextPath}/list-job" class="nav-link">Công việc</a></li>
              <li class="nav-item"><a href="${pageContext.request.contextPath}/list-user" class="nav-link">Ứng cử viên</a></li>
              
              <c:if test="${user != null}">
             <li class="nav-item"><span class="nav-link"> ${user.fullName} <security:authentication property="principal.authorities" /></span>
                <ul class="dropdown">
                  <li><a href="${pageContext.request.contextPath}/user/profile/${user.id}">Hồ Sơ</a></li>
                  <security:authorize access="hasRole('USER')"> <li><a href="${pageContext.request.contextPath}/save-job/get-list" >Công việc đã lưu</a></li></security:authorize>
                  <security:authorize access="hasRole('HR')"> <li ><a href="${pageContext.request.contextPath}/user/list-post" >Danh sách bài đăng</a></li></security:authorize>
                  <security:authorize access="hasRole('USER')"> <li ><a href="${pageContext.request.contextPath}/user/get-list-apply" >Công việc đã ứng tuyển</a></li></security:authorize>
                  <security:authorize access="hasRole('USER')"> <li ><a href="${pageContext.request.contextPath}/user/get-list-company" >Công ty đã theo dõi</a></li></security:authorize>
                  <li><a href="${pageContext.request.contextPath}/auth/logout" >Đăng xuất</a></li>
                </ul>
                </li>
                <li></li>
                <security:authorize access="hasRole('HR')"><li class="nav-item cta mr-md-1"><a href="${pageContext.request.contextPath}/recruitment/post" class="nav-link">Đăng tuyển</a></li></security:authorize>
                </c:if>
                <c:if test="${user == null}">
               <li class="nav-item cta cta-colored"><a href="${pageContext.request.contextPath}/auth/login" class="nav-link">Đăng nhập</a></li>
               </c:if>
            </ul>
          </div>
        </div>
      </nav>
<!-- END NAV -->

<!-- Xu li Alert -->
<c:if test="${msg_success != null}">
<div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: '${msg_success}',
            /* text: 'Redirecting...', */
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
</div>
</c:if>

<c:if test="${msg_error != null}">
<div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: '${msg_error}',
            /* text: 'Redirecting...', */
            icon: 'error',
            timer: 3000,
            buttons: true,
            type: 'error'
        })
    </script>
</div>
</c:if>
<!-- END -->