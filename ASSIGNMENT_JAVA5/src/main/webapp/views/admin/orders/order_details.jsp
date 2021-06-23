<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>
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
			<h1 class="text-center">Order Detail List</h1>
		<div style="min-height: 900px;">
			
						<div class="mt-5 col-10 offset-1 border border-dark p-3">
							<table class="table table-hover">
								<thead>
									<tr>
										
										<td>OrderDetailId</td>
										<td>Product Name</td>
										<td>Image</td>
										<td>Quantity</td>
										<td>Price</td>
										<td>Total</td>
					
										
									</tr>
								</thead>
								
								<tbody>
								<c:forEach items="${pageData.content}" var="orderDetail">
									<tr>
										<td>${orderDetail.id}</td>
										<td>${orderDetail.product.name}</td>
											
	
										<td>
											<img style="width: 100px;height: 60px;" alt=""
											src="${ pageContext.request.contextPath }/views/storage/${orderDetail.product.image}">
										
										</td>
										<td>${orderDetail.quantity}</td>
										<td>${orderDetail.price}</td>
										<td>${orderDetail.price*orderDetail.quantity}</td>
										
										
									</tr>
									</c:forEach>
								</tbody>
								
							</table>
							<div class="text-end">
								<a class="btn btn-dark" href="${ pageContext.request.contextPath }/admin/orders">Go to Order</a>
							</div>
								
								
								
								<div >
									<ul class="pagination justify-content-center">
										<c:forEach begin="0" end="${pageData.totalPages>0?pageData.totalPages-1:0}" varStatus="page">
												<li class="page-item">
													<a href="${ pageContext.request.contextPath }/admin/orders/order-details/${id}?page=${page.index}" class="page-link">${page.index+1}</a>
												</li>
										</c:forEach>
									
									</ul>
								
								</div>
								
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