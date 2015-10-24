<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="genericepayment.*"  %>
<%@page import="java.util.*" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
String mssg=StringEscapeUtils.escapeHtml(request.getParameter("mssg")!=null?request.getParameter("mssg"):"") ;
GenericBean gb=request.getSession().getAttribute("signupbean")!=null? (GenericBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
String dlrname=gb.getDlrname()!=null?gb.getDlrname(): "";
String email=request.getSession().getAttribute("email")!=null?(String)request.getSession().getAttribute("email") : "";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>E generic Payment</title>
<%@ include file="head_tag.jsp"%> 
        <script type="text/javascript" src="jquery/jquery.validate.min.js"></script>
        <script type="text/javascript" src="jquery/validate.js"></script>
        
   
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
  <div class="well" style="min-height:600px;  margin-bottom:0px;">
    <%@ include file="header.jsp"%> 
    
       <!--apn12 div closed-->
     
<!-- span12 closed -->

            
<div class="span12">
  <div class="row-fluid less-left-margin">
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
        <legend style="font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;">Pay Your Taxes Through</legend>
          <div class="span12">
             <div class="row-fluid">
              <div class="span6">
                <div id="netbankings">NET BANKING </div>
                 <div id="subnetbankings">Quick, Easy And Always Available</div>
               </div>
               <div class="span6">
                 <div id="cardpayments">CARD PAYMENT </div>
                  <div id="subcardpayments">Quick, Easy And Always Available</div>
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
                         <label>Contact us to get quick answers to your questions. Our friendly representatives are happy to work with you and look forward to hearing from you.</label>
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
                               </div> </div></div>
                            
                             <%@ include file="footer.jsp"%> 
                              
       </div> <!--well div closed-->
     </div>  <!--row-fluid div closed-->
    </div>
   </div>
  </div>  <!--Wrapper div closed-->
 </div>
</div>  <!--container div closed-->

</body>
</html>