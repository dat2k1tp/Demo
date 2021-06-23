<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
</head>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	
	    <div class="container-fluid">
	        <a class="navbar-brand" href="${ pageContext.request.contextPath }/home">
	        <i class="fa fa-credit-card"></i>  SHOPPING NOW</a>
	      
			
	      		
	          <!--  -->
	           <div class="d-flex">
	           
	               	<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
						  <a class="navbar-brand" href="${ pageContext.request.contextPath }/member/cart"> <i class="fa fa-shopping-cart"> Cart</i></a>
						  
						  <ul class="navbar-nav">
						     <li class="nav-item dropdown">
						         <a class="nav-link dropdown-toggle active" href="#" id="navbarDarkDropdownMenuLink" 
						         role="button" data-bs-toggle="dropdown" aria-expanded="false">
						         		 <i class="fa fa-user-circle"></i> Xin chào ! ${sessionScope.user==null?"ACOUNT MANAGENMENT":(sessionScope.user.username.length()>22
											?sessionScope.user.username.replace(sessionScope.user.username.substring(20),"..."):sessionScope.user.username)}
						         </a>
						         <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
						         <c:if test="${not empty sessionScope.user}">
	 								<li><a class="dropdown-item" href="${ pageContext.request.contextPath }/member/account/orders">Order</a></li>
						            <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/member/account/edit/${sessionScope.user.id}">Edit Profile</a></li>
						            <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/member/account/edit/${sessionScope.user.id}">Change Password</a></li>
						            <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/logout">Logout</a></li>
	 								
	 							</c:if>
						            
						             <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/login">Login</a></li>
						           
						         </ul>
						     </li>
						  </ul>
						  
					</div>
					
	            </div>
	            
	        </div>
	         
	    
	</nav>


</html>