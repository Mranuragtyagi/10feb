<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%@ page import="java.util.*,genericepayment.*,genericepayadmin.*"  %>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {

        GenericAdminBean u = (GenericAdminBean) request.getAttribute("userdetails");
        String str = u.getUsername();
        ArrayList al = (ArrayList) request.getAttribute("circlelist");
        ArrayList a2 = (ArrayList) request.getAttribute("divisionlist");
        String dept = (String) request.getSession().getAttribute("dept");
%>

<html>
    <head>
        <!-- start: Meta -->
        <title>View Admin Details | Payonline Jharkhand</title>
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
                            <a href="#">Modify User Details and Privilege</a>
                        </li>


                    </ul>
                    <div class="row-fluid sortable">

                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="fa fa-edit"></i><span class="break"></span>Modify User Details and Privilege</h2>

                            </div>
                            <div class="box-content">


                                <form action="<%=ccp%>/GenericAdminServlet" method="post" name="frm">
                                     <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="department" id="department" value="<%=dept%>">
                                    <input type="hidden" name="step"  value="modify">
                                    <fieldset>
                                        <table class="table table-striped table-bordered bootstrap-datatable datatable">          
                                            <tr>
                                                <th>Username</th>
                                                <td>
                                                    <input type="hidden" name="username" value="<%= u.getUsername()%>">
                                                    <%= u.getUsername()%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Full Name</th>
                                                <td>
                                                    <input type="text" value="<%=u.getFullname()%>" name="fullname" size="35">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Role to Grant</th>
                                                <td width="68%">
                                                    <input type="hidden" name="prev_role" value="<%= u.getUserrole()%>" />
                                                    <select size="1" name="userrole" style="font-family: Verdana; font-size: 10pt; font-weight: bold">
                                                        <option value="ADMINISTRATOR" <%= u.getUserrole().equals("ADMINISTRATOR") ? " Selected " : ""%>>ADMINISTRATOR</option>
                                                        <option value="VATMONITOR" <%= u.getUserrole().equals("VATMONITOR") ? " Selected " : ""%>>VATMONITOR</option>
                                                        <option value="CCT" <%= u.getUserrole().equals("CCT") ? " Selected " : ""%>>CCT</option>
                                                        <option value="JC" <%= u.getUserrole().equals("JC") ? " Selected " : ""%>>JC</option>
                                                        <option value="INCHARGE" <%= u.getUserrole().equals("INCHARGE") ? " Selected " : ""%>>INCHARGE</option>
                                                        <option value="OFFICER" <%= u.getUserrole().equals("OFFICER") ? " Selected " : ""%>>OFFICER</option>
                                                        <option value="STATISTICIAN" <%= u.getUserrole().equals("STATISTICIAN") ? " Selected " : ""%>>STATISTICIAN</option>
                                                        <option value="OPERATOR" <%= u.getUserrole().equals("OPERATOR") ? " Selected " : ""%>>OPERATOR</option>
                                                        <option value="IB_OPERATOR" <%= u.getUserrole().equals("IB_OPERATOR") ? " Selected " : ""%>>IB_OPERATOR</option>
                                                        <option value="IB_OFFICER" <%= u.getUserrole().equals("IB_OFFICER") ? " Selected " : ""%>>IB_OFFICER</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Access&nbsp;Rights</th>
                                                <td>
                                                    <select size="1" name="scope" onClick="hide(this)" onChange="hide(this)">
                                                        <option value="C" <%= u.getScope().equals("C") ? "SELECTED" : ""%>>Circle</option>
                                                        <option value="D"  <%= u.getScope().equals("D") ? "SELECTED" : ""%>>Division</option>
                                                        <option value="S"  <%= u.getScope().equals("S") ? "SELECTED" : ""%>>State</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr id="circle">
                                                <th>Circle</th>
                                                <td>
                                                    <select size="1" name="cirncode" value="<%=u.getCirncode()%>" style="font-family: Verdana; font-size: 10pt; font-weight: bold">
                                                        <%

                                                            Iterator itr = al.iterator();
                                                            while (itr.hasNext()) {
                                                                GenericAdminBean c = (GenericAdminBean) itr.next();
                                                        %>
                                                        <option value="<%= c.getCirncode()%>" <%=(c.getCirncode() == u.getCirncode() ? "SELECTED" : "")%> ><%= c.getCirname()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr id="division" style="display:none;">
                                                <th>Division</th>
                                                <td width="68%">
                                                    <select size="1" name="div_code" >
                                                        <!-- <option value="0">Not Applied</option> -->
                                                        <%
                                                            itr = a2.iterator();
                                                            while (itr.hasNext()) {
                                                                GenericAdminBean c = (GenericAdminBean) itr.next();

                                                        %>
                                                        <option value="<%= c.getDivisioncode()%>"><%=c.getDivisionname()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th colspan="2" align="center" >
                                                    <input type="submit" value="Modify" name="modify" class="btn btn-primary" />
                                                    <input type="submit" value="Delete" name="delete" class="btn btn-primary" />
                                                    <input type="submit" value="Reset Password" name="resetpw" class="btn btn-primary"/>
                                                    <input type="submit" value="Unlock Acct" name="unlockAcct" class="btn btn-primary"/>
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


        <script type="text/javascript">
                      function hide(tr) {
                          var tr_c = document.getElementById("circle");
                          var tr_d = document.getElementById("division");
                          if (tr.value == 'C') {
                              tr_c.style.display = "";
                              tr_d.style.display = "none";
                          } else if (tr.value == 'D') {
                              tr_c.style.display = "none";
                              tr_d.style.display = "";
                          } else {
                              tr_c.style.display = "none";
                              tr_d.style.display = "none";
                          }
                      }
        </script>    

        <script type="text/javascript" language="javascript">
            hide(document.frm.scope);
        </script>


        <%}%>
    </body>
</html>
