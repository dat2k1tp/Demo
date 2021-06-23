<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
	<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row min-vh-100 flex-column flex-md-row">
			<asdie class="col-12 col-md-3 col-xl-2 p-0 bg-dark flex-shrink-1">
				<jsp:include page="/views/layout/nav_ad.jsp"></jsp:include>
			</asdie>
			
			
			<main class="col px-0 flex-grow-1">
				<div class="container py-3">
					<article>
				<!--Content  -->
 				<!--End content  -->
					</article>
				</div>
			</main>
		
		</div>
	</div>
	
 

	
</body>
</html>




<!--<form:form action="${pageContext.request.contextPath}/upload-hello"
	method="post"
	enctype="multipart/form-data">
	<div class="form-group mt-3">
				<label for="photo">Image</label>
			    <input type="file"  class="form-control" id="avatar" name="upload_file">
			    
			</div>
	<button>Submit</button>
	</form:form>  -->
<!--
<button type="button" class="navbar-toggler border-0 order-1"
					data-toggler="collapse" data-target="#nav" aria-controls="nav"
					aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					
<ul class="nav justify-content-center">
						<li class="nav-item">
							<a href="#" class="nav-link text-white"><i class="fab fa-twitter-square fa-lg"></i>d</a>
						</li>
						<li class="nav-item">
							<a href="#" ><i class="fab fa-facebook"></i>d</a>
						</li>
					</ul>  -->