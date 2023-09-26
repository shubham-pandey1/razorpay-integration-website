<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="com.daoImp.QuestDaoImp"%>
<%@page import="com.entity.Question"%>
<%@page import="java.util.List"%>
<%@page import="com.db.Conpro"%>
<%@page import="com.daoImp.ExamDaoImp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online: All Questions</title>
<%@include file="../allcomponent/allCss.jsp" %>

<style type="text/css">
	body {
	background: rgb(237, 237, 240);
}
</style>

</head>
<body>
<%@include file="Navbar.jsp" %>
<c:if test="${empty user }">
		<c:redirect url="index.jsp"/>
	</c:if>
	
	<%
		String pass = (String)session.getAttribute("admin");
		if(!pass.equals("(gMlQC8N?n:a1\"7!rL^s"))
				response.sendRedirect("../index.jsp");
	%>

<%
	String eid = request.getParameter("eid");
	List <Question> list = new QuestDaoImp(Conpro.getCon()).allQuestion(eid);

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
	<div class="container">
	<div class="row mt-3">
      <div class="col-sm-6 ms-3">
      <h3 class=" text-success">All Questions</h3></div>
      <div class="col-md-2 ms-auto">
      <a class="btn btn-primary" href="AddQuest.jsp?eid=<%=eid%>"><i class="fa-solid fa-circle-plus me-2"></i>Add Question</a>
      </div>
    </div>
    </div>
	
	 <div class="pb-5 p-2">
	<table class="table table-striped p-3 text-center border">
	<thead class="bg-primary text-white">
  		<tr>
  			<th scope = "col">QID</th>
  			<th scope = "col">Question</th>
  			<th scope = "col">Option a</th>
  			<th scope = "col">Option b</th>
  			<th scope = "col">Option c</th>
  			<th scope = "col">Option d</th>
  			<th scope = "col">Answer</th>
  			<th scope = "col">Action</th>
  		</tr>
  		</thead>
	<%
		for(Question quest: list){
	%>
  		<tr>
  			<td scope = "row"><%=quest.getQid() %></td>
  			<td scope = "row"><%=quest.getQuest() %></td>
  			<td scope = "row"><%=quest.getOptiona()%></td>
  			<td scope = "row"><%=quest.getOptionb() %></td>
  			<td scope = "row"><%=quest.getOptionc() %></td>
  			<td scope = "row"><%=quest.getOptiond() %></td>
  			<td scope = "row"><%=quest.getAnswer() %></td>
  			<td scope = "row">
  				<a href = "EditQuest.jsp?eid=<%=eid%>&qid=<%=quest.getQid()%>" class = "btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square me-2"></i>Edit</a>
  				
  				<button type="button" class="btn btn-danger py-1 px-2" data-bs-toggle="modal" data-bs-target="#exampleModal<%=quest.getQid()%>"><i class="fa-solid fa-trash-can me-2"></i>
				  Delete
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal<%=quest.getQid()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        Do you want to Delete this Question?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
				        <a  class="btn btn-danger" href="../DeleteQuest?eid=<%=eid%>&qid=<%=quest.getQid()%>">Delete</a>
				      </div>
				    </div>
				  </div>
				</div>
  			</td>
  		</tr>
  		<%} %>
  		
	</table>
	</div>
<footer>
<div class="fixed-bottom ">
	<%@include file="Footer.jsp"%>
</div>
</footer>
</body>
</html>