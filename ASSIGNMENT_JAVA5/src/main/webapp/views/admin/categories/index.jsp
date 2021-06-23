<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
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
					<h1 class="text-center">Category List</h1>
					<div class="col-10 offset-1 mt-5 border border-dark p-2">
					
						<form method="get" action="${ pageContext.request.contextPath }/admin/categories">
							<div class="row col-12 mt-2">
								<div class="col-6">
									<label>
										Sắp sếp theo
									</label>
									<select name="sort_by" class="form-select" aria-label="Default select example">
										<option ${sort_by=="id"?"selected":""} value="id">Mặc định</option>
										<option ${sort_by=="name"?"selected":""} value="name" >Name</option>
									</select>
								</div>
						
							
								<div class="col-6">
									<label>
										Thứ tự
									</label>
									<select name="sort_direction" class="form-select" aria-label="Default select example">
										<option ${sort=="asc"?"selected":""} value="asc">Tăng dần</option>
										<option ${sort=="desc"?"selected":""} value="desc">Giảm dần</option>
									</select>
								</div>
						</div>
						
						
						<div>
							<button class="btn btn-primary mt-4" >Lọc</button>
							
							<a class="btn btn-danger mt-4" href="${ pageContext.request.contextPath }/admin/categories">Reset</a>
						</div>
					</form>
					
					</div>
					<div class="mt-5 col-10 offset-1 border border-dark p-3">
						<div class="">
							<a
								class="btn btn-success col-1"
								href="${ pageContext.request.contextPath }/admin/categories/create">Create</a>
						</div>
						<table class="table table-hover">
								<thead>
									<tr>
										<td>Id</td>
										<td>Name</td>
										<td colspan="2">Action</td>
									</tr>
								</thead>
								
								<tbody>
								<c:forEach items="${pageData.content}" var="category">
									<tr>
										<td>${category.id}</td>
										<td>${category.name}</td>
										<td>
											<a
												class="btn btn-primary"
												href="${ pageContext.request.contextPath }/admin/categories/edit/${category.id}">Update</a>
										</td>
										<td>
											<form action="${ pageContext.request.contextPath }/admin/categories/soft-delete/${category.id}" method="POST">
												<button id="confirm" class="btn btn-danger" onclick="onClickHandle(event)">Delete</button>
											</form>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<div>
							<ul class="pagination">
								<c:forEach begin="0" end="${pageData.totalPages>0?pageData.totalPages-1:0}" varStatus="page">
										<li class="page-item">
											<a href="${ pageContext.request.contextPath }/admin/categories?page=${page.index}&limit=3&sort_direction=${sort}&sort_by=${sort_by}" class="page-link">${page.index+1}</a>
										</li>
								</c:forEach>
							
							</ul>
							
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