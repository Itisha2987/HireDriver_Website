<%-- 
    Document   : success
    Created on : 19 Jul, 2018, 5:25:30 PM
    Author     : lenov0
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
                <th>Passenger Name</th>
                <th>From</th>
                <th>To</th>
                <th>Departure Date</th>
                <th>Departure Time</th>
                <th>Fare</th>
                <th>Return Date</th>
                <th>Return Time</th>
                <th>Amount</th>
                
            </tr>
        </thead>
        <tbody>

        <%
            String driverid=request.getParameter("driverkey");
            int id=Integer.parseInt(driverid);
            ArrayList<Driver> driverList=DriverDao.getDutyInfoById(id);
            System.out.println(driverList);
            for(Driver driver:driverList){
                out.print("<tr>");
                out.print("<td>"+driver.getPassengername()+"</td>");
                out.print("<td>"+driver.getCityFrom()+"</td>");
                out.print("<td>"+driver.getCityTo()+"</td>");
               out.print("<td>"+driver.getDeparturedate()+"</td>");
                out.print("<td>"+driver.getDeparturetime()+"</td>");
                out.print("<td>"+driver.getFare()+"</td>");
                out.print("<td>"+driver.getReturndate()+"</td>");
                out.print("<td>"+driver.getReturntime()+"</td>");
                out.print("<td>"+driver.getAmount()+"</td>");
                out.print("</tr>");
            }


        %>    
          </tbody>
       </table>
            </center>
    </body>
</html>

