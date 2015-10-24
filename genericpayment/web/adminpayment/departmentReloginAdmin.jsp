<%-- 
    Document   : departmentReloginAdmin
    Created on : Jan 9, 2015, 5:34:48 PM
    Author     : zephaniah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%@ page import="vicclas.*" errorPage="/error.jsp"%>
    <%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
String deptuser=request.getSession().getAttribute("departmentUsername")!=null?(String)request.getSession().getAttribute("departmentUsername") : ""; 
String deptid=request.getSession().getAttribute("deptid")!=null?(String)request.getSession().getAttribute("deptid") : "";

%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@ include file="../assets/metro/__inc/base_links.jsp"%>
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >
    </head>
    <body>
          <%@ include file="../assets/metro/__inc/department_header.jsp"%>
		<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<%@ include file="../assets/metro/__inc/department_main_menu.jsp"%>
			<!-- end: Main Menu -->
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="<%=ccp%>/adminpayment/departmentReportByPeriod.jsp">Home</a><i class="icon-angle-right"></i> 
                                         <i class="icon-edit"></i> <a href="#">Department Relogin</a>
				</li>
				<li>
					<i class="icon-edit"></i>
					<a href="#">Change Password</a>
				</li>
			</ul>
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Change Password</h2>
						
					</div>
					<div class="box-content">  
      
                        <div class="span12">
                                <p align="center" style="padding-top:10px; font-family:cambria; color:#000;font-size:16px;">Password Successfully Changed.&nbsp;&nbsp;
                                <a target="_top" href="<%=ccp%>/adminpayment/departmentLogin.jsp" style="font-size:16px; color:green;"><u> Click here to Re-Login with your new password.</u></a></p>
                            </div>
        </div>
				</div><!--/span-->

			</div>
    
	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
  
  <div class="clearfix"></div>
	<%@ include file="../assets/metro/__inc/footer.jsp"%>
          <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
          <script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
          <script src="<%=ccp%>/assets/metro/js/custom.js"></script>
      
        <%}%>
    </body>
</html>
