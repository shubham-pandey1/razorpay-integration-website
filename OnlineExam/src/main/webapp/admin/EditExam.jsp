<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.entity.Exam"%>
<%@page import="com.db.Conpro"%>
<%@page import="com.daoImp.ExamDaoImp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online: Edit Exam</title>
<%@include file="../allcomponent/allCss.jsp" %>
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
	 <%
		String eid = request.getParameter("eid");
	 	ExamDaoImp edi = new ExamDaoImp(Conpro.getCon());
	 	Exam exam = edi.examById(Integer.parseInt(eid));
	 %>
<div class="container mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4 ">
				<div class="card mb-3 rounded-5 py-3">
					<div class="card-body">
						<h4 class="text-center text-success">Edit Exam</h4>
						
						 	
						  <form action="../UpdateExam?eid=<%=eid%>" method="post" >
							<div class="mb-2">
								<label for="bname" class="form-label">Exam Name: </label> <input
									type="text" class="form-control" id="formGroupExampleInput"
									placeholder="Exam Name" name="name" required value="<%= exam.getName()%>">
							</div>
							<div class="mb-2">
								<label for="aname" class="form-label">Exam Duration: </label> <input
									type="number" class="form-control" id="formGroupExampleInput2"
									placeholder="Enter time in seconds" name="duration" required value="<%= exam.getDuration()%>">
							</div>
							
							<div class="mb-0 text-center">
								<button type="submit" class="btn btn-primary m-2">Update Exam</button>
								<button type="reset" class="btn btn-danger ms-3 m-2">Reset</button>
							</div>
							
						</form>
							
						
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="fixed-bottom">
	<%@ include file="Footer.jsp"%>
</div>

</body>
</html>