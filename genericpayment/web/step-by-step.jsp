<!DOCTYPE html >
<html>
<% String ccph="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href="assets/metro/images/favicon.ico" />
        <title>Home | Government of Jharkhand Electronic Revenue Receipt Portal</title>
        
        <!-- <link href="css/demo.css" rel="stylesheet" type="text/css">-->
		<script src="assets/metro/js/demo.js"></script>

		<!--[if IE 8]>
        	<script>var IE8 = true;</script>
        	<script src="http://formstone.it/js/site.ie8.js"></script>
			<link rel="stylesheet" href="http://formstone.it/css/demo.ie8.css">
		<![endif]-->
		<!--[if IE 9]>
        	<script>var IE9 = true;</script>
        	<script src="http://formstone.it/js/site.ie9.js"></script>
		<![endif]-->

		<link href="assets/metro/css/jquery.fs.boxer.css" rel="stylesheet" type="text/css" media="all">
		<script src="assets/metro/js/jquery.fs.boxer.js"></script>

		<!--[DEMO:START-RESOURCES]-->
		<script>
			$(document).ready(function() {
				$(".boxer").not(".retina, .boxer_fixed, .boxer_top, .boxer_format, .boxer_mobile, .boxer_object").boxer();

				$(".boxer.boxer_fixed").boxer({
					fixed: true
				});

				$(".boxer.boxer_top").boxer({
					top: 50
				});

				$(".boxer.retina").boxer({
					retina: true
				});

				$(".boxer.boxer_format").boxer({
					formatter: function($target) {
						return '<h3>' + $target.attr("title") + "</h3>";
					}
				});

				$(".boxer.boxer_object").click(function(e) {
					e.preventDefault();
					e.stopPropagation();

					$.boxer( $('<div class="inline_content"><h2>More Content!</h2><p>This was created by jQuery and loaded into the new Boxer instance.</p></div>') );
				});

				$(".boxer.boxer_mobile").boxer({
					mobile: true
				});

				$(window).one("pronto.load", function() {
					$.boxer("close");
					$(".boxer").boxer("destroy");
				});
			});
		</script>
        
        <link rel="stylesheet" href="assets/metro/css/bootstrap_s.css" type="text/css"> 
        <link rel="stylesheet" href="assets/metro/css/bootstrap-responsive.css" type="text/css">
        <link rel="stylesheet" href="assets/metro/font-awesome/css/font-awesome.min.css" type="text/css">
        <link href="assets/metro/css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>      
        <div class="container">
            <div class="content">
                <div class="wrapper">
                    <div class="row">
                        <div class="span12">
                            <div class="row-fluid">
                                <div class="roundbox"> 
                                    <div class="span12">
                                        <div class="row-fluid">
                                            <div class="span4">
                                                <div id="mobilemenu">
                                                    <div class="btn-group">
                                                        <a data-toggle="dropdown" href="#"><i class="fa fa-bars fa-2x "></i>&nbsp;</a>
                                                        <ul class="dropdown-menu">                            	
                                                            <li><a href=""><i class="icon-home font18"></i> Home</a></li>
                                                            <li><a href=""> <i class="fa fa-credit-card"></i>Instant Pay</a></li>
                                                            <li><a  href="" rel="tooltip" data-placement="bottom" data-original-title="">
                                                            	<i class="fa  fa-sign-in"></i> Sign In</a></li>	
                                                            <li><a href="" data-toggle="modal" rel="tooltip" data-placement="bottom" 
                                                            	data-original-title="Department Login">
                                                                <i class="fa  fa-user"></i> Official</a></li>
                                                            <li><a href="" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Admin Login">
                                                                    <i class="fa  fa-user"></i> Admin</a></li>
                                                            <li><a href="" rel="tooltip" data-placement="bottom" data-original-title="">
                                                            	<i class="fa fa-dashboard"></i> Dashboard</a></li>
                                                        </ul>
                                                    </div> 
                                                </div>
                                                <div class="leftheader">
                                                    <a href="#">
                                                        <h2>Pay<span>Online</span></h2>
                                                    </a>
                                                    <h5>Government of Jharkhand</h5>
                                                </div>
                                            </div>
                                            <div class="span3 pull-right cust-span3">
                                                <form id="custom-search-form" class="form-search form-horizontal span12" action="" method="get">
                                                    <input type="hidden" name="step" id="step" value="10">
                                                    <input type="hidden" name="email" id="email" value="">
                                                    <div class="input-append span12">
                                                        <input type="text" class="search-query span12" name="er" id="challan" placeholder="Enter Receipt No">
                                                        <button type="button" class="btn"><i class="fa fa-search"></i></button>
                                                    </div>
                                                </form>
                            
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span12" id="navbarid">
                                        <div class="navbar">
                                            <div class="navbar-inner">
                                                <div class="container-fluid">
                                                    <a class="btn btn-navbar" data-toggle="dropdown" data-target=".nav-collapse">
                                                        <span class="icon-bar"></span>
                                                        <span class="icon-bar"></span>
                                                        <span class="icon-bar"></span>
                                                    </a>
                                                    <div class="nav-collapse collapse">
                                                        <ul class="nav">							
                                                            <li><a href="<%=ccph%>/GenericLogin">&nbsp;<i class="fa fa-home font18 lb1"></i> Home</a></li>
                                                            <li><a href="<%=ccph%>/genericpayment/unregisteredUserDetail.jsp"> <i class="fa  fa-credit-card"></i>
                                                            	Instant Pay</a></li>
                                                            <li><a  href="<%=ccph%>/landing.jsp" rel="tooltip" data-placement="bottom" data-original-title="">
                                                                <i class="fa  fa-sign-in"></i> Sign In</a></li>	
                                                            <li><a href="<%=ccph%>/Dashboard.jsp" rel="tooltip" data-placement="bottom" data-original-title="" >
                                                                <i class="fa fa-dashboard"></i> Dashboard</a></li>
                                                            <li><a href="<%=ccph%>/adminpayment/departmentLogin.jsp" data-toggle="modal" rel="tooltip" 
                                                           		data-placement="bottom" data-original-title="Department Login"> <i class="fa  fa-user"></i> 
                                                                Official</a></li>
                                                            <li><a href="<%=ccph%>/adminpayment/adminLogin.jsp" data-toggle="modal" rel="tooltip" 
                                                                data-placement="bottom" data-original-title="Admin Login"> <i class="fa  fa-user"></i> Admin</a></li>
                                                        </ul>                         		
                                                    </div>
                                                </div>
                                            </div> <!-- navbarid closed -->   
                                        </div>
                                    </div>
 <!--- banner---->                                   
