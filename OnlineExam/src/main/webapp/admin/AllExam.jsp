<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="com.entity.AllExam"%>
<%@page import="java.util.List"%>
<%@page import="com.db.Conpro"%>
<%@page import="com.daoImp.ExamDaoImp"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online: All Exam</title>
<%@include file="../allcomponent/allCss.jsp" %>



<style type="text/css">
	body {
	background: rgb(237, 237, 240);
}
</style>
</head>
<body>
<%@include file="Navbar.jsp" %>
	
	<c:if test="${empty admin }">
		<c:redirect url="index.jsp"/>
	</c:if>
	
	<%
		String pass = (String)session.getAttribute("admin");
		if(!pass.equals("(gMlQC8N?n:a1\"7!rL^s"))
				response.sendRedirect("../index.jsp");
	%>
	
	<c:if test="${not empty fumsg}">
		<div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
		   ${fumsg }
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<c:remove var="fumsg" scope="session"/>
	</c:if>
	<c:if test="${not empty umsg}">
		<div class="alert alert-success alert-dismissible fade show text-center" role="alert">
		   ${umsg}
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<c:remove var="umsg" scope="session"/>
	</c:if>
	
	<h3 class = "text-center m-3 text-success">All Exam</h3>
	
	<div class="p-3 pb-5">		
	 
	<table class="table table-striped text-center border ">
	<thead class="bg-primary text-white">
  		<tr>
  			<th scope = "col">EID</th>
  			<th scope = "col">Exam Name</th>
  			<th scope = "col">Duration</th>
  			<th scope = "col">No. of Question</th>
  			<th scope = "col">No. of Candidate</th>
  			
  			<th scope = "col">Action</th>
  			<th scope = "col">Questions</th>
  		</tr>
  		</thead>
  		<%
  			ExamDaoImp edi = new ExamDaoImp(Conpro.getCon());
  			List<AllExam> list = edi.allExams();
  			for(AllExam allExam: list){
  		%>
	
  		<tr>
  			<td scope = "row"><%=allExam.getEid() %></td>
  			<td scope = "row"><%=allExam.getEname() %></td>
  			<td scope = "row"><%=allExam.getDuration() %></td>
  			<td scope = "row"><%=allExam.getNoquest() %></td>
  			<td scope = "row"><%=allExam.getNocandidate() %></td>
  			<td scope = "row">
  				<a href = "EditExam.jsp?eid=<%=allExam.getEid()%>" class = "btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square me-2"></i>Edit</a>
  				
  				<!-- Button trigger modal -->
<button type="button" class="btn btn-danger py-1 px-2" data-bs-toggle="modal" data-bs-target="#exampleModal<%=allExam.getEid()%>"><i class="fa-solid fa-trash-can me-2"></i>
  Delete
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal<%=allExam.getEid()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Do you want to Delete this exam?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
        <a  class="btn btn-danger" href="../DeleteExam?eid=<%=allExam.getEid()%>">Delete</a>
      </div>
    </div>
  </div>
</div>
  				
  			</td>
  			<td> <a href = "AllQuest.jsp?eid=<%=allExam.getEid()%>" class = "btn btn-sm btn-success"><i class="fa-regular fa-rectangle-list me-2"></i>See Question</a></td>
  		</tr>
  		<%} %>
  		
  		
	</table>
	</div>

	<script type="text/javascript">
		const bsAlert = new bootstrap.Alert('.alert')
			setTimeout(() => {
				bsAlert.close();
			}, 3000);
	</script>
	
<div class="fixed-bottom">
	<%@include file="Footer.jsp"%>
</div>
</body>
</html>