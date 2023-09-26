<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="com.db.Conpro"%>
<%@page import="com.daoImp.UserDaoImp"%>
<%@page import="com.entity.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online: Students</title>
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
			  	
			  	String su = (String)session.getAttribute("umsg");
			  	String fa = (String)session.getAttribute("fumsg");
			  	String dsu = (String)session.getAttribute("dmsg");
			  	String dfa = (String)session.getAttribute("fdmsg");
			  	
				Format f = new SimpleDateFormat("HH.mm.ss");
				String time = f.format(new Date());
			
			  %>
			  <% if(fa != null || su !=null){ %>
			  <div class="toast-container position-fixed bottom-0 end-0 me-2 mb-3 p-0 toast" role="alert" aria-live="assertive" aria-atomic="true">
			  <div class="toast-header pb-1 mb-0">
			     <c:if test="${not empty umsg}">
			      <strong class=" text-success"><i class="fa-solid fa-circle-check me-2 fa-beat"></i>Update Message</strong>
			      </c:if>
			    
			      <c:if test="${ not empty fumsg}">
			      <strong class="me-auto text-danger "><i class="fa-solid fa-circle-xmark fa-beat me-2"></i>Update Message</strong>
			      </c:if>
			      <small class="ms-4"><%= time%></small>
			   	 <button type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
			      
			  </div>
			   <c:if test="${not empty umsg}">
			    <div class="toast-body text-success  m-0 p-auto text-center ">
			      ${umsg}
			    </div> 
			    <c:remove var="umsg" scope="session"/>
			    </c:if>
			    <c:if test="${ not empty fumsg}">
			    <div class="toast-body text-danger p-1 m-0 text-center">
			      ${fumsg}
			    </div>
			    <c:remove var="fumsg" scope="session"/>
			    </c:if>
			</div>
			<%} %>
			
			  <% if(dfa != null || dsu !=null){ %>
			  <div class="toast-container position-fixed bottom-0 end-0 me-2 mb-3 p-0 toast" role="alert" aria-live="assertive" aria-atomic="true">
			  <div class="toast-header pb-1 mb-0">
			     <c:if test="${not empty dmsg}">
			      <strong class=" text-success"><i class="fa-solid fa-circle-check me-2 fa-beat"></i>Delete Message</strong>
			      </c:if>
			    
			      <c:if test="${ not empty fdmsg}">
			      <strong class="me-auto text-danger "><i class="fa-solid fa-circle-xmark fa-beat me-2"></i>Delete Message</strong>
			      </c:if>
			      <small class="ms-4"><%= time%></small>
			   	 <button type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
			      
			  </div>
			   <c:if test="${not empty dmsg}">
			    <div class="toast-body text-success  m-0 p-auto text-center ">
			      ${dmsg}
			    </div> 
			    <c:remove var="dmsg" scope="session"/>
			    </c:if>
			    <c:if test="${ not empty fdmsg}">
			    <div class="toast-body text-danger p-1 m-0 text-center">
			      ${fdmsg}
			    </div>
			    <c:remove var="fdmsg" scope="session"/>
			    </c:if>
			</div>
			<%} %>
	
	<h3 class = "text-center m-3 text-success">All Student</h3>
	
	 <div class="pb-5 p-2">
	<table class="table table-striped text-center border">
	<thead class="bg-primary text-white">
  		<tr>
  			<th scope = "col">SID</th>
  			<th scope = "col">Name</th>
  			<th scope = "col">Email</th>
  			<th scope = "col">Mobile No.</th>
  			<th scope = "col">Password</th>
  			<th scope = "col">Exam</th>
  			<th scope = "col">Exam Status</th>
  			<th scope = "col">Address</th>
  			
  			<th scope = "col">Action</th>
  		</tr>
  		</thead>
	<%
		UserDaoImp udi = new UserDaoImp(Conpro.getCon());
		List<User> list = udi.allStudent();
		
		for(User user: list){
	%>
  		<tr>
  			<td scope = "row"><%=user.getSid() %></td>
  			<td scope = "row"><%=user.getName() %></td>
  			<td scope = "row"><%=user.getEmail() %></td>
  			<td scope = "row"><%=user.getMobile() %></td>
  			<td scope = "row"><%=user.getPassword() %></td>
  			<td scope = "row"><%=user.getExam() %></td>
  			<td scope = "row"><%=user.getExamstatus()%></td>
  			<td scope = "row"><%=user.getAddress() %></td>
  			<td scope = "row">
			  <a href = "EditStuDet.jsp?sid=<%=user.getSid() %>" class = "btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square me-2"></i>Edit</a>
			
			<!-- Button trigger modal -->
			
		      <button type="button" class="btn btn-danger mt-1" data-bs-toggle="modal" data-bs-target="#staticBackdrop<%=user.getSid()%>"><i class="fa-solid fa-trash-can me-2"></i>Delete</button>
		      
		      <!-- Modal -->
		      
		<div class="modal fade" id="staticBackdrop<%=user.getSid()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">Are you sure...?</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        You want to delete the Student detail?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">No</button>
		        <a class="btn btn-danger" href="../DeleteStu?sid=<%=user.getSid()%>">Delete</a>
		      </div>
		    </div>
		  </div>
		</div>
  			</td>
  		</tr>
  		<%} %>
  		
  		
	</table>

	</div>
	<script type="text/javascript" src="../allcomponent/main.js"></script>
 <div class="fixed-bottom ">
	<%@include file="Footer.jsp"%>
</div>
</body>
</html>