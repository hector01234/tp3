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
     
    <% Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = null;
            PreparedStatement consultaEjercicio = null;
    String consultaSucursal = " select productos.nombre as mercancia,"
                                  +"        productos.costo as precio," 
                                  +"        sucursales.nombre as titulo,"
                                  +"        sucursales.direccion as ubicacion"                              
                                  +"   from productos_sucursales" 
                                  +"      join sucursales " 
                                  +"           on productos_sucursales.id_sucursal = sucursales.id_sucursal  " 
                                  +"      join productos " 
                                  +"           on  productos_sucursales.id_producto = productos.id_producto";
    
               
               
                try {
                  conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "");
                   consultaEjercicio = conexion.prepareStatement(consultaSucursal);
                     ResultSet listaEjercicio = consultaEjercicio.executeQuery();
                    /*prepara curso*/
                    while (listaEjercicio.next()){
                        %>
                        <ul>
                            <li><%out.print(listaEjercicio.getString("titulo"));%></li>
                            <li><%out.print(listaEjercicio.getString("mercancia"));%></li>
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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selector de sucursal</title>
</head>
<body>
    
    <h2>  por favor elija la sucursal que desee </h2>
    <h3 > <a href="sucursal1.jsp ">  primera sucursal  </a> </h3>
    <h3><a href="sucursal2.jsp">  segunda sucursal </a> </h3>
    <h3> <a href="sucursal3.jsp"> tercera sucursal </a></h3>
    
</body>
</html>

                    
       
          
           
    </body>
</html>