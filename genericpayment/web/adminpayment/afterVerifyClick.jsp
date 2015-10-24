<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" import="java.text.*" errorPage="/error.jsp"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils, genericepayadmin.*, vicclass.* "%>
<%
    User u = (User)request.getSession().getAttribute("user");
    if (u == null){
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {
        String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";
        GenericDepartmentBean gb = request.getAttribute("gbean") != null ? (GenericDepartmentBean) request.getAttribute("gbean") : null;
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        DecimalFormat df = new DecimalFormat("##################0.00");
        String mssg = StringEscapeUtils.escapeHtml(request.getParameter("mssg") != null ? request.getParameter("mssg") : "");
        String addr = gb.getAddress() != null ? gb.getAddress() : "" + ", " + gb.getCity() != null ? gb.getCity() : "" + ", " + gb.getState() != null ? gb.getState() : "";
%>
<html>
    <head>
        <title>afterVerifyClick</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Verify Payment | Government of Jharkhand Electronic Revenue Receipt Portal</title>
        <%@ include file="../assets/metro/__inc/base_links.jsp"%>
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >
        <style>th{font-weight:bold;}</style>
    </head>
    <body>
        <%@ include file="../assets/metro/__inc/department_header.jsp"%>
        <!-- start: Header -->
        <div class="container-fluid-full">
            <div class="row-fluid">
                <!-- start: Main Menu -->
                <%@ include file="../assets/metro/__inc/department_main_menu.jsp"%>
                <!-- end: Main Menu -->
                <!-- start: Content -->
                <div id="content" class="span10">

                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="<%=ccp%>/adminpayment/departmentReportByPeriod.jsp">Home</a>
                            <i class="icon-angle-right"></i> 
                        </li>
                        <li>
                            <i class="icon-edit"></i>
                            <a href="#">Verified Challan Report</a>
                        </li>
                    </ul>
                    <div class="row-fluid sortable">

                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="fa fa-edit"></i><span class="break"></span>Challan Report</h2>
                            </div>
                            <div class="box-content">
                                
                                    <form>
                                         <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                        <br/>
                                        <div align="center">
                                            <label style="font-size:17px; font-family:cambria; color:#900;">
                                                <%=request.getParameter("mesg") != null ? request.getParameter("mesg") : ""%>
                                            </label>
                                        </div><br/>
                                        <table class="tablebox table-hover" style="width:80%; background-image:url(../assets/metro/images/verified123.jpg); background-position:center; background-repeat:no-repeat;" align="center" >
                                            <tr>
                                                <th>Challan No</th>
                                                <td>
                                                    <input type="text" name="challan" readonly maxlength="16" 
                                                           size="16"  class="input-medium" value="<%=gb.getChallan_no()!= null ? gb.getChallan_no(): ""%>"/>
                                                </td>
                                                <th>Department</th>
                                                <td>
                                                    <input type="text" name="department" readonly class="input-medium" value="<%=gb.getDepartment() != null ? gb.getDepartment() : ""%>"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Name</th>
                                                <td>
                                                    <input type="text" name="dlrname" readonly class="input-medium" value="<%=gb.getDlrname() != null ? gb.getDlrname() : ""%>"/>
                                                </td>

                                                <th>Purpose</th>
                                                <td>
                                                    <input type="text" name="purpose" readonly class="input-medium" value="<%=gb.getPurpose() != null ? gb.getPurpose() : ""%>"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Mobile</th>
                                                <td>
                                                    <input type="text" name="mobile" readonly maxlength="10"  class="input-medium" value="<%=gb.getMobile() != null ? gb.getMobile() : ""%>"/>
                                                </td>
                                                <th>Payment Date</th>
                                                <td>
                                                    <input type="text" name="paymentdate" readonly class="input-medium" value="<%=gb.getPayment_date()!= null ? sdf.format(gb.getPayment_date()) : ""%>"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Email Id</th>
                                                <td>
                                                    <input type="text" name="email" class="input-medium" readonly value="<%=gb.getEmail() != null ? gb.getEmail() : ""%>"/>
                                                </td>
                                                <th>Address</th>
                                                <td>
                                                    <input type="text" name="address" class="input-medium" readonly value="<%=addr != null ? addr : ""%>"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Period From</th>
                                                <td>
                                                    <input type="text" name="periodfrom" readonly class="input-medium" value="<%=gb.getPeriod_from() != null ? sdf.format(gb.getPeriod_from()) : ""%>"/>
                                                </td>
                                                <th>Period To</th>
                                                <td>
                                                    <input type="text" name="periodto" readonly class="input-medium" value="<%=gb.getPeriod_to() != null ? sdf.format(gb.getPeriod_to()) : ""%>"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th colspan="2">Amount</th>
                                                <td  colspan="2">
                                                    <input type="text" name="amount" readonly class="input-medium" value="<%=gb.getAmount() != 0.0 ? df.format(gb.getAmount()) : "0.0"%>"/>
                                                </td>
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
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script>
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
            <%}%>
    </body>
</html>