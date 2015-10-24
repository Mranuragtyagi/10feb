<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% java.util.ArrayList  ar=(java.util.ArrayList)request.getSession().getAttribute("statelist");
String err=request.getParameter("error")!=null ?request.getParameter("error"): "" ;
%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>

<html>
  <head> 
 <%@ include file="../head_tag.jsp"%> 

   
  </head>
  <body>
  <div class="container">
<div class="content">
<div class="wrapper">
 <div class="row">
<div class="span12">
<div class="row-fluid roundbox min-height">
       <!--apn12 div closed-->
      <%@ include file="../header.jsp"%> 
      <div class="span12"></div>
      <div class="span4" align="center"></div>
      <div class="span3 roundbox signup-form thumbnail ">
                    <div class="span12 font18"> <span class="lb1"><strong>Sign up</strong></span></div>
                    <form accept-charset="UTF-8" id="signupForm" action="<%=ccp%>/genericpayment/remainingUnregisteredDetails.jsp" method="post">
                      <input class="span11" id="firstname" name="firstname" placeholder="Full Name" type="text" required="required" />
                      <input class="span11" id="email" name="email" placeholder="Email" type="text" required="required" />
                      <input class="span11" id="phonenumber" name="phonenumber" placeholder="Mobile" type="text" required="required" />
                      <input class="span11" id="password1" name="password1" placeholder="Password" type="password" required="required" />
                      <input class="span11" id="confirmpassword" name="confirmpassword" placeholder="Confirm Password" type="password" required="" />
                      <!--<select  id="question" name="question" class="span11"  placeholder="Security Question">
                        <option value="" selected>Security Question</option>
                        <option value="Your Hoobies">Your Hobby</option>
                        <option value="Your Place Of Birth">Your Place Of Birth</option>
                        <option value="Your First School Name">Your First School Name</option>
                        <option value="Your First Cell Phone Company Name" >Your First Cell Phone Company Name</option>
                      </select>
                      <input class="span11" id="eanswer" name="eanswer" placeholder="Answer" type="text" required="" />-->
                      <div class="span12" align="center" style="margin:0 auto;">
                        <button class="btn btn-warning span12" type="submit"> <strong>Create an Account</strong> </button>
                      </div>
                    </form>
                  </div>
                  
      </div>
      
     </div></div></div></div><%@ include file="../footer.jsp"%></div> 
  
  
  
  </body>
</html>


