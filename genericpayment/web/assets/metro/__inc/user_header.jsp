<%@ page import="genericepayment.*"  %>
<%String ccph="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
    String ccp_header="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
    String rndadmin= ""+ Math.round( Math.random()*100000);
    request.getSession().setAttribute("rnd",rndadmin);
  GenericBean gbh=request.getSession().getAttribute("signupbean")!=null? (GenericBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
  String dlrnameuh=gbh.getDlrname()!=null?gbh.getDlrname(): "";
%>
  <script type="text/javascript" src="<%=ccph%>/assets/metro/js/md5.js"></script> 
<script type="text/javascript">
function loginValidation(){
    var email=document.LoginForm.email.value;
    var password=document.LoginForm.password.value;
    var atpos=email.indexOf("@");
    var dotpos=email.lastIndexOf(".");
    
    var pwdlength=password.length;
    var strongRegex = new RegExp("^(?=.{8,})(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$*])");
    
    if(atpos < 1 || ( dotpos - atpos < 2 )){
        alert("Not a valid e-mail address!");
       document.LoginForm.email.value;
        return false;
    }else if(pwdlength<8){
        alert("Password length must be greater than 7 digits!");
        document.LoginForm.password.value;
        return false;
    }else if(!strongRegex.test(password)){
         alert("Password must contain alphanumeric and special character!");
         document.LoginForm.password.value;
         return false;
    }else{
        encrytMD5user();
        document.LoginForm.submit();
    }
}


 function demoDisplay(){
        var email = document.getElementById('lemail').value;
        var atpos=email.indexOf("@");
        var dotpos=email.lastIndexOf(".");
        var answerEx=/^[0-9a-zA-Z ]+$/;
        var a = document.getElementById('eanswer').value;
        var c = document.getElementById('question').value;
        
    if(atpos < 1 || ( dotpos - atpos < 2 )){
        alert("Not a valid e-mail address!");
        document.ForgotForm.question.value="";
        document.ForgotForm.lemail.focus();
        return false;
    }else if(c==""){
            alert("This email id is not registered!");
            document.ForgotForm.question.focus();
    }else if(!a.match(answerEx)){
            alert("Only Characters and Numbers are allowed!");
            document.getElementById('eanswer').focus();
    }else
        {
            document.ForgotForm.submit();
        }
    }  
    
    function emailCheck(){
        var email = document.getElementById('lemail').value;
        var atpos=email.indexOf("@");
        var dotpos=email.lastIndexOf(".");
        
        if(atpos < 1 || ( dotpos - atpos < 2 )){
            alert("Not a valid e-mail address!");
            document.ForgotForm.question.value="";
            document.ForgotForm.lemail.focus();
            return false;
        }else{
            securityQuestion();
        }  
    }
    
       function encrytMD5user(){  
            
           var t=document.getElementById('rnd');
                var p = document.getElementById('password');
                if(p.value=="" || p.length==0){
                    p.value = "";
                    return false;
                }else{
                    p.value = m5(p.value, t.value);
                    return true;
			//		document.getElementById("adminlogin").submit();
                }
		
            }
            
            
      function securityQuestion(){  
	
        $.ajax({
        type: "POST",
        url: $("#ccp").val()+"/JsonService?step=securityQ",
        data: {lemail:$("#lemail").val()}
        }).done(function(msg){       
        $("#question").val(msg);
        });
    }
    
    <%--  function securityQuestion(){  
	
        $.ajax({
        type: "POST",
        url: $("#ccp").val()+"/genericpayment/getSecurityQuestion.jsp",
        data: {lemail:$("#lemail").val()}
        }).done(function(msg){
        $("#myscript").html(msg);
        });
    }
    --%>
        
</script>
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                <span class="fa fa-bars"></span>
            </a>
            <%if(request.getSession().getAttribute("userloggedin")!=null){%>
                <a class="brand" href="<%=ccp_header%>/genericpayment/userContent.jsp">Pay<span class="lb1">Online</span></a><%}else{%>
                <a class="brand" href="<%=ccp_header%>/GenericLogin">Pay<span class="lb1">Online</span></a>
            <%}%>								
				<!-- start: Header Menu -->
             <%if(request.getSession().getAttribute("userloggedin")!=null){%>
                <div class="nav-no-collapse header-nav">
                    <ul class="nav pull-right">
                        <!-- start: User Dropdown -->
			<!-- end: User Dropdown -->
			<!-- start: User Dropdown -->
			<li class="dropdown">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="halflings-fa fa white user"></i> Welcome, <%=dlrnameuh%>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-menu-title">
                                    <span>User Settings</span>
				</li>
                                <li><a href="<%=ccp_header%>/genericpayment/editProfileDetails.jsp">&nbsp;<i class=" icon-random"></i>Profile Setting</a></li>
                                <li><a href="<%=ccp_header%>/genericpayment/chngPassword.jsp">&nbsp;<i class=" icon-random"></i>Change Password</a></li>
                                <li><a href="<%=ccp_header%>/GenericLogin?step=logoutuserloggedin">&nbsp;<i class="icon-off"></i>Log Out</a></li>
                            </ul>
                        </li>
			<!-- end: User Dropdown -->
                    </ul>
		</div>
             <%}else{%>
             <%String invalidloginmsg=request.getParameter("msg")!=null?(String)request.getParameter("msg") : "";%>
                 <div class="nav-no-collapse header-nav">
                     <ul class="nav pull-right hide480">
                         <form id="LoginForm" name="LoginForm" action="<%=ccp_header%>/GenericServlet" method="post" class="form-inline" autocomplete="off" >
                            <input type="hidden" name="step" id="step" value="header_login">
                            <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                             <input type="hidden" name="rnd" id="rnd" value="<%=rndadmin%>">
                            <div><font color="Yellow"><%=invalidloginmsg%></font></div>
                            <input placeholder="E-mail" name="email" id="email" type="text" required="required" autocomplete="off"/>
                            <input placeholder="Password" name="password" id="password" type="password" value="" required="required" autocomplete="off"/>
                            <input class="btn-small btn-yellow" type="button" onclick="loginValidation();" id="login" value="Login"/>
                         </form>
                         <div class="pull-right">
                            <span  style="font-size: 11.9px; font-weight: bold; padding:2px; cursor:pointer;"> <a href="#adminmodel" style="text-decoration: none; color:#fff" data-toggle="modal" data-placement="bottom">Staff</a> </span> |
                            <span  style="font-size: 11.9px; font-weight: bold; padding:2px; cursor:pointer;"> <a href="#departmentmodel" style="text-decoration: none; color:#fff" data-toggle="modal" data-placement="bottom" >Department</a> </span> |  
                            <span  style="font-size: 11.9px; font-weight: bold; padding:2px; cursor:pointer;">
                            <a href="#forgotPassword" style="text-decoration: none; color:#fff" data-toggle="modal" rel="tooltip" data-placement="bottom" data-original-title="Forgot Password">&nbsp;Forgot Password </a></span>
                         </div>
                     </ul>
                 </div>
             <%}%>
	           <!-- end: Header Menu -->
        </div>
    </div>
</div>

   <!-- Model START--> 
    
    
<div id="forgotPassword" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form id="ForgotForm" name="ForgotForm" action="<%=ccp_header%>/GenericServlet" method="post" class="form-horizontal" >
        <input class=span type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
         <input type="hidden" name="step" value="7"/>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
            <h3 id="myModalLabel">Forgot Password</h3>
        </div>
        <div class="modal-body">
            <div><font color="Red"><%=request.getParameter("mssg")==null?"":""+request.getParameter("mssg") %></font></div>
            <%--<label> EMAIL_ID</label> <input id="lemail" class="span5" name="lemail"  onblur="securityQuestion()" onchange="securityQuestion()" placeholder="Email" type="text" required>--%>
            <label> EMAIL_ID</label> <input id="lemail" class="span4" name="lemail"  onblur="emailCheck()" onchange="emailCheck()" placeholder="Email" type="text" required>
            
            <label>Security Question</label><div id="myscript"></div><input id="question" class="span4"  name="question" readonly="readonly" type="text" required>
            <label> Enter Answer</label>
            <input id="eanswer" name="eanswer" class="span4" placeholder="Enter Answer" type="text" required="required">
            
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" type="button" onclick="demoDisplay();">Submit</button>
            <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
    </form>
</div>

<!-- Model END-->