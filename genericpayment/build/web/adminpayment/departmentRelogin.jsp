<!DOCTYPE html>


<% 

if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{ %>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<html>
  <head>
      <title>departmentRelogin</title>
      <%@ include file="../assets/metro/__inc/base_links.jsp"%>
  </head>
  <body>
  <%@ include file="../assets/metro/__inc/header.jsp"%>
<!-- start: Header -->

<div class="container-fluid-full">
  <div class="row-fluid"> 
    
    <!-- start: Main Menu -->
    <%@ include file="../assets/metro/__inc/main_menu.jsp"%>
    <!-- end: Main Menu --> 
    
    <!-- start: Content -->
    <div id="content" class="span10">
      <ul class="breadcrumb">
        <li> <i class="icon-home"></i> <a href=<%=ccp%>/adminpayment/adminContent.jsp>Home</a> <i class="icon-angle-right"></i> </li>
        <li> <i class="icon-edit"></i> <a href="#">Department Relogin</a> </li>
      </ul>
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-header" data-original-title>
            <h2><i class="fa fa-edit"></i><span class="break"></span>Department Relogin</h2>
          </div>
          <div class="box-content">
                            <div class="span12">
                                <p align="center" style="padding-top:10px; font-family:cambria; color:#000;font-size:16px;">Password Successfully Changed.&nbsp;&nbsp;
                                <a target="_top" href="<%=ccp%>/adminpayment/departmentLogin.jsp" style="font-size:16px; color:green;"><u> Click here to Re-Login with your new password.</u></a></p>
                            </div>
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

            <%@ include file="../assets/metro/__inc/footer.jsp"%>
            <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
            <script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
            <script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
     <%}%>
  </body>     

</html>
