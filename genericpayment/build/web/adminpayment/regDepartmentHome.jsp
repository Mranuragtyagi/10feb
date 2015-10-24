
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="genericepayadmin.*"  errorPage="/error.jsp"%>
<%@page import="java.util.*" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
String mssg=StringEscapeUtils.escapeHtml(request.getParameter("mssg")!=null?request.getParameter("mssg"):"") ;
//GenericAdminBean gb=request.getSession().getAttribute("signupbean")!=null? (GenericAdminBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
String dlrname="Admin";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>regDepartmentHome</title>
<link rel="stylesheet" href="Bootstrap2.2/css/bootstrap.css" />
<link rel="stylesheet" href="Bootstrap2.2/css/bootstrap-responsive.css" />
 <link rel="stylesheet" href="Bootstrap2.2/css/sticky.css" />  
        <script type="text/javascript" src="jquery/jquery1.8.3.js"></script>
        <script type="text/javascript" src="Bootstrap2.2/js/bootstrap.js"></script>
        <script type="text/javascript" src="jquery/jquery.validate.min.js"></script>
        <script type="text/javascript" src="jquery/validate.js"></script>
         <script type="text/javascript" src="jquery/Chart.js"></script>
        <!-- <script type="text/javascript" src="Bootstrap2.2/js/bootstrap.min.js"></script>-->
       <style>
       #signupForm label.error {
	color:red;
}
#LoginForm label.error {
	color:red;
}
#ForgotForm label.error {
	color:red;
}
       </style>
          
<script>
$(function(){
    
    $('li a').tooltip({
        delay:{
            show: 750,  
            hide: 100
        }
    });
	 });
   
</script>

<script type="text/javascript">
    function securityQuestion(){  
        $.ajax({
        type: "POST",
        url: "<%=ccp%>/genericpayment/getSecurityQuestion.jsp",
        data: {lemail:$("#lemail").val()}
        }).done(function(msg){
        $("#myscript").html(msg);
        });
    }
</script>   

<script type="text/javascript" >
     function demoDisplay(){
        var a = document.getElementById('eanswer').value;
        var b = document.getElementById('lemail').value;
        var c = document.getElementById('question').value;
        if(b==""){
            document.getElementById('lemail').focus();
        }else if(a==""){
            document.getElementById('eanswer').focus();
        }else if(c==""){
            document.getElementById('question').focus();
            alert("This email id is not registered");
        }
        else{
            document.ForgotForm.submit();
        }
    }         
</script>

<script>
var message="Right Click Disabled!";
   function clickIE4(){
       if (event.button==2){
       alert(message);
       return false;
       }
   }
