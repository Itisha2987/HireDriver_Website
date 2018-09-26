<%-- 
    Document   : delete
    Created on : 2 Jul, 2018, 11:10:26 AM
    Author     : root
--%>

<%@page import="com.universal.dao.DriverDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <%
           String id= request.getParameter("deletekey");
           
          boolean flag= DriverDao.deleteDriverById(Integer.parseInt(id));
            if(!flag){
                response.sendRedirect("driver.jsp");
            }
            
            %>
        </h1>
    </body>
</html>
