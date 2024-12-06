<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>도서아이디 오류</title>
</head>
<body>
<div class="container py-4">
	<%@include file="menu.jsp" %>
	<div class="p-5 bm-4 bg-body-tertiary rounded-3">
		<h1 class="alert alert-danger">해당 도서가 존재하지 않습니다.</h1>
	</div>
</div>

<div class="row align-items-md-stretch">
	<div class="col-md-12">
		<div class="h-100 p-5">
			<p> <%=request.getRequestURL() %>?<%= request.getQueryString() %>
			<p> <a href="books.jsp class="btn btn-secondary"> 도서 목록 &raquo;</a>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
	</div>
</body>
</html>