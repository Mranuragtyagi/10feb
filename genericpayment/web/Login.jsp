<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="X-UA-Compatible" value="IE=8"> 
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link href="css/Tabs.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript" src="js/tabs.js"></script>
<script src="script/jquery-latest.pack.js" language="javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('a.login-window').click(function() {
		
		// Getting the variable's value from a link 
		var loginBox = $(this).attr('href');

		//Fade in the Popup and add close button
		$(loginBox).fadeIn(300);
		
		//Set the center alignment padding + border
		var popMargTop = ($(loginBox).height() + 24) / 2; 
		var popMargLeft = ($(loginBox).width() + 24) / 2; 
		
		$(loginBox).css({ 
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});
		
		// Add the mask to body
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);
		
		return false;
	});
	
	// When clicking on the button close or the mask layer the popup closed
	$('a.close, #mask').live('click', function() { 
	  $('#mask , .login-popup').fadeOut(300 , function() {
		$('#mask').remove();  
	}); 
	return false;
	});
});
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-34261803-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>


<style type="text/css">

a { 
	text-decoration:none; 
	color:#00c6ff;
}

h1 {
	font: 4em normal Arial, Helvetica, sans-serif;
	padding: 32px;
	margin: 0;
	text-align:center;
}

h1 small{
	font: 0.2em normal  Arial, Helvetica, sans-serif;
	text-transform:uppercase; letter-spacing: 0.2em; line-height: 5em;
	display: block;
}

h2 {
    color:#bbb;
    font-size:1em;
	text-align:center;
	text-shadow:0 1px 3px #161616;
}

.container {width: 960px; margin: 0 auto; overflow: hidden;}

#content {	float: left; width: 100%;}

.post { margin: 0 auto; padding-bottom: 50px; float: left; width: 960px; }

