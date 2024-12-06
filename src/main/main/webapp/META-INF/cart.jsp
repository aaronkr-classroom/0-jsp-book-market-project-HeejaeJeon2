"./shippingInfo.jsp?cartId=<%cartId>"

shippingInfo.jsp

<%@ page contentType="text/html; charset=utf-8 %>
<html>
<head>
<link rel="sylesheet" href="./resources/css/bootstrap.min.css" />
<title>배송 정보</title>
</head>
</html>
<body>
<div class="container py-4">
	<%@ include file="menu.jsp" %>

	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="dispaly-5 fw-bold">배송 정보</h1>
				<p class="col-md-8 fs-4">Shipping Info</p> 
		</div>
	</div>
	
	<div class="row align-items-md-stretch">
		<form action="./processSgippingInfo.jsp" method="post">
			<input type="hidden" name="cartId" value="<%=request.
			getParameter("cartId")%>">
			<div class="mb-3 row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
			</div>
			
		</form>
	</div>
</div>
</body>