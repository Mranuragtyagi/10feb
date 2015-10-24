<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import ="java.util.*"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
  ArrayList a3=(ArrayList)request.getAttribute("deptList");
%>
<html>
<head>
<!-- start: Meta -->
<title>Ask Other Dept Admin UserName | Payonline Jharkhand</title>
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
        <li> <i class="icon-home"></i> <a href="<%=ccp%>/adminpayment/adminContent.jsp">Home</a> <i class="icon-angle-right"></i> </li>
        <li> <i class="icon-edit"></i> <a href="#">Modify User Details and Privilege</a> </li>
      </ul>
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-header" data-original-title>
            <h2><i class="fa fa-edit"></i><span class="break"></span>Modify User Details and Privilege</h2>
          </div>
          <div class="box-content"> <%= request.getAttribute("err")!=null?"<font face=verdana size=2 color=red><b>"+(String)request.getAttribute("msg")+"</br></font>":"" %>
              <form action="<%=ccp%>/GenericAdminServlet?step=showuser" method="post" name="odrfrm" onSubmit="return checkForm(this)">
                 <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
              <table class="table table-striped table-bordered bootstrap-datatable datatable">
                <tr>
                  <th width="187" align="right">Enter Username to Modify&nbsp;&nbsp;</th>
                  <td width="120" align="left"><input name="username" type="text" size="20" maxlength="20" onKeyPress="toUpper()"></td>
                  <td width="67" rowspan="2" style="vertical-align:middle;"><input type="submit" value="Continue" name="continue" onclick="return(fieldValidation1());" style="font-family: Verdana; font-weight: bold; font-size: 8pt" class="btn btn-primary"></td>
                </tr>
                <tr>
                  <th align="right">Department&nbsp;&nbsp;</th>
                  <td align="left"><select id="department" name="department" style="font-size:10px;" onClick="hide(this)" onChange="hide(this)"  >
                      <option value="#">--select--</option>
                      <%
                                    Iterator itr2=a3.iterator();
                                    while(itr2.hasNext()){
                                    genericepayadmin.GenericAdminBean dept=(genericepayadmin.GenericAdminBean)itr2.next();
                                %>
                      <option value="<%= dept.getDeptid()%>"><%= dept.getDepartment() %></option>
                      <%}%>
                    </select></td>
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
<script type="text/javascript" src="script/validate.js" language="JavaScript"></script> 
<script type="text/javascript" language="JavaScript">
            function checkForm(f){
                var msg="Please enter the Username to Modify!!!";
                var correct=true;
                  var namerex=/^[a-zA-Z ]+$/;
                if(!f.username.value.match(namerex)){
                    correct=false;
                }if(correct==false){
                    alert(msg);
                }
                return correct;		
            }
            
			 function fieldValidation1(){
				  var name=document.getElementById("department").value;
            if((document.odrfrm.department.value == '#')||(document.odrfrm.department.value =="")){
                alert("Enter the department");
                document.getElementById('department').focus();
                return false;
            }
			 }
        </script>
</body>
<%}%>
</html>
