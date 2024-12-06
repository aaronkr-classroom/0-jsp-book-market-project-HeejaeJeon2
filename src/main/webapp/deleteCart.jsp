<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "dto.Book" %>
<%@ page import = "dao.BookRepository" %>

<%
	String id = request.getParameter("cartId");
	if (id==null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;
	}
	
	session.invalidate();
	response.sendRedirect("cart.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>