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
String username=request.getParameter("username");
String password=request.getParameter("password");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admindetails","root","tiger");
Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from admininfo where username='"+username+"' and password='"+password+"'");
if(rs.next())
{
	session.setAttribute("username",username);
	response.sendRedirect("adminpage.html");
}
else
{
	out.println("invalid credentials");
	out.println("<a href='adminlogin.html'>goto login page</a>");
	out.println("<a href='home.html'>goto Home page</a>");
}}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>