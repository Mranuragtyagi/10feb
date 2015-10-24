<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.net.URLEncoder" %>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="<%=ccp%>/images/favicon.ico" />
<title>Home | Government of Jharkhand Electronic Revenue Receipt Portal</title>
<link rel="stylesheet" href="Bootstrap2.2/css/bootstrap_s.css" type="text/css"> 
<link rel="stylesheet" href="Bootstrap2.2/css/bootstrap-responsive.css" type="text/css">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">
  
</head>
<body>
<div id="fb-root"></div>
<script>
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=475654849201699";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
<div class="container">
  <div class="content">
    <div class="wrapper">
      <div class="row">
        <div class="span12">
          <div class="row-fluid">
            <div class="roundbox" style="min-height: 1050px;margin-bottom: 0px"> 
           <%@ include file="header.jsp"%>
              <div class="span2 no-margin">
              <div class="span12 roundthumb">
      <div class="span12 fc_000"><span class="font14 fc_000"><strong>Pay Tax </strong></span><br />
      <span class="font18 fc_000"><strong>By Department</strong></span></div>
      <div class="span11">
      <div class="dropdown clearfix">
                <ul aria-labelledby="dropdownMenu" role="menu" class="nav leftdropdown" id="dropmenu">
                  <li>&nbsp;</li>
                  <div id="sidemenu">
                  </div>
                  
                  
                  
                </ul>
              </div>
    </div>
             
      </div>
      <div style="min-height:400px;">&nbsp;</div>
      <!--<div class="span12 roundthumb">
      <div class="span12 fc_000" align="center"><span class="font16 fc_000"><strong>Chief Minister <br />Relief Fund </strong></span><br />
      <img src="images/relief.png" width="80" height="64"  />
      <button type="button" class="btn btn-warning"  > &nbsp;&nbsp;<strong>Donate Now</strong>&nbsp;&nbsp; </button>
     
 </div>
    
             
      </div>-->
      <!--<div class="span12 roundthumb">
      <div class="span12 fc_000" align="center"><span class="font16 fc_000"><strong>How to Pay <br /><br /> </strong></span><br />
      <img src="images/watchnow.png"  /><br /> 
 </div>
    
             
      </div>-->
  
      </div>
                <div class="span10 uproundbox banner">
                  <div class="span8 text">
                    <div class="span12" align="center">
                      <div class="span12" align="left">
                      <span class="text1">Pay Taxes, Bills &amp; Fees safely and easily.</span>
                        <h2 class="text">Pay Taxes, Bills &amp; Fees <br />
                          <span>safely and easily.</span></h2>
                      </div>
                    </div>
                    <div id="cards" class="span12 fc_FFF">
                   <div class="span12 bold font20">Easy, Convenient and Fast Tax Payment System.</div>
                    <!--  <div class="span12 bold">PAYMENT METHOD</div>
                      <div class="flote_left thumbnail"> <span><i class="fa  fa-credit-card lb1"></i> Debit Card</span> </div>
                      <div class="flote_left thumbnail"> <span><i class="fa  fa-laptop lb1"></i> Net Banking</span> </div>
                   --> </div>
                  </div>
                
                  <!--div class="span4 banner-cloud">
              		<<h2>
                    <i class="fa fa-5x fa-cloud">
                    <span class="mytextwithicon">
                    <span class="mytextwithicon2"></span>
                    </span></i>
                      <div class="mouse"></div>
                      <div class="img-24x7"></div>
                      
                    </h2>>
                  </div-->
                  <div class="span3 roundbox signup-form pull-right" align="center">
                    <div class="span12 font18"> <span class="lb1"><strong>Sign up</strong></span></div>
                    <form accept-charset="UTF-8" id="signupForm" action="<%=ccp%>/genericpayment/remainingUnregisteredDetails.jsp" method="post">
                      <input class="span11" id="firstname" name="firstname" placeholder="Full Name" type="text" required="required" />
                      <input class="span11" id="email" name="email" placeholder="Email" type="text" required="required" />
                      <input class="span11" id="phonenumber" name="phonenumber" placeholder="Mobile" type="text" required="required" />
                      <input class="span11" id="password1" name="password1" placeholder="Password" type="password" required="required" />
                      <input class="span11" id="confirmpassword" name="confirmpassword" placeholder="Confirm Password" type="password" required="" />
                      <div class="span12" align="center" style="margin:0 auto;">
                        <button class="btn btn-warning span12" type="submit"> <strong>Create an Account</strong> </button>
                       

                      </div>
                    </form>
                    
                  </div>
                  <br /><br /><br />
                </div>
                <div class="span10 slogan">
                <div style="background-color: #FC0; margin-top:-10px;">
                  <h2>Welcome to Pay<!--<span>-->Online<!--</span>--></h2>
                  <h3>Government of Jharkhand Electronic Revenue Receipt Portal</h3>
                  </div>
                  <div class="span12">&nbsp;</div>
                  <div class="span12" id="bodymenu"></div>
                  </div>
                </div>
                
                <div class="span12 roundbox effect2">
                  <div class="spa4_a roundbox" align="center">
                    <div class="span12 font18 h200">
                      <h3><i class="fa fa-mobile-phone f13A89E"></i><br>
                        <span class="f333">Smart device compliance</span></h3>
                      The portal is compatible with smart mobile or tablet. You can pay using your mobile or tablet. </div>
                  </div>
                  <div class="spa4_a roundbox" align="center">
                    <div class="span12 font18 h200">
                      <h3><i class="fa fa-desktop f13A89E"></i><br>
                        <span class="f333">67+ Net banking Options</span></h3>
                      Tied up with 67+ banks for net banking and debit card payment. </div>
                  </div>
                  <div class="spa4_a roundbox" align="center">
                    <div class="span12 font18 h200">
                      <h3><i class="fa fa-lock f13A89E"></i><br>
                        <span class="f333">100% Secure</span></h3>
                      Your card or net banking details always remain encrypted and secure with NDML payment gateway. </div>
                  </div>
               
                <%@ include file="footer_menu.jsp"%>
                </div>
              </div>
              <!--div class="span12 roundthumb">
      <div class="span12 fc_000 FFF" align="center">
      
      <div class="fb-like-box" data-href="https://www.facebook.com/payonlinejharkhand" data-width="800" data-colorscheme="light" data-show-faces="true" data-header="false" data-stream="false" data-show-border="false"></div>

 </div>
    
             
      </div-->
             
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="myModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false"><i class="icon-remove" style="cursor: pointer"></i></div>
</body>
<script type="text/javascript" src="<%=ccp%>/jquery/jquery1.8.3.js"></script>
        <script type="text/javascript" src="<%=ccp%>/Bootstrap2.2/js/bootstrap.js"></script>        
  
