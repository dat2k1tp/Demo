<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
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
					
					
				<!--Content  -->
					<h1 class="text-center">Product List</h1>
					<div class="col-10 offset-1 mt-5 border border-dark p-2">
					
						<form method="get" action="${ pageContext.request.contextPath }/admin/products">
							<div class="row col-12 mt-2">
								<div class="col-4">
									<label>
										Danh mục
									</label>
									
									<select name="categoryId" class="form-select" aria-label="Default select example">
										<c:forEach items="${categories}" var="categories">
											<option ${categories.id==cateId?"selected":""} value="${categories.id}">${categories.name}</option>
										</c:forEach>
									</select>
									
								</div>
								
								<div class="col-4">
									<label>
											Sắp sếp theo
										</label>
										<select name="sort_by" class="form-select" aria-label="Default select example">
											<option ${sort_by=="id"?"selected":""} value="id">Mặc định</option>
											<option ${sort_by=="name"?"selected":""} value="name" >Name</option>
											<option ${sort_by=="price"?"selected":""} value="price">Price</option>
											<option ${sort_by=="createDate"?"selected":""} value="createDate">Date</option>
											<option ${sort_by=="available"?"selected":""} value="available">Available</option>
										</select>
								
								</div>
							
								<div class="col-4">
									<label>
										Thứ tự
									</label>
									<select name="sort_direction" class="form-select" aria-label="Default select example">
										<option ${sort=="asc"?"selected":""}  value="asc">Tăng dần</option>
										<option ${sort=="desc"?"selected":""} value="desc">Giảm dần</option>
									</select>
								</div>
						</div>
						
						
						<div>
							<button class="btn btn-primary mt-4" >Lọc</button>
							<a class="btn btn-danger mt-4" href="${ pageContext.request.contextPath }/admin/products">Reset</a>
						</div>
					</form>
					
					</div>
					<div class="mt-5 col-10 offset-1 border border-dark p-3 row">
						<div class="col-4">
							<a
								class="btn btn-success "
								href="${ pageContext.request.contextPath }/admin/products/create">Create</a>
						</div>
						<form class="d-flex col-6" method="post" action="${pageContext.request.contextPath}/admin/products?page=0&limit=3&categoryId=${cateId}&sort_direction=${sort}&sort_by=${sort_by}" style="margin-left: 30px;">
     					 	<input name="keyword" value="${sessionScope.keyword}"  class="form-control me-2" 
     					 	type="search" placeholder="Search" aria-label="Search">
     					 	<button class="btn btn-outline-success" type="submit">Search</button>
    					</form>
						<table class="table table-hover">
								<thead>
									<tr>
										<td>Id</td>
										<td>Name</td>
										<td>Image</td>
										<td>Price</td>
										<td>Date</td>
										<td>Available</td>
										<td colspan="2">Action</td>
									</tr>
								</thead>
								
								<tbody>
								<c:forEach items="${pageData.content}" var="product">
									<tr>
										<td>${product.id}</td>
										<td>${product.name}</td>
										<td>
											<img alt="" style="width: 100px; height: 60px;" 
											src="${ pageContext.request.contextPath }/views/storage/${product.image}">
										</td>
										<td>${product.price}</td>
										<td>${product.createDate}</td>
										<td>${product.available}</td>
										<td>
											<a
												class="btn btn-primary"
												href="${ pageContext.request.contextPath }/admin/products/edit/${product.id}">Update</a>
										</td>
										<td>
											<form action="${ pageContext.request.contextPath }/admin/products/soft-delete/${product.id}" method="POST">
												<button id="confirm" class="btn btn-danger" onclick="onClickHandle(event)">Delete</button>
											</form>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<div>
								<nav aria-label="Page navigation example">
								  <ul class="pagination">
								    <li class="page-item">
								    	<a class="page-link" href="${pageContext.request.contextPath}/admin/products?page=0&limit=3&categoryId=${cateId}&sort_direction=${sort}&sort_by=${sort_by}">First</a>
								    </li>
								    <li class="page-item">
								    	<a class="page-link" href="${pageContext.request.contextPath}/admin/products?page=${pageData.number>0?pageData.number-1:0}&limit=3&categoryId=${cateId}&sort_direction=${sort}&sort_by=${sort_by}">Previous</a>
								    </li>
								    <li class="page-item">
								    	<a class="page-link" href="${pageContext.request.contextPath}/admin/products?page=${pageData.number<pageData.totalPages-1?pageData.number+1:pageData.totalPages-1}&limit=3&categoryId=${cateId}&sort_direction=${sort}&sort_by=${sort_by}">Next</a>
								    </li>
								    <li class="page-item">
								    	<a class="page-link" href="${pageContext.request.contextPath}/admin/products?page=${pageData.totalPages-1}&limit=3&categoryId=${cateId}&sort_direction=${sort}&sort_by=${sort_by}">Last</a>
								    </li>
								  </ul>
								</nav>
							
							</div>
							
					</div>
 				<!--End content  -->
 				
 				
 				
					</article>
				</div>
			</main>
		
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="${ pageContext.request.contextPath }/js/confirm.js"></script>
</body>
</html>