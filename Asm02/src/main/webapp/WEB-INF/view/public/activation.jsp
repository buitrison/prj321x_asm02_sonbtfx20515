<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Successful Account Verification</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <c:if test="${success != null}">
  <div class="container mt-5">
    <div class="alert alert-success" role="alert">
      <h4 class="alert-heading">Account Verified Successfully!</h4>
      <p>Your account has been successfully verified. You can now access all features.</p>
      <hr>
      <p class="mb-0">Thank you for verifying your account.</p>
    </div>
  </div>
  </c:if>
  <c:if test="${success == null}">
  <div class="container mt-5">
    <div class="alert alert-danger" role="alert">
      <h4 class="alert-heading">Failed to Verify Account!</h4>
      <p>Sorry, we couldn't verify your account. Please try again later or contact support.</p>
      <hr>
      <p class="mb-0">If you believe this is an error, please contact our support team.</p>
    </div>
  </div>
  </c:if>
 

  <!-- Bootstrap JS and jQuery (optional) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
