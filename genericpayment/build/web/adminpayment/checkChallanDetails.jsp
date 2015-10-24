<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<% 

if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
String msg=StringEscapeUtils.escapeHtml(request.getParameter("mesg"));
%>
<html>
<head>
<%@ include file="../assets/metro/__inc/base_links.jsp"%>
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
                            <a href="<%=ccp%>/GenericDepartment">Home</a>
                            <i class="icon-angle-right"></i> 
                        </li>
                        <li>
                            <i class="icon-edit"></i>
                            <a href="#">verify Payment</a>
                        </li>
                    </ul>
                    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="fa fa-edit"></i><span class="break"></span>verify Payment</h2>
                            </div>
                            <div class="box-content">
  
      <div class="alert alert-block">
          <h3><%=msg%></h3>
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
        <script src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script>
        <script src="<%=ccp%>/assets/metro/js/custom.js"></script>
<!-- start: JavaScript--> 

<%}%>
</body>
</html>
