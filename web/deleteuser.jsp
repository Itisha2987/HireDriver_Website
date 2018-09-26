<%-- 
    Document   : deleteuser
    Created on : 9 Jul, 2018, 6:17:02 PM
    Author     : lenov0
--%>

<%@page import="com.universal.dao.UserDao"%>
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
           
          boolean flag= UserDao.deleteUserById(Integer.parseInt(id));
            if(!flag){
                response.sendRedirect("user.jsp");
            }
            
            %>
        </h1>
    </body>
</html>
