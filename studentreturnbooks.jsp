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
int cur=0;
String username=(String)session.getAttribute("stdusername");
String bookname=(request.getParameter("bookname"));
java.util.Date currentDate = new java.util.Date();
java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlist","root","tiger");
Statement st1=con.createStatement();
Statement st2=con.createStatement();
ResultSet rs=st1.executeQuery("select * from studentinfo where username='"+username+"' and deadline<'"+sqlDate+"'");
if(rs.next())
{
	ResultSet rs1=st2.executeQuery("select * from studentprofile where stdusername='"+username+"'");
	while(rs1.next())
	{
		cur=rs1.getInt("fines");
		cur=cur+15;
	}
	String updateQuery = "UPDATE studentprofile SET fines = ? WHERE stdusername = ? ";
PreparedStatement preparedStatement = con.prepareStatement(updateQuery);
preparedStatement.setInt(1, cur);
preparedStatement.setString(2, username);
int rowsAffected = preparedStatement.executeUpdate();
}
PreparedStatement st=con.prepareStatement("delete  from studentinfo where username=? and bookborrowed=?");
st.setString(1,username);
st.setString(2,bookname);
int i=st.executeUpdate();
if(i>0)
{  
	response.sendRedirect("studentpage.html");
}
else
{
	out.println("return failed");
	out.println("<a href='studentpage.html'>goto studentpage</a>");
}
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>