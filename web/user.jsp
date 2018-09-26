<%-- 
    Document   : user
    Created on : 9 Jul, 2018, 5:38:52 PM
    Author     : lenov0
--%>

<%@page import="com.universal.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.universal.dto.User"%>
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
        <h3 align="right"><a href="login.jsp">Logout</a></h3>
        <center>
       <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>USERNAME</th>
                <th>EMAIL</th>
                <th>PHONE</th>
                <th>ACTIVATION STATUS</th>
                <th>EDIT</th>
                <th>DELETE</th>
            </tr>
        </thead>
        <tbody>

        <%
            ArrayList<User> userList=UserDao.getUserInfo();
            System.out.println(userList);
            for(User user:userList){
                out.print("<tr>");
                int id=user.getId();
                out.print("<td>"+user.getId()+"</td>");
                out.print("<td>"+user.getName()+"</td>");
                out.print("<td>"+user.getUsername()+"</td>");
                out.print("<td>"+user.getEmail()+"</td>");
                out.print("<td>"+user.getPhone()+"</td>");
                out.print("<td>"+user.getActivate()+"</td>");
                out.print("<td><a href=edituser.jsp?editkey="+id+"><img src='images/edit.png' width='30px' height='30px'></a></td>");
                out.print("<td><a href=deleteuser.jsp?deletekey="+id+"><img src='images/delete.jpeg' width='30px' height='30px' ></a></td>");
               
                
                out.print("</tr>");
            }


        %>    
          </tbody>
       </table>
            </center>
    </body>
</html>
