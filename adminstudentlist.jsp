<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>students list</title>
  <link rel="stylesheet" href="stylehome.css">
  <style> th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 4px solid #ddd;
            font-size:35px;
        }

        th {
            background-color: #ff7200;
            color: white;
        }
    table {
            width: 100%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        </style>
</head>
<body style=" width: 100%;
background: linear-gradient(to top, rgba(0,0,0,0.5)50%,rgba(0,0,0,0.5)50%), url(1.jpg);
background-position: center;
background-size: cover;
height: 20vh;">
 <div class="main">
        <div class="navbar">
            <div class="icon">
                <h2 class="logo">Students</h2>
            </div>
            <div class="search">
  
                <a href="home.html"> <button class="btn">logout</button></a>
            </div>
<br>
    <table border="2">
        <tr>
            <th>studentname</th>
            <th>username</th>
            <th>password</th>
            <th>fines</th>
        </tr>

        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlist", "root", "tiger");
            PreparedStatement ps = con.prepareStatement("select * from studentprofile");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(4) %></td>
                </tr>
                <%
            }
        } catch (Exception e) {
            out.println(e);
        }
        %>
    </table>

    </div>
    </div>
</body>
</html>