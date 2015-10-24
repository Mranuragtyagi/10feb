<%@ page import="org.apache.commons.lang.StringEscapeUtils" errorPage="/error.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%@ page import="vicclas.*" %>
    <%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
    <%

if (request.getSession().getAttribute("user")==null){
    response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
    vicclass.User u=(vicclass.User)request.getSession().getAttribute("user");
    String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
    String deptid=request.getSession().getAttribute("deptid")!=null?(String)request.getSession().getAttribute("deptid") : "";
    String deptuser=request.getSession().getAttribute("departmentUsername")!=null?(String)request.getSession().getAttribute("departmentUsername") : "";
    String msg=StringEscapeUtils.escapeHtml(request.getParameter("msg"));
    System.out.println(msg);
%>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>changePwdFirstTime</title>
<%@ include file="../assets/metro/__inc/base_links.jsp"%>
    </head>
    <body>
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
        <li> <i class="icon-edit"></i> <a href="#">Change Password</a> </li>
      </ul>
      <%if(msg!=null){%>
      <div class="alert alert-block">
        <h4 class="alert-heading"><%=msg%></h4>
      </div>
      <%}%>
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-header" data-original-title>
            <h2><i class="fa fa-edit"></i><span class="break"></span>Change Password</h2>
          </div>
          <div class="box-content">
        <br><font color="Red"></font>
              <form action="<%=ccp%>/GenericAdminServlet?step=22" method="post" onSubmit="return confirmpass(this)">
                     <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                <input type="hidden" name="user" id="user" value="<%=deptuser%>" >
                <input type="hidden" name="department" id="department" value="<%=deptid%>" >
                <div align="center">
                    <table id="AutoNumber1" align="center" class="tablebox table-bordered table-hover">
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
                            <th>Re-Enter New Password</th>
                            <td><input name="repassword" type="password"/></td>
                        </tr>
                        <tr>                        
                            <th colspan="2" align="center"><input name="changepass" type="submit" class="btn btn-success" value="Change Password"/></th> 
                        </tr>
                    </table>
                </div>
            </form>
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
<!--/fluid-row--><%@ include file="../assets/metro/__inc/footer.jsp"%> 
        <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
        <script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
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
                    //f.oldpassword.value=m5(f.oldpassword.value,t);
                    correct=true;
                }
                return correct;
            }
        </script>
  </body>
       
</html>

<%}%>