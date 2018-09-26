<%-- 
    Document   : drivergallery.jsp
    Created on : 13 Jul, 2018, 12:52:34 PM
    Author     : lenov0
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.universal.dto.Driver"%>
<%@page import="com.universal.dao.DriverDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 
	Template 2047 Brown Field
	by www.tooplate.com 
-->
<title>Hire Driver - Gallery</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/tooplate_style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/swfobject.js"></script>
	<script type="text/javascript">
        var flashvars = {};
        flashvars.xml_file = "photo_list.xml";
        var params = {};
        params.wmode = "transparent";
        var attributes = {};
        attributes.id = "slider";
        swfobject.embedSWF("flash_slider.swf", "flash_grid_slider", "440", "220", "9.0.0", false, flashvars, params, attributes);
    </script>
    
    <link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css" />    
    
    <!-- Arquivos utilizados pelo jQuery lightBox plugin -->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.lightbox-0.5.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css" media="screen" />
    <!-- / fim dos arquivos utilizados pelo jQuery lightBox plugin -->
    
    <!-- Ativando o jQuery lightBox plugin -->
    <script type="text/javascript">
    $(function() {
        $('.lightbox').lightBox();
    });
    </script>

</head>
<body>

<div id="tooplate_wrapper">
    
    <div id="tooplate_middle">
    	<div id="mid_slider">
        	
        </div>
        <div>
            <div id="mid_title">
                Our Driver Gallery	
          </div>
            <p style="color:white">Being a safe and responsible driver takes a combination of knowledge, skill and attitude.Good drivers ensure safety for drivers and passengers; they maximise fuel efficiency; and adhere to schedules – ensuring passengers are not left waiting by the roadside, and get to their journey destinations on time.Here is our drivers...... you acn seee their detaiils and proceed for booking by selecting the driver of your choice</p>
	  	</div>
        <div class="cleaner"></div>
	</div> <!-- end of middle -->
    
    <div id="tooplate_main_top"></div>
    <div id="tooplate_main">
    	
        <div id="gallery">
 <%
                            ArrayList<Driver> imageList=DriverDao.getDriverInfo();
                            for(Driver driver:imageList){
                                String name=driver.getName();
                                String nm=name.toUpperCase();
                        %>


       	<div class="gallery_box">
                <a class="lightbox"  href="upload/<%=driver.getProfile()%>" title="Cras nec nisl a enim ornare imperdiet.">
				<img width="300" height="150" src="upload/<%=driver.getProfile()%>" alt="Image 01" class="image_wrapper" />
                </a>
                                <center><p style="font-style: italic; font-weight: bolder; font-size: x-large"><%=nm%></p></center>
                                <center><a href="driverinfo.jsp?driverid=<%=driver.getId()%>" class="more float_l">Detail</a>
                <a href="journeydet.jsp?driverid=<%=driver.getId()%>&drivername=<%=driver.getName()%>" class="more float_l">Book</a></center>
                <div class="cleaner"></div>
			</div>
                <% } %>
        </div> 
             
		<div class="cleaner"></div>
    </div> <!-- end of main -->
    
    <div id="tooplate_main_bottom"></div>
	
</div> <!-- wrapper -->

<div id="tooplate_footer_wrapper">
	<div id="tooplate_footer">
        Copyright © 2048 <a href="#">Hire Driver</a> 
        
	</div>
</div>

</body>
</html>