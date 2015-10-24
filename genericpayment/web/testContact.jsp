<%-- 
    Document   : testContact
    Created on : Apr 13, 2015, 4:40:04 PM
    Author     : zephaniah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
    <head>
<title>Dashboard | Government of Jharkhand Electronic Revenue Receipt Portal</title>
<%@ include file="assets/metro/__inc/base_links.jsp"%>
<link href="<%=ccp%>/assets/metro/css/fullcalendar.css" type="text/css" rel="stylesheet">
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
        <h1>Hello World!</h1>
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

<!-- start: JavaScript--> 

<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script> 
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/fullcalender.min.js"></script> 
<!--<script type="text/javascript" src="<%=ccp%>/bootstrap/js/combine.js"></script>--> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/chartvalue.jsp"></script> 

<!-- end: JavaScript-->

</body>
</html>
