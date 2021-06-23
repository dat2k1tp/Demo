<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
	<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<form:form action="${pageContext.request.contextPath}/upload-hello"
	method="post"
	enctype="multipart/form-data">
	<div class="form-group mt-3">
				<label for="photo">Image</label>
			    <input type="file"  class="form-control" id="avatar" name="upload_file">
			</div>
	<button>Submit</button>
	</form:form>
</body>
</html>