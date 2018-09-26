<%-- 
    Document   : edituser
    Created on : 9 Jul, 2018, 6:11:59 PM
    Author     : lenov0
--%>

<%@page import="com.universal.dto.User"%>
<%@page import="com.universal.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Meta tags -->
	<title>General Application Form a Flat Responsive Widget Template :: w3layouts</title>
	<meta name="keywords" content="General Application Form Responsive widget, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- stylesheets -->
	<link rel="stylesheet" href="css/styleedit.css" type="text/css" media="all">
	
	<!-- google fonts  -->
	<link href="//fonts.googleapis.com/css?family=Alegreya+Sans:100,100i,300,300i,400,400i,500,500i,700,700i,800,800i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">

</head>
<body>

      
        <%
        String name;
       
        String phone;
        String email;
        String username;
        int activate;
        
        %>
       <%
       
       int id=Integer.parseInt(request.getParameter("editkey"));
       User driver=UserDao.getUserById(id);
       name=driver.getName();
       username=driver.getUsername();
       phone=driver.getPhone();
       email=driver.getEmail();
       
       activate=driver.getActivate();
       
       %>
       
        <div class="w3ls-banner">
	<div class="heading">
		<h1>EDIT <%=name%> INFO</h1>
	</div>
		<div class="container">
			<div class="heading">
				<h2>Please Enter User Details</h2>
				
			</div>
			<div class="agile-form">
				<form action="UpdateUserServlet" method="get">
					<ul class="field-list">
                                            <li >
							
							<div class="form-input add">
								<span class="form-sub-label">
									<input type="text" name="id" setEditable="false" value="<%=id%>" style="display: none">
								</span>
								
							</div>
						</li>
						<li class="name">
							<label class="form-label"> Name <span class="form-required"> * </span></label>
							<div class="form-input add">
								<span class="form-sub-label">
									<input type="text" name="name"   value="<%=name%>">
								</span>
								
							</div>
						</li>
                                                <li class="name">
							<label class="form-label"> UserName <span class="form-required"> * </span></label>
							<div class="form-input add">
								<span class="form-sub-label">
									<input type="text" name="username"   value="<%=username%>">
								</span>
								
							</div>
						</li>
                                                
						<li> 
							<label class="form-label"> E-Mail Address <span class="form-required"> * </span></label>
							<div class="form-input">
								<input type="email" name="email"  value="<%=email%>" required="">
							
							</div>
						</li>
						<li> 
							<label class="form-label"> Phone Number <span class="form-required"> * </span></label>
							<div class="form-input">
								<input type="text" name="phone"  value="<%=phone%>" required="">
							
							</div>
						</li>
                                                <li> 
							<label class="form-label">Activation Status <span class="form-required"> * </span></label>
							<div class="form-input">
                                                            <input type="text" name="activate"  required="" value="<%=activate%>"  >
							</div>
						</li>
                                                 
					</ul>
					<div class="submit_btn">
						<input type="submit" value="Edit">
					</div>
				</form>	
			</div>
		</div>
			</div>
</body>
</html>
         
      
       
       
         
     
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       <!--<form action="UpdateUserServlet">
            <table>
                <tr>
                    
                    <td><input type="text"  name="id" value="<%=id%>" style="display: none"></td>
                </tr>
                 <tr>
                    <td>Name</td>
                    <td><input type="text"  name="name" value="<%=name%>" ></td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td>
                        <input type="text" name="username" value="<%=username%>"> 
                    </td>
                </tr>
                
                 <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" value="<%=email%>"></td>
                </tr>
                 <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phone"  value="<%=phone%>"></td>
                </tr>
                
                <tr>
                    <td>Activation Status</td>
                    <td><input type="text"  name="activate" value="<%=activate%>"></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" value="Update">
                    <input type="reset" value="Reset"></td>
                </tr>
                
            </table>
                
        </form>
    </body>
</html>
       -->
