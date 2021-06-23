<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Form</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
	<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
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
	
<!-- 
	alert
 -->
 <div class="alert alert-${type}" role="alert">
  ${mess}
</div>


<div class="row" >
    <div class="col-12">
        <div class="col-6 offset-3">
        
        	<h2>Register</h2>
            <form:form
				method="POST"
				modelAttribute="user"
				action="${ pageContext.request.contextPath }/register/store">
								
					<div class="form-group mt-3">
						<label for="username">Name</label>
						<form:input  path="username" class="form-control" id="username"  autocomplete="off" />
						<form:errors path="username" element="span" cssClass="text-danger" />
					</div>
								
					<div class="form-group mt-3">
						<label for="email">Email</label>
						<form:input  path="email" class="form-control" id="email"  autocomplete="off" />
						<form:errors path="email" element="span" cssClass="text-danger" />
						<span class="text-danger">${errorEmail}</span>
					</div>
								
					<div class="form-group mt-3">
						<label for="password">Password</label>
						<form:password  path="password"  class="form-control" id="password" autocomplete="off"  />
						<form:errors path="password" element="span" cssClass="text-danger" />
					</div>
					
					<div class="form-group mt-3">
						<label for="passwordConfirm">Password ConFirm</label>
						<form:password  path="passwordConfirm"  class="form-control" id="passwordConfirm" autocomplete="off"  />
						<form:errors path="passwordConfirm" element="span" cssClass="text-danger" />
						<span class="text-danger">${errorPass}</span>
					</div>
										
					<div class="form-group mt-3">
						<button class="btn btn-primary">Submit</button>
						<a class="btn btn-danger" href="${ pageContext.request.contextPath }/register">Clear</a>
					</div>
					
					 <a style = "font-family:courier,arial,helvetica;text-decoration: none;float:right;"
				 class="fst-italic fs-5" 
				href="${ pageContext.request.contextPath }/login"><b>Login</b></a>
			</form:form>
			
        </div>
    </div>
</div>
		<!-- Footer -->
	<jsp:include page="/views/layout/footer.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
</body>
</html>