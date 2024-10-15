<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.Book" %>
<%@ page import = "dao.BookRepository" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.mulipart.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BookMarket\\resources\\images";
	int maxSize=5 * 1024 * 1024;
	String encType="utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
	
	

	String bookId=multi.getParameter("bookId");
	String name=rmulti.getParameter("name");
	String unitPrice=multi.getParameter("unitPrice");
	String author=multi.getParameter("author");
	String publisher=multi.getParameter("publisher");
	String releaseDate=multi.getParameter("releaseDate");
	String description=multi.getParameter("descriptrion");
	String category=multi.getParameter("category");
	String unitsInStock=multi.getParameter("unitsInStock");
	String condition=multi.getParameter("condition");
	
	Enumeration files=multi.getFileNames();
	String fname=(String) files.nextElement();
	String fileName=multi.getFilesystemName(fname);
	
	integer price;
	
	if (unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
	
	long stock;
	
	if (unitsInStock.isEmpty())
		stock=0;
	else
		stock=long.valueOf(unitsInStock);
	
	BookRepository dao=BookRepository.getInstace();
	
	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setreleaseDate(releasDate);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);
	
	dao.addBook(newBook);
	
	response.sendRedirect("books.jsp");
%>

</body>
</html>