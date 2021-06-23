<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>


			
				<nav class="navbar nvbar-expand-md navbar-dark bd-dark flex-md-column
				 flex-row align-items-center py-2 text-center sticky-top" id="slidebar">
				 
					<div class="text-center p-4">
						<img src="${ pageContext.request.contextPath }/views/storage/${sessionScope.user.photo}"
						 alt="profile picture" 
						 class="img-fluid rounded-circle my-4 p-1 d-none d-md-block shadow">
					</div>
					<!-- chuoi dai hon 22 substring -->
					<i class="navbar-brand mx-0 font-weight-bold text-nowrap">Hello,</i>
					<h3 class="navbar-brand mx-0 font-weight-bold text-nowrap">${sessionScope.user.username.length()>22
					?sessionScope.user.username.replace(sessionScope.user.username.substring(20),"..."):sessionScope.user.username}</h3>
						
						
					<!--USERS  -->
					<nav class="navbar navbar-dark bg-dark">
					   <div class="container-fluid">
					      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent3" aria-controls="navbarToggleExternalContent3" aria-expanded="false" aria-label="Toggle navigation">
					      	<i class="fa fa-address-card"></i> USERS
					      </button>
					   </div>
					</nav>
					<div class="collapse" id="navbarToggleExternalContent3">
						   <div class="bg-dark p-4">
						     	<ul class="navbar-nav flex-column w-100 justify-content-center">
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/users" class="nav-link active">User List</a>
									</li>
									
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/users/create" class="nav-link active">Create User</a>
									</li>
								</ul>
						   </div>
					</div>
					
					
					<!--ORDERS  -->
					<nav class="navbar navbar-dark bg-dark">
					   <div class="container-fluid">
					      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent4" aria-controls="navbarToggleExternalContent4" aria-expanded="false" aria-label="Toggle navigation">
					      	<i class="fa fa-truck"></i> ORDERS
					      </button>
					   </div>
					</nav>
					<div class="collapse" id="navbarToggleExternalContent4">
						   <div class="bg-dark p-4">
						     	<ul class="navbar-nav flex-column w-100 justify-content-center">
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/orders" class="nav-link active">Order List</a>
									</li>
								</ul>
						   </div>
					</div>
								
								
					<!--PRODUCTS  -->
					<nav class="navbar navbar-dark bg-dark">
					   <div class="container-fluid">
					      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent2"
					       aria-controls="navbarToggleExternalContent2" aria-expanded="false" aria-label="Toggle navigation">
					      		<i class="fa fa-balance-scale"></i> PRODUCTS
					      </button>
					   </div>
					</nav>
					<div class="collapse" id="navbarToggleExternalContent2">
						   <div class="bg-dark p-4">
						     	<ul class="navbar-nav flex-column w-100 justify-content-center">
									
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/products" class="nav-link active">Product List</a>
									</li>
									
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/products/create" class="nav-link active">Create Product</a>
									</li>
									
								</ul>
						   </div>
					</div>	
				
						<!--CATEGORIES  -->
					<nav class="navbar navbar-dark bg-dark">
					   <div class="container-fluid">
					      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent1"
					       aria-controls="navbarToggleExternalContent1" aria-expanded="false" aria-label="Toggle navigation">
					      		<i class="fa fa-book"></i> CATEGORIES
					      </button>
					   </div>
					</nav>
					<div class="collapse" id="navbarToggleExternalContent1">
						   <div class="bg-dark p-4">
						     	<ul class="navbar-nav flex-column w-100 justify-content-center">
									
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/categories" class="nav-link active">Category List</a>
									</li>
									
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/categories/create" class="nav-link active">Create Category</a>
									</li>
									
								</ul>
						   </div>
					</div>
					
					
					
					
					<!--RECYCLE BIN  -->
					<nav class="navbar navbar-dark bg-dark">
					   <div class="container-fluid">
					      <button  class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent5" aria-controls="navbarToggleExternalContent5" aria-expanded="false" aria-label="Toggle navigation">
					     		<i class="fa fa-trash-o"></i> RECYCLE BIN
					      </button>
					   </div>
					</nav>
					<div class="collapse" id="navbarToggleExternalContent5">
						   <div class="bg-dark p-4">
						     	<ul class="navbar-nav flex-column w-100 justify-content-center">
									
									
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/users/recycle-bin" class="nav-link active">User</a>
									</li>
									
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/products/recycle-bin" class="nav-link active">Product</a>
									</li>
									
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/categories/recycle-bin" class="nav-link active">Category</a>
									</li>
									
									<li class="nav-item">
										
										<!--<a href="#" class="nav-link active">Order</a>  -->
									</li>
								</ul>
						   </div>
					</div>	
					
						<!--REPORT  -->	
					<nav class="navbar navbar-dark bg-dark">
					   <div class="container-fluid">
					      <button  class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent6" aria-controls="navbarToggleExternalContent6" aria-expanded="false" aria-label="Toggle navigation">
					     		<i class="fa fa-bar-chart"></i> REPORT
					      </button>
					   </div>
					</nav>
					<div class="collapse" id="navbarToggleExternalContent6">
						   <div class="bg-dark p-4">
						     	<ul class="navbar-nav flex-column w-100 justify-content-center">
									
									<li class="nav-item">
										<a href="${ pageContext.request.contextPath }/admin/reports/chart" class="nav-link active">Product</a>
									</li>
									
								</ul>
						   </div>
					</div>	
					
					
					
						<!--Logout  -->	
					<nav class="navbar navbar-dark bg-dark">
						  <div class="container-fluid">
						    <a class="navbar-brand" href="${ pageContext.request.contextPath }/logout" 
						    style ="font-family:courier,arial,helvetica;">Logout</a>
						  </div>
					</nav>
					
					
					<!--  -->	
				</nav>
				
		
	

	

</html>

