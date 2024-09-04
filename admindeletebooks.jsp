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
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/librarybooks","root","tiger");
PreparedStatement st=con.prepareStatement("delete from books where bookname=(?)");
st.setString(1,bookname);
int i=st.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("adminpage.html");
	}
	else
	{
		out.println("deletion failed");
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