<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<html>
<%@ page import="vicclas.*" %>
<head>
<title>Relogin Admin | Payonline Jharkhand</title>
<%@ include file="../assets/metro/__inc/base_links.jsp"%>
</head>
<body>

<!-- start: Header -->
<%@ include file="../assets/metro/__inc/header.jsp"%>
<!-- start: Header -->

<div class="container-fluid-full">
  <div class="row-fluid"> 
    
    <!-- start: Main Menu -->
    <%@ include file="../assets/metro/__inc/main_menu.jsp"%>
    <!-- end: Main Menu --> 
    
    <!-- start: Content -->
    <div id="content" class="span10">
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-content">
            <p>Password Successfully Changed.<a href="<%=ccp%>/GenericAdServlet?step=adminlogin" target="_top"> Click here to Re-Login with your new password.</a></p>
          </div>
        </div>
        <!--/span--> 
        
      </div>
    </div>
    <!--/.fluid-container--> 
    
    <!-- end: Content --> 
  </div>
  <!--/#content.span10--> 
</div>
<!--/fluid-row-->

<div class="clearfix"></div>
<%@ include file="../assets/metro/__inc/footer.jsp"%>

<!-- start: JavaScript--> 

<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script>
<%}%>
</body>
</html>
