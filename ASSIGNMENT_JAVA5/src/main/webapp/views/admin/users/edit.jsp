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
	
	<div class="container-fluid">
		<div class="row min-vh-100 flex-column flex-md-row">
			<asdie class="col-12 col-md-3 col-xl-2 p-0 bg-dark flex-shrink-1">
				<jsp:include page="/views/layout/nav_ad.jsp"></jsp:include>
			</asdie>
			
			
			<main class="col px-0 flex-grow-1">
				<div class="container py-3">
					<article>
					
					
						<h1 class="text-center">Update User</h1>
						<div class="mt-5 col-10 offset-1">
							<form:form
								enctype="multipart/form-data"
								modelAttribute="user"
								method="POST"
								action="${ pageContext.request.contextPath }/admin/users/update/${user.id}">
								
								
								<div class="form-group mt-3">
									<label for="username">Name</label>
								    <form:input  path="username" class="form-control" id="username"  autocomplete="off" />
								    <form:errors path="username" element="span" cssClass="text-danger" />
								</div>
								
								<div class="form-group mt-3">
									<label for="email">Email</label>
								    <form:input  path="email" class="form-control" id="email"  autocomplete="off" />
								   	<form:errors path="email" element="span" cssClass="text-danger" />
								</div>
								
								<div class="form-group mt-3" >
									<!--  -->
									<input name="password" value="${user.password}"  class="form-control" id="password" autocomplete="off"  type="hidden"/>
								    <!--<form:errors path="password" element="span" cssClass="text-danger" />  -->
								</div>
								
								
								<div class="form-group mt-3">
									<label for="admin">Role</label>
									<form:select path="admin" id="admin" class="form-control" >
										<form:option value="1" >Admin</form:option>
										<form:option value="0" >Member</form:option>
									</form:select>
									<form:errors path="admin" element="span" cssClass="text-danger" />
								</div>
								
								<div class="form-group mt-3">
									<div id="displayImg" >
				
									</div>	
									<label for="photo">Image</label>
									<input name="photo" type="file"  class="form-control" 
									id="photo" accept=".jpeg, .png, .jpg, .gif" onchange="ImageFileURL()"
									/>
								     <form:errors path="photo" element="span" cssClass="text-danger" />
								</div>
								
								
								
								<div class="form-group mt-3">
									<label for="activated">Activated</label>
									<form:select path="activated" id="activated" class="form-control" >
										<form:option value="1" >Active</form:option>
										<form:option value="0" >Inactive</form:option>
									</form:select>
									<form:errors path="activated" element="span" cssClass="text-danger" />
								</div>
								
								<div class="form-group mt-3">
									<button class="btn btn-primary">Submit</button>
									<button type="reset" class="btn btn-danger">Clear</button>
								</div>
							</form:form>
						</div>
 					
 				
 				
 				
 				
 				
 				
					</article>
				</div>
			</main>
		
		</div>
	</div>
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