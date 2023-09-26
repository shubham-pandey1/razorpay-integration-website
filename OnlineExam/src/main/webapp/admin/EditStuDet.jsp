<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.db.Conpro"%>
<%@page import="java.util.*"%>
<%@page import="com.daoImp.ExamDaoImp"%>
<%@page import="com.entity.Exam"%>
<%@page import="com.daoImp.UserDaoImp"%>
<%@page import="com.entity.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online: Edit Student Detail</title>
<%@include file="../allcomponent/allCss.jsp" %>
<style type="text/css">
	
</style>
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
		String sid = request.getParameter("sid");
		
		User user = new UserDaoImp(Conpro.getCon()).getData(sid);
	%>
	
	<div class="container mt-4 mb-2 pb-4">
		<div class="row mb-2 justify-content-center">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body round-2">
						<h2 class ="text-center text-danger">Edit Registration Details</h2>
						<%-- <c:if test="${not empty serv}">
							<p class="text-center text-success">${serv}</p>
							<c:remove var= "serv" scope="session"/>
						</c:if>
						<c:if test="${not empty fserv}">
							<p class="text-center text-danger">${fserv}</p>
							<c:remove var= "fserv" scope="session"/>
						</c:if> --%>
						<form class="row g-3" action="../UpdateStuDet?sid=<%=sid%>" method="post">
						  <div class="col-md-6">
						    <label for="inputEmail4" class="form-label">Name:</label>
						    <input type="text" class="form-control" id="inputEmail4" value="<%=user.getName()%>" required="required" name = "name">
						  </div>
						  <div class="col-md-6">
						    <label for="inputPassword4" class="form-label">Email:</label>
						    <input type="email" class="form-control" id="inputPassword4" value="<%=user.getEmail()%>" required="required" name = "email">
						  </div>
						  <div class="col-md-6">
						    <label for="inputEmail4" class="form-label">Phone:</label>
						    <input type="number" class="form-control" id="inputEmail4" value="<%=user.getMobile()%>" required="required" name = "phone">
						  </div>
						  <div class="col-md-6">
						    <label for="inputPassword4" class="form-label">Password:</label>
						    <input type="text" class="form-control" id="inputPassword4" value="<%=user.getPassword()%>" required="required" name = "pass">
						  </div>
						  <div class="col-12">
						    <label for="inputAddress" class="form-label">Address</label>
						    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" value="<%=user.getAddress() %>" required="required" name = "address">
						  </div>
						  
						  <div class="col-md-4">
						    <label for="inputState" class="form-label">Exam:</label>
						    <select id="inputState" class="form-select" name = "exam">
						      <option>---Select---</option>
						      
						      <%
						      		List<Exam> list = new ExamDaoImp(Conpro.getCon()).exames();
						      		for(Exam exam: list){
						      %>
						      
						      <option value="<%=exam.getEid() %>" <% if(user.getEid()== exam.getEid()){ %>selected<%} %>><%=exam.getEid()+" "+ exam.getName() %> </option>
						      
						      <%} %>
						      
						    </select>
						  </div>
						  
						  <div class="col-12 text-center">
						    <button type="submit" class="btn btn-success col-md-3">Update</button>
						    <button type="reset" class="btn btn-primary ms-2 col-md-3">Reset</button>
						  </div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="fixed-bottom">
		<%@include file= "Footer.jsp" %>
	</div>
</body>
</html>