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
          Connection conexion = null;
            PreparedStatement consultaEjercicio = null;
              ResultSet listaEjercicio =null;
    String consultaSucursal = " select productos.nombre as mercancia,"
                                  +"        productos.costo as precio," 
                                  +"        sucursales.nombre as titulo,"
                                  +"        sucursales.direccion as ubicacion," 
                                  +"         productos_sucursales.stock as cantidad        " 
                                  +"   from productos_sucursales" 
                                  +"      join sucursales " 
                                  +"           on productos_sucursales.id_sucursal = sucursales.id_sucursal and sucursales.id_sucursal = 3 " 
                                  +"      join productos " 
                                  +"           on  productos_sucursales.id_producto = productos.id_producto";
    
               
               
                try {
                  conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "");
                   consultaEjercicio = conexion.prepareStatement(consultaSucursal);
                      listaEjercicio = consultaEjercicio.executeQuery();
                    /*prepara curso*/
                    while (listaEjercicio.next()){
                        %>
                          
                        <ul>
                            <li><%out.print(listaEjercicio.getString("titulo"));%></li>
                            <li><%out.print(listaEjercicio.getString("ubicacion"));%></li>
                            <li><%out.print(listaEjercicio.getString("mercancia"));%></li>
                            <li><%out.print(listaEjercicio.getString("precio"));%></li>
                            <li><%out.print(listaEjercicio.getString("cantidad"));%></li>
                        </ul>
                    
                        <%
                    }
                   
                    
                    out.print("cargado");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(consultaEjercicio + "</br>");
                    //out.println(consultaRel + "</br>");
                  
                } finally {
                    try {
                        //consultaRel.close();
                        consultaEjercicio.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
            %>

                    
       
          
           
    </body>
</html>