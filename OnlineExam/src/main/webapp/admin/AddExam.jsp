<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page isELIgnored="false" %> 

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body{
		background-color: rgb(134, 134, 227);  
		
	}
</style>
<meta charset="UTF-8">
<title>Online: Add Exam</title>

<%@include file="../allcomponent/allCss.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body class="bg-body-secondary">
	<%@include file="Navbar.jsp" %>
	
	<c:if test="${empty admin }">
		<c:redirect url="index.jsp"/>
	</c:if>
	
	<%
		String pass = (String)session.getAttribute("admin");
		if(!pass.equals("(gMlQC8N?n:a1\"7!rL^s"))
				response.sendRedirect("../index.jsp");
	%>
	
	<div class="container my-3 ">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4 mt-3">
				<div class="card rounded-5 py-3">
					<div class="card-body">
						<h4 class="text-center text-success">Add Exam</h4>
						 <%-- <c:if test="${not empty smsg}">
						 <h6 class="text-center text-success">${smsg}</h6>
						 <c:remove var="smsg" scope="session"/>
						 </c:if>
						 <c:if test="${not empty fmsg}">
							 <p class="text-center text-danger">${fmsg}</p>
							 <c:remove var="fmsg" scope="session"/>
						 </c:if> --%>
						  <form id="exam" >
							<div class="mb-2">
								<label for="bname" class="form-label">Exam Name: </label> <input
									type="text" class="form-control" id="formGroupExampleInput"
									placeholder="Exam Name" name="name" required>
							</div>
							<div class="mb-2">
								<label for="aname" class="form-label">Exam Duration: </label> <input
									type="number" class="form-control" id="formGroupExampleInput2"
									placeholder="Enter time in seconds" name="duration" required>
							</div>
							
							<div class="mb-0 text-center">
								<button type="submit" class="btn btn-primary m-2">Save Exam & Next</button>
								<button type="reset" class="btn btn-danger ms-3 m-2">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../allcomponent/examreg.js"></script>
	
	<div class="fixed-bottom">
		<%@include file="Footer.jsp" %>
	</div>
</body>
</html>