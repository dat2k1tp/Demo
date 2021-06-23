<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Show</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
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
							
							
							
						<div class="col-10 offset-1">
								<div>
									<label class="col-4">Name</label>
									<label class="col-6">${user.username}</label>
								</div>
								<div>
									<label class="col-4">Email</label>
									<label class="col-6">${user.email}</label>
								</div>
								<div>
									<label class="col-4">Activated</label>
									<label class="col-6">${user.activated==1?"Active":"Inactive"}</label>
								</div>
								<div>
									<label class="col-4">Name</label>
									<label class="col-6">${user.admin==1?"Admin":"Member"}</label>
								</div>
						</div>
					
					
					
					
					
 				
					</article>
				</div>
			</main>
		
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>	
</body>
</html>