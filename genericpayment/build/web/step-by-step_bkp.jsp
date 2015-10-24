<!DOCTYPE html >
<html><head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href="./images/favicon.ico" />
        <title>Home | Government of Jharkhand Electronic Revenue Receipt Portal</title>
        
        <!-- <link href="css/demo.css" rel="stylesheet" type="text/css">-->
		<script src="js/demo.js"></script>

		<!--[if IE 8]>
        	<script>var IE8 = true;</script>
        	<script src="http://formstone.it/js/site.ie8.js"></script>
			<link rel="stylesheet" href="http://formstone.it/css/demo.ie8.css">
		<![endif]-->
		<!--[if IE 9]>
        	<script>var IE9 = true;</script>
        	<script src="http://formstone.it/js/site.ie9.js"></script>
		<![endif]-->

		<link href="css/jquery.fs.boxer.css" rel="stylesheet" type="text/css" media="all">
		<script src="js/jquery.fs.boxer.js"></script>

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
        
        <link rel="stylesheet" href="css/bootstrap_s.css" type="text/css"> 
        <link rel="stylesheet" href="css/bootstrap-responsive.css" type="text/css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>
     <%
                    String ccph="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
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
                                                            <li><a href="<%=ccph%>/Reghome.jsp"><i class="icon-home font18"></i> Home</a></li>
                                  <li><a href="<%=ccph%>/genericpayment/unregisteredUserDetail.jsp"> <i class="fa fa-credit-card"></i>Instant Pay</a></li>
                                  <li><a  href="<%=ccph%>/Home.jsp" rel="tooltip" data-placement="bottom" data-original-title=""> <i class="fa  fa-sign-in"></i> Sign In</a></li>
                
                                  <li><a href="<%=ccph%>/adminpayment/departmentLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Department Login"> <i class="fa  fa-user"></i> Official</a></li>
                                  <li><a href="<%=ccph%>/Dashboard.jsp" rel="tooltip" data-placement="bottom" data-original-title="" > <i class="fa fa-dashboard"></i> Dashboard</a></li>
                        <li><a href="<%=ccph%>/adminpayment/adminLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Admin Login"> <i class="fa  fa-user"></i> Admin</a></li>
                         <li><a href="<%=ccph%>/about.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="About"> <i class="fa  fa-user"></i>About</a></li>
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
                                                           <li><a href="<%=ccph%>/Reghome.jsp"><i class="icon-home font18"></i> Home</a></li>
                                  <li><a href="<%=ccph%>/genericpayment/unregisteredUserDetail.jsp"> <i class="fa fa-credit-card"></i>Instant Pay</a></li>
                                  <li><a  href="<%=ccph%>/Home.jsp" rel="tooltip" data-placement="bottom" data-original-title=""> <i class="fa  fa-sign-in"></i> Sign In</a></li>
                
                                  <li><a href="<%=ccph%>/adminpayment/departmentLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Department Login"> <i class="fa  fa-user"></i> Official</a></li>
                                  <li><a href="<%=ccph%>/Dashboard.jsp" rel="tooltip" data-placement="bottom" data-original-title="" > <i class="fa fa-dashboard"></i> Dashboard</a></li>
                        <li><a href="<%=ccph%>/adminpayment/adminLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Admin Login"> <i class="fa  fa-user"></i> Admin</a></li>
                         <li><a href="<%=ccph%>/about.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="About"> <i class="fa  fa-user"></i>About</a></li>
                                </ul>	
                                                    </div>
                                                </div>
                                            </div> <!-- navbarid closed -->   
                                        </div>
                                    </div>
 <!--- banner---->                                   
<div class="banner-about">
<div class="span5"><img src="images/banner-jharkhand.png" alt="banner-jharkhand"></div>
<div class="span7">
<div class="span12 header-text bold f-s-5">
<p>Click & Pay
 </p>
</div>
<div class="span12"><img src="images/banner-save-time.png" alt="banner-save-time"></div>
<div class="span12  header-text bold f-s-2"><p>24x7 Online Payment-Any time & Any where</p></div>
</div>
<div class="clear"></div>
</div>
 <!--- banner-end----> 
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">

<section class="section-title left">
 
