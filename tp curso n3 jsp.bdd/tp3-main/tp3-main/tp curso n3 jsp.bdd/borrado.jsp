<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


 <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela"
        ,"root", "");
        Statement s = conexion.createStatement();
        request.setCharacterEncoding("UTF-8");
        String insercion = "alter table productos drop collum ? = ("
            + ", '" + request.getParameter("codigo")
            + ")";
        s.execute(insercion);
        conexion.close();
    %>