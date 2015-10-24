<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%--errorPage="../error.jsp"--%>
<%@page import="java.sql.*,java.text.*" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<% String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
<title>genericReceipt</title>
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
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-content">
            <div class="span11" id="printdiv" >
              <div class="row-fluid spanborder" id="rowfluid">
             
                <div class="span12 logo"  id="logo" style="display:none;">
                  <div class="row-fluid">
                    <div class="span6">
                      <div style="margin-left:5px;">
                        <div class="leftheader"></div>
                      </div>
                    </div>
                    <div class="span6">
                      <div style="float:right; margin-right:5px;">
                        <!--<img src="<%=ccp%>/assets/metro/img/printrightheader.png" width="160" height="50" />-->
                      </div>
                    </div>
                  </div>
                </div>
               
                <div class="span12" style="margin:0px; margin-right:40px; margin-top:30px;">
               <b>If Debited From Account The Status Will Be Updated Within 48 Hours</b>
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
<div class="clearfix"></div>
<%@ include file="../assets/metro/__inc/footer.jsp"%>
<!-- start: JavaScript-->
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
<script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/qrcode.min.js"></script>

</body>
</html>
