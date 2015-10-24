<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.text.*, genericepayment.*, vicclass.*, genericepayadmin.*, 
         org.apache.commons.lang.StringEscapeUtils" contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%
    User user = request.getSession().getAttribute("user") != null ? (User) request.getSession().getAttribute("user") : null;
    if (user == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {
        String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";
        String chln = request.getAttribute("chalan") != null ? (String) request.getAttribute("chalan") : "";
        String status = StringEscapeUtils.escapeHtml(request.getParameter("status") != null ? request.getParameter("status") : "");
        GenericDepartmentBean gb = request.getAttribute("gbean") != null ? (GenericDepartmentBean) request.getAttribute("gbean") :new  GenericDepartmentBean();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        DecimalFormat df = new DecimalFormat("##################0.00");
        String mssg = StringEscapeUtils.escapeHtml(request.getParameter("mssg") != null ? request.getParameter("mssg") : "");
        String addr = gb.getAddress() != null ? gb.getAddress() : "" + ", " + gb.getCity() != null ? gb.getCity() : "" + ", " + gb.getState() != null ? gb.getState() : "";
%>
<html>
    <head>
        <!-- start: Meta -->
        <title>Verify Payment | Payonline Jharkhand</title>
        <%@ include file="../assets/metro/__inc/base_links.jsp"%>
    </head>
    <body>
        <!-- start: Header -->
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
                            <a href="#">verify Payment</a>
                        </li>
                    </ul>
                    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="fa fa-edit"></i><span class="break"></span>verify Payment</h2>
                            </div>
                            <div class="box-content">
                                <%if (status.equals("0") && mssg != "") {%>
                                <form action="<%=ccp%>/GenericDepartment" method="POST" name="frm">
                                      <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" id="step" value="verifypayment">
                                    <input type="hidden" name="actn" id="actn" value="veri">
                                    <div><font color="Red"> <%=request.getParameter("mssg") != null ? request.getParameter("mssg") : ""%></font></div>
                                    <table class="table table-striped table-bordered bootstrap-datatable datatable">          
                                        <tr>
                                            <th>Challan No</th>
                                            <td>
                                                <input type="text" name="challan" readonly maxlength="16"  
                                                       value="<%=gb.getChallan_no() != null ? gb.getChallan_no() : ""%>"/>
                                            </td>
                                            <th>Department</th>
                                            <td>
                                                <input type="text" name="department" readonly 
                                                       value="<%=gb.getDepartment() != null ? gb.getDepartment() : ""%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <td>
                                                <input type="text" name="dlrname" readonly 
                                                       value="<%=gb.getDlrname() != null ? gb.getDlrname() : ""%>"/>
                                            </td>
                                            <th>Purpose</th>
                                            <td>
                                                <input type="text" name="purpose" readonly 
                                                       value="<%=gb.getPurpose() != null ? gb.getPurpose() : ""%>"/>
                                            </td>

                                        </tr>
                                        <tr>
                                            <th>Mobile</th>
                                            <td>
                                                <input type="text" name="mobile" readonly maxlength="10" 
                                                       value="<%=gb.getMobile() != null ? gb.getMobile() : ""%>"/>
                                            </td>
                                            <th>Payment Date</th>
                                            <td>
                                                <input type="text" name="paymentdate" readonly 
                                                       value="<%=gb.getPayment_date() != null ? sdf.format(gb.getPayment_date()) : ""%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Email Id</th>
                                            <td>
                                                <input type="text" name="email" readonly 
                                                       value="<%=gb.getEmail() != null ? gb.getEmail() : ""%>"/>
                                            </td>
                                            <th>Address</th>
                                            <td>
                                                <input type="text" name="address" readonly 
                                                       value="<%=addr != null ? addr : ""%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Period From</th>
                                            <td>
                                                <input type="text" name="periodfrom" readonly 
                                                       value="<%=gb.getPeriod_from() != null ? sdf.format(gb.getPeriod_from()) : ""%>"/>
                                            </td>

                                            <th>Period To</th>
                                            <td>
                                                <input type="text" name="periodto" readonly 
                                                       value="<%=gb.getPeriod_to() != null ? sdf.format(gb.getPeriod_to()) : ""%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">Amount</th>
                                            <td colspan="2">
                                                <input type="text" name="amount" readonly value="<%=gb.getAmount() != 0.0 ? df.format(gb.getAmount()) : "0.0"%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <div align="center">
                                                    <input type="submit" name="ver" id="ver" 
                                                       class="btn-primary btn-mini" value="Verify" 
                                                       onclick="javascript:b();">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <%} else {%>
                                <form action="<%=ccp%>/GenericDepartment" method="POST" name="chform">
                                      <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" id="step" value="getchallandetails">
                                    <div>
                                        <font color="Red"> 
                                            <%=request.getParameter("mesg") != null ? request.getParameter("mesg") : ""%>
                                        </font>
                                    </div>
                                    <table class="table table-striped table-bordered bootstrap-datatable datatable">          
                                        <tr>
                                            <th>Challan NO</th>
                                            <td> 
                                                <input type="text" name="challan" id="challan" value="<%=chln%>" required> 
                                                &nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <input type="button" value="Submit" onclick="challanValidate();" 
                                                       class="btn btn-primary">
                                            </td>
                                        </tr>
                                    </table>
                                    <%if (request.getParameter("mesg") != null) {%>
                                    <table class="table table-striped table-bordered bootstrap-datatable datatable">                                        
                                        <tr>
                                            <th>Challan No</th>
                                            <td>
                                                <input type="text" name="challan" readonly maxlength="16" 
                                                       size="16" value="<%=gb.getChallan_no() != null ? 
                                                               gb.getChallan_no() : ""%>"/>
                                            </td>
                                            <th>Department</th>
                                            <td>
                                                <input type="text" name="department" readonly 
                                                       value="<%=gb.getDepartment() != null ? gb.getDepartment() : ""%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <td>
                                                <input type="text" name="dlrname" readonly 
                                                       value="<%=gb.getDlrname() != null ? 
                                                               gb.getDlrname() : ""%>"/>
                                            </td>
                                            <th>Purpose</th>
                                            <td>
                                                <input type="text" name="purpose" readonly 
                                                       value="<%=gb.getPurpose() != null ? 
                                                               gb.getPurpose() : ""%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Mobile</th>
                                            <td>
                                                <input type="text" name="mobile" readonly 
                                                       maxlength="10" size="10" value="<%=gb.getMobile() != null ?
                                                               gb.getMobile() : ""%>"/>
                                            </td>
                                            <th>Payment Date</th>
                                            <td>
                                                <input type="text" name="paymentdate" readonly value="<%=gb.getPayment_date() != null ? sdf.format(gb.getPayment_date()) : ""%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Email Id</th>
                                            <td>
                                                <input type="text" name="email" readonly 
                                                       value="<%=gb.getEmail() != null ? gb.getEmail() : ""%>"/>
                                            </td>
                                            <th>Address</th>
                                            <td>
                                                <input type="text" name="address" readonly 
                                                       value="<%=addr != null ? addr : ""%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Period From</th>
                                            <td>
                                                <input type="text" name="periodfrom" readonly 
                                                       value="<%=gb.getPeriod_from() != null ? 
                                                               sdf.format(gb.getPeriod_from()) : ""%>"/>
                                            </td>
                                            <th>Period To</th>
                                            <td>
                                                <input type="text" name="periodto" readonly 
                                                       value="<%=gb.getPeriod_to() != null ? 
                                                               sdf.format(gb.getPeriod_to()) : ""%>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">Amount</th>
                                            <td  colspan="2">
                                                <input type="text" name="amount" readonly 
                                                       value="<%=gb.getAmount() != 0.0 ? 
                                                               df.format(gb.getAmount()) : "0.0"%>"/>
                                            </td>
                                        </tr>
                                    </table>
                                    <%}%>
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
            function a() {
                var a = document.frm.can.value;
                if (a == 'Cancel') {
                    document.frm.actn.value = "canc";
                    document.frm.submit();
                }
            }
            function b() {
                
                var b = document.frm.ver.value;
                if (b == 'Verify') {
                    document.frm.actn.value = "veri";
                    document.frm.submit();
                }
            }
        </script>
        <script type="text/javascript">
            function challanValidate() {
                var challan = document.chform.challan.value;
                challanRegex = /^[0-9]+$/;
                if (challan == "") {
                    alert("Please enter the challan no!");
                    document.chform.challan.focus();
                    return false;
                } else if (!challan.match(challanRegex)) {
                    alert("Please enter the Valid Challan No!");
                    document.chform.challan.focus();
                    return false;
                } else {
                    document.chform.submit();
                }
            }
        </script>
        <%}}%>
    </body>
</html>