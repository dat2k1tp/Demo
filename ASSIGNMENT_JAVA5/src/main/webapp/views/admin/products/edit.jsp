<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
					
					
				<!--contents  -->
						<h1 class="text-center">Update Product </h1>
						<div class="mt-5 col-10 offset-1">
							<form:form
								enctype="multipart/form-data"
								modelAttribute="product"
								method="POST"
								action="${ pageContext.request.contextPath }/admin/products/update/${product.id}">
									
									<div class="form-group mt-3">
									<label for="categoryId">Category</label>
									<form:select path="categoryId" id="categoryId" class="form-control" >
										<c:forEach items="${categories}" var="categories">
											<form:option value="${categories.id}">${categories.name}</form:option>
										</c:forEach>
									</form:select>
									<form:errors path="categoryId" element="span" cssClass="text-danger" />
								</div>
								
								<div class="form-group mt-3">
									<label for="name">Name</label>
								    <form:input  path="name" class="form-control" id="name"  autocomplete="off" />
								    <form:errors path="name" element="span" cssClass="text-danger" />
								</div>
								
								<div class="form-group mt-3">
									<div id="displayImg" >
				
									</div>	
									<label for="image">Image</label>
									<form:input path="image" type="file"  class="form-control" 
									id="image" accept=".jpeg, .png, .jpg, .gif" onchange="ImageFileURL()"
									/>
									<span class="text-warning">${imageError}</span>
								    <form:errors path="image" element="span" cssClass="text-danger" />
								</div>
								
								<div class="form-group mt-3">
									<label for="price">Price</label>
								    <form:input  path="price" class="form-control" id="price"  autocomplete="off" />
								    <form:errors path="price" element="span" cssClass="text-danger" />
								</div>
								
								<div class="form-group mt-3">
									<label for="createDate">Date</label>
								    <form:input  path="createDate" class="form-control" id="createDate"  autocomplete="off" readonly="true"/>
								    <form:errors path="createDate" element="span" cssClass="text-danger" />
								</div>
								
								<div class="form-group mt-3">
									<label for="available">Available</label>
								    <form:input type="number" path="available" class="form-control" id="available"  autocomplete="off" />
								    <form:errors path="available" element="span" cssClass="text-danger" />
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
	
	<script type="text/javascript">
		function ImageFileURL() {
			var fileSelected=document.getElementById('image').files;
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