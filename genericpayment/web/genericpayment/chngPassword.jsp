<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%//@ include file="../portalheader.jsp"%>
<%@ page import="genericepayment.*"  %>
<%if (request.getSession().getAttribute("userloggedin")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{%>
<%
GenericBean gb=request.getSession().getAttribute("signupbean")!=null? (GenericBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
//String dlrname=gb.getDlrname()!=null?gb.getDlrname(): "";
String email=request.getSession().getAttribute("email")!=null?(String)request.getSession().getAttribute("email") : "";
%>
<% String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<html lang="en">
    <head>
     <title>Change Password | Payonline</title>
     <%@ include file="../assets/metro/__inc/base_links.jsp"%>
     <link id="base-style-responsive" href="../assets/metro/css/cmxform.css" rel="stylesheet">
     <script type="text/javascript">
     function chngPwdValidation(){
        var oldpwd=document.frm.oldpassword.value;
        var password=document.frm.password.value;
        var confirmpassword=document.frm.confirmpassword.value;
        var pwdlength=password.length;
        var oldpwdlength=oldpwd.length;
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*])");
    if(oldpwdlength<8){
        alert("Old Password length must be greater than 7");
        document.frm.oldpassword.focus();
        return false;
      }else if(!strongRegex.test(oldpwd)){
          alert("Please Enter Old Strong Password");
          document.frm.oldpassword.focus();
          return false;
    }
    
    else if(pwdlength<8){
        alert("New password length must be greater than 7");
        document.frm.password.focus();
        return false;
    }else if(!strongRegex.test(password)){
         alert("Please Enter New Strong Password");
         document.frm.password.focus();
         return false;
    }
    else if(confirmpassword<8){
        alert("Confirm password length must be greater than 7");
        document.frm.confirmpassword.focus();
        return false;
    }else if(!strongRegex.test(confirmpassword)){
         alert("Please Enter Confirm Strong Password");
         document.frm.confirmpassword.focus();
         return false;
    }else if(password!=confirmpassword){
         alert("password mismatch!");
         document.frm.confirmpassword.focus();
         return false;
    }else{
        document.frm.submit();
    }    
}
     
     </script>
    </head>
    <body>
		<!-- start: Header -->
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
                        <a href="#">Change Password</a>
                    </li>
                </ul>
                <div class="row-fluid sortable">
                    <div class="box span12">
                        <div class="box-header" data-original-title>
                            <h2><i class="fa fa-edit"></i><span class="break"></span>Change Password</h2>
                        </div>
                        <div class="box-content">
                        <!--div><font color="Yellow"><%=request.getParameter("msg")!=null?request.getParameter("msg") : ""%></font></div-->
                            <form id="changepassword" name="frm" action="<%=ccp%>/GenericServlet" method="POST" onSubmit="return confirmpass(this)"> 
                                <input type="hidden" name="step" id="step" value="8">
                                <input type="hidden" name="username" value="<%=email%>">
                                    <div align="center" ><font color="Green"><%= request.getParameter("msg")!=null ? request.getParameter("msg") : "" %></font>  </div>
                                        <legend id="llegend">Create New Password</legend>
                                        <table class="table table-bordered" align="center">
                                            <tr>
                                                <th>Old Password</th>
                                                <td><input type="password" name="oldpassword" id="oldpassword"></td>
                                            </tr>
                                            <tr>
                                                <th>New Password</th>
                                                    <td><input type="password" name="password" id="password"></td>
                                            </tr>
                                            <tr>
                                                <th>Confirm Password</th>
                                                <td><input type="password" name="confirmpassword" id="confirmpassword"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><div align="center"><input type="button" value="Submit" onclick="chngPwdValidation();" class="btn-success" >
                                                <input type="reset" value="Reset" class="btn-success" ></div></td>
                                            </tr>
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
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.validate.js"></script>
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script> 
    <script type="text/javascript">
			
		// validate signup form on keyup and submit
		$("#changepassword").validate({
			ignore:[],
			rules: {
				oldpassword:{
					required: true,
					//date: true
				},
				password: {
					required: true,
					minlength: 8
				},
				confirmpassword: {
					required: true,
					minlength: 8
				},
			},
		});
	</script>
	<!-- end: JavaScript-->
        <%}%>
</body>
</html>