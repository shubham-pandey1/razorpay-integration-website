<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flood: Relief</title>
<%@ include file="allcomponent/allCss.jsp" %>
<style type="text/css">
	.backimg {
	
	background-image: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7) ), url("image/flood.jpg");
	height: 70vh;
	min-height: 400px;
	width: 100%;
	Background-repeat: no-repeat;
	background-size: cover;
	position: relative;
	
	font-family: 'Montserrat', sans-serif;
}
	.head{
		font-size: 60px;
		font-weight: 600;
	}
	
	.back {
	background: rgb(63,94,251);
	background: -moz-radial-gradient(circle, rgba(63,94,251,1) 0%, rgba(252,70,107,1) 100%);
	background: -webkit-radial-gradient(circle, rgba(63,94,251,1) 0%, rgba(252,70,107,1) 100%);
	background: radial-gradient(circle, rgba(63,94,251,1) 0%, rgba(252,70,107,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#3f5efb",endColorstr="#fc466b",GradientType=1);
}
	.image{
		
		width: 550px;
		border-radius: 30px;
	}
	
	.bg{
		background: rgb(232, 232, 235);
		
	}
</style>
</head>
<body class="back">
	<%@ include file="allcomponent/navbar.jsp" 
	%>
	
	<div class="backimg">
		<div class="text-center text-light">
			<p class="head pt-3">Let's kind for <br>
			People affected by <br>
			Flood</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do <br> eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
		</div>
	</div>
	<div class="container">
		<div class="row mt-3 mb-5 p-0">
			<h3 class="text-white text-center">Your small effort make</h3>
			<h3 class="text-white text-center">their life Good</h3>
			<div class="col-md-6 mt-3 rounded-4 me-2">
				<img alt="flood" src="image/floodb.jpg" class="image">
			</div>
			<div class="col-md-5 mt-3 rounded-4 bg ms-3 p-4">
				<h4 class="text-primary text-center mb-3"><i class="fa-solid fa-hand-holding-dollar me-2"></i>Donate Us<i class="fa-solid fa-house-flood-water ms-2"></i></h4>
				<div class="mt-2">
					
					  <div class="mb-3">
					    <label for="exampleInputEmail1" class="form-label">Name: </label>
					    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name" required="required">
					    
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputPassword1" class="form-label">Amount</label>
					    <input type="number" class="form-control" id="amt" name = "amount">
					  </div>
					  <div class="text-center">
					  <button class="btn btn-success col-md-5 me-2" onclick="paymentStart()">Pay</button>
					  <button type="reset" class="btn btn-primary col-md-5 ms-2">Reset</button>
					  </div>
					
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript" src= "allcomponent/main.js"></script>
<%@ include file="allcomponent/Footer.jsp" %>
</body>
</html>