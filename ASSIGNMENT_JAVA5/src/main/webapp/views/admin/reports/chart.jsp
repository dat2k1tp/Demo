<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chart</title>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
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
					<div class="container">
						<div class="d-flex justify-content-center row">
							
							<h1 class="text-center">Report</h1>
							<div class="col-10 offset-1 mt-5 border border-dark p-2">
					
									<form method="get" action="${ pageContext.request.contextPath }/admin/reports/chart">
										<div class="row col-12 mt-2">
											
										
											<div class="col-6">
												<label>
													Sắp sếp theo
												</label>
												<select name="sort_by" class="form-select" aria-label="Default select example">
													<option ${sort_by=="id"?"selected":""}  value="id">Mặc định</option>
													<option ${sort_by=="product.name"?"selected":""}   value="product.name">Name</option>
													<option ${sort_by=="order.total"?"selected":""}  value="order.total" >Total</option>
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
											<div class="col-2">
												<input min="1" type="number" value="${limit}" name="limit"  class="form-control"/>
											</div>
									</div>
									
									
									<div>
										<button class="btn btn-primary mt-4" >Lọc</button>
								
										<a class="btn btn-danger mt-4" href="${ pageContext.request.contextPath }/admin/reports/chart">Reset</a>
									</div>
								</form>
					
						</div>
						
						<div class="mt-5 col-10 offset-1 border border-dark p-3">		
							<table class="table table-bordered">
								<thead>
										<tr>
											<td>Tên</td>
											<td>Tổng số lượng bán ra</td>
											<td>Dooanh thu</td>
										</tr>
								</thead>
													
								<tbody>
									<c:forEach items="${listReport.content}" var="report">
														
										<tr>
											<td>${report[0].name}</td>
											<td>${report[2]}</td>
											<td>${report[1]}</td>
										</tr>
														
									</c:forEach>
								</tbody>
							</table>
							<div>
							<ul class="pagination">
								<c:forEach begin="0" end="${listReport.totalPages>0?listReport.totalPages-1:0}" varStatus="page">
										<li class="page-item">
											<a href="${ pageContext.request.contextPath }/admin/reports/chart?page=${page.index}&limit=${limit}&sort_direction=${sort}&sort_by=${sort_by}" class="page-link">${page.index+1}</a>
										</li>
								</c:forEach>
							
							</ul>
							
							</div>
							
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
	
</body>
</html>