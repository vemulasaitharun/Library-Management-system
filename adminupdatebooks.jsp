<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String bookname=(request.getParameter("bookname"));
String whattoupdate=request.getParameter("whattochange");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/librarybooks","root","tiger");
	if(bookname=="quantity")
	{
		int updatedvalue=Integer.parseInt(request.getParameter("updatedvalue"));
PreparedStatement ps = con.prepareStatement("update books set "+whattoupdate+"= (?) where bookname =?");
ps.setInt(1,updatedvalue);
ps.setString(2,bookname);
int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("adminpage.html");
}
else
{
	out.println("updation failed");
	out.println("<a href='updatestu.html'>goto update page</a>");
	out.println("<a href='admin.html'>goto admin page</a>");
}
}
	else
	{
		String updatedvalue=request.getParameter("updatedvalue");
	PreparedStatement ps = con.prepareStatement("update books set "+whattoupdate+"= (?) where bookname =?");
	ps.setString(1,updatedvalue);
	ps.setString(2,bookname);
	int i=ps.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("adminpage.html");
	}
	else
	{
		out.println("updation failed");
		out.println("<a href='updatestu.html'>goto update page</a>");
		out.println("<a href='admin.html'>goto admin page</a>");
	}
	}
		
}
catch(Exception e)
{
	out.println(e);
}

%>
</body>
</html>