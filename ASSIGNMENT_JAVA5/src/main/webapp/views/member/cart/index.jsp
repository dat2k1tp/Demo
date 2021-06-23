<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
	<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		/* Chrome, Safari, Edge, Opera */
			/*input::-webkit-outer-spin-button,
			input::-webkit-inner-spin-button {
		 	 -webkit-appearance: none;
			  margin: 0;
			}*/
			
		
		
	</style>

</head>
<body >

			<jsp:include page="/views/layout/nav_us.jsp"></jsp:include>
			
			<h1 class="text-center">Cart List</h1>
			
	<!-- Alert -->		
	<c:if test="${not empty sessionScope.errorCart}">
	 	<div class="alert alert-danger">${sessionScope.errorCart}</div>
	 	<c:remove var="errorCart" scope="session" />
	 </c:if> 
	 
	 <c:if test="${not empty sessionScope.buy}">
	 	<div class="alert alert-success">${sessionScope.buy}</div>
	 	<c:remove var="buy" scope="session" />
	 </c:if> 
	 <!-- End alert -->
	 
<div style="min-height: 1000px;" >	
	<div  class="mt-4 col-10 offset-1 row">
			
			<!-- content 1 -->
			<div class=" col-8 mb-5  border border-dark p-2" >
						
						
				<table class="table table-hover" >
					<thead>
						<tr>
							<td>Id</td>
							<td>Name</td>
							<td>Image</td>
							<td>Price</td>
							<td>Quantity</td>
							<td>Amount</td>
							<td>Action</td>
						</tr>
					</thead>
								
					<tbody>
						<c:forEach items="${cart.items}" var="product">
							<form action="${ pageContext.request.contextPath }/member/cart/update/${product.id}" method="post">
							
								<tr>
									<td>${product.id}</td>
									<td>${product.name}</td>
									<td><img style="width: 100px;height: 60px;" alt=""
										src="${ pageContext.request.contextPath }/views/storage/${product.image}"></td>
									<td>${product.price}</td>
									<td>
										<input name="qty" value="${product.quantity}"
										type="number"
										 onblur="this.form.submit()" style="width: 50px;"></td>
										<td>${product.price*product.quantity}</td>
									<td>
										<a href="${pageContext.request.contextPath}/member/cart/remove/${product.id}" class="btn btn-danger">Remove</a>
									</td>
										
								</tr>
							</form>
							
								
						</c:forEach>
					</tbody>
				</table>
				
				<div class="text-end">
					<a  class="btn btn-danger" href="${ pageContext.request.contextPath }/member/cart/clear">Clear Cart</a>
					<a class="btn btn-dark" href="${ pageContext.request.contextPath }/home">Go to Home</a>
				</div>
				
							
			</div>	
			<!-- end content 1 -->
			
			<!-- content 2 -->
			<div class="card border-dark mb-5 col-2 offset-1 p-2" style="width: 17rem;margin: 40px 120px 40px 30px;display: ${cart.getCount()==0?"none":""}">
				<form:form action="${ pageContext.request.contextPath }/member/cart/checkout" method="post" modelAttribute="order">
					  <div class="card-body text-dark">
					    <h5 class="card-title text-center">Đơn Hàng</h5>
					    <p class="card-text"><b>Tổng số lượng hàng</b> : ${cart.getCount()}</p>
					    <p class="card-text"><b>Tổng số tiền</b> : ${cart.getAmount()}</p>
					    
					    <div >
							  <label for="telephone" class="form-label fw-bold">Số điện thoại:</label>
							  <form:input type="text" path="telephone" class="form-control" id="telephone" />
							  <form:errors path="telephone" element="span" cssClass="text-danger" />
					  	</div>
					  	
						<div >
						  	<label for="address" class="form-label fw-bold">Địa chỉ:</label>
						  	<form:textarea path="address" class="form-control" id="address" rows="3"></form:textarea>
						  	<form:errors path="address" element="span" cssClass="text-danger" />
						</div>
						
					  </div>
					  
					  
					  <div class="card-footer bg-transparent border-dark">
					  		<button class="btn btn-info ">Thanh toán</button>
					  </div>
				</form:form>
			</div>	
			<!-- end content 2 -->
						
	</div>	
	
</div>			
		<jsp:include page="/views/layout/footer.jsp"></jsp:include>			
			
 				
 				
 	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="${ pageContext.request.contextPath}/js/confirm.js"></script>
</body>
</html>