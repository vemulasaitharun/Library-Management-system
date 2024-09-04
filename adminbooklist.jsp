<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Books</title>
  <link rel="stylesheet" href="stylehome.css">
</head>
<body style=" width: 100%;
background: lavender;
background-position: center;
background-size: cover;
height: 20vh;">
 <div class="main">
        <div class="navbar">
            <div class="icon">
                <h2 class="logo">AU Library</h2>
            </div>
            <div class="search">
  
                <a href="home.html"> <button class="btn">logout</button></a>
            </div>
<br>
    <table border="1">
        <tr>
            <th>Book Name</th>
            <th>Author</th>
            <th>Category</th>
            <th>Price</th>
            <th>Quantity</th>
        </tr>

        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarybooks", "root", "tiger");
            PreparedStatement ps = con.prepareStatement("select * from books");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                </tr>
                <%
            }
        } catch (Exception e) {
            out.println(e);
        }
        %>
    </table>
    <div class="search">
                <a href="adminaddbooks.html"> <button class="btn" style="background-color: #45a049; border: 2px solid #45a049;'">Add new book</button></a>
            </div>
    </div>
    </div>
</body>
<style> th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 4px solid #ddd;
            font-size:35px;
        }

        th {
            background-color: #45a049;;
            color: white;
        }
    table {
            width: 100%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        </style>
</html>