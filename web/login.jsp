<%-- 
    Document   : login
    Created on : 10 Jul, 2018, 5:37:54 PM
    Author     : lenov0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Taped Login Form Flat Responsive Widget Template::w3layouts</title>
        <!-- Meta tag Keywords -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <meta name="keywords" content="taped login form Widget a Flat Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Meta tag Keywords -->
        <link rel="stylesheet" href="css/stylelogin.css" type="text/css" media="all" /><!-- Style-CSS -->
        <link rel="stylesheet" href="css/font-awesomelogin.css" type="text/css" media="all" />
        <link href="//fonts.googleapis.com/css?family=Snippet" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Barlow" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
    </head>
    <body data-vide-bg="video/ship">
         <%
           String id= request.getParameter("driverid");
           %>
        <section class="login-maintop">
            <div class="login-main">
                <header><h1>Login form</h1></header>
                <div class="login-form">
                    <h2>login now</h2>
                    <form action="LoginServlet" method="get">
                        <input type="text" name="id" setEditable="false" value="<%=id%>" style="display:none">
                        <span><i class="fa fa-user-o" aria-hidden="true"></i></span>
                        <input type="text" name="username" placeholder="enter your name" required="">
                        <span><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
                        <input type="password" name="password" placeholder="enter your password" required="">
                        <p style="color:red" align="center">${error}</p><br/>
                        <input type="submit" value="login">
                    </form>
                 <div class="login-password">
				<span><a href=forgotPword.html>forgot password</a></span>
			</div>
			<div class="login-input">
			
			</div>  
                   

                    
                    <div class="social-icons">
                        <ul>
                            <li><a href="www.facebook.com"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                        </ul>
                        <a href=SignUpform.html>SignUp here</a> &nbsp;&nbsp;&nbsp; 
                        
                    </div>
                </div>
                <!--footer-->
                <div class="footer">
                    <p>&copy; 2018 Taped Login Form. All rights reserved </p>
                </div>
                <!--//footer-->
            </div>
        </section>
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <script src="js/jquery.vide.min.js"></script>
    </body>
</html>

