<%-- 
    Document   : recibedato
    Created on : 23 sep. 2022, 09:49:15
    Author     : COMPU07
--%>
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
        <h1>texto recibido</h1>
        
        
            
            
            <%out.println(request.getParameter("nombre") ); %><br>
            <%out.println(request.getParameter("descripcion") ); %><br>
            <%out.println(request.getParameter("costo")); %><br>
            
            <%
            
         
         Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela"
        ,"root", "");
        preparedStatement s = conexion.createStatement();
        String consulta= "alter table productos drop collumn if exist nombre,descripcion,costo  ";
        ResultSet listado= s.executeQuery(consulta);
    try{
        while(listado.next()){
            out.println("nombre: " + listado.getString("nombre") + "<br>");
            out.println("curso: " + listado.getString("descripcion") + "<br>" );
            out.println("edad: " + listado.getString("costo") + "<br>");
                }catch {
                s.close;
                listado.close();
                }}    
            %>
        
       
    </body>
</html>
