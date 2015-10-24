<!DOCTYPE html>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" errorPage="/error.jsp"%>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{

String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<html>
    <%@ page import="vicclas.*" %>
    <head>
	<title>Change Admin Password | Payonline Jharkhand</title>
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
					<a href="#">Change Admin Password</a>
				</li>
			</ul>
           
			<div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Change Admin Password</h2>
						
					</div>
					<div class="box-content">
    
    <%  vicclass.User u=(vicclass.User)request.getSession().getAttribute("user");
        String adminusername=(String)request.getSession().getAttribute("adminUserName");
        %>
        <br><font color="Red"><%=request.getParameter("msg")!=null ?""+request.getParameter("msg"):""%></font></br>
      
            <form action="<%=ccp%>/GenericAdminServlet?step=changepass2&user=<%=adminusername%>" method="post" onSubmit="return confirmpass(this)">
                <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                <input type="hidden" name="user" id="user" value="<%=adminusername%>" >
                <div align="center">
                    <table class="table table-striped table-bordered bootstrap-datatable datatable"> 
                        <tr>
                            <th>Enter Old Password</th>
                            <td><input id="oldpassword" name="oldpassword" type="password"></td>
                        </tr>
                        <tr>
                            <th>Enter New Password</th>
                            <td><input id="password" name="password" type="password" onKeyUp="return passwordChanged();">
                            </td>
                        </tr>
                        <tr>
                            <th>Re-Enter New Password </th>
                            <td><input name="repassword" type="password"/></td>
                        </tr>
                        <tr>                        
                            <th colspan="2" align="center"><input name="changepass" type="submit" class="btn btn-primary" value="Change Password"/></th> 
                        </tr>
                    </table>
                </div>
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
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script>      
            
            <p>&nbsp;</p>
 
         <script type="text/javascript" src="<%=ccp%>/script/md5.js"></script>
        <script type="text/javascript" language="javascript">
            function confirmpass(f){
         
                var p1,p2;
                var correct=true;
                p1=f.password.value;
                p2=f.repassword.value;
                if(f.oldpassword.value.length==0){
                    alert("Enter Old Password");
                    f.oldpassword.focus();
                    correct=false;
                }else if((p1.length==0)){
                    alert("Password can not be blank");
                    f.password.focus();
                    correct=false;
                }else if((p1.length<6)){
                    alert("Minimum six characters required");
                    f.password.focus();
                    correct=false;
                }else if(p1!=p2){
                    alert("Passwords  mismatch!!!");
                    correct=false;
                }else{
                    correct=true;
                }
                return correct;
            }
        </script>
        <script type="text/javascript" language="javascript">
          
        </script>
       
    </body>
    <%}%>
</html>

