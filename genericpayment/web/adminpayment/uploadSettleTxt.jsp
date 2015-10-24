<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="genericepayment.*"  %>

<%  
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
    String msg =  request.getAttribute("msg1")==null?"":(String) request.getAttribute("msg1");
    String msgerror =  request.getAttribute("msg2")==null?"":(String) request.getAttribute("msg2");
    int count=request.getAttribute("count")==null?0:(Integer)request.getAttribute("count");
%>
<html>
  <head>
   <!-- start: Meta -->
	<title>Upload Settle Text | Payonline Jharkhand</title>
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
					<a href="#">Upload Bank Settlement File</a>
				</li>
		
				
			</ul>
                            <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Upload</h2>
					</div>
					<div class="box-content">
                                            <font color="Red"><%=msg%></font>
                                                <div id="form1" align="center">
                                                    <form id="frmup" name="frmup" action="<%=ccp%>/Settle" method="post">
                                                        <fieldset title="upload Excel">
                                                             <input type="hidden" name="step" value="1"/>
                                                             <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                                            <strong>Select text File</strong>
                                                            <input id="fileName" type="file" name="excel" id="excel" value="Upload txt file"/><br/>
                                                            <input type="button" class="btn-primary" value="Upload" id="btn" onclick="Checkfiles();"/>
                                                        </fieldset>
                                                    </form> 
                                                </div> 
                                        </div>
                                </div>
                            </div>
                        </div>
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	
    	<div class="clearfix"></div>
	<%@ include file="../assets/metro/__inc/footer.jsp"%>
	
	<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script>
<script src="<%=ccp%>/assets/metro/js/custom.js"></script>
    <script language="javascript">
        function Checkfiles()
        {
        var fileName=document.frmup.excel.value;
        var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
        if(ext == "txt" || ext == "TXT")
        {
            document.frmup.submit();
        } 
        else
        {
            alert("Upload txt file only");
            fup.focus();
            return false;
        }
        }
    </script>
    
  <%}%>
  </body>
  
</html>