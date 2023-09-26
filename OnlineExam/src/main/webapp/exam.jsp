<%@page import="com.db.Conpro"%>
<%@page import="com.daoImp.QuestDaoImp"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.Question"%>
<%@page import="com.entity.Exam"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored= "false" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Online: Exam</title>
<%@ include file="allcomponent/allCss.jsp"%>


<style type="text/css">
body {
	background: rgb(242, 245, 242);
}

form {
	font-weight: 500;
}

.info h5 {
	display: inline;
}

.final {
	background: rgb(106, 8, 156);
}

.final:hover {
	background-color: rgb(93, 6, 138) !important;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</head>
<body>
	<%@ include file="allcomponent/navbar.jsp"%>
	
	<c:if test="${empty user }">
		<c:redirect url="index.jsp"/>
	</c:if>
	
	<%
	User user = (User) session.getAttribute("user");
	Exam exam = (Exam) session.getAttribute("exam");
	List<Question> list = new QuestDaoImp(Conpro.getCon()).allQuestion(exam.getEid() + "");
	int noquest = new QuestDaoImp(Conpro.getCon()).noQuestion(user.getEid() + "");
	Question question = null;
	%>

	<div class="container-fluid mt-3 text-danger">
		<div class="row">
			<div class="col-md-4 ms-3">
				<h5>
					<%=user.getName()%></h5>
			</div>
			<div class="col-md-2 ms-auto ">
				<h6 class="text-center">Remaining time:</h6>
				<h6 class="text-center timer"></h6>
				<input type="number" class="duration" hidden="hidden"
					value="<%=exam.getDuration()%>">
				<div class="progress" role="progressbar"
					aria-label="Animated striped example" aria-valuenow="75"
					aria-valuemin="0" aria-valuemax="100">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated ani bg-danger"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt-4">

		<form id="question">
			<hr>
			<%
			if (list.size() > 0) {
				question = list.get(0);
			%>
			<input type="text" name="qid" class="qid"
				value="<%=question.getQid()%>" hidden="hidden"> <input
				type="text" name="total" class="total" value="<%=noquest%>"
				hidden="hidden"> 
				<label class="no">Ques. 1. </label> <label
				for="exampleFormControlInput1" class="form-label quest"><%=question.getQuest()%></label>
			<hr>
			<div class="form-check mb-2">
				<input class="form-check-input" type="radio" name="option"
					id="optiona" value="a"> <label class="form-check-label"
					for="optiona" id="oa"> <%=question.getOptiona()%>
				</label>
			</div>
			<div class="form-check mb-2">
				<input class="form-check-input" type="radio" name="option"
					id="optionb" value="b"> <label class="form-check-label"
					for="optionb" id="ob"> <%=question.getOptionb()%>
				</label>
			</div>
			<div class="form-check mb-2">
				<input class="form-check-input" type="radio" name="option"
					id="optionc" value="c"> <label class="form-check-label"
					for="optionc" id="oc"> <%=question.getOptionc()%>
				</label>
			</div>
			<div class="form-check mb-2">
				<input class="form-check-input" type="radio" name="option"
					id="optiond" value="d"> <label class="form-check-label"
					for="optiond" id="od"> <%=question.getOptiond()%>
				</label>
			</div>
			<%
			}
			%>
			<div class="row mt-5 pt-4" id="header">
				<div class="col-md-4 ms-3">
					<!-- Button trigger modal -->
					<button type="submit" class="final btn text-light"
						onclick="finalsubmit()">
						<i class="fa-solid fa-right-from-bracket me-2"></i> Submit Exam
					</button>
				</div>
				<div class="col-md-5 ms-auto ">
					<button class="btn btn-primary previous" type="submit"
						onclick="previous()">
						<i class="fa-solid fa-angles-left me-2"></i>Save and Previous
					</button>
					<button class="btn btn-success ms-4 next" type="submit"
						onclick="next()">
						Save and Next<i class="fa-solid fa-angles-right  ms-2"></i>
					</button>
				</div>
			</div>

		</form>

	</div>
	<script type="text/javascript" src="allcomponent/examjs.js"></script>
</body>
</html>