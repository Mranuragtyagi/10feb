<!DOCTYPE html>
<%-- 
    Document   : treasuryinfo
    Created on : Jan 6, 2015, 11:20:53 AM
    Author     : santosh
--%>

<%@page import="vicclass.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>


<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<html>
<head>
<title>Department Integration | Payonline Jharkhand</title>
<%@ include file="../assets/metro/__inc/base_links.jsp"%>
</head>
<body>
        
      <%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
 

         	String randm = RandomStringUtils.random(12, 0, 6, true, true, "bj81G5RDED3DC6142kasok".toCharArray());
         	Random random = new Random();    
        	long n = (long) (100000000000000L + random.nextFloat() * 900000000000000L);
          	String msg=request.getParameter("message");
		  %>
          

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
      <ul class="breadcrumb">
        <li> <i class="icon-home"></i> <a href=<%=ccp%>/adminpayment/adminContent.jsp>Home</a> <i class="icon-angle-right"></i> </li>
        <li> <i class="icon-edit"></i> <a href="#">Department Integration</a> </li>
      </ul>
      <%if(msg!=null){%>
      <div class="alert alert-block">
        <h4 class="alert-heading"><%=msg%></h4>
      </div>
      <%}%>
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-header" data-original-title>
            <h2><i class="fa fa-edit"></i><span class="break"></span>Department Integration</h2>
          </div>
          <div class="box-content">

        <form name="frm" method="post" action="<%=ccp%>/Dept_Intcode" onsubmit="return getvalidate();">
            
            <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
            <table class="table table-bordered table-hover">
                
                <tr><td>Department Name</td><td><input type="text" name="deptname" required><input type="hidden" name="step" value="step1"></td></tr>  
                <tr><td>Department Code</td><td><input type="text" name="deptcode" required></td></tr>  
                <tr><td>IP Address</td><td><input type="text" name="ipadrs" onkeypress='return verifyIP(ipadrs.value)' required></td></tr>
                <tr><td>Secret Code</td><td><input type="text" name="secrtcod" value="<%=randm%>" readonly></td></tr>  
                <tr><td>Response Url</td><td><input type="text" name="respurl" required></td></tr>
                 <tr><td>Error Url</td><td><input type="text" name="error_url" required></td></tr>
                <tr><td colspan="2" align="center"><input type="submit" name="Submit" class="btn btn-primary" value="Submit"></td></tr>
                
                 </table>
            
        </form>
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
<script type="text/javascript">
            function getvalidate()
            {
                
var dept=document.frm.deptname.value;
var nameEx=/^[a-zA-Z ]+$/;
var nameEx2=/^[a-zA-Z0-9 ]+$/;
var deptcode=document.frm.deptcode.value;
 // var patterns = /[^0-9]/g;
var ipadrs=document.frm.ipadrs.value;
//var seccod=document.frm.secrtcod.value;
var resurl=document.frm.respurl.value;

 if(!dept.match(nameEx)){
  alert("Please fill the Department Name only in alphabet");
  document.frm.deptname.focus();
  return false;
}

if(!deptcode.match(nameEx2)){
  alert("Please fill alphabet-numeric Department Code");
  document.frm.deptcode.focus();
  return false;
} 
//var IPText = "123.123.123.123"; 
RegE = /^\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}$/ 
if(!ipadrs.match(RegE))
{
  alert("Please fill the exact Ip Address");
  document.frm.ipadrs.focus();
  return false;
} 
 var pattern = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
       
if(!pattern.test(resurl)){
  alert("Please fill the Proper Response Url");
  document.frm.respurl.focus();
  return false;
} 
   }
</script>
 <%}%>
</body>
</html>
