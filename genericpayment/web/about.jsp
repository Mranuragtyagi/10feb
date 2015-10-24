<!DOCTYPE html >
<html>
		<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="shortcut icon" href="assets/metro/images/favicon.ico" />
		<title>Home | Government of Jharkhand Electronic Revenue Receipt Portal</title>

		<!-- <link href="assets/metro/css/demo.css" rel="stylesheet" type="text/css">-->
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
                <%
                    String ccph="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
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
                              <div class="btn-group"> <a data-toggle="dropdown" href="#"><i class="fa fa-bars fa-2x "></i>&nbsp;</a>
                        <ul class="dropdown-menu">
                                  <li><a href="<%=ccph%>/Reghome.jsp"><i class="icon-home font18"></i> Home</a></li>
                                  <li><a href="<%=ccph%>/genericpayment/unregisteredUserDetail.jsp"> <i class="fa fa-credit-card"></i>Instant Pay</a></li>
                                  <li><a  href="<%=ccph%>/landing.jsp" rel="tooltip" data-placement="bottom" data-original-title=""> <i class="fa  fa-sign-in"></i> Sign In</a></li>
                
                                  <li><a href="<%=ccph%>/adminpayment/departmentLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Department Login"> <i class="fa  fa-user"></i> Official</a></li>
                                  <li><a href="<%=ccph%>/Dashboard.jsp" rel="tooltip" data-placement="bottom" data-original-title="" > <i class="fa fa-dashboard"></i> Dashboard</a></li>
                        <li><a href="<%=ccph%>/adminpayment/adminLogin.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Admin Login"> <i class="fa  fa-user"></i> Admin</a></li>
                         <li><a href="<%=ccph%>/about.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="About"> <i class="fa  fa-user"></i>About</a></li>
                                </ul>
                      </div>
                            </div>
                    <div class="leftheader"> <a href="#">
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
                    <div class="container-fluid"> <a class="btn btn-navbar" data-toggle="dropdown" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
                              <div class="nav-collapse collapse">
                        <ul class="nav">
                                  <li><a href="<%=ccph%>/GenericLogin">&nbsp;<i class="fa fa-home font18 lb1"></i> Home</a></li>
                                  <li><a href="<%=ccph%>/genericpayment/unregisteredUserDetail.jsp"> <i class="fa  fa-credit-card"></i> Instant Pay</a></li>
                                  <li><a  href="<%=ccph%>/landing.jsp" rel="tooltip" data-placement="bottom" data-original-title=""> <i class="fa  fa-sign-in"></i> Sign In</a></li>
                                  <li><a href="<%=ccph%>/Dashboard.jsp" rel="tooltip" data-placement="bottom" data-original-title="" > <i class="fa fa-dashboard"></i> Dashboard</a></li>
                                  <li><a href="<%=ccph%>/adminpayment/departmentLogin.jsp" data-toggle="modal" rel="tooltip" 
                                                           		data-placement="bottom" data-original-title="Department Login"> <i class="fa  fa-user"></i> Official</a></li>
                                  <li><a href="<%=ccph%>/adminpayment/adminLogin.jsp" data-toggle="modal" rel="tooltip" 
                                    data-placement="bottom" data-original-title="Admin Login"> <i class="fa  fa-user"></i> Admin</a></li>
                                </ul>
                      </div>
                            </div>
                  </div>
                          <!-- navbarid closed --> 
                        </div>
              </div>
                      <!-- banner-->
                      <div class="banner-about">
                <div class="span5"><img src="assets/metro/images/banner-jharkhand.png" alt="banner-jharkhand"></div>
                <div class="span7">
                          <div class="span12 header-text bold f-s-5">
                    <p>Click & Pay </p>
                  </div>
                          <div class="span12"><img src="assets/metro/images/banner-save-time.png" alt="banner-save-time"></div>
                          <div class="span12  header-text bold f-s-2">
                    <p>24x7 Online Payment-Any time & Any where</p>
                  </div>
                        </div>
                <div class="clear"></div>
              </div>
                      <!-- banner-end--> 
                      <!-- About-->
                      <div class="roundbox">
                <div class="span12 About-text">
                          <div class="media-object-a">
                    <p>Pay online provides a platform  for all Government departments tax services accessible to the common man in his door step. </p>
                  </div>
                        </div>
                <div class="span12 top-about">
                          <div class="span4 span-img"> <img src="assets/metro/images/Pay-Online-Objective.png" alt="Pay-Online-Objective">
                    <div class="roundbox-ex">
                              <div class="header">Pay Online Objective</div>
                              <div class="headtext-c"> Citizen and Government at One Place </div>
                            </div>
                  </div>
                          <div class="span4 span-img"> <img src="assets/metro/images/Benefits.png" alt="Benefits">
                    <div class="header">Benefits</div>
                    <div class="headtext-c">Cash Less &nbsp; &nbsp;Paper Less &nbsp; &nbsp; Contact Less</div>
                  </div>
                          <div class="span4 span-img"> <img src="assets/metro/images/easy-steps.png" alt="easy-steps">
                    <div class="header" style="padding-left:10%">Easy Process</div>
                    <div class="headtext-c">Process in just six easy steps</div>
                  </div>
                        </div>
                <div class="span12 top-about">
                          <div class="span4 span-img"> <img src="assets/metro/images/dashboard.png" alt="dashboard">
                    <div class="roundbox-ex">
                              <div class="header" style="padding-left:0%;">Department Benefits</div>
                              <div class="headtext-c">Includes detailed reporting and statistics <br>
                        Real time  Revenue collection and management system </div>
                            </div>
                  </div>
                          <div class="span4 span-img"> <img src="assets/metro/images/open-source.png" alt="open-source">
                    <div class="header">Open source</div>
                    <div class="headtext-c">open source utilities and software for completely flexible functionality </div>
                  </div>
                          <div class="span4 span-img"> <img src="assets/metro/images/completely-web-based.png" alt="completely-web-based">
                    <div class="header">completely-web-based</div>
                    <div class="headtext-c">Single Receipt portal integrated  with  Revenue Departments</div>
                  </div>
                        </div>
                <div class="clear"></div>
                <div class="media-object-a w"> <a class="btn-new btn btn-primary btn-lg btn-block" href="step-by-step.jsp">Step by step guide </a> </div>
                
                <!-- About-end--> 
                <!--</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<p></p>
