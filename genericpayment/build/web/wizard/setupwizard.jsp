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
<title>Setup Wizard | Payonline Jharkhand</title>
<%@ include file="../assets/metro/__inc/base_links.jsp"%>
<link href="<%=ccp%>/assets/metro/css/wizard.css" type="text/css" rel="stylesheet">
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
        <li> <i class="icon-edit"></i> <a href="#">Setup Organization</a> </li>
      </ul>
      <%if(msg!=null){%>
      <div class="alert alert-block">
        <h4 class="alert-heading"><%=msg%></h4>
      </div>
      <%}%>
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-header" data-original-title>
            <h2><i class="fa fa-edit"></i><span class="break"></span>Setup Organization</h2>
          </div>
          <div class="box-content">
            <section id="wizard">
              <div id="rootwizard">
                <ul>
                  <li><a href="#tab1" data-toggle="tab"><span class="label">1</span> Department</a></li>
                  <li><a href="#tab2" data-toggle="tab"><span class="label">2</span> Branch Office</a></li>
                  <li><a href="#tab3" data-toggle="tab"><span class="label">3</span> Major Tax</a></li>
                  <li><a href="#tab4" data-toggle="tab"><span class="label">4</span> Sub tax or Fee Type</a></li>
                  <li><a href="#tab5" data-toggle="tab"><span class="label">5</span> ID Proof</a></li>
                </ul>
                <ul class="pager wizard">
                    <li class="previous first" style="display:none;"><a href="javascript:void(0);">First</a></li>
                    <li class="previous"><a href="javascript:void(0);">Previous</a></li>
                    <li class="next last" style="display:none;"><a href="javascript:void(0);">Last</a></li>
                    <li class="next"><a href="javascript:void(0);">Next</a></li>
                  </ul>
                <div class="tab-content">
                  <div class="tab-pane" id="tab1">
                    <div class="row-fluid">
                      
                      <div class="span6 box">
                      <div class="box-header">
                        Department(s)
                        </div>
                        <div class="box-content" id="dept_list">
                        </div>
                      </div>
                      <div class="span6">
                        <div class="box box-primary">
                        <div class="box-header">
                        Add Department
                        </div>
                          <div class="box-content">
                            <form action="<%=ccp%>/GenericAdminServlet" method="POST" class="form-inline">
                              <input type="hidden" name="step" id="step" value="2">
                              <label>Department</label>
                              <input type="text" name="department" id="department"/>
                              <input type="submit"  class="btn btn-small btn-primary" value="Submit"/>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" id="tab2"> 2 </div>
                  <div class="tab-pane" id="tab3"> 3 </div>
                  <div class="tab-pane" id="tab4"> 4 </div>
                  <div class="tab-pane" id="tab5"> 5 </div>
                  <ul class="pager wizard">
                    <li class="previous first" style="display:none;"><a href="javascript:void(0);">First</a></li>
                    <li class="previous"><a href="javascript:void(0);">Previous</a></li>
                    <li class="next last" style="display:none;"><a href="javascript:void(0);">Last</a></li>
                    <li class="next"><a href="javascript:void(0);">Next</a></li>
                  </ul>
                </div>
              </div>
            </section>
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
<script src="<%=ccp%>/assets/metro/js/jquery.bootstrap.wizard.min.js"></script> 
<script>
$(document).ready(function() {
	  	$('#rootwizard').bootstrapWizard({'tabClass': 'bwizard-steps'});	
		window.prettyPrint && prettyPrint()
	});	
</script>

<script src="<%=ccp%>/assets/metro/js/setupwizard.js"></script>
<script src="<%=ccp%>/assets/metro/js/wizard_department.js"></script>
<!-- end: JavaScript-->
<%}%>
</body>
</html>
