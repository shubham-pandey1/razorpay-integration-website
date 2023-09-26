<%@page import="com.db.Conpro"%>
<%@page import="com.daoImp.QuestDaoImp"%>
<%@page import="com.entity.Exam"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instruction</title>
<%@ include file="allcomponent/allCss.jsp" %>
<style type="text/css">
	body {
	background: rgb(215, 217, 215);
}
	ul li{
		background: none !important;
		font-weight: 500;
	}
</style>
</head>
<body>
	<%@ include file = "allcomponent/navbar.jsp" %>
	<c:if test="${empty user }">
	<c:redirect url="index.jsp"/>
	</c:if>
	
	<%
		User user = (User)session.getAttribute("user");
		Exam exam = (Exam)session.getAttribute("exam");
		int duration = Integer.parseInt(exam.getDuration());
		String time = duration/3600 + ":"+ (duration%3600)/60 +":"+ duration%60;
		int noquest = new QuestDaoImp(Conpro.getCon()).noQuestion(user.getEid()+"");
	%>
	
	<div class="container">
		<h1 class="text-center text-danger mt-3">Instruction</h1>
		<hr>
		<div class="row">
	      <div class="col-sm-6 ms-3">
	      <h3 class=" text-success"><%= user.getName() %></h3></div>
	      <div class="col-md-2 ms-auto">
	      <h4 class="text-danger"><i class="fa-regular fa-clock me-2"></i><%=time %></h4>
	      </div>
    	</div>
		<div class="row">
			<div class="col-md-8">
			
			<ul class="list-group list-group-flush mt-5">
			  <li class="list-group-item"><i class="fa-regular fa-hand-point-right me-2 text-danger"></i>Welcome in Online Exam of <%=exam.getName() %></li>
			  <li class="list-group-item"><i class="fa-regular fa-hand-point-right me-2 text-danger"></i>Exam have total of <%=noquest %> Question.</li>
			  <li class="list-group-item"><i class="fa-regular fa-hand-point-right me-2 text-danger"></i>Total time duration of Exam in hh:mm:ss is <%=time %></li>
			  <li class="list-group-item"><i class="fa-regular fa-hand-point-right me-2 text-danger"></i>No Negative marking.</li>
			  <li class="list-group-item"><i class="fa-regular fa-hand-point-right me-2 text-danger"></i>You can only once attempt the exam</li>
			</ul>
			</div>
			<div class="text-center mt-4">
				<a class="btn btn-success col-md-3" href="Attendence?sid=<%=user.getSid()%>">Start</a>
			</div>
		</div>
		
	</div>

</body>
</html>