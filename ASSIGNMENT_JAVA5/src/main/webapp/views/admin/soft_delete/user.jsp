<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
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
						
							
							<h1 class="text-center">User Recycle Bin</h1>
						<div class="col-10 offset-1 mt-5 border border-dark p-2">
	
							<form method="get" action="${ pageContext.request.contextPath }/admin/users/recycle-bin">
								<div class="row col-12 mt-2">
									<div class="col-6">
										<label>
											Sắp sếp theo
										</label>
										<select name="sort_by" class="form-select" aria-label="Default select example">
											<option ${sort_by=="id"?"selected":""} value="id">Mặc định</option>
											<option ${sort_by=="username"?"selected":""} value="username" >Username</option>
											<option ${sort_by=="email"?"selected":""} value="email">Email</option>
											<option ${sort_by=="admin"?"selected":""} value="admin">Role</option>
											<option ${sort_by=="activated"?"selected":""} value="activated">Trạng thái</option>
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
								<button class="btn btn-primary mt-4">Lọc</button>
								<a class="btn btn-danger mt-4" href="${ pageContext.request.contextPath }/admin/users/recycle-bin">Reset</a>
								
							</div>
						</form>
						
						</div>
						<div class="mt-5 col-10 offset-1 border border-dark p-3">
							<div class="">
								<a
									class="btn btn-success col-1"
									href="${ pageContext.request.contextPath }/admin/users/create">Create</a>
							</div>
							<table class="table table-hover">
									<thead>
										<tr>
											<td>Id</td>
											<td>Username</td>
											<td>Email</td>
											<td>Avatar</td>
											<td>Role</td>
											<td colspan="2">Action</td>
										</tr>
									</thead>
									
									<tbody>
									<c:forEach items="${pageData.content}" var="user">
										<tr>
											<td>${user.id}</td>
											<td>${user.username}</td>
											<td>${user.email}</td>
											<td>${user.photo}</td>
											<td>${user.admin==1?"Admin":"Member"}</td>
											
											<td>
												<form action="${ pageContext.request.contextPath }/admin/users/restore/${user.id}" method="POST">
													<button class="btn btn-success" >Restore</button>
												</form>
											</td>
											<td>
												<form action="${ pageContext.request.contextPath }/admin/users/delete/${user.id}" method="POST">
													<button class="btn btn-danger" onclick="onClickHandleTwo(event)">Delete</button>
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
													<a href="${ pageContext.request.contextPath }/admin/users/recycle-bin?page=${page.index}&limit=3&sort_direction=${sort}&sort_by=${sort_by}" class="page-link">${page.index+1}</a>
												</li>
										</c:forEach>
									
									</ul>
								
								</div>
								
						</div>
						
						
						
						
						
							
 				
					</article>
				</div>
			</main>
		
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="${ pageContext.request.contextPath }/js/confirm.js"></script>
</body>
</html>