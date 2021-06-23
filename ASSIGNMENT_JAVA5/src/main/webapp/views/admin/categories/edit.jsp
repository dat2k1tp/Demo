<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
	<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
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
					
					
				<!--contents  -->
						<h1 class="text-center">Update Category</h1>
						<div class="mt-5 col-10 offset-1">
							<form:form
								modelAttribute="category"
								method="POST"
								action="${ pageContext.request.contextPath }/admin/categories/update/${category.id}">
								
								
									<div class="form-group mt-3">
										<label for="name">Name</label>
									    <form:input  path="name" class="form-control" id="name"  autocomplete="off" />
									    <form:errors path="name" element="span" class="text-danger" />
									</div>
									<div class="form-group mt-3">
										<button class="btn btn-primary">Submit</button>
										<button type="reset" class="btn btn-danger">Clear</button>
									</div>
								
							</form:form>
						</div>
				
				
 				<!--end contents  -->
 				
					</article>
				</div>
			</main>
		
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>