<div class="banner-about">
<div class="span5"><img src="assets/metro/images/banner-jharkhand.png" alt="banner-jharkhand"></div>
<div class="span7">
<div class="span12 header-text bold f-s-5">
<p>Click & Pay
 </p>
</div>
<div class="span12"><img src="assets/metro/images/banner-save-time.png" alt="banner-save-time"></div>
<div class="span12  header-text bold f-s-2"><p>24x7 Online Payment-Any time & Any where</p></div>
</div>
<div class="clear"></div>
</div>
 <!--- banner-end----> 
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">

<div class="tabe-f">
<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs col" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Instant Pay</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Registered User</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Search Challan</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Dashboard</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    <section class="section-title left"> 
<h4 class="Step">Step by step guide to Tax Payer for Instant Payment:</h4>
</section>
<div class="tabe">
<div class="span4"><a href="assets/metro/images/payonlinepage-portal.jpg" class="boxer boxer_image" data-gallery="gallery" title='This is meant for the unregistered users. They can directly make the payment to the Government without  registration.' >
<img class="img-f" src="assets/metro/images/payonlinepage-portal-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><p class="no-margin-top flote_left">This is meant for the unregistered users. They can directly make the payment to the Government without  registration.</p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>


<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image.jpg" class="boxer boxer_image" data-gallery="gallery" title='The fields marked in (*) are the mandatory fields which means without filling up these fields the user cannot proceed further.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"></span><p class="no-margin-top flote_left">The fields marked in (*) are the mandatory fields which means without filling up these fields the user cannot proceed further.</p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image2.jpg" class="boxer boxer_image" data-gallery="gallery" title='Enter all your tax details.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image2-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li>Tax Info:</li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">Enter all your tax details.</p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image3.jpg" class="boxer boxer_image" data-gallery="gallery" title='Verify all your details.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image3-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li>Verify: </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">Verify all your details.</p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image4.jpg" class="boxer boxer_image" data-gallery="gallery" title='Click on Proceed to pay' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image4-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li>Click on 'Proceed to pay '</li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left"></p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image5.jpg" class="boxer boxer_image" data-gallery="gallery" title='Page redirects to NSDL and ask the user to select the Bank through which the payment has to be done.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image5-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">Page redirects to NSDL and ask the user to select the Bank through which the payment has to be done.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image6.jpg" class="boxer boxer_image" data-gallery="gallery" title='User should enter the Internet Banking Log-in ID and Password issued by the respective Bank and login into bank account.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image6-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">User should enter the Internet Banking Log-in ID and Password issued by the respective Bank and login into bank account.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image7.jpg" class="boxer boxer_image" data-gallery="gallery" title='a)	User can enter the Payment remarks in the given box.
<br>
b)	User selects Pay option and gets the payment validation screen.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image7-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">a)	User can enter the Payment remarks in the given box. </p> </li>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">b)	User selects Pay option and gets the payment validation screen.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image8.jpg" class="boxer boxer_image" data-gallery="gallery" title='a)	User enters Internet User ID and enters Transaction password.
<br>
b)	User enters the OTP i.e received on registered mobile number.
<br>
c)	After entering  fields user selects Validate option.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image8-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">a)	User enters Internet User ID and enters Transaction password. </p> </li>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">b)	User enters the OTP i.e received on registered mobile number.</p> </li>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">c)	After entering  fields user selects Validate option.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>


