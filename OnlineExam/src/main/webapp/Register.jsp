<%@page import="com.db.Conpro"%>
<%@page import="com.daoImp.ExamDaoImp"%>
<%@page import="com.entity.Exam"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored= "false" %>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>
<%@include file="allcomponent/allCss.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
	
</style>
</head>
<body class="bg-body-secondary">
	<%@include file="allcomponent/navbar.jsp"%>
			
	<div class="container mt-4 mb-4 pb-4">
		<div class="row mb-2 justify-content-center">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body round-2">
						<h2 class ="text-center text-danger">Enter Registration Details</h2>
						
						<form class="row g-3" id="register">
						  <div class="col-md-6">
						    <label for="inputEmail4" class="form-label">Name:</label>
						    <input type="text" class="form-control" id="name" name= "name" required="required">
						  </div>
						  <div class="col-md-6">
						    <label for="inputPassword4" class="form-label">Email:</label>
						    <input type="email" class="form-control" id="email" name= "email" required="required">
						  </div>
						  <div class="col-md-6">
						    <label for="inputEmail4" class="form-label">Phone:</label>
						    <input type="number" class="form-control" id="phone" name= "phone" required="required">
						  </div>
						  <div class="col-md-6">
						    <label for="inputPassword4" class="form-label">Password:</label>
						    <input type="password" class="form-control" id="pass" name= "pass" required="required">
						  </div>
						  <div class="col-12">
						    <label for="inputAddress" class="form-label">Address</label>
						    <input type="text" class="form-control" id="address" placeholder="1234 Main St" name= "address"  required="required">
						  </div>
						  
						  <div class="col-md-4">
						    <label for="inputState" class="form-label">Exam:</label>
						    <select id="exam" class="form-select" name="exam">
						      <option selected>---Select---</option>
						      <%
						      		List<Exam> list = new ExamDaoImp(Conpro.getCon()).exames();
						      		for(Exam exam: list){
						      %>
						      
						      <option value="<%=exam.getEid() %>"><%=exam.getEid()+" "+ exam.getName() %> </option>
						      
						      <%} %>
						    </select>
						  </div>
						  
						  <div class="col-12">
						    <div class="form-check">
						      <input class="form-check-input" type="checkbox" id="accept" name="term" value="yes">
						      <label class="form-check-label" for="gridCheck">
						        I accept terms and conditions
						      </label>
						    </div>
						  </div>
						  <div class="col-12 text-center">
						    <button type="submit" class="btn btn-success col-md-3" onclick="checkbox()" >Submit</button>
						    <button type="reset" class="btn btn-warning ms-2 col-md-3">Reset</button>
						  </div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript" src="allcomponent/main.js"></script>
	<script type="text/javascript" src="allcomponent/stureg.js"></script>
	
	<div class="fixed-bottom">
	<%@include file= "allcomponent/Footer.jsp" %>
	</div>
</body>
</html>