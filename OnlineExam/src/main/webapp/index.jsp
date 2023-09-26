<%@page import="com.google.protobuf.Empty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Exam</title>
<%@ include file="allcomponent/allCss.jsp" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Catamaran:wght@100&family=Dosis:wght@200&family=Pangolin&display=swap" rel="stylesheet">


<style type="text/css">
	body {
	background: rgb(182, 252, 162);
}
	.online{
	width: 150%;
	height: 100%;
}

*{

	font-family: 'Montserrat', sans-serif;
	
 }
	.co{
		background: rgb(212, 212, 214); 
		border-radius: 40px;
		
		font-weight: 600;
	}
	
</style>

</head>
<body>
	<%@ include file = "allcomponent/navbar.jsp" %>
	<c:if test="${not empty status}">
		<div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
		   ${status }
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<c:remove var="status" scope="session"/>
	</c:if>
	<%
		
		String msg = (String)session.getAttribute("iumsg");
		System.out.println(msg);
	%>
	<div class="container mb-5 ">
		<div class="row mt-4 ">
		<div class="text-center mb-4">
			<h2>Welcome, in Online Examination Portal</h2>
		</div>
			<div class="col-md-5 me-5 mb-3 p-4 co">
				<h3 class="text-center text-primary">Login here</h3>
				<c:if test="${not empty iumsg }">
					<h6 class="text-center text-danger"><b>${iumsg }</b></h6> 
				<c:remove var="iumsg" scope="session"/>	
				</c:if>
				
				<form action="LoginServ" method="post">
						<div class="mb-3">
								<label for="email" class="form-label">User is: </label> 
							<select class="form-select" aria-label="Default select example" id="user" name = "user">
							  <option selected>---Select---</option>
							  <option value="admin">Admin</option>
							  <option value="student">Student</option>
							</select>
						</div>
							<div class="mb-3">
								<label for="email" class="form-label">ID: </label> 
								<input type="number" class="form-control" name = "id" id="exampleInputEmail1" aria-describedby="emailHelp">
								
							</div>
							<div class="mb-3">
								<label for="pass" class="form-label">Password: </label>
								<input type="password" class="form-control" name = "pass" id="exampleInputPassword1" required>
							</div>
							<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input" id="accept" name="term"> 
							<label class="form-check-label" for="term" required>I accept term and condition</label>
							</div>
							<div class="text-center mb-2">
								<button type="submit" class="btn btn-primary ps-4 pe-4" onclick="check()">Submit</button>
								<button type="reset" class="btn btn-danger ms-5 ps-4 pe-4">Reset</button>
							</div>
							<div class="text-center">
							<a href="Register.jsp" class="text-small">Click here for new Student</a>
							</div>
						</form>
			</div>

			<div class="col-md-5 ms-5 text-center p-4">
				<img alt="exam" src="image/onlinee.png" class="online">
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src = "allcomponent/main.js"></script>
	<script type="text/javascript">
		const bsAlert = new bootstrap.Alert('.alert')
			setTimeout(() => {
				bsAlert.close();
			}, 3000);
	</script>
	<div class="position-bottom">
		<%@include file="allcomponent/Footer.jsp"%>
	</div>
</body>
</html>