<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image9.jpg" class="boxer boxer_image" data-gallery="gallery" title='Continue with OK Button.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image9-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">Continue with ‘OK” Button.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>


<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image10.jpg" class="boxer boxer_image" data-gallery="gallery" title='Again click on continue to carry forward the transaction.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image10-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">Again click on ‘continue’ to carry forward the transaction.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image11.jpg" class="boxer boxer_image" data-gallery="gallery" title='User gets bank CIN No. of that respective bank  and Transaction No. after the successful completion of the transaction.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image11-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">User gets bank CIN No. of that respective bank  and Transaction No. after the successful completion of the transaction.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>
    </div>
    
    
    <div role="tabpanel" class="tab-pane" id="profile">
    <section class="section-title left"> 
<h4 class="Step">Step by step guide to Tax Payer for Registered User</h4>
</section>
<div class="tabe">
<div class="span4"><a href="assets/metro/images/Search-Challan-image1.jpg" class="boxer boxer_image" data-gallery="gallery" title='This module is meant for the registered user or new user who wants to use the online payment system after registration.
<br>
<li><p class="no-margin-top flote_left">If you are already an existing user , enter the email id,  password and the secret code. Then click on Login.' >
<img class="img-f" src="assets/metro/images/Search-Challan-image1-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><p class="no-margin-top flote_left">This module is meant for the registered user or new user who wants to use the online payment system after registration.</p></li>
<br>
<li><p class="no-margin-top flote_left">If you are already an existing user , enter the email id,  password and the secret code. Then click on ‘Login’.</p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Search-Challan-image2.jpg" class="boxer boxer_image" data-gallery="gallery" title='If you are a new user, then click on Register New to create a new account.
<br>
Then fill in the fields mentioned in the page with the valid email id and Mobile number and then click on Create an Account.' >
<img class="img-f" src="assets/metro/images/Search-Challan-image2-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><p class="no-margin-top flote_left">If you are a new user, then click on ‘Register New’ to create a new account.</p></li>
<br>
<li><p class="no-margin-top flote_left">Then fill in the fields mentioned in the page with the valid email id and Mobile number and then click on ‘Create an Account’.</p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Search-Challan-image4.jpg" class="boxer boxer_image" data-gallery="gallery" title='Fill in the details in the Complete Your Registration page and then click on Submit.
<br>
Note: Never reveal your secret question to anybody because that is the base for changing your password.' >
<img class="img-f" src="assets/metro/images/Search-Challan-image4-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><p class="no-margin-top flote_left">Fill in the details in the ‘Complete Your Registration’ page and then click on ‘Submit’.</p></li>
<br>
<li><p class="no-margin-top flote_left">Note: Never reveal your secret question to anybody because that is the base for changing your password.</p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Search-Challan-image5.jpg" class="boxer boxer_image" data-gallery="gallery" title='Account is created.' >
<img class="img-f" src="assets/metro/images/Search-Challan-image5-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>Account is created.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>
    
