<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : baja
    Created on : 11 nov. 2022, 12:36:03
    Author     : COMPU07
--%>


      <% 
            
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela","root", "");
        String consulta= "SELECT * FROM productos";
        PreparedStatement s = conexion.prepareStatement(consulta);
        ResultSet listado= s.executeQuery();
        String respuesta;

        while(listado.next()){
            out.println("codigo: " + listado.getString("id_producto") + "<br>");
            out.println("nombre: " + listado.getString("nombre") + "<br>");
            out.println("descripcion: " + listado.getString("descripcion") + "<br>" );
            out.println("costo: " + listado.getString("costo") + "<br>");
            
            } 
            
          /* 
          out.println("desea borrar algo?, en ese caso marque el el codigo para ello" + "<br>");
          respuesta = System.console().readline();
          if(respuesta == "si"){
          String consultaBorrado= "alter table productos drop collumn nombre,descripcion,costo";
           PreparedStatement consultaborrado = null;
          out.println("codigo: " + listado.getString("id_producto") + "<br>");
          */
     
%>
<<html>
    <head>
        <title>descripcion de borrado</title>
    </head>
    <body>
    <form    method="get" action="borrado.jsp">
            <input type="text" name="codigo" /> <br>
            <input type="submit" value="borrar"/>
            
    </form>
 
    </body>
</html>
>