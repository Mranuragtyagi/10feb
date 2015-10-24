<%-- 
    Document   : codeConduct
    Created on : Apr 13, 2015, 5:55:29 PM
    Author     : zephaniah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
    <head>
<title>Code Of Conduct</title>
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
      <div class="row-fluid">
       
    This Code of Conduct is to help users understand how to best use this site. Please note that the usage of this site is governed by the Code of Conduct, the Terms of Service and the Privacy Policy. 
- User accounts can be created only by humans. Accounts created by bots, crawlers or automated programs are disallowed. 
- If you are creating an account, you must provide your name, a valid email address, and other required information in order to complete the signup process. 
- You are solely responsible for the security of your account and password. We will not be liable for any loss/damage arising from your failure to comply with your account security. 
- You are responsible for all content posted and activity that occurs from your account. Please handle your account with care. 
- You should not use this platform for any illegal or unauthorized purpose. Your usage of this site must not violate The Terms of Service and Privacy Policy. 

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