<div class="tabe">
<div class="span4"><a href="assets/metro/images/Search-Challan-image6.jpg" class="boxer boxer_image" data-gallery="gallery" title='Click on Pay Tax to proceed with the payment.' >
<img class="img-f" src="assets/metro/images/Search-Challan-image6-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>Click on 'Pay Tax' to proceed with the payment.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Search-Challan-image7.jpg" class="boxer boxer_image" data-gallery="gallery" title='The fields marked in (*) are the mandatory fields which means without filling up these fields the user cannot proceed further.Click on Next.' >
<img class="img-f" src="assets/metro/images/Search-Challan-image7-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><p class="no-margin-top flote_left">The fields marked in (*) are the mandatory fields which means without filling up these fields the user cannot proceed further.Click on 'Next'. </p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Search-Challan-image8.jpg" class="boxer boxer_image" data-gallery="gallery" title='Click on Verify.' >
<img class="img-f" src="assets/metro/images/Search-Challan-image8-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>Click on 'Verify'.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="images/Search-Challan-image9.jpg" class="boxer boxer_image" data-gallery="gallery" title='Click on Proceed to Pay.' >
<img class="img-f" src="assets/metro/images/Search-Challan-image9-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>Click on 'Proceed to Pay'.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Search-Challan-image10.jpg" class="boxer boxer_image" data-gallery="gallery" title='Page redirects to NSDL and ask the user to select the Bank through which the payment has to be done.' >
<img class="img-f" src="assets/metro/images/Search-Challan-image10-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><p class="no-margin-top flote_left">Page redirects to NSDL and ask the user to select the Bank through which the payment has to be done.</p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image6.jpg" class="boxer boxer_image" data-gallery="gallery" title='User should enter the Internet Banking Log-in ID and Password issued by the respective Bank and login into bank account.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image6-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><p class="no-margin-top flote_left">User should enter the Internet Banking Log-in ID and Password issued by the respective Bank and login into bank account.</p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image7.jpg" class="boxer boxer_image" data-gallery="gallery" title='a)	User can enter the Payment remarks in the given box. 
<br>
b)	User selects Pay option and gets the payment validation screen.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image7-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">a)	User can enter the Payment remarks in the given box. </p> </li>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">b)	User selects Pay option and gets the payment validation screen.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image8.jpg" class="boxer boxer_image" data-gallery="gallery" title='a)	User enters Internet User ID and enters Transaction password.
<br>
b)	User enters the OTP i.e received on registered mobile number.
<br>
c)	After entering  fields user selects Validate option.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image8-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">a)	User enters Internet User ID and enters Transaction password. </p> </li>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">b)	User enters the OTP i.e received on registered mobile number.</p> </li>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">c)	After entering  fields user selects Validate option.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>


<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image9.jpg" class="boxer boxer_image" data-gallery="gallery" title='Continue with OK Button.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image9-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">Continue with 'OK" Button.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>


<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image10.jpg" class="boxer boxer_image" data-gallery="gallery" title='Again click on continue to carry forward the transaction.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image10-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">Again click on 'continue' to carry forward the transaction.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

<div class="tabe">
<div class="span4"><a href="assets/metro/images/Instant-Payment-image11.jpg" class="boxer boxer_image" data-gallery="gallery" title='User gets bank CIN No. of that respective bank  and Transaction No. after the successful completion of the transaction.' >
<img class="img-f" src="assets/metro/images/Instant-Payment-image11-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
</ul>
</div>
<div class="taxhead-step">
<ul>
<li> </li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"> </span><p class="no-margin-top flote_left">User gets bank CIN No. of that respective bank  and Transaction No. after the successful completion of the transaction.</p> </li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>

    </div>
  <!--end-->  
    <div role="tabpanel" class="tab-pane" id="messages">
    <section class="section-title left"> 
<h4 class="Step">Search Challan</h4>
</section>
    <div class="tabe">
<div class="span4"><a href="assets/metro/images/Search-Challan.jpg" class="boxer boxer_image" data-gallery="gallery" title='This option is used to search challan and get the print of challan.' >
<img class="img-f" src="assets/metro/images/Search-Challan-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>This option is used to search challan and get the print of challan.</li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold"></span><p class="no-margin-top flote_left"></p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>
    
    </div>
    <div role="tabpanel" class="tab-pane" id="settings">
    
        <section class="section-title left"> 
<h4 class="Step">Dashboard</h4>
</section>
    <div class="tabe">
<div class="span4"><a href="assets/metro/images/Dashboard.jpg" class="boxer boxer_image" data-gallery="gallery" title='Real time  Revenue collection' >
<img class="img-f" src="assets/metro/images/Dashboard-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>Real time  Revenue collection</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
<div class="bg-2"><img src="assets/metro/images/full-width.png" alt="bg"></div>
    
    </div>
  </div>

</div>
</div>







</div>                                  
</div>
</div>
</div>
</div>
</div> 
</body>

    
 <!--<div class="youtube"><a href="http://player.vimeo.com/video/15091562" class="boxer button small" data-gallery="video_gallery" title="you tube">
video from youtube
</a></div>-->       
        
 <!-- <script src="js/jquery1.8.3.js"></script>-->
  <script src="assets/metro/js/bootstrap.js"></script>
  
                    
    </body>
</html>