<script type="text/javascript"> 
 function setCookie(cname,cval)
	{
	cvalue=cval;
	var d = new Date();
	d.setTime(d.getTime()+(1*24*60*60*1000));
	var expires = "expires="+d.toGMTString();
	document.cookie = cname + "=" + cvalue + "; " + expires;

	}
            function encryptDeptPassword(t){
            var p = document.LoginForm.password; 
            if(p.value=="" || p.length==0){ 
            document.LoginForm.password.value = ""; 
            }else{
            document.LoginForm.password.value = m5(p.value, t);
            }
        } 
$(document).ready(function(){

		
			function getmenu(dept,menuid,pagemenuid,footerid){
				var options ='';
				
				$.getJSON("<%=ccp%>/genericpayment/getTaxTypeByDept.jsp",{'dept': dept, ajax: 'true'}, function(res){
					
                    options += '<li class="dropdown-submenu"><a href="#" tabindex="-1">'+dept+'</a><ul class="dropdown-menu m0">';
					var pageoption='<ul>';
					var footeroption='';
                    var items = res.list;
                    for(var i = 0; i < items.length; i++){
						var aa='<a href="<%=ccp%>/genericpayment/unregisteredUserDetail.jsp" tabindex="-1" onclick="javascript:setCookie(\'department\',\''+dept+'\');setCookie(\'purpose\',\''+items[i].val+'\');">'+items[i].val+'</a>';
						options +=  '<li>'+aa+'</li>';
						if(i<5){pageoption+='<li>'+aa+'</li>';}
						if(i==5){
							pageoption+='<li><a class=" dropdown-toggle" data-toggle="dropdown" style="color:#900; cursor:pointer">More >> </a><ul class="dropdown-menu page_dropdown-menu">';
							pageoption+='<li>'+aa+'</li>';
							}
						if(i>5){pageoption+='<li>'+aa+'</li>';}
						if(i==items.length){pageoption+='</ul></li>';}
						footeroption+='| '+aa+' ';
						
                    }
					options+='</ul></li>';
					pageoption+='</ul>';
                    $("#"+menuid).prepend(options);
					$("#"+pagemenuid).prepend(pageoption);
					$("#"+footerid).prepend(footeroption);
                });
			}
		var depts=['Commercial Tax','Excise And Prohibition','Mines And Geology','Registration','Transport', 'Traffic Police'];
		var sidemenuoptions='';
		for(var i = 0; i < depts.length; i++){
			sidemenuoptions='<span id="m'+i+'"></span>';
			$("#sidemenu").append(sidemenuoptions);
			$("#bodymenu").append('<div class="span4"><div class="span12 bold taxhead">'+depts[parseInt(i)]+'</div><div class="span12 headtext"  id="pagemenu'+i+'"></div></div>');
			$("#footermenu").append('<span class="lb1 bold">'+depts[parseInt(i)]+' </span><span class="fc_000" id="footer'+i+'"></span>');
			getmenu(depts[parseInt(i)],'m'+i,'pagemenu'+i,'footer'+i);
			
		}		 
		
        });
   function clickIE4(){
       if (event.button==2){
       return false;
       }
   }
function clickNS4(e){
   if (document.layers||document.getElementById&&!document.all){
       if (e.which==2||e.which==3){
           return false;
       }
   }
}
if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
} else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}
document.oncontextmenu=new Function("return false")
    </script>
</html>