.btn-sign {
	width:460px;
	margin-bottom:20px;
	margin:0 auto;
	padding:20px;
	border-radius:5px;
	background: -moz-linear-gradient(center top, #00c6ff, #018eb6);
    background: -webkit-gradient(linear, left top, left bottom, from(#00c6ff), to(#018eb6));
	background:  -o-linear-gradient(top, #00c6ff, #018eb6);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#00c6ff', EndColorStr='#018eb6');
	text-align:center;
	font-size:36px;
	color:#fff;
	text-transform:uppercase;
}

.btn-sign a { color:#fff; text-shadow:0 1px 2px #161616; }

#mask {
	display: none;
	background: #000; 
	position: fixed; left: 0; top: 0; 
	z-index: 10;
	width: 100%; height: 100%;
	opacity: 0.8;
	z-index: 999;
}

.login-popup{
	display:none;
	background: #333;
	padding: 10px; 	
	border: 2px solid #ddd;
	float: left;
	font-size: 1.2em;
	position: fixed;
	top: 50%; left: 50%;
	z-index: 99999;
	box-shadow: 0px 0px 20px #999;
	-moz-box-shadow: 0px 0px 20px #999; /* Firefox */
    -webkit-box-shadow: 0px 0px 20px #999; /* Safari, Chrome */
	border-radius:3px 3px 3px 3px;
    -moz-border-radius: 3px; /* Firefox */
    -webkit-border-radius: 3px; /* Safari, Chrome */
}

img.btn_close {
	float: right; 
	margin: -28px -28px 0 0;
}

fieldset { 
	border:none; 
}

form.signin .textbox label { 
	display:block; 
	padding-bottom:7px; 
}

form.signin .textbox span { 
	display:block;
}

form.signin p, form.signin span { 
	color:#999; 
	font-size:11px; 
	line-height:18px;
} 

form.signin .textbox input { 
	background:#666666; 
	border-bottom:1px solid #333;
	border-left:1px solid #000;
	border-right:1px solid #333;
	border-top:1px solid #000;
	color:#fff; 
	border-radius: 3px 3px 3px 3px;
	-moz-border-radius: 3px;
    -webkit-border-radius: 3px;
	font:13px Arial, Helvetica, sans-serif;
	padding:6px 6px 4px;
	width:200px;
}

form.signin input:-moz-placeholder { color:#bbb; text-shadow:0 0 2px #000; }
form.signin input::-webkit-input-placeholder { color:#bbb; text-shadow:0 0 2px #000;  }

.button { 
	background: -moz-linear-gradient(center top, #f3f3f3, #dddddd);
	background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3), to(#dddddd));
	background:  -o-linear-gradient(top, #f3f3f3, #dddddd);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#f3f3f3', EndColorStr='#dddddd');
	border-color:#000; 
	border-width:1px;
	border-radius:4px 4px 4px 4px;
	-moz-border-radius: 4px;
    -webkit-border-radius: 4px;
	color:#333;
	cursor:pointer;
	display:inline-block;
	padding:6px 6px 4px;
	margin-top:10px;
	font:12px; 
	width:214px;
}



</style>


<style type="text/css">
#service a
{
		color:#217e95;
		padding:4px;
}
.style1 {
	font-size: 40px;
	font-family: Tahoma;
}
h1 {
	font-size: 39px;
	font-weight: normal;
	margin: 0 0 30px 0;
	padding: 5px 0;
}
</style>
<script type="text/javascript" src="script/md5.js"></script>
<script language="Javascript">
function i()
{
window.history.forward(-1);
}
</script>
<script type="text/javascript">
function c5(f,t)
{
var c=true;
if((f.name.value.length==0)){
alert('Please Enter Your User Name');
f.name.focus();
c=false;
}
else if (f.pwd.value.length==0){
alert('Please Enter Your Password');
f.pwd.focus();
c=false;
}
else if (f.captcha.value.length==0){
alert('Please Enter the Secret Code');
f.captcha.focus();
c=false;
}
else{
f.pwd.value=m5(f.pwd.value,t);

}
return c;
}
<% 
  if(request.getSession().getAttribute("u")!=null){
 response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/welcome.jsp");     
   }
  else if(request.getSession().getAttribute("rnd")==null){
 response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/Login?step=login");     
   }
  String rnd=request.getSession().getAttribute("rnd").toString();
  String name=(String)request.getAttribute("user");
  if(name==null){
  name="";
  }
  String host="http://jharkhandcomtax.gov.in";
  String r= ( new java.util.Date()).toString();
  //host=( host.split(":") )[0];
  %>
</script>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
</head>
<body>
 <div id="login-box" class="login-popup">
   <a href="#" class="close"><img src="images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
   		 <h2>e-Road Permit(Consignor)</h2>	
  <iframe src="ewaybill/waybillentry.jsp?xx=<%=r%>" width="350" height="200" seamless scrolling="no" frameborder="0"></iframe>        
  </div>
 <div id="login-cbox" class="login-popup">
   <a href="#" class="close"><img src="images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
   		 <h2>e-Road Permit(Consignee)</h2>	
  <iframe src="CLogin?xx=<%=r%>" width="350" height="200" seamless scrolling="no" frameborder="0"></iframe>        
  </div>

<div id="templatemo_wrapper">
	
    <div id="templatemo_header">
    
   		<div id="site_title">
        	<div style="float:left"><img src="images/Logo.png" height="80" /></div>
            <div style="float:left;  padding-top:20px; font-size:26px; font-weight:bold; color: #083d4a; width:240px">Commercial Taxes</div>
              <div style="float:left; padding-top:5px; font-size:18px; text-align:center; width:210px; font-family:Verdana, Geneva, sans-serif">Govt. Of Jharkhand</div>
              
      <div style="float:left; padding-top:10px; font-size:22px; font-weight:bold; text-align:center; width:200px; color:#217e95; font-family:Verdana, Geneva, sans-serif">Dealer Portal <div style="font-size:10px;color:#333; float:right; margin-top:-4px;">Beta</div></div>

        </div> <!-- end of site_title -->
        
        <div id="templatemo_menu">
            <ul>
                <li><a href="#" class="current">Home</a></li>
                <li><a href="<%= host%>/commercialtax/e-services">Services</a></li>
                <li><a href="<%= host%>/commercialtax/latest-news_page">News</a></li>
                <li><a href="<%= host%>/commercialtax/node/234">About us</a></li>
                <li><a href="<%= host%>/commercialtax/contactinfo">Contact</a></li>
            </ul>    	
        </div> <!-- end of templatemo_menu -->
    
    </div>
    
<!--    <div id="templatemo_middle">
    
    	<h1>&nbsp;</h1>
	</div>-->
    
      <div id="templatemo_content">
       
        	<div>
            		<table align="center"  width="100%">
                    	<tr>
                        	<td valign="baseline">
                            		<table border="0" cellpadding="0" cellspacing="0"  style="background: url(images/left_bg.gif)">
				<tr>
					<td><img src="images/left_left.gif" width="21" height="29" border="0" alt=""></td>
					<td><img src="images/spacer.gif" width="7" height="1" border="0" alt=""></td>
					<td width="490" style="color:#FFF; font-weight:bold">Services</td>
					<td><img src="images/left_right.gif" width="6" height="29" border="0" alt=""></td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td style="background: url(images/c_left.gif)"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
					<td width="500" align="center">
                    
                    
                    <!--Start of the Tabmenu -->
                    <div class="menu">
                    <ul>
                    <li><a href="#" onmouseover="stop_autochange('1', '1');" onfocus="stop_autochange('1', '1');" onmouseout="autochange();" onclick="return false;"  title="" id="tablink1">e-Registration</a></li>
                    <li><a href="#" onmouseover="stop_autochange('1', '2');" onfocus="stop_autochange('1', '2');" onmouseout="autochange();"  onclick="return false;"  title="" id="tablink2">e-Return</a></li>
                    <li><a href="#" onmouseover="stop_autochange('1', '3');" onfocus="stop_autochange('1', '3');" onmouseout="autochange();" onclick="return false;"  title="" id="tablink3">e-Form</a></li>
                    <li><a href="#" onmouseover="stop_autochange('1', '4');" onfocus="stop_autochange('1', '4');" onmouseout="autochange();" onclick="return false;"  title="" id="tablink4">e-Road Permit </a></li>
                 	 <li><a href="#" onmouseover="stop_autochange('1', '5');" onfocus="stop_autochange('1', '5');" onmouseout="autochange();" onclick="return false;"  title="" id="tablink5">e-Challan</a></li>
                    </ul>
                    </div>
                    <!--End of the Tabmenu -->
                    
                    
                    <!--Start Tabcontent 1 -->
                    <div id="tabcontent1" style="vertical-align:middle; height:100px;">
                    	<div style="float:left; padding-top:30px; padding-left:10px;"><h1>e-Registration</h1>
                   	  </div>
                      <div style="float:right"><img src="images/registration.jpg" height="100" width="223" /></div>
                        <div style="clear:both"></div>
                    </div>
                    <!--End Tabcontent 1-->
                    
                    <!--Start Tabcontent 2-->
                    <div id="tabcontent2" style="vertical-align:middle; height:100px;">
                    	<div style="float:left; padding-top:30px; padding-left:10px;"><h1>e-Return</h1></div>
                        <div style="float:right"><img src="images/ereturn.jpg" height="100" width="223" /></div>
                        <div style="clear:both"></div>
                    </div>
                    <!--End Tabcontent 2 -->
                    
                    <!--Start Tabcontent 3-->
                    <div id="tabcontent3" style="vertical-align:middle; height:100px;">
                    	<div style="float:left; padding-top:30px; padding-left:10px;"><h1>e-Form</h1></div>
                        <div style="float:right"><img src="images/eform.jpg" height="100" width="223" /></div>
                        <div style="clear:both"></div>
                    </div>
                    <!--End Tabcontent 3-->
                    
                    <!--Start Tabcontent 4-->
                    <div id="tabcontent4" style="vertical-align:middle; height:100px;">
                    	<div style="float:left; padding-top:30px; padding-left:10px;"><h1>e-Road Permit</h1></div>
                        <div style="float:right"><img src="images/waybill.jpg" height="100" width="223" /></div>
                        <div style="clear:both"></div>
                    </div>
                    <!--End Tabcontent 4-->
                    
                     <!--Start Tabcontent 3-->
                    <div id="tabcontent5" style="vertical-align:middle; height:100px;">
                    	<div style="float:left; padding-top:30px; padding-left:10px;"><h1>e-Challan</h1></div>
                        <div style="float:right"><img src="images/epay.jpg" height="100" width="223" /></div>
                        <div style="clear:both"></div>
                    </div>
                    <!--End Tabcontent 3-->
                    
                    
                    
                    
                    
                    
                    
                    
					<div><img src="images/spacer.gif" width="1" height="12" border="0" alt=""></div>
					<div><img src="images/spacer.gif" width="1" height="14" border="0" alt=""></div>
					</td>
					<td style="background: url(images/c_right.gif)"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
				</tr>
				<tr>
					<td><img src="images/c4.gif" width="5" height="5" border="0" alt=""></td>
					<td style="background: url(images/c_bot.gif)"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
					<td><img src="images/c3.gif" width="5" height="5" border="0" alt=""></td>
				</tr>
			</table>
                            </td>
                            
                         
                            
                            
                            
                            <td style="padding-left:20px; vertical-align:baseline;">
                            
                            
             <table border="0" cellpadding="0" cellspacing="0"  style="background: url(images/left_bg.gif)">
				<tr>
					<td><img src="images/left_left.gif" width="21" height="29" border="0" alt=""></td>
					<td><img src="images/spacer.gif" width="7" height="1" border="0" alt=""></td>
					<td width="204" style="color:#FFF; font-weight:bold">Login</td>
					<td><img src="images/left_right.gif" width="6" height="29" border="0" alt=""></td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td style="background: url(images/c_left.gif)"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
				  <td width="228" align="left">
                   <form name="login" action="Login" method="post" onsubmit="return c5(this,'<%=rnd%>')">
                  <div style="padding-left:30px; padding-top:15px;">
                   	<div id="message" style="padding:0 10px 10px 0px; height:auto; width:170px; word-wrap: break-word; color:#F30"><%=request.getParameter("msg")==null?"":""+request.getParameter("msg") %></div>
                    User ID :
                    <br />
                   <input type="text" name="name"  vaue="<%=name%>"  maxlength="11" size="20"/>
                    <br />
                      Password :
                    <br />
                    <input name="pwd" type="password"  size="20" value="lkujlkcj"/>
                     <br />
                      <div style="float:left; padding-top:4px;"> <img name="c" id="c" src="CustomizedCaptcha" height="30" width="120"></div>
                                    <div style="float:left;padding-top:10px;"><a href="#" onclick='document.getElementById("c").src="CustomizedCaptcha?x="+Math.random();login.captcha.focus();'>  <img src="images/refresh1.jpg" alt="" width="25" height="25" onmouseover="this.src='images/refresh.gif'" onmouseout="this.src='images/refresh1.jpg'" style="border: 0px;" /> </a></div>
                     	<br />	
                      <div style="clear:both">Captcha Code :
                        <input type="text" name="captcha" maxlength="5" size="6"/>
                      </div>
                      <div align="right" style="padding-top:5px;">
                          <input type="submit" name="Login" style="background-image:url(images/templatemo_buton.png); background-repeat:repeat; vertical-align:middle; border:none; color:#FFF; width:80px; height:23px;" value="Login" />
                    </div>
                    <a href="reset_password.jsp" style="border: 0px;"> Reset/Forgot Password </a>
                    </div>
					<div><img src="images/spacer.gif" width="1" height="4" border="0" alt=""></div>
					<div><img src="images/spacer.gif" width="1" height="4" border="0" alt=""></div>
					</form>
                    </td>
					<td style="background: url(images/c_right.gif)"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
				</tr>
				<tr>
					<td><img src="images/c4.gif" width="5" height="5" border="0" alt=""></td>
					<td style="background: url(images/c_bot.gif)"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
					<td><img src="images/c3.gif" width="5" height="5" border="0" alt=""></td>
				</tr>
			</table>
                            
                            </td>
                         
                        </tr>
                        <tr>
                        	<td> Date of Deployment: 05-June-2013</td>
                            <td><br /><b>Don't have online account?</b> <input type="button" style="background-image:url(images/templatemo_buton.png); background-repeat:repeat; border:none; color:#FFF; width:80px; height:23px;" value="Create One" onclick="location.href='RegisterDealer?step=register'" /></td>
                        </tr>
                    </table>
            </div>
            <br />
            <br />
         
     </div>
   
   <div id="templatemo_footer" >
    		<div style="margin-top:-13px; padding-bottom:4px;" id="service"><a href="DoRegister?step=1">e-Registration</a> | <a href="#">e-Return</a> |  <a href="#">e-Form</a> | e-Road Permit <a href="#login-box" class="login-window">Consignor </a> :<a href="#login-cbox" class="login-window">Multiuser Login </a>| <a href="#">e-Challan</a> </div>
          Copyright &copy; 2012 <a href="#">Department Of Commercial Taxes, Jharkhand</a> | Designed by <a href="#" target="_parent">National Informatic Center</a>  
    </div>
    
</div>

</body>
</html>