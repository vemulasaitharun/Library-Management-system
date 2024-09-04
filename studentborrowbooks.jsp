<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body style="width: 100%; background: linear-gradient(to top, rgba(0,0,0,0.5)50%,rgba(0,0,0,0.5)50%), url(1.jpg); background-position: center; background-size: cover; height: 20vh;">
    <div class="main">
        <div class="navbar">
            <div class="icon">
                <h2 class="logo">Students</h2>
            </div>
            <div class="search">
                <a href="home.html"> <button class="btn">logout</button></a>
            </div>
            <br>

            <%
            String bookname = (request.getParameter("bookname"));
            String stdusername = null;
            String password = null;
            String studentname = null;
            java.util.Date currentDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(currentDate);
            calendar.add(Calendar.DAY_OF_MONTH, 7);
            java.sql.Date sqlDate7DaysLater = new java.sql.Date(calendar.getTimeInMillis());
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlist", "root", "tiger");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarybooks", "root", "tiger");
                PreparedStatement ps1 = con1.prepareStatement("select * from books where bookname=?");
                ps1.setString(1, bookname);
                ResultSet rs1 = ps1.executeQuery();
                if(rs1.next())
                {
                PreparedStatement ps = con.prepareStatement("select * from studentprofile where stdusername=?");
                ps.setString(1, (String) session.getAttribute("stdusername"));
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    stdusername = rs.getString(1);
                    password = rs.getString(2);
                    studentname = rs.getString(3);
                    
                }

                // Insert data into the studentinfo table with proper date format
                PreparedStatement insertStatement = con.prepareStatement("insert into studentinfo values (?, ?,?, ?, ?, ?)");
                insertStatement.setString(1, studentname);
                insertStatement.setString(2, stdusername);
                insertStatement.setString(3, password);
                insertStatement.setString(4,bookname);
                insertStatement.setDate(5, sqlDate);
                insertStatement.setDate(6,sqlDate7DaysLater );

                int i = insertStatement.executeUpdate();

                if (i > 0) {
                    response.sendRedirect("studentpage.html");
                } else {
                    out.println("borrow failed");
                    out.println("<a href='studentpage.html'>Go to admin page</a>");
                }
                }
                else
                {
                	out.println("borrow failed");
                	out.println("enter valid bookname");
                    out.println("<a href='studentpage.html'>Go to admin page</a>");
                }
            } catch (Exception e) {
                out.println(e);
            } 
            %>

        </div>
    </div>
</body>
</html>
