<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>alumno cargado</h1>
        
        <% 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "");
        preparedStatement a = conexion.preparedStatement();
         PreparedStatement consultaEjercicio =null;
         try{
        request.setCharacterEncoding("utf-8");
        String insercion = "INSERT INTO productos (nombre, descripcion, costo)values ('" 
                + request.getParameter("nombre")
                + "'," + request.getParameter(("descripcion"))
                + ",'" + Integer.valueOf(request.getParameter("costo"))
                + "')";
        a.execute(insercion);
            }
        catch{
        conexion.close();
            }