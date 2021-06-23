<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body >

			<jsp:include page="/views/layout/nav_us.jsp"></jsp:include>
			
			<h1 class="text-center">Product List</h1>
		<!--alert  -->	
	 <c:if test="${not empty sessionScope.messCart}">
	 	<div class="alert alert-info">${sessionScope.messCart}</div>
	 	<c:remove var="messCart" scope="session" />
	 </c:if> 
	 
	 <c:if test="${not empty sessionScope.errorCart}">
	 	<div class="alert alert-danger">${sessionScope.errorCart}</div>
	 	<c:remove var="errorCart" scope="session" />
	 </c:if> 
	 <!--end alert  -->	
	 
	<div style="min-height: 1000px;">
				<div class="col-10 offset-1 mt-5 border border-dark p-2" >
					
					<form method="get" action="${ pageContext.request.contextPath }/home">
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
							
							<a class="btn btn-danger mt-4" href="${ pageContext.request.contextPath }/home">Reset</a>
						</div>
					</form>
					
			</div>
			
			
			<div class="mt-2 col-10 offset-1 p-4" >
						<form class="d-flex col-6" method="post" action="${pageContext.request.contextPath}/home?page=0&limit=3&categoryId=${cateId}&sort_direction=${sort}&sort_by=${sort_by}" style="margin-left: 30px;">
     					 	<input name="keyword" value="${sessionScope.keyword}"  class="form-control me-2" 
     					 	type="search" placeholder="Search" aria-label="Search">
     					 	<button class="btn btn-outline-success" type="submit">Search</button>
    					</form>
						
						<table class="table table-hover" >
							
							
				<!-- Content -->
							<c:forEach items="${pageData.content}" var="product">
								<div class="card-group" style="width: 22rem;float: left;height: 23rem;
									margin: 23px">
									  <div class="card border border-dark" style="margin: 10px;">
										    <img src="${ pageContext.request.contextPath }/views/storage/${product.image}"
										     class="card-img-top" alt="..." width="250" height="200">
										   <div class="card-body">
										      <h5 class="card-title"><i>Name</i>: ${product.name}</h5>
										      <p class="card-text"><b>Price</b>: ${product.price}</p>
										      <p class="card-text"><b>Available</b>: ${product.available}</p>
										      <p class="card-text"><small class="text-muted">
										      <b>Date Created</b>: ${product.createDate}</small></p>
										      <form method="post" action="${pageContext.request.contextPath}/member/cart/add/${product.id}?categoryId=${cateId}">
													<button class="btn btn-primary">Add to cart</button>
											  </form>
										   </div>
  										</div>
								</div>
									
							</c:forEach>
				<!-- End content -->
				<!-- Dat hang -->
							
						</table>
							
							
							
				</div>	
				
				<div class="p-5">
								<nav aria-label="Page navigation example">
								  <ul class="pagination justify-content-center">
								    <li class="page-item">
								    	<a class="page-link" href="${pageContext.request.contextPath}/home?page=0&limit=3&categoryId=${cateId}&sort_direction=${sort}&sort_by=${sort_by}">First</a>
								    </li>
								    <li class="page-item">
								    	<a class="page-link" href="${pageContext.request.contextPath}/home?page=${pageData.number>0?pageData.number-1:0}&limit=3&categoryId=${cateId}&sort_direction=${sort}&sort_by=${sort_by}">Previous</a>
								    </li>
								    <li class="page-item">
								    	<a class="page-link" href="${pageContext.request.contextPath}/home?page=${pageData.number<pageData.totalPages-1?pageData.number+1:pageData.totalPages-1}&limit=3&categoryId=${cateId}&sort_direction=${sort}&sort_by=${sort_by}">Next</a>
								    </li>
								    <li class="page-item">
								    	<a class="page-link" href="${pageContext.request.contextPath}/home?page=${pageData.totalPages-1}&limit=3&categoryId=${cateId}&sort_direction=${sort}&sort_by=${sort_by}">Last</a>
								    </li>
								  </ul>
								</nav>
							
							</div>
				
						
		</div>			
		<jsp:include page="/views/layout/footer.jsp"></jsp:include>			
			
 				
 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="${ pageContext.request.contextPath}/js/confirm.js"></script>
</body>
</html>

				
 	
	