<!DOCTYPE html>
 <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
 <META HTTP-EQUIV="Expires" CONTENT="-1">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<head>
<!-- start: Meta -->
<title>Admin Login | Payonline Jharkhand</title>
<%@ include file="../assets/metro/__inc/base_links.jsp"%>
</head>
<body>

<!-- start: Header -->
<%@ include file="../assets/metro/__inc/header.jsp"%>
<!-- start: Header -->
<div class="container-fluid-full">
  <div class="row-fluid"> 
    
    <!-- start: Main Menu --> 
    <!-- end: Main Menu --> 
    
    <!-- start: Content -->
    <div id="content" class="span10">
      <ul class="breadcrumb">
        <li> <i class="icon-home"></i> <a href="<%=ccp%>/landing.jsp">Home</a> <i class="icon-angle-right"></i> </li>
        <li> <i class="icon-edit"></i> <a href="#">Admin Login </a> </li>
      </ul>
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-header" data-original-title>
            <h2><i class="fa fa-edit"></i><span class="break"></span>Admin Login </h2>
          </div>
          <div class="box-content">
            <form  id="adminloginjsp" name="adminloginjsp" action="<%=ccp%>/GenericAdServlet" method="post" autocomplete="off">
              <input type="hidden" name="step" id="step" value="1">
              <%-- <input type="hidden" name="rndm" id="rndm" value="<%=rndadmins%>"> --%>
              <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
              <div align="center"><font color="Red"><%=request.getParameter("mesg")!=null?request.getParameter("mesg") : ""%></font></div>
              <table class="table table-striped table-bordered bootstrap-datatable datatable">
                <tr>
                  <th>User Name </th>
                  <td>
                      <input id="useradmin" name="useradmin"  placeholder="User name" type="text" autocomplete="off" required>
                    <br/>
                  </td>
                </tr>
                <tr>
                  <th>Password</th>
                  <td><input id="passwordadmin" name="passwordadmin"  placeholder="Password" type="password" autocomplete="off" required>
                    <br/>
                  </td>
                </tr>
                <!--tr>
                  <th>Security Code</th>
                  <td><div style="clear:both;font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;">
                      <input type="text" name="captcha" maxlength="5"   placeholder="Security Code" style="width:100px;"/>
                      <img name="c" id="c" src="<%=ccp%>/CustomizedCaptcha" height="25" width="66"> <a href="#" onclick='document.getElementById("c").src="<%=ccp%>/CustomizedCaptcha?x="+Math.random();adminlogin.captcha.focus();'> <img src="<%=ccp%>/assets/metro/images/refresh1.jpg" alt="" width="20" height="25" onmouseover="this.src='<%=ccp%>/assets/metro/images/refresh.gif'" onmouseout="this.src='<%=ccp%>/assets/metro/images/refresh1.jpg'" style="border: 0px;" /> </a> </div></td>
                </tr-->
                <tr>
                  <td></td>
                  <td >
                      <div class="controls" >
                          <button class="btn btn-primary" type="button" name="Loh" onclick="adminValid1();" >Login</button>
                        <button class="btn btn-primary" type="Reset" id="Dreset">Reset </button>
                      </div></td>
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
<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
<script type="text/javascript" src="<%=ccp%>/jquery/jquery.validate.min.js"></script> 
<script type="text/javascript" src="<%=ccp%>/script/md5.js"></script> 
<script type="text/javascript">
        function encryptDeptPassword(t){                
                var p = document.adminloginjsp.password1;
                if(p.value=="" || p.length==0){
                    document.adminloginjsp.password1.value = "";
                }else{
                    document.adminloginjsp.password1.value = m5(p.value, t);
                }
            }
           
                             function adminValid1() {
              
                                var usradmn = document.adminloginjsp.useradmin.value;//useradmin,passwordadmin
                               var pwdRegex=/^[0-9a-zA-Z]+$/;
                                var pwdadmn = document.adminloginjsp.passwordadmin.value;
                                var userregx = /^[a-zA-Z]+$/;

                                if (!usradmn.match(userregx)) {
                                    alert("Please enter the User Name!");
                                    document.adminloginjsp.useradmin.focus();
                                    return false;
                                } else if (!pwdadmn.match(pwdRegex)) {
                                    alert("Please enter the Password!");
                                    document.adminloginjsp.pincode.focus();
                                    return false;
                                } else {
                                    //return true;
                                    document.adminloginjsp.submit();
                                }
                            }
        </script> 
<script type="text/javascript">
var message="Right Click Disabled!";
   function clickIE4(){
       if (event.button==2){
       alert(message);
       return false;
       }
   }
function clickNS4(e){
   if (document.layers||document.getElementById&&!document.all){
       if (e.which==2||e.which==3){
           alert(message);
           return false;
       }
   }
}
if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
} else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}
document.oncontextmenu=new Function("alert(message);return false")
</script>
</body>
</html>