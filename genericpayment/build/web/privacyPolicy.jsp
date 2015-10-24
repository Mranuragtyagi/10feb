<%-- 
    Document   : privacyPolicy
    Created on : Apr 13, 2015, 5:49:19 PM
    Author     : zephaniah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
    <head>
<title>Privacy Policy</title>
<%@ include file="assets/metro/__inc/base_links.jsp"%>
</head>
<body>
<!-- start: Header -->
<%@ include file="assets/metro/__inc/user_header.jsp"%>
<!-- start: Header -->

<div class="container-fluid-full">
  <div class="row-fluid"> 
    
    <!-- start: Main Menu -->
    <%@ include file="assets/metro/__inc/user_main_menu.jsp"%>
    <!-- end: Main Menu --> 
    
    <!-- start: Content -->
    <div id="content" class="span10">
        <div class="container"style="min-height: 451px; width:60%; background:#F0F0F0; border: solid 1px #D8D8D8; padding:20px; border-radius:5px;">
      <div class="row-fluid ">
          <h2>PRIVACY POLICY</h2>
       The privacy of the users of this site is important to us. 
       
Users are free to browse this site and we will not automatically capture any specific personal information about you (e.g. your name, your phone number or email ID), that may allow us to identify you individually. 
We gather certain information about site visitors, such as Internet protocol (IP) addresses, domain name, browser type, operating system, the date and time of the visit, pages visited, referring URLs etc. We make no attempt to link these with the identity of individuals visiting our site unless an attempt to damage the site has been detected. 
The PayOnline platform uses cookies. A cookie is a small amount of data that is sent from our servers to be stored in your browser. We use these cookies to record current session information, to improve your user experience with PayOnline and tailor it to your preferences. We do not use permanent cookies. You can control cookies through your browser settings and other tools. By continuing to browse the site, you are granting consent to the placement of cookies in your browser as per this Privacy Policy.
If we require you to provide personal information by creating a user account, you will be informed about the particular purposes for which the information is being gathered and adequate security measures will be taken to protect your personal information 
We do not sell or share any personally identifiable information disclosed on this site to any third party (public or private), unless and until it is required by law. Any information provide by you will be protected from loss, misuse, unauthorized access or disclosure, alteration, or destruction.

    </div>
            </div>
    <!--/.fluid-container--> 
    <!-- end: Content --> 
  </div>
  <!--/#content.span10--> 
</div>
<!--/fluid-row-->
</div>
<div class="clearfix"></div>

<%@ include file="assets/metro/__inc/footer.jsp"%>

<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script> 
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 

</body>
</html>
