<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../allcomponent/allCss.jsp" %>

<style type="text/css">
	.hov:hover{
		transform: scale(1.2);
		
	}
	*{
		font-family: 'Nunito Sans', sans-serif;
		
	}
</style>
</head>
<body>
	<%@include file="Navbar.jsp" %>
	
	<c:if test="${empty admin }">
		<c:redirect url="../index.jsp"/>
	</c:if>
	<%
		String pass = (String)session.getAttribute("admin");
		if(!pass.equals("(gMlQC8N?n:a1\"7!rL^s"))
				response.sendRedirect("../index.jsp");
	%>
	<div class="container mt-3">
		<h3 class="text-primary text-center"><b>Admin Panel</b></h3>
		<div class="row p-3 justify-content-center">
			<div class="col-md-4 ">
				<a href="AllStudent.jsp" class="text-decoration-none">
					<div class="card">
						<div class="card-body text-center text-primary">
							<i class="fa-solid fa-users fa-4x"></i>
							<h4 class="mt-3">Registered Student</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 ">
				<a href="AllExam.jsp" class="text-decoration-none">
					<div class="card">
						<div class="card-body text-center ">
			
							<i class="fa-solid fa-computer fa-3x clr"></i>
							<h4 class="mt-3">All Exam</h4>
						</div> 
					</div>
				</a>
			</div>
			
		</div>
		<div class="row p-3 justify-content-center">
			<div class="col-md-4 ">
				<a href="AddExam.jsp" class="text-decoration-none">
					<div class="card">
						<div class="card-body text-center text-danger">
							
							<i class="fa-solid fa-file-circle-plus fa-3x"></i>
							<h4 class="mt-3 ">Add Exam</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 ">
				<a href="Result.jsp" class="text-decoration-none">
					<div class="card">
						<div class="card-body text-center text-success">
						
							<i class="fa-solid fa-file-circle-check fa-3x"></i>
							<h4 class="mt-3">Result </h4>
							
						</div>
					</div>
				</a>
			</div>
			
				
			</div>

		</div>
	
<div class="fixed-bottom">
	<%@include file="Footer.jsp" %>
</div>
	
</body>
</html>