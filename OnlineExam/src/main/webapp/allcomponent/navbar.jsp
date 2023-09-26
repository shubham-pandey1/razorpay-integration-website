<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page isELIgnored="false" %>
<style>

nav{
	background: rgb(3,15,228);
	background: -moz-linear-gradient(0deg, rgba(3,15,228,1) 0%, rgba(46,67,252,1) 100%);
	background: -webkit-linear-gradient(0deg, rgba(3,15,228,1) 0%, rgba(46,67,252,1) 100%);
	background: linear-gradient(0deg, rgba(3,15,228,1) 0%, rgba(46,67,252,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#030fe4",endColorstr="#2e43fc",GradientType=1);
}
 
	a:hover{
		transform: scale(1.1);
	}

</style>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand text-light" href="home1.jsp"><i class="fa-solid fa-book-open-reader me-2 ms-2"></i>Online Examination</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <c:if test="${not empty user }">
    <form class="d-flex ">
        
       
        <!-- Button trigger modal -->
<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
  <i class="fa-solid fa-right-from-bracket me-2"></i>Logout
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Logout</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Are you sure you want to Logout?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a  class="btn btn-danger" href="StuLogout">Yes</a>
      </div>
    </div>
  </div>
</div>
         
      </form>
      </c:if>
  </div>
</nav>