<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
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
						
							
							<h1 class="text-center">Order List</h1>
						<div class="col-10 offset-1 mt-5 border border-dark p-2">
	
							<form method="get" action="${ pageContext.request.contextPath }/admin/orders">
								<div class="row col-12 mt-2">
									<div class="col-6">
										<label>
											Sắp sếp theo
										</label>
										<select name="sort_by" class="form-select" aria-label="Default select example">
											<option ${sort_by=="id"?"selected":""} value="id">Default</option>
											<option ${sort_by=="user"?"selected":""} value="user" >UserId</option>
											<option ${sort_by=="createDate"?"selected":""} value="createDate">Date</option>
											<option ${sort_by=="address"?"selected":""} value="address">Address</option>
											<option ${sort_by=="telephone"?"selected":""} value="telephone">Telephone</option>
											<option ${sort_by=="activated"?"selected":""} value="activated">Activated</option>
											<option ${sort_by=="total"?"selected":""} value="total">Total Money</option>
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
								<a class="btn btn-danger mt-4" href="${ pageContext.request.contextPath }/admin/orders">Reset</a>
							</div>
						</form>
						
						</div>
						<div class="mt-5 col-10 offset-1 border border-dark p-3">
							
							<table class="table table-hover">
									<thead>
										<tr>
											<td>OrderId</td>
											<td>Username</td>
											<td>Address</td>
											<td>Telephone</td>
											<td>Total Money</td>
											<td>Activated</td>
											<td colspan="2">Action</td>
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
										<form action="${ pageContext.request.contextPath }/admin/orders/update/${order.id}" method="POST">
											<td>
												<select name="activated" class="form-select" aria-label="Default select example">
													<option ${order.activated==1?"selected":""} value="1">Đang xử lý</option>
													<option ${order.activated==2?"selected":""} value="2" >Đang giao hàng</option>
													<option ${order.activated==3?"selected":""} value="3">Hoàn thành</option>
													<option ${order.activated==0?"selected":""} value="0">Hủy đơn hàng</option>
												</select>
											
											
											</td>
															
											<td>
													<button class="btn btn-primary" onclick="onClickHandleThree(event)">Update</button>
											</td>
										</form>
										
										<td>
											<a class="btn btn-info" href="${ pageContext.request.contextPath }/admin/orders/order-details/${order.id}">View OrderDetails</a>
										</td>
										</tr>
										
										</c:forEach>
									</tbody>
								</table>
								
								
								
								<div>
								<ul class="pagination">
									<c:forEach begin="0" end="${pageData.totalPages>0?pageData.totalPages-1:0}" varStatus="page">
											<li class="page-item">
												<a href="${ pageContext.request.contextPath }/admin/orders?page=${page.index}&limit=3&sort_direction=${sort}&sort_by=${sort_by}" class="page-link">${page.index+1}</a>
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

	
<script type="text/javascript">
	function onClickHandleThree(event) {
		var check=confirm('Bạn có muốn cập nhật không?');
	 	if(check===false){
	 		event.preventDefault()
			
	 	}else if(check===true){
			alert("Trạng thái đã được cập nhật !")
		}
	
		
		
	}
	
</script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>	
</body>
</html>