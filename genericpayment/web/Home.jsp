<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
java.util.Random rndm=new java.util.Random(1234);
request.getSession().setAttribute("rnd", "" + rndm.nextLong());
String mssg=StringEscapeUtils.escapeHtml(request.getParameter("mssg")!=null?request.getParameter("mssg"):"" );
 String rnd=request.getSession().getAttribute("rnd")!=null?request.getSession().getAttribute("rnd").toString() :"";
String email=request.getSession().getAttribute("email")!=null?(String)request.getSession().getAttribute("email") : "";
String err=StringEscapeUtils.escapeHtml(request.getParameter("error")!=null ?request.getParameter("error"): "") ;
 java.sql.Connection con=null;
   java.sql.Statement st=null; java.sql.ResultSet rss=null ;
        java.util.ArrayList ar = new java.util.ArrayList();
        try {
        vicclass.User u=new vicclass.User();
        u.createConnection();
        con=u.getConnection();
             st = con.createStatement();
            String sqll = "select * from states";
             rss = st.executeQuery(sqll);
            while (rss.next()) {
                vicclass.State s = new vicclass.State();
                s.STATE_CODE = rss.getString("STATE_CODE");
                s.STATE_NAME = rss.getString("STATE_NAME");
                ar.add(s);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }finally{               
             try{
                 if(st !=null)
                     st.close();
                 if(rss!=null)
                     rss.close();
                if(con!=null)
                     con.close();
                 }catch(Exception e){
                     System.out.println(e.getMessage());
                 }
         }

%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Government of Jharkhand Electronic Revenue Receipt Portal</title>
<link rel="shortcut icon" href="<%=ccp%>/images/favicon.ico" />
<link rel="stylesheet" href="<%=ccp%>/Bootstrap2.2/css/bootstrap_s.css" type="text/css"> 
<link rel="stylesheet" href="<%=ccp%>/Bootstrap2.2/css/bootstrap-responsive.css" type="text/css">
<link rel="stylesheet" href="<%=ccp%>/font-awesome/css/font-awesome.min.css" type="text/css">

       
</head>
 <body>
<div class="container">
<div class="content">
<div class="wrapper">
 <div class="row">
<div class="span12">
<div class="row-fluid roundbox">
       <!--apn12 div closed-->
      <%@ include file="header.jsp"%> 
<!-- span12 closed -->

                    
<div class="span12">

    <div class="span3 effect2 thumbnail">

    <div id="forgotpassword">     
      <div id="forgotpwdtext"><p id="Pforgotpwdtext" style="font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;">Provide Details To Get Forgot Password?</p>
      </div><br/>
        <form id="ForgotForm" name="ForgotForm" action="<%=ccp%>/GenericServlet?step=7" method="post"   >
        <div id="message" style="padding:0 10px 10px 0px; height:auto; width:170px; word-wrap: break-word; color:#F30"><%=request.getParameter("mssg")==null?"":""+request.getParameter("mssg") %></div>
            <label> EMAIL_ID</label> <input class="span11" id="lemail" name="lemail"  onblur="securityQuestion()" onchange="securityQuestion()" placeholder="Email_id" type="text" required>
                <div id="a" style="display:none;color:red;"> </div><br/>
            <label>Security Question</label> <input class="span11" id="question"  name="question" readonly="readonly" type="text" required><br/>
            <br/>
                <label> Enter Answer</label>
                  <input class="span11" id="eanswer" name="eanswer" placeholder="Enter Answer" type="text" required="required"><br/>
                  <button class="btn-small" type="button"  onclick=" demoDisplay();">Submit </button> 
                  <button class="btn-small" type="Reset" id="resetf">Reset </button>
           
                   <div id="myscript">
                    </div>
     </form >
    </div>

     <!-- forgot password start -->
     <%if(mssg.equals("Invalid Answer")){%>
     <div id="forgotpassword">     
      <div id="forgotpwdtext"><p id="Pforgotpwdtext" style="font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;">Provide Details To Get New Password</p>
      </div><br/>
        <form id="ForgotForm" name="ForgotForm" action="<%=ccp%>/GenericServlet?step=7" method="post"   >
        <div id="message" style="padding:0 10px 10px 0px;font-weight:bold; height:auto; width:170px; word-wrap: break-word; color:#F30"><%=request.getParameter("mssg")==null?"":""+request.getParameter("mssg") %></div>
            <label> EMAIL_ID</label> <input class="span11" id="lemail" name="lemail"  onblur="securityQuestion()" onchange="securityQuestion()" placeholder="Email_id" type="text" required>
                <div id="a" style="display:none;color:red;"> </div><br/>
            <label>Security Question</label> <input class="span11" id="question"  name="question" readonly="readonly" type="text" required><br/>
            <br/>
                <label> Enter Answer</label>
                  <input class="span11" id="eanswer" name="eanswer" placeholder="Enter Answer" type="text" required="required"><br/>
                  <button class="btn-small" type="button" onclick="demoDisplay();" >Submit </button> 
                  <button class="btn-small" type="Reset" id="resetf">Reset </button>
                 <!-- <button class="btn-small" id="loginbtn" type="submit">Login </button>-->
                   <div id="myscript">
                    </div>
     </form >
    </div> <%}else{%> <!-- fogot password closed -->
 
      <div id="loginfield">
         <div id="sublogin" class="lb1 font16"> <img id="lgnimg" src="Bootstrap2.2/img/login.gif"/> User login
         </div><!-- sublogin closed -->
         <form id="LoginForm" name="LoginForm" action="<%=ccp%>/GenericServlet" method="post">
         <input type="hidden" name="step" id="step" value="6">
             <div id="message" style="padding:0 10px 10px 0px; height:auto; width:170px; word-wrap: break-word; color:#F30">
                <%=request.getParameter("msg")==null?"":""+request.getParameter("msg") %>
             </div>
             <div class="input-prepend"><span class="add-on"><i class="icon-user"></i></span>
            <input class="form-control span10" placeholder="E-mail" name="email" id="email" type="text" required="required"/></div>
            <div class="input-prepend"><span class="add-on"><i class="icon-lock"></i></span>
            <input class="form-control span10" placeholder="Password" name="password" id="password" type="password" value="" required="required"/></div>
            <div style="clear:both;font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;"><input type="text" name="captcha" maxlength="5"
placeholder="Secret Code" style="width:100px;"/>
            <img name="c" id="c" src="CustomizedCaptcha" height="25" width="66"/>
            <a href="#" onclick='document.getElementById("c").src="CustomizedCaptcha?x="+Math.random();login.captcha.focus();'>
            <img src="images/refresh1.jpg" alt="" width="20" height="25" onmouseover="this.src='images/refresh.gif'" onmouseout="this.src='images/refresh1.jpg'" style="border: 0px;"/> </a>
             </div>
             <input class="btn-small" type="submit" onclick="encryptDeptPassword('<%=rnd%>');" value="Login"/>
             <input class="btn-small" type="Reset" value="Reset" id="Dreset"/>
             <br />
             <span id="fpassbtn" style="font-size: 11.9px; font-weight: bold; padding:2px; cursor:pointer;">&nbsp;Forgot Password </span>|
             <span id="myModalbtn" style="font-size: 11.9px; font-weight: bold; padding:2px; cursor:pointer;"> <a href="genericpayment/createAccount.jsp" style="text-decoration: none; color:#333" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="create New Account">Register New</a> </span>
             
              <!--span id="myModalbtn" style="font-size: 11.9px; font-weight: bold; padding:2px; cursor:pointer;"> <a href="#myModal" style="text-decoration: none; color:#333" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="create New Account">Register New</a> </span-->
            
         </form>
    
                  
	  </div><%}%><!-- loginfield closed -->
     <br/>
    

</div>
   <div class="span9">
       <br/>
               <div class="netbankings">Important Security Notice:</div>
<div id="subnetbankings">NET BANKING & CARD PAYMENT</div>    
                           
           <div id="thumbnail" style=" word-wrap: break-word;">
               <ul class="thumbnails">
                  <li class="span11">
                     <div class="thumbnail">
                       <div id="Lcanvas" style="height:100%; width:100%;">
                         <div id="faq" style="pointer-events:none; padding-left:20px;">
                            
         					<!--label>1. URL address on the address bar of your internet browser begins with http://payonline.jharkhand.gov.in.</label-->
        					<label>1. Do not enter login or other sensitive information in any pop up window.</label>
         					<label>2. You have verified the security certificate by clicking on the padlock icon of your internet browser.</label>
                            <label>3. Do not enter login or other sensitive information in any pop up window.</label>
                            <label>4. Phishing is a fraudulent attempt, usually made through email, phone calls, SMS etc seeking your personal and confidential information.</label>
                         </div>
                        </div> <!-- div id Lcanvas closed -->
                       </div><!-- div id thumbnails closed -->
                    </li>
                 
              </ul>
         </div> <!--thumbnail div closed-->
      </div>
    </div> 
 

              <div class="span12 roundbox effect2">
                <div class="spa4_a roundbox" align="center">
                  <div class="span12 font18 h200"> <h3><i class="fa fa-mobile-phone f13A89E"></i><br><span class="f333">Smart device compliance</span></h3>
                    The portal is compatible with smart mobile or tablet. You can pay using your mobile or tablet.
               
                  </div>
                </div>
                <div class="spa4_a roundbox" align="center">
                  <div class="span12 font18 h200"> <h3><i class="fa fa-desktop f13A89E"></i><br><span class="f333">67+ Net banking Options</span></h3>
                    Tied up with 67+ banks for net banking and debit card payment.
                  
                  </div>
                </div>
                <div class="spa4_a roundbox" align="center"> 
                  <div class="span12 font18 h200"> <h3><i class="fa fa-lock f13A89E"></i><br><span class="f333">100% Secure</span></h3>
                    Your card or net banking details always remain encrypted and secure with NDML payment gateway.
                  
                  </div>
                </div>
              	
              </div>
  </div>
                          
                               <!-- footer start -->
              
 <%@ include file="footer.jsp"%> 
        <!-- footer closed -->                      
   
    </div>
   </div>
  </div>  <!--Wrapper div closed-->
 </div>
</div>  <!--container div closed-->
<div id="myModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">

            <div class="modal-header">
                <a class="pull-right" data-dismiss="modal" aria-hidden="true"><i class="icon-remove" style="cursor: pointer"></i></a>
                <h4><i class="icon-th-large  pull-left" style="margin-right: 10px;margin-top: 2px"></i>Register yourself</h4>
            </div>

            <div class="modal-body">
            <div class="span3 well">
                    <form accept-charset="UTF-8"  id="signupForm" action="<%=ccp%>/GenericServlet?step=3" method="post">
                    <div><font color="Red"><%=err%></font></div>
                       <label>Full Name<span style="color:#F00;">* </span></label><input class="span3"  id="firstname" name="firstname" placeholder="Full Name" type="text" required> <br/>
                       <label> Email_Id</label> <input class="span3" id="email" name="email" placeholder="Email_id" type="text" required><br/>
                       <label> phone No.</label><input class="span3" id="phonenumber" name="phonenumber" placeholder="Phone Number" type="text" required><br/>
                        <label>Address</label><input class="span3" id="address" name="address" placeholder="Address" type="text" required><br/>
                       
                       <label> State</label>
                       
                        <%if(ar!=null){
                java.util.Iterator it=ar.iterator();
                %>
                  <select name="state" id="state" class="span3">
                        <option selected="selected" value="#">-------Select------- </option>
                     <% while(it.hasNext()){
                         vicclass.State s = (vicclass.State)it.next();
                     %>
                         <option value="<%=s.STATE_CODE%>" ><%=s.STATE_NAME%> </option>
                     <%}%>
                    </select>
                <%}%>
                       <br/>
                       <label>City</label>
                                <select id="city" name="city"  class="span3" >
                                    <option value="#">-----Select-----</option>
                        </select>
        
                       <!--input class="span3" id="state" name="state" placeholder="State" type="text" required--><br/>
                       <label> Pin-Code</label><input class="span3" id="pincode" name="pincode" placeholder="Pincode" type="text" required><br/>
                       <label> Select Question</label><select  id="question" name="question" class="span3">
                             <option value="Your Hobbies"selected>Your Hobbies</option>
                             <option value="Your Place Of Birth">Your Place Of Birth</option>
                             <option value="Your First School Name">Your First School Name</option>
                             <option value="Your First Cell Phone Company Name" >Your First Cell Phone Company Name</option>
                        </select>  <br/>
                        <label> Enter Answer</label><input class="span3" id="eanswer" name="eanswer" placeholder="Enter Answer" type="text" required><br/>
                      <label> Password</label> <input class="span3" id="password1" name="password1" placeholder="Password" type="password" required><br/>
                      <label> Confirm Password</label> <input class="span3" id="confirmpassword" name="confirmpassword" placeholder="Confirm Password" type="password" required><br/>

                       <button class="btn btn-warning" type="submit"> Sign up </button> 
                       <button class="btn btn-warning" id="Sresets" type="reset" > Reset </button>
                       
                    </form>
                </div>
            </div>
            
               </div>
</body>
<script type="text/javascript" src="<%=ccp%>/jquery/jquery1.8.3.js"></script>
        <script type="text/javascript" src="<%=ccp%>/Bootstrap2.2/js/bootstrap.js"></script>
 <script type="text/javascript" src="<%=ccp%>/jquery/jquery.validate.min.js"></script>
        <script type="text/javascript" src="<%=ccp%>/jquery/validate.js"></script>
         <script type="text/javascript" src="<%=ccp%>/script/md5.js"></script>
         <script type="text/javascript" language="javascript">
         
            function encryptDeptPassword(t){
            var p = document.LoginForm.password; 
            if(p.value=="" || p.length==0){ 
            document.LoginForm.password.value = ""; 
            }else{
            document.LoginForm.password.value = m5(p.value, t);
            }
            }
            
          function loginUser(){
    //var username= document.getElementById("email");
    var username=document.departmentlogin.email;
    var password=document.departmentlogin.password1;			
    if(username.value=="" || username.length==0){
        alert("Please!Enter your User Name.");
    }else if(password.value=="" || password.value==0){
        alert("Please! Enter a password.");
    }else { 
        document.departmentlogin.step.value='4';
        document.departmentlogin.method="POST";
        document.departmentlogin.action="<%=ccp%>/GenericAdminServlet";
        document.departmentlogin.submit();		
    }
 }   
            
            
            
            
            
            
            
$(function(){$('li a').tooltip({delay:{show: 750,  hide: 100}});});
   $(document).ready(function(){
 $("#forgotpassword").hide();
 });
  $(document).ready(function(){myModal
  $("#fpassbtn").click(function(){
    $("#loginfield").hide();
	 $("#listofbank").show();
	$("#forgotpassword").show();
  });
 // $("#myModalbtn").click(function(){
   // 	$("#myModal").show();
  //});
  $("#loginbtn").click(function(){																																	
    $("#loginfield").show();
	 $("#listofbank").show();
	 $("#forgotpassword").hide();
  });
});

    function securityQuestion(){  
        $.ajax({
        type: "POST",
        url: "<%=ccp%>/genericpayment/getSecurityQuestion.jsp",
        data: {lemail:$("#lemail").val()}
        }).done(function(msg){
        $("#myscript").html(msg);
        });
    }

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

            $(function(){                
                $("#state").change(function(){      
                    $.getJSON("<%=ccp%>/json/districts.txt", function(res){ 
                        var options = '<option value="#">-----SELECT-----</option>';
                        var items = res.list;       
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                        if(items[i].state_code==$("#state").val()){
                            options += '<option value="' + items[i].district_code + '"'+ x +'>' + items[i].district_name + '</option>';
                            }
                        }
                        $("#city").html(options);
                    })
                })
            });
   
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
</html>