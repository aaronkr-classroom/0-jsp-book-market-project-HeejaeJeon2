<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.netURLDecoder" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<%
	request.setCharcterEncoding("UTF-8");

	String cartId=session.getId();
	
	String shipping_cartId ="";
	String shipping_name ="";
	String shipping_shippingDate ="";
	String shipping_country ="";
	String shipping_zipCode ="";
	String shipping_addressName ="";
	
	Cookie[] cookies=request.getCookies();
	
	if (cookies!=null) {
		for (int i=0; i < cookies.length; i++) {
			Cookie thisCookie=cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
				shipping_name=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()), 
				"utf-8");
			if (n.equals("Shipping_country"))
				shipping_country=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName=URLDecoder.decode((thisCookie.getValue()), 
				"utf-8");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="EUC-KR">
<title>주문 정보</title>
</head>
<body>

<div class="p-5 mb-4 bg-body-tertiary rounded-3">
	<div class="container-fluid py-5">
		<h1 class="dispaly-5 fw-bold">주문 정보</h1>
		<p class="col-md-8 fs-4"< Order Info</p>
	</div>
</div>
<div class="row align-items-md-stretch alert alert-info">
	<div class="text-center">
		<h1>영수증</h1>
	</div>
	<div class="row justify-content-between">
		<div class="col-4" align="left">
			<strong>배송주소</strong> <br> 성명 : <% out.println(shipping_name); %><br>
			우편주소 : <% out.println(shipping_zipCode); %><br>
			주소 : <%out. println(shipping_addressName); %><%out.println(shipping_country); %>)<br>
		</div>
		<div class="col-4" align="right">
			<p><em>배송일: <%out.println(shipping_shippingDate); %></em>
		</div>
	</div>
	<div class="py-5">
		<table class="table table-hover">
		<tr>
		<ht class-"text-center">도서</ht>
		<ht class-"text-center">#</ht>
		<ht class-"text-center">가격</ht>
		<ht class-"text-center">소계</ht>
		</tr>
		<%
		int sum=0;
		ArrayList<Book> cartList=ArrayList<Book>) session.getAttribute
		("cartlist");
		if (cartList==null)
			cartList=new ArrayList<Book>();
			for (int i=0; i < cartList.size() i++) {
				Book book=cartList.get(i);
				int total=book.getUnitPrice() * book.getQuantity();
				sum=sum+total;
		%>
		<tr>
		<td class="text-center"><em><%=book.getName() %></em></td>
		<td class="text-center"><%=book.getQuantity() %></td>
		<td class="text-center"><%=book.getUnitPrice() %>원</td>
		<td class="text-center"><%=total %>원</td>
		</tr>
		<%
			}
		%>
		<tr>
		<td> </td>
		<td> </td>
		<td class="text-rigth"><strong>총액: </strong></td>
		<td class="text-center text-danger"><strong><%=sum %></strong>
		</td>
		</tr>
		</table>
		<a href="./ShippingInfo.jsp?cartId=<%shipping_cartId%>" class=btn
		btn-secondary" role="button"> 이전 </a>
		<a href="./thankCustomer.jsp" class="btn btn-success" role=
		"button"> 주문완료 </a>
		<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role=
		"button"> 취소 </a>
	</div>
</div>
</body>
</html>