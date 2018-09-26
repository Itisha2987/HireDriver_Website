

<%-- 
    Document   : edit
    Created on : 2 Jul, 2018, 11:10:16 AM
    Author     : root
--%>

<%@page import="com.universal.dto.Driver"%>
<%@page import="com.universal.dao.DriverDao"%>
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
        String city;
        String gender;
        String phone;
        String email;
        int age;
        String lisence;
        int activate;
        
        %>
       <%
       
       int id=Integer.parseInt(request.getParameter("editkey"));
       Driver driver=DriverDao.getDriverById(id);
       name=driver.getName();
       city=driver.getCity();
       gender=driver.getGender();
       phone=driver.getPhone();
       email=driver.getEmail();
       age=driver.getAge();
       lisence=driver.getLisence();
       activate=driver.getActivation_status();
       
       %>
       
       
       
       <div class="w3ls-banner">
	<div class="heading">
		<h1>EDIT <%=name%> INFO</h1>
                 
	</div>
		<div class="container">
			<div class="heading">
				<h2>Please Enter Driver Details</h2>
				
			</div>
			<div class="agile-form">
				<form action="UpdateDriverServlet" method="get">
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
							<label class="form-label"> Age <span class="form-required"> * </span></label>
							<div class="form-input add">
								<span class="form-sub-label">
									<input type="text" name="age"   value="<%=age%>">
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
							<label class="form-label"> Gender <span class="form-required"> * </span></label>
							<div class="form-input">
								<select class="form-dropdown" name="gender" required value="<%=gender%>">
									
									<option value="Male"> Male </option>
									<option value="Female"> Female </option>
									
								</select>
							</div>
						</li>
						
				                <li>
							<label class="form-label">
							   City
							   <span class="form-required"> * </span>
							</label>
							<div class="form-input add">
								<span class="form-sub-label">
                                                                    <input type="text" name="city"  value="<%=city%>">
								</span>
								
							</div>
                                                 </li>
     
                                                 <li> 
							<label class="form-label">Lisence Number <span class="form-required"> * </span></label>
							<div class="form-input">
                                                            <input type="text" name="lisence"  value="<%=lisence%>" required= "" >
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
         
      