function clickNS4(e){
   if (document.layers||document.getElementById&&!document.all){
       if (e.which==2||e.which==3){
           alert(message);
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
document.oncontextmenu=new Function("alert(message);return false")
</script>
</head>
 <body>
<div class="container">
<div class="content">
<div class="wrapper">
 <div class="row">
<div class="span12">
<div class="row-fluid">
  <div class="well" style="min-height:600px; min-width:280px; margin-bottom:0px;">
    <div class="span12">
      <div class="row-fluid">
         <div class="span6">
           <div class="leftheader"> </div>
         </div>
          <div class="span6">
           <div class="rightheader"> </div>
         </div>     
      </div>
     </div>   <!--apn12 div closed-->
     
<div class="span12" style="margin-bottom:-8px;">
  <div id="navbarid">
   <div class="navbar">
    <div class="navbar-inner" >
      <ul class="nav">
        <li class="active"><a href="regDepartmentHome.jsp"><i class="icon-home "></i>&nbsp;Home</a></li>
        <li class="dropdown" >
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">&nbsp;<i class="icon-user icon-white"></i>&nbsp;Accounts<b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
                       <li><a href="<%=ccp%>/adminpayment/changeDepartmentPassword.jsp"><i class="icon-wrench "></i>&nbsp; Change Password</a></li>
                        <li class="divider"></li>
                         <li><a href="<%=ccp%>/adminpayment/verifyPaymentByAdmin.jsp"><i class="icon-edit"></i>&nbsp; Verify Payment</a></li>
                        <!--li class="divider"></li>
                        <li><a href="<%=ccp%>/adminpayment/transactionView.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-camera icon-white"></i>&nbsp;Transaction view</a></li-->
                         <li class="divider"></li>
                        <li><a href="<%=ccp%>/adminpayment/departmentReportByPeriod.jsp">&nbsp;<i class="icon-list"></i>&nbsp;Report</a></li>
                         <li class="divider"></li>
                        <li><a href="<%=ccp%>/GenericLogin?step=logout" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-off "></i>&nbsp;Log Out</a></li>
                    </ul>
            </li>
      </ul>
         <form id="custom-search-form" class="form-search form-horizontal pull-right">
          <div class="input-append ">
            <input type="text" class="search-query" placeholder="Enter Receipt No">
            <button type="submit" class="btn"><i class="icon-search"></i></button>
           </div>
         </form>
       </div>
    </div>
  </div> <!-- navbarid closed -->
</div><!-- span12 closed -->

<!--<div class="span12">
  <div class="slider">
    <div id="myCarousel" class="carousel slide">
      
    <div class="carousel-inner">
      <div class="active item"><img src="Bootstrap2.2/img/headers.png" alt="Pay All Taxes" style="font-weight:bold; text-align:center;"></div>
      <div class="item"><img src="Bootstrap2.2/img/slider2.png" alt="Pay All Taxes in Easy way" style="font-weight:bold; text-align:center;"></div>
      <div class="item"><img src="Bootstrap2.2/img/imageslider.png" alt="Pay All Taxes in Time" style="font-weight:bold; text-align:center;"></div>
    </div>
       
      <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
      <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div>
  </div>
</div> -->
                               
<div class="span12" style="margin-top: 15px;">
  <div class="row-fluid">
    <div class="span3">
    
   <div id="RegisterName" style="padding:5px;"> Welcome Mr.<%=dlrname%></div>
<div id="listofbank" style="margin-top:2%">
  <p  style="font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;" > Other Payment sites</p>
     <p id="los"> 
     <a target="_blank" href="http://jharkhandcomtax.gov.in/commercialtax/" > Department of Commercial Tax</a> <br/>
     <a target="_blank" href="http://www.jharkhand.gov.in/new_depts/trans/trans_fr.html" color:#464646;>Department of Transport</a> <br/>
     <a target="_blank" href="http://www.jharkhand.gov.in/new_depts/regns/regns_fr.html" color:#464646;>Department of Registration</a> <br/> </p>
                              
 
 </div>
</div>
   <div class="span9">
      <fieldset>
        <legend style="font:Arial, Helvetica, sans-serif; font-size:18px; font-weight:bold; color:#ffa200;">Pay Your Taxes</legend>
          <div class="span12">
             <div class="row-fluid">
              <div class="span6">
                <div id="netbanking"> </div>
               </div>
               <div class="span6">
                 <div id="cardpayment"> </div>
               </div>
              </div>
           </div>
      </fieldset> <br/>
          <div id="thumbnail" style=" word-wrap: break-word;">
               <ul class="thumbnails">
                  <li class="span6">
                     <div class="thumbnail">
                       <div id="Lcanvas" style="height:100%; width:100%;">
                         <div id="faq" style="pointer-events:none; padding-left:20px;">
                            <p> Features:-</p>
         					<label> <span>*</span> Easy, convenient & fast. </label>
        					<label><span>*</span> Facility is available 24 X 7. </label>
         					<label><span>*</span> No more queues and waiting. </label>
 						    <label><span>*</span> Instant online receipts for payment made. </label>
						    <label><span>*</span> Revenue will come earlier in to the Government <br/>treasury as compared to old system. </label>
                         </div>
                        </div> <!-- div id Lcanvas closed -->
                       </div><!-- div id thumbnails closed -->
                    </li>
                    
                    <li class="span6">
                     <div class="thumbnail">
                      <div id="PPcanvas"  style="height:100%;  width:100%;">
                      <div id="faq" style="pointer-events:none; padding-left:20px;">
                         <p> Can we help you?</p>
                         <label>Contact us to get quick answers to your questions. Our friendly representitives are happy to work with you and look forward to hearing from you.</label>
                         <label> Live Support call :- 7776543210 </label>
                         <label> Helpdesk Number :- 7776543210 </label>
                           <label>Mail-Id :- genericpayment@gmail.com </label>
                           <label></label>
                       </div>
                      </div><!-- div id PPcanvas closed --> 
                    </div><!-- div id thumbnails closed -->
                  </li>
              </ul>
         </div> <!--thumbnail div closed-->
                              </div>
                               </div> </div>
                            
                             <div id="footer" class="span12 navbar navbar-fixed-bottom" style="margin-left: 6%; width: 88%;">
<div class="row-fluid">
<div class="span12">

<div align="center" style="font-size:10px; font-weight:bold; color:#FFF; padding-top:10px; ">
                      Powered By Government of Jharkhand 
                    </div>

</div>
</div>
 </div>
                              
       </div> <!--well div closed-->
     </div>  <!--row-fluid div closed-->
    </div>
   </div>
  </div>  <!--Wrapper div closed-->
 </div>
</div>  <!--container div closed-->

              
     <%}%>          

</body>
</html>