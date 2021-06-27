<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
	<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		img{
			width: 90px;
			height: 80px;
		}
		
	</style>
</head>
<body>
	
	
					<jsp:include page="/views/layout/nav_us.jsp"></jsp:include>
					
						<h1 class="text-center">Edit Profile</h1>
						<div class="mt-5 col-10 offset-1">
							<form:form
								enctype="multipart/form-data"
								modelAttribute="user"
								method="POST"
								action="${ pageContext.request.contextPath }/member/account/update/${user.id}">
								
								
								<div class="form-group mt-3">
									<label for="username">Name</label>
								    <form:input  path="username" class="form-control" id="username"  autocomplete="off" />
								    <form:errors path="username" element="span" cssClass="text-danger" />
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
									<div id="displayImg" >
				
									</div>	
									<label for="photo">Image</label>
									<form:input path="photo" type="file"  class="form-control" 
									id="photo" accept=".jpeg, .png, .jpg, .gif" onchange="ImageFileURL()"
									/>
									<form:errors path="photo" element="span" cssClass="text-danger" />
									<span class="text-warning">${photoError}</span>
								     
								</div>
								
								
								
								
								
								<div class="form-group mt-3">
									<button class="btn btn-primary">Submit</button>
									<a  class="btn btn-danger" href="${ pageContext.request.contextPath }/member/account/edit/${user.id}">Clear</a>
								</div>
							</form:form>
						</div>
 					
 				
 			<jsp:include page="/views/layout/footer.jsp"></jsp:include>		
 				
 				
 				
	<script type="text/javascript">
		function ImageFileURL() {
			var fileSelected=document.getElementById('photo').files;
			//check xem co null
			if(fileSelected.length>0){
				//lay phan tu dau tien tim thay
				var fileToLoad=fileSelected[0];
				//tao doi tuong doc  file img
				var fileReader= new FileReader();
				fileReader.onload=function(fileLoaderEvent){
					//convert base 64
					var srcData=fileLoaderEvent.target.result;
					//hien thi anh
					var newImage=document.createElement('img');
					newImage.src=srcData;
					document.getElementById('displayImg').innerHTML=newImage.outerHTML;
				}
				fileReader.readAsDataURL(fileToLoad);
			}
		}
	
	
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>