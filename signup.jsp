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
String stdusername = request.getParameter("stdusername");
String password = request.getParameter("password");
String studentname = request.getParameter("studentname");
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlist", "root", "tiger");
    PreparedStatement insertStatement = con.prepareStatement("insert into studentprofile values (?, ?, ?, ?)");
    insertStatement.setString(1, stdusername);
    insertStatement.setString(2, password);
    insertStatement.setString(3, studentname);
    insertStatement.setInt(4,0);
    int i = insertStatement.executeUpdate();

    if (i > 0) {
        response.sendRedirect("studentlogin.html");
    } else {
        out.println("Insertion failed");
        out.println("<a href='signup.html'>Go to signin page</a>");
    }
}
    catch(Exception e)
    {
    	
    }
%>
</body>
</html>