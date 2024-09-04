<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String bookname=(request.getParameter("bookname"));
String author=request.getParameter("author");
String category=request.getParameter("category");
int price=Integer.parseInt(request.getParameter("price"));
int quantity=Integer.parseInt(request.getParameter("quantity"));
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/librarybooks","root","tiger");
Statement st=con.createStatement();
int i=st.executeUpdate("insert into books values('"+bookname+"','"+author+"','"+category+"','"+price+"','"+quantity+"')");
if(i>0)
{
	response.sendRedirect("adminpage.html");
}
else
{
	out.println("insertion failed");
	out.println("<a href='adminpage.html'>goto admin page</a>");
}
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>