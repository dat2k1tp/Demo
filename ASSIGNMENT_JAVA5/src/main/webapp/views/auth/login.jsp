<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
	
</head>
<body style="
    background-image: url('https://mdbcdn.b-cdn.net/img/Photos/Others/images/76.jpg');
    height: 100vh; 
  ">

	<!-- nav -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">My Assignment</a>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	       
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<div class="col-10 offset-1 mt-5">
	 <c:if test="${not empty sessionScope.error}">
	 	<div class="alert alert-danger">${sessionScope.error}</div>
	 	<c:remove var="error" scope="session" />
	 </c:if> 
	
	<div class="row" >
   		<div class="col-12">
       		<div class="col-6 offset-3">
       		
				<form method="post" action="${ pageContext.request.contextPath }/login">
					<div class="mt-3">
						<label for="email">Email</label>
						<input type="email" name="email" id="email" class="form-control" />
					</div>
	
					<div class="mt-3">
						<label for="password">Password</label>
						<input type="password" name="password" id="password" class="form-control" />
					</div>
	
					<div class="mt-3">
						<button type="submit" class="btn btn-secondary">Login</button>
					</div>
					
					
					 <a style = "font-family:courier,arial,helvetica;text-decoration: none;float:right;color:white;"
					 class="fst-italic fs-5" 
					href="${ pageContext.request.contextPath }/register"><b>Register</b></a>
					
				
				</form>
				
			</div>
		</div>
	</div>
	
</div>
	<jsp:include page="/views/layout/footer.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	 crossorigin="anonymous"></script>
</body>
</html>