<section class="section-title left"> 
<h4>Step by step guide to Tax Payer:</h4>
</section>
<div class="span12">
<div class="span4"><a href="images/payonlinepage.png" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img src="images/payonlinepage.png" alt="payonlinepage"/></a></div>
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
<div class="span4"><a href="images/payonlinepage-portal.png" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img src="images/payonlinepage-portal.png" alt="payonlinepage-portal"/></a></div>
</div>
<div class="clear"></div>
</div>

<div class="bg">&nbsp;</div>
<div class="roundbox">
<div class="span12">
<div class="span4"><a href="images/Instant-Payment-image.png" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img src="images/Instant-Payment-image.png" alt="Instant-Payment-image"/></a></div>
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
<div class="span8">
<div class="taxhead-step">
<ul>
<li>2) Enter all your tax details</li>
</ul>
</div>
</div>
<div class="span4"><a href="images/Instant-Payment-image2.png" class="boxer boxer_image" data-gallery="gallery" title='Left Little' >
<img src="images/Instant-Payment-image2.png" alt="Instant-Payment-image2"/></a></div>
</div>
<div class="clear"></div>
</div>--> 
                
              </div>
                    </div>
          </div>
                </div>
      </div>
            </div>
  </div>
        </div>
<!-- <script src="js/jquery1.8.3.js"></script>--> 
<script src="assets/metro/js/bootstrap.js"></script>
</body>
</html>