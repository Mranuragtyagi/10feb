<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%String message=StringEscapeUtils.escapeHtml(request.getParameter("er")!=null?request.getParameter("er") : "");%>
<% String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>genericTransactionError</title>
    <style>.cont{margin-top:3%;}i{margin-top:5px;}#sublink{ font-family:Arial, Helvetica, sans-serif; font-size:12px;  color:rgb(0,136,204); cursor:pointer;}</style>
    <%@ include file="../assets/metro/__inc/base_links_payment_page.jsp"%>
</head>
  <body>
  <%@ include file="../assets/metro/__inc/user_header.jsp"%>
		<!-- start: Header -->
    <div class="container-fluid-full">
        <div class="row-fluid">
	<!-- start: Main Menu -->
        <%@ include file="../assets/metro/__inc/user_main_menu.jsp"%>
                <!-- end: Main Menu -->
                <!-- start: Content -->
            <div id="content" class="span10">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="<%=ccp%>/genericpayment/userContent.jsp">Home</a>
                        <i class="icon-angle-right"></i> 
                    </li>
                    <li>
                        <i class="icon-edit"></i>
                        <a href="#">Transaction Error</a>
                    </li>
                </ul>
                <div class="row-fluid sortable">
                    <div class="box span12">
                        <div class="box-header" data-original-title>
                            <h2><i class="fa fa-edit"></i><span class="break"></span>Transaction Error</h2>
                        </div>
                        <div class="box-content">
          <h3> <font face="Tahoma" color="red">An Error Has Occurred</font></h3>
          <br/>
          <p><%=message%><br/>
            <a href="<%=ccp%>/GenericLogin"> <span id="sublink">Take me to Home Page</span></a></p>
 
 </div>
                    </div><!--/span-->
                </div>
            </div><!--/.fluid-container-->
	     <!-- end: Content -->
        </div><!--/#content.span10-->
    </div><!--/fluid-row-->
    <div class="clearfix"></div>
    <%@ include file="../assets/metro/__inc/footer.jsp"%>
	<!-- start: JavaScript-->
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.validate.js"></script>
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script> 
    
  </body>
  </html>
   
