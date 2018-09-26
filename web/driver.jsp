<%-- 
    Document   : admin
    Created on : 30 Jun, 2018, 11:29:57 AM
    Author     : root
--%>

<%@page import="com.universal.dto.Driver"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.universal.dao.DriverDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/jquery.dataTables.min.js"/></script>
        
    <link href="css/jquery.dataTables.min.css" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <script>
            $(document).ready(function() {
    var table = $('#example').DataTable();
 
    $('#example tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
    } );
 
    $('#button').click( function () {
        alert( table.rows('.selected').data().length +' row(s) selected' );
    } );
} );
        </script>
        
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <h3 align="right"><a href="login.jsp">Logout</a></h3>
       <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>PROFILE</th>
                <th>VIEW DRIVER HISTORY</th>
                <th>EDIT</th>
                <th>DELETE</th>
            </tr>
        </thead>
        <tbody>

        <%
            ArrayList<Driver> driverList=DriverDao.getDriverInfo();
            System.out.println(driverList);
            for(Driver driver:driverList){
                out.print("<tr>");
                int id=driver.getId();
                out.print("<td>"+driver.getId()+"</td>");
                out.print("<td>"+driver.getName()+"</td>");
                %>
               <td><a href="dutyinfo.jsp?driverkey=<%=id%>"><img src="upload/<%=driver.getProfile()%>" width='30px' height='30px' ></a></td>

                <%
                out.print("<td>"+driver.getActivation_status()+"</td>");
                out.print("<td><a href=editdriver.jsp?editkey="+id+"><img src='images/edit.png' width='30px' height='30px'></a></td>");
                out.print("<td><a href=delete.jsp?deletekey="+id+"><img src='images/delete.jpeg' width='30px' height='30px' ></a></td>");
               
                
                out.print("</tr>");
            }


        %>    
          </tbody>
       </table>
            </center>
    </body>
</html>
