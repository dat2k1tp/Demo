<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body >

			<jsp:include page="/views/layout/nav_us.jsp"></jsp:include>
			
			<h1 class="text-center">Order List</h1>
	<div style="min-height: 900px;">
		<div class="col-10 offset-1 mt-5 border border-dark p-2">
	
							<form method="get" action="${ pageContext.request.contextPath }/member/account/orders">
								<div class="row col-12 mt-2">
									<div class="col-6">
										<label>
											Sắp sếp theo
										</label>
										<select name="sort_by" class="form-select" aria-label="Default select example">
											<option  value="id">Default</option>
											<option value="user" >UserId</option>
											<option value="createDate">Date</option>
											<option value="address">Address</option>
											<option value="telephone">Telephone</option>
											<option value="activated">Activated</option>
											<option value="total">Total Money</option>
										</select>
									</div>
							
								
									<div class="col-6">
										<label>
											Thứ tự
										</label>
										<select name="sort_direction" class="form-select" aria-label="Default select example">
											<option value="asc">Tăng dần</option>
											<option value="desc">Giảm dần</option>
										</select>
									</div>
							</div>
							
							
							<div>
								<button class="btn btn-primary mt-4">Lọc</button>
								<a class="btn btn-danger mt-4" href="${ pageContext.request.contextPath }/member/account/orders">Reset</a>
							</div>
						</form>
						
						</div>
						<div class="mt-5 col-10 offset-1 border border-dark p-3">
							
							<table class="table table-hover">
									<thead>
										<tr>
											<td>Id</td>
											<td>Username</td>
											<td>Address</td>
											<td>Telephone</td>
											<td>Total Money</td>
											<td>Activated</td>
											<td >Action</td>
										</tr>
									</thead>
									
									<tbody>
									<c:forEach items="${pageData.content}" var="order">
										
										<tr>
											<td>${order.id}</td>
											<td>${order.user.username}</td>
											<td>${order.address}</td>
											<td>${order.telephone}</td>
											<td>${order.total}</td>
										
											<td>
												<select name="activated" class="form-select" aria-label="Default select example" disabled="true">
													<option ${order.activated==1?"selected":""} value="1">Đang xử lý</option>
													<option ${order.activated==2?"selected":""} value="2" >Đang giao hàng</option>
													<option ${order.activated==3?"selected":""} value="3">Hoàn thành</option>
													<option ${order.activated==0?"selected":""} value="0">Hủy đơn hàng</option>
												</select>
											
											
											</td>
															
											<td>
													<a class="btn btn-primary" href="${ pageContext.request.contextPath }/member/account/order-details/${order.id}">View</a>
											</td>
										
										</tr>
										
										</c:forEach>
									</tbody>
								</table>
								
								
								
								<div>
								<ul class="pagination">
									<c:forEach begin="0" end="${pageData.totalPages>0?pageData.totalPages-1:0}" varStatus="page">
											<li class="page-item">
												<a href="${ pageContext.request.contextPath }/member/account/orders?page=${page.index}&limit=3&sort_direction=${sort}" class="page-link">${page.index+1}</a>
											</li>
									</c:forEach>
								
								</ul>
								
								</div>
								
						</div>
		</div>
		<jsp:include page="/views/layout/footer.jsp"></jsp:include>			
			
 				
 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="${ pageContext.request.contextPath}/js/confirm.js"></script>
</body>
</html>

				
 	