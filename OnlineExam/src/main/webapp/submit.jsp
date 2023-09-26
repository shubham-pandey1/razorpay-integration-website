<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success Order</title>
<%@ include file="allcomponent/allCss.jsp" %>
<style type="text/css">
body {
	background: #f5f3f2;
}
.hl{
	height: 200px;
	widows: 200px;
}
</style>
</head>
<body>
	
	
	<%@ include file = "allcomponent/navbar.jsp" %>
	<div class="d-flex justify-content-center align-items-center">
		<div class="text-center mt-5 pt-5">
		<i class="fa-solid fa-circle-check fa-beat fa-6x text-success"></i>
		<div class="text-danger">
		<h3 class="mt-3">Your Exam Successfully Submitted</h3>
		<strong>We will Soon declare result</strong><br>
		<div class="p-3">
		<a class="btn btn-warning me-3 col-md-5" href="index.jsp"><b>Home</b></a>
		
		</div>
		</div>
	</div>
	</div>

</body>
</html>