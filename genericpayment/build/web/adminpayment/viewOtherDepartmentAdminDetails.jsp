<!DOCTYPE HTML>
<%@ page import ="java.util.*" contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%@ page import="genericepayment.*"  %>

<%

    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {
        genericepayadmin.GenericAdminBean u = (genericepayadmin.GenericAdminBean) request.getAttribute("userdetails");
        ArrayList al = (ArrayList) request.getAttribute("districtlist");
        ArrayList a2 = (ArrayList) request.getAttribute("divlist");
        ArrayList a3 = (ArrayList) request.getAttribute("deptList");


%>
<html>
    <head>
        <!-- start: Meta -->
        <title>View Other Department Admin Details | Payonline Jharkhand</title>
        <%@ include file="../assets/metro/__inc/base_links.jsp"%>


    </head>
    <body onload="hide(this)">
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
                            <a href="#">Modify User</a>
                        </li>


                    </ul>
                    <div class="row-fluid sortable">

                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="fa fa-edit"></i><span class="break"></span>Modify User</h2>

                            </div>
                            <div class="box-content">


                                <%= request.getParameter("msg") != null ? "<br><font color=red face=verdana size=1>" + (request.getParameter("msg").equals("0") ? "The given username already exists. Please type a new one." : "User created successfully.") + "</FONT>" : ""%>
                                <form id="modifyuser" name="modifyuser" method="post" action="<%=ccp%>/GenericAdminServlet?step=modify" onSubmit="return checkForm(this)">            
                                   <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="department" id="department" value="<%= u.getDepartment()%>">
                                    <fieldset>
                                        <legend></legend>
                                        <table align="center" class="tablebox table-bordered table-hover">
                                            <tr>
                                                <td align="right">User Name&nbsp;&nbsp;:&nbsp;</td>
                                                <td align="left">
                                                    <font color="Red"> <%= u.getUsername()%></font>
                                                    <input type="hidden" id="username" name="username" value="<%= u.getUsername()%>">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">Full Name&nbsp;&nbsp;:&nbsp;</td>
                                                <td align="left"><input type="text" id="fullname" name="fullname" value="<%=u.getFullname()%>"></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Department&nbsp;&nbsp;:&nbsp;</td>
                                                <td align="left">
                                                    <select id="dept" name="dept" style="font-size:10px;" onClick="hide(this)" onChange="hide(this)"  >
                                                        <option value="#">--select--</option> 
                                                        <%
                                                            Iterator itr2 = a3.iterator();
                                                            while (itr2.hasNext()) {
                                                                genericepayadmin.GenericAdminBean dept = (genericepayadmin.GenericAdminBean) itr2.next();
                                                        %>
                                                        <option value="<%= dept.getDeptid()%>"><%= dept.getDepartment()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">Role To Grant&nbsp;&nbsp;:&nbsp;</td>
                                                <td align="left">
                                                    <select id="userrole" name="userrole" style="font-size:10px;" onClick="hide(this)" onChange="hide(this)"  >
                                                        <option value="#">--select--</option> 
                                                        <option value="adm" <%= u.getUserrole().equals("adm") ? "SELECTED" : ""%> >Administrator</option>
                                                        <option value="sta" <%= u.getUserrole().equals("sta") ? "SELECTED" : ""%> >State Officer</option>
                                                        <option value="div" <%= u.getUserrole().equals("div") ? "SELECTED" : ""%> >Division Officer</option>
                                                        <option value="dis" <%= u.getUserrole().equals("dis") ? "SELECTED" : ""%> >District Officer</option> 
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr id="div" style="display:none;">
                                                <td align="right">Division&nbsp;&nbsp;:&nbsp;</td>                            	
                                                <td align="left">
                                                    <select id="div_code" name="div_code" style="font-size:10px;">
                                                        <option value="#">--select--</option> 
                                                        <%
                                                            Iterator itr1 = a2.iterator();
                                                            while (itr1.hasNext()) {
                                                                genericepayadmin.GenericAdminBean div = (genericepayadmin.GenericAdminBean) itr1.next();
                                                        %>
                                                        <option value="<%= div.getDivisioncode()%>"  ><%= div.getDivisionname()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr id="dist" style="display:none;" >
                                                <td align="right">District&nbsp;&nbsp;:&nbsp;</td>                            	
                                                <td align="left">
                                                    <select id="district" name="district" style="font-size:10px;">
                                                        <option value="#">--select--</option> 
                                                        <%
                                                            Iterator itr = al.iterator();
                                                            while (itr.hasNext()) {
                                                                genericepayadmin.GenericAdminBean d = (genericepayadmin.GenericAdminBean) itr.next();
                                                        %>
                                                        <option value="<%= d.getDistrictcode()%>" ><%= d.getDistrictname()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th colspan="2" align="center" >
                                                    <input type="submit" value="Modify" name="modify" class="btn btn-primary" />
                                                    <input type="submit" value="Delete" name="delete" class="btn btn-primary" />
                                                    <!--input type="submit" value="Reset Password" name="resetpw" class="btn btn-success"/-->
                                                    <!--input type="submit" value="Unlock Acct" name="unlockAcct" class="btn btn-success"/-->
                                                </th>

                                            </tr>
                                        </table>
                                    </fieldset>
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
        <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <script src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script>
        <script src="<%=ccp%>/assets/metro/js/custom.js"></script>  


        <script type="text/javascript" language="JavaScript">
        function hide(tr) {
            var tr_dist = document.getElementById("dist");
            var tr_div = document.getElementById("div");
            if (tr.value == '#') {
                tr_div.style.display = "none";
                tr_dist.style.display = "none";
            } else if (tr.value == 'adm') {
                tr_dist.style.display = "none";
                tr_div.style.display = "none";
            } else if (tr.value == 'sta') {
                tr_dist.style.display = "none";
                tr_div.style.display = "none";
            } else if (tr.value == 'div') {
                tr_div.style.display = "";
                tr_dist.style.display = "none";
            } else if (tr.value == 'dis') {
                tr_div.style.display = "none";
                tr_dist.style.display = "";
            }
        }
        function checkForm(f) {
            var msg = "Following fields should not be left Blank: \n";
            var correct = true;
              var namerex=/^[a-zA-Z ]+$/;
            if (!f.username.value.match(namerex)) {
                correct = false;
                msg = msg + "User Name, ";
            }
            if (!f.fullname.value.match(namerex)) {
                correct = false;
                msg = msg + "Full Namee,";
            }
            if (f.dept.value == '#') {
                correct = false;
                msg = msg + "Department,";
            }
            msg = msg.substr(0, msg.length - 2);
            if (correct == false) {
                alert(msg);
            }
            return correct;
        }
        </script>
        <%}%>
    </body>
</html>

