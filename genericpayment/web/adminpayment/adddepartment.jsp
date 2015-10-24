<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<% 

if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
String msg=StringEscapeUtils.escapeHtml(request.getParameter("msg"));
%>
<html>
<head>
<title>Add Department Xml | Payonline Jharkhand</title>
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
      <ul class="breadcrumb">
        <li> <i class="icon-home"></i> <a href=<%=ccp%>/adminpayment/adminContent.jsp>Home</a> <i class="icon-angle-right"></i> </li>
        <li> <i class="icon-edit"></i> <a href="#">Add Department</a> </li>
      </ul>
      <%if(msg!=null){%>
      <div class="alert alert-block">
        <h4 class="alert-heading"><%=msg%></h4>
      </div>
      <%}%>
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-header" data-original-title>
            <h2><i class="fa fa-edit"></i><span class="break"></span>Add Department</h2>
          </div>
          <div class="box-content">
              <form action="<%=ccp%>/GenericAdminServlet" name="frm" method="POST">
                  <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
              <table class="table table-bordered table-hover">
                <tr><th>
                  <input type="hidden" name="step" id="step" value="2"><label>Department</label>
                  <input type="text" name="department" id="department"></th></tr>
                  <tr><td>
                          <input type="button"  class="btn btn-primary" value="Submit" onclick="fieldValidation()"></td>
                </tr>
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
<script>
		
		 function fieldValidation(){
                var name=document.getElementById("department").value;
               // var deptRegex=/^[a-zA-Z ]+$/;
                var deptRegex=/^[a-zA-Z ]+$/;
         //   if((document.frm.department.value == '#')||(document.frm.department.value =="")||(!name.match(deptRegex))){
                 if(!name.match(deptRegex)){
                alert("Please Enter the Appropriate Department");
                document.getElementById('department').focus();
                return false;
            }else{
                document.frm.submit();
            }
        }
		 </script> 
<!-- end: JavaScript-->
<%}%>
</body>
</html>
