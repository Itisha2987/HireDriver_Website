<%-- 
    Document   : driverinfo
    Created on : 11 Jul, 2018, 9:45:55 AM
    Author     : lenov0
--%>

<%@page import="com.universal.dto.Driver"%>
<%@page import="com.universal.dao.DriverDao"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<title>Driver Details</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	
	
	<!-- Font -->
	
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700%7CAllura" rel="stylesheet">
	
	<!-- Stylesheets -->
	
	<link href="css/bootstrap.css" rel="stylesheet">
	
	<link href="css/ionicons.css" rel="stylesheet">
	
	<link href="css/fluidbox.min.css" rel="stylesheet">
	
	<link href="css/details/styles.css" rel="stylesheet">
	
	<link href="css/details/responsive.css" rel="stylesheet">
	
</head>
<body>
<%
int driverid=Integer.parseInt(request.getParameter("driverid"));
Driver driver=DriverDao.getDriverById(driverid);
%>
	<header>
		<div class="container">
			<div class="heading-wrapper">
				<div class="row">
					<div class="col-sm-6 col-md-6 col-lg-4">
						<div class="info">
							<i class="icon ion-ios-location-outline"></i>
							<div class="right-area">
								<h5><%=driver.getCity()%></h5>
								
							</div><!-- right-area -->
						</div><!-- info -->
					</div><!-- col-sm-4 -->
					
					<div class="col-sm-6 col-md-6 col-lg-4">
						<div class="info">
							<i class="icon ion-ios-telephone-outline"></i>
							<div class="right-area">
								<h5>HireDriver Helpline No 8770259918</h5>
								<h6>MON - SUN</h6>
							</div><!-- right-area -->
						</div><!-- info -->
					</div><!-- col-sm-4 -->
					
					<div class="col-sm-6 col-md-6 col-lg-4">
						<div class="info">
							<i class="icon ion-ios-chatboxes-outline"></i>
							<i class="icon ion-ios-chatboxes-outline"></i>
							<div class="right-area">
								<h5>javademo2987@gmail.com</h5>
								<h6>INSTANT REPLY</h6>
							</div><!-- right-area -->
						</div><!-- info -->
					</div><!-- col-sm-4 -->
				</div><!-- row -->
			</div><!-- heading-wrapper -->
			
			
		</div><!-- container -->
	</header>
	
	<section class="intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-1 col-lg-2"></div>
				<div class="col-md-10 col-lg-8">
					<div class="intro">
                                            <div class="profile-img"><img src="upload/<%=driver.getProfile()%>" alt=""></div>
						<h2><b><%=driver.getName()%></b></h2>
						<h4 class="font-yellow">Experienced Driver</h4>
						<ul class="information margin-tb-30">
							<li><b>Age : </b><%=driver.getAge()%></li>
							<li><b>EMAIL : </b><%=driver.getEmail()%></li>
							<li><b>PHONE : </b><%=driver.getPhone()%></li>
                                                        <li><b>City : </b><%=driver.getCity()%></li>
						</ul>
						
					</div><!-- intro -->
				</div><!-- col-sm-8 -->
			</div><!-- row -->
		</div><!-- container -->
	</section><!-- intro-section -->
	
	<section class="portfolio-section section">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="heading">
						<h3><b>Portfolio</b></h3>
						<h6 class="font-lite-black"><b>MY WORK</b></h6>
					</div>
				</div><!-- col-sm-4 -->
                                <h3>   &nbsp; &nbsp; &nbsp; &nbsp;<a href="journeydet.jsp?driverid=<%=driverid%>&drivername=<%=driver.getName()%>" >PROCEED FOR BOOKING</a> </h3>
			</div><!-- row -->
		</div><!-- container -->
		
		
	<footer>
		<p class="copyright">
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ion-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		</p>


	</footer>
	
	
	<!-- SCIPTS -->
	
	<script src="common-js/jquery-3.2.1.min.js"></script>
	
	<script src="common-js/bootstrap.js"></script>
	
       <script src="common-js/scripts.js"></script>
	
</body>
</html>
