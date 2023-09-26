<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.db.Conpro"%>
<%@page import="com.daoImp.QuestDaoImp"%>
<%@page import="com.entity.Question"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Online: Edit Question</title>
<%@include file="../allcomponent/allCss.jsp" %>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.28/sweetalert2.min.js"
	integrity="sha512-CyYoxe9EczMRzqO/LsqGsDbTl3wBj9lvLh6BYtXzVXZegJ8VkrKE90fVZOk1BNq3/9pyg+wn+TR3AmDuRjjiRQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
	
<%
	String eid,qid,opt;
	eid = request.getParameter("eid");
	qid = request.getParameter("qid");
	
	Question quest = new QuestDaoImp(Conpro.getCon()).getQuestion(qid, eid);
	opt = quest.getAnswer();
%>
<div class="container mt-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card px-0">
					<div class="card-body">
						<h4 class="text-center text-success">Edit Question</h4>
						
						  <form action="../UpdateQuest?eid=<%=eid %>&qid=<%=qid %>" method="post" >
							<div class="mb-2">
								<label for="bname" class="form-label">Question </label> <input
									type="text" class="form-control" id="formGroupExampleInput"
									placeholder="Question" name="question" value="<%=quest.getQuest() %>" required>
							</div>
							<div class="mb-2">
								<label for="aname" class="form-label">Option a: </label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Option a" name="a" value="<%=quest.getOptiona() %>" required>
							</div>
							<div class="mb-2">
								<label for="price" class="form-label">Option b:</label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Option b" name="b" value="<%=quest.getOptionb() %>" required>
							</div>
							<div class="mb-2">
								<label for="btype" class="form-label">Option c: </label> 
								<input type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Option c" name="c" value="<%=quest.getOptionc() %>" required>
							</div>
							<div class="mb-2">
								<label for="btype" class="form-label">Option d: </label> 
								<input type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Option d" name="d" value="<%=quest.getOptiond() %>" required>
							</div>
							<div class="col-md-12">
						
						  <div class="row mb-3">
						    <label for="inputState" class="col-sm-1 col-form-label">Answer:</label>
						    <div class="col-sm-3">
						    <select id="option" class="form-select" name="option">
						      <option >---Select---</option>
						      <option value="a" <%if(opt.equalsIgnoreCase("a")){ %>selected="selected" <%} %>>A</option>
						      <option value="b" <%if(opt.equalsIgnoreCase("b")){ %>selected="selected" <%} %>>B</option>
						      <option value="c" <%if(opt.equalsIgnoreCase("c")){ %>selected="selected" <%} %>>C</option>
						      <option value="d" <%if(opt.equalsIgnoreCase("d")){ %>selected="selected" <%} %>>D</option>
						    </select>
						    </div>
						  </div>
						  </div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-primary m-2 col-md-2" onclick="check()">Update</button>
								<button type="reset" class="btn btn-danger ms-3 m-2 col-md-2">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../allcomponent/validquest.js"></script>
<div >
	<%@ include file="Footer.jsp"%>
</div>

</body>
</html>