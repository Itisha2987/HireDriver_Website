<%-- 
    Document   : journeydet
    Created on : 17 Jul, 2018, 11:33:15 PM
    Author     : lenov0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>

<head>
	<title>Airline Booking Form a Responsive Widget Template :: w3layouts</title>
	<!-- Meta tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Airline Booking Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
	/>
	<script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- //Meta tags -->
	<!-- Stylesheet -->
	<link href="css/wickedpickerj.css" rel="stylesheet" type='text/css' media="all" />
	<link rel="stylesheet" href="css/jquery-uij.css" />
	<link href="css/stylej.css" rel='stylesheet' type='text/css' />
	<!-- //Stylesheet -->
	<!--fonts-->
	<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Megrim" rel="stylesheet">
	<!--//fonts-->
</head>

<body>
    <%
   String drivername= request.getParameter("drivername");
   String driverid= request.getParameter("driverid");
    %>
	<!--background-->
	<h1>Journey Details</h1>
	<div class="booking-form-w3layouts">
		<!-- Form starts here -->
		<form action="journeyServlet" method="post">
            <input type="text" name="driverid" setEditable="false" value="<%=driverid%>" style="display:none">
              <input type="text" name="drivername" setEditable="false" value="<%=drivername%>" style="display:none">

			<h2 class="sub-heading-agileits">Booking Details</h2>
			<div class="main-flex-w3ls-sectns">
				<div class="field-agileinfo-spc form-w3-agile-text1">
                                    <select class="form-control"  name="cityfrom">
										<option>From</option>
										<option value="indore">Indore</option>
										<option value="pune">Pune</option>
                                                                                <option value="bhopal">Bhopal</option>
                                                                                
									</select>
				</div>
				<div class="field-agileinfo-spc form-w3-agile-text2">
					<select class="form-control" name="cityto">
										<option>To</option>
										<option value="indore">Indore</option>
										<option value="pune">Pune</option>
                                                                                <option value="bhopal">Bhopal</option>
									</select>
				</div>
			</div>
			
			<div class="main-flex-w3ls-sectns">
				<div class="field-agileinfo-spc form-w3-agile-text1">
					<input id="datepicker" name="departuredate" type="text" placeholder="Departure Date" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'mm/dd/yyyy';}"
					    required="">
				</div>
				<div class="field-agileinfo-spc form-w3-agile-text2">
					<input type="text" id="timepicker" name="departuretime" class="timepicker form-control" placeholder="Departure Time" value="">
				</div>
			</div>

			
			<div class="radio-section">
				<h6>Select your Fare</h6>
				<ul class="radio-buttons-w3-agileits">
					<li>
						<input type="radio" id="a-option" value="oneway" name="fare">
						<label for="a-option">One Way</label>
						<div class="check"></div>
					</li>
					<li>
						<input type="radio" id="b-option" value="roundtrip" name="fare">
						<label for="b-option">Round-Trip</label>
						<div class="check">
							<div class="inside"></div>
						</div>
					</li>
				</ul>
				<div class="clear"></div>
			</div>
			<div class="main-flex-w3ls-sectns">
				<div class="field-agileinfo-spc form-w3-agile-text1">
					<input id="datepicker1" name="returndate" type="text" placeholder="Return Date" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'mm/dd/yyyy';}"
					    required="">
				</div>
				<div class="field-agileinfo-spc form-w3-agile-text2">
					<input type="text" id="timepicker1" name="returntime" class="timepicker form-control" placeholder="Return Time" value="">
				</div>
			</div>
			<div class="field-agileinfo-spc form-w3-agile-text">
				<textarea name="message" placeholder="Any Message..."></textarea>
			</div>
			<h3 class="sub-heading-agileits">Personal Details</h3>
			<div class="main-flex-w3ls-sectns">
				<div class="field-agileinfo-spc form-w3-agile-text1">
					<input type="text" name="name" placeholder="Full Name" required="">
				</div>
				<div class="field-agileinfo-spc form-w3-agile-text2">
					<input type="text" name="phone" placeholder="Phone Number" required="">
				</div>
			</div>
			<div class="field-agileinfo-spc form-w3-agile-text">
				<input type="email" name="email" placeholder="Email" required="">
			</div>
			<div class="clear"></div>
			<input type="submit" value="Submit">
			<input type="reset" value="Clear Form">
			<div class="clear"></div>
		</form>
		<!--// Form starts here -->
	</div>
	<!--copyright-->
	<div class="copyright">
		<p>&copy; 2018. Airline Booking Form . All Rights Reserved</p>
	</div>
	<!--//copyright-->
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<!-- Time Js -->
	<script type="text/javascript" src="js/wickedpicker.js"></script>
	<script type="text/javascript">
		$('.timepicker,.timepicker1').wickedpicker({
			twentyFour: false
		});
	</script>
	<!--// Time Js -->
	<!-- Calendar Js -->
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function () {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3").datepicker();
		});
	</script>
	<!-- //Calendar Js -->

</body>

</html>