<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<% 
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
    String msgg=StringEscapeUtils.escapeHtml(request.getParameter("msg"));
String deprtmentname=request.getAttribute("dep")!=null?(String)request.getAttribute("dep") : "";
String taxtype=request.getAttribute("taxtyp")!=null?(String)request.getAttribute("taxtyp"):"";
String treasury=request.getAttribute("treasury")!=null?(String)request.getAttribute("treasury"):"";
String taxpurposeid=StringEscapeUtils.escapeHtml(request.getParameter("taxid")!=null?request.getParameter("taxid") : "");
String departmentid=request.getAttribute("department")!=null?(String)request.getAttribute("department"):"";
String msg=StringEscapeUtils.escapeHtml(request.getParameter("mesg")!=null?request.getParameter("mesg"): "");
%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<html lang="en">
<head>
	
	<!-- start: Meta -->
	<title>Edit Tax Type | Payonline Jharkhand</title>
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
				<li>
					<i class="icon-home"></i>
					<a href="<%=ccp%>/adminpayment/adminContent.jsp">Home</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="icon-edit"></i>
					<a href="#">Edit Tax Type</a>
				</li>
			</ul>  <%if(msgg!=null){%>
      <div class="alert alert-block">
        <h4 class="alert-heading"><%=msgg%></h4>
      </div>
      <%}%>
           
			<div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Edit Tax Type</h2>
						
					</div>
					<div class="box-content">
    <form name="frm" action="<%=ccp%>/GenericAdminServlet" method="POST">
          <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
    <input type="hidden" name="step" id="step" value="8">
    <input type="hidden" name="taxpurid" id="taxpurid" value="<%=taxpurposeid%>">
    <input type="hidden" name="deptid" id="deptid" value="<%=departmentid%>">
        <table class="table table-bordered table-hover">
        <%if(msg=="" || msg.equals("")){%>
   <tr>
                <th>Department</th>
                <td><input type="text" name="department" readonly="readonly" id="department" value="<%=deprtmentname%>"></td>
                
            <tr>
                <th>Tax Type</th>
               <td><input type="text" name="taxtype"  id="taxtype" value="<%=taxtype%>"></td>
            </tr>
            <tr>
                    <th>Traesury Head Code</th>
                    <td><input type="text" name="treasury"  id="treasury" value="<%=treasury%>"></td>
            </tr>
           
            <tr>
                <td align="center" colspan="2"><input type="button"  class="btn-success"  value="Submit" onclick="fieldValidation();" ></td>
            </tr>
        </tr>
        <%}else{%>
       
            <div align="center"><font color="Green" size=""><%=msg%></font></div>
       
        <%}%>
    </table>
    </form>
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

		<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
<script>
    function fieldValidation(){
				  var name=document.getElementById("department").value;
                                  var txty=document.getElementById("taxtype").value;
                                   var trsry=document.getElementById("treasury").value;
                                    var namerex=/^[a-zA-Z ]+$/;
                                  var nmber=/^[0-9]+$/;
            if((document.frm.department.value == '#')||(document.frm.department.value =="")){
                alert("Enter the Department");
                document.getElementById('department').focus();
                return false;
            }else if(!txty.match(namerex)){
                alert("Plz!Enter Alphabet tax type");
                document.getElementById('taxtype').focus();
                return false;
            }else  if(!trsry.match(nmber)){
                alert("Plz!Enter Numeric Numeric Treasury Head Code");
                document.getElementById('treasury').focus();
                return false;
            }else{
             frm.submit();
            }
	}
    
</script>
</body>  <%}%>
</html>