<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.db.Conpro"%>
<%@page import="com.daoImp.ExamDaoImp"%>
<%@page import="com.entity.Result"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Result</title>
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
	<h3 class="text-center m-3 text-success">Student Results</h3>
	<div class="p-3">
	<table class="table table-striped mb-5 ">
		<thead class="bg-primary text-white text-center border">
			<tr>
				<th scope="col">RID</th>
				<th scope="col">SID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Exam</th>
				<th scope="col">Correct</th>
				<th scope="col">Incorrect</th>
				<th scope="col">Total</th>
				
			</tr>
		</thead>
		<tbody class="text-center">
		<%
				List <Result> list = new ExamDaoImp(Conpro.getCon()).result();
				for(Result res: list){
		%>
		<tr>
			<td scope="col"> <%=res.getRid() %></td>
			<td scope="col"> <%=res.getSid() %></td>
			<td scope="col"> <%=res.getName() %></td>
			<td scope="col"> <%=res.getEmail() %></td>
			<td scope="col"><%=res.getExam() %></td>
			<td scope="col"><%=res.getCorrect() %></td>
			<td scope="col"><%=res.getIncorrect() %></td>
			<td scope="col"><%=res.getTotal() %></td>
			
		</tr>
		<%} %>
		
		
		</tbody>
		<tfoot class="mb-5">	</tfoot>
		
	</table>
	</div>
<div class="fixed-bottom mt-2">
	<%@include file="Footer.jsp" %>
</div>
</body>
</html>