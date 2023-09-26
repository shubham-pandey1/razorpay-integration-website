<%@page import="java.security.spec.PSSParameterSpec"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page isELIgnored="false" %> 

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	
</style>
<meta charset="UTF-8">
<title>Online: Add Question</title>
<%@include file="../allcomponent/allCss.jsp" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body class="bg-body-secondary">



	<%@include file="Navbar.jsp" %>
	
	
	<c:if test="${empty admin }">
		<c:redirect url="index.jsp"/>
	</c:if>
	
	 <%
	 		
	 
	 	String eid,eid1,eid2;
	 	eid1 = request.getParameter("eid");
	 	
		eid2 = (String)session.getAttribute("id");
		
		if(eid1 != null) eid = eid1;
		else eid = eid2;
	 
	%> 
	<%
		String pass = (String)session.getAttribute("admin");
		if(!pass.equals("(gMlQC8N?n:a1\"7!rL^s"))
				response.sendRedirect("../index.jsp");
	%>
	
	<c:if test="${not empty famsg}">
		<div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
		   ${famsg }
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<c:remove var="famsg" scope="session"/>
	</c:if>
	<c:if test="${not empty amsg}">
		<div class="alert alert-success alert-dismissible fade show text-center" role="alert">
		   ${amsg}
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<c:remove var="amsg" scope="session"/>
	</c:if>
	
	<div class="container my-3 px-0 mb-5 pb-3">
		<div class="row px-0">
			<div class="col-md-12">
				<div class="card px-0">
					<div class="card-body">
						<h4 class="text-center text-success">Add Question</h4>
						<%--  <c:if test="${not empty smsg}">
						 <h6 class="text-center text-success">${smsg}</h6>
						 <c:remove var="smsg" scope="session"/>
						 </c:if>
						 <c:if test="${not empty fmsg}">
							 <p class="text-center text-danger">${fmsg}</p>
							 <c:remove var="fmsg" scope="session"/>
						 </c:if> --%>
						  <form action="../AddQuest?eid=<%=eid %>" method="post">
							<div class="mb-2">
								<label for="bname" class="form-label">Question </label> <input
									type="text" class="form-control" id="formGroupExampleInput"
									placeholder="Question" name="question" required>
							</div>
							<div class="mb-2">
								<label for="aname" class="form-label">Option a: </label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Option a" name="a" required>
							</div>
							<div class="mb-2">
								<label for="price" class="form-label">Option b:</label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Option b" name="b" required>
							</div>
							<div class="mb-2">
								<label for="btype" class="form-label">Option c: </label> 
								<input type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Option c" name="c" required>
							</div>
							<div class="mb-2">
								<label for="btype" class="form-label">Option d: </label> 
								<input type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Option d" name="d" required>
							</div>
						<div class="col-md-12">
						
						  <div class="row mb-3">
						    <label for="inputState" class="col-sm-2 col-form-label">Answer:</label>
						    <div class="col-sm-4">
						    <select id="option" class="form-select" name="option">
						      <option selected>---Select---</option>
						      <option value="a">A</option>
						      <option value="b">B</option>
						      <option value="c">C</option>
						      <option value="d">D</option>
						    </select>
						    </div>
						  </div>
						  </div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-primary m-2 col-md-2" onclick="check()">Add</button>
								<button type="reset" class="btn btn-danger ms-3 m-2 col-md-2">Reset</button>
							</div>
						</form>
						<c:remove var="id" scope="session"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		const bsAlert = new bootstrap.Alert('.alert')
			setTimeout(() => {
				bsAlert.close();
			}, 3000);
	</script>
	
	<script type="text/javascript" src="../allcomponent/validquest.js"></script>
	<div class="fixed-bottom">
		<%@include file="Footer.jsp" %>
	</div>
</body>
</html>