<h4 class="Step">Step by step guide to Tax Payer:</h4>
</section>
<div class="span12">
<div class="span4"><a href="images/payonlinepage.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/payonlinepage-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>1 Go to  http://payonline.jharkhand.gov.in/.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/payonlinepage-portal.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/payonlinepage-portal-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>2.	There are two ways to pay the taxes.</li>
</ul>
</div>
<div class="span12 headtext" id="pagemenu0">
<ul>
<li><span class="flote_left bold">i)	 Instant Pay:</span><p class="text no-margin-top flote_left">This is meant for the unregistered users. They can directly make the payment to the Government without  registration.</p></li>
<div class="clear"></div>
<li><span class="flote_left bold">ii)	Sign in :</span><p class="text no-margin-top flote_left">This is meant for the new users/existing users who want to pay the payment through their id.</p></li>
<div class="clear"></div>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>1) Instant Payment:</li>
<p class="text">This module is meant for the unregistered user who wants to use the online payment system without registration. The user approaches portal and selects the <span class="bold">‘Instant Pay’</span> option given in the menu. After selecting the option user gets the screen for Challan payment.</p>
<p class="text"><span class="bold">Steps for making the payment through ‘Instant Payment’</span></p>
<p class="text">1)<span class="bold"> Enter user details.</span></p>
<p class="text">The fields marked in (*) are the mandatory fields which means without filling up these fields the user cannot proceed  further </p>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>


<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image2.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image2-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>2) Enter all your tax details</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image3.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image3-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>3) Click on ‘Verify’ Button:</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image4.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image4-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>4): Click on ‘Proceed to pay’</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image5.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image5-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>5): Page redirects to NSDL and ask the user to select the Bank through which the payment has to be done.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image6.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image6-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>User should enter the Internet Banking Log-in ID and Password issued by the respective Bank and login into bank account.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image7.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image7-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>a)	User can enter the Payment remarks in the given box. </li>
<br>
<li>b)	User selects Pay option and gets the payment validation screen.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image8.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image8.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>a)	User enters Internet User ID and enters Transaction password. </li>
<br>
<li>b)	User enters the OTP i.e received on registered mobile number.</li>
<br>
<li>c)	After entering  fields user selects Validate option.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image9.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image9.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>Click ‘OK’ to continue</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image10.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image10-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>Again click on ‘continue’ to carry forward the transaction.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image11.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Instant-Payment-image11-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>User gets bank CIN No. of that respective bank  and Transaction No. after the successful completion of the transaction.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<section class="section-title left"> 
<h4 class="Step">Search Challan</h4>
</section>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>This option is used to search challan and get the print of challan.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>


<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image1.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image1-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>Sign-in:</li>
<p class="text">This module is meant for the registered user or new user who wants to use the online payment system after registration. The user approaches portal and selects the <span class="bold">‘Sign-in</span> option given in the menu. </p>
<p class="text"><span class="bold"> Steps for making the payment though ‘Sign-in’ option.</span></p>
<p class="text">1)	If you are already an existing user , enter the email id,  password and the secret code. Then click on ‘Login’. </p>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image2.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image2-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li></li>
<p class="text">If you are a new user , then click on ‘Register New’ to create an new account.</p>
<p class="text">Then fill in the fields mentioned in the page with the valid email id and Mobile number  and then click on ‘Create an Account’.</p>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image3.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image3-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>Example:</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image4.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image4-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>2)	Fill in the details in the ‘Complete Your Registration’ page and then click on ‘Submit’.</li>
<p class="text">Enter  the ‘Security Question’ such that you can remember that for future use incase you forget your password or want to reset the password.</p>
<p class="text">Note: Never reveal your secret question to anybody because that is the base for changing your password.</p>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>


<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image5.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image5-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>3)	Now the account is created .</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image6.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image6-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>4)	Now click on ‘Pay Tax’ to proceed with the payment since the account is created .</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image7.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image7-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>5) Enter user details.</li>
<p class="text">The fields marked in (*) are the mandatory fields which means without filling up these fields the user cannot proceed  further .Click on ‘Next’.</p>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image8.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image8-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>6)	Click on ‘Verify’.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image9.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image9-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>7)	Click on ‘Proceed to Pay’.</li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image10.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image10-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>8) This page redirects to NSDL and ask the user to select the Bank through which the payment has to be done. Select the bank and then click on ‘Make Payment‘. </li>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Search-Challan-image11.jpg" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img class="img-f" src="images/Search-Challan-image11-s.jpg" alt="image"/></a></div>
<div class="span8">
<div class="taxhead-step">
<ul>
<li>9) It will direct the user to the NetBanking site of the bank to make the payment.  </li>
<p class="text">Example: In this case , the page was directed to the NetBanking site of HDFC. Enter the ‘Customer id’ and click on ‘Continue’ to proceed with the payment.</p>
</ul>
</div>
</div>
</div>
<div class="clear"></div>
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
  <script src="js/bootstrap.js"></script>
  
                    
    </body>
</html>