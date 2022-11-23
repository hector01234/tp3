<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
                Class.forName("com.mysql.jdbc.Driver");
                String consulta1 = "SELECT * from productos_sucursales = 1,1";
                Connection conexion = null;
                PreparedStatement consultaSucursal = null;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "");
                    consultaSucursal = conexion.prepareStatement(consulta1);
                    consultaSucursal.setString(1, request.getParameter("nombre"));
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");
                    out.println(consultaSucursal + "</br>");
                } finally {
                    try {
                        consultaSucursal.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
            %>
    </body>
</html>