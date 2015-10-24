<!DOCTYPE html>
<%@ page import="java.text.*" contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {

        String chln = request.getAttribute("chalan") != null ? (String) request.getAttribute("chalan") : "";
        genericepayadmin.GenericAdminBean gb = request.getAttribute("gbean") != null ? (genericepayadmin.GenericAdminBean) request.getAttribute("gbean") : new genericepayadmin.GenericAdminBean();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        DecimalFormat df = new DecimalFormat("##################0.00");
        String mssg = StringEscapeUtils.escapeHtml(request.getParameter("mssg") != null ? request.getParameter("mssg") : "");
        String mesg = StringEscapeUtils.escapeHtml(request.getParameter("mesg") != null ? request.getParameter("mesg") : "");
        String addr = gb.getAddress() != null ? gb.getAddress() : "" + ", " + gb.getCity() != null ? gb.getCity() : "" + ", " + gb.getState() != null ? gb.getState() : "";
%>
<html lang="en">
    <head>

        <!-- start: Meta -->
        <title>Challan Details | Payonline Jharkhand</title>
        <%@ include file="../assets/metro/__inc/base_links.jsp"%>
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >

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
                            <a href="#">Challan Details</a>
                        </li>
                    </ul>

                    <%if (mssg != "" || mssg.equalsIgnoreCase("Please Enter the valid Challan Number")) {%>
                    <div><font color="Red"><%=mssg%></font></div>
                        <%}%>

                    <div class="row-fluid sortable">

                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="icon-edit"></i><span class="break"></span>Challan Details</h2>

                            </div>
                            <div class="box-content">

                                <form action="<%=ccp%>/GenericAdminServlet" method="POST" class="form-horizontal">
                                    <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <fieldset>
                                        <input type="hidden" name="step" id="step" value="17">
                                        <div class="control-group">
                                            <label class="control-label" for="ChallanNO">Challan NO</label>
                                            <div class="controls">
                                                <input type="text" name="challan" id="challan" value="<%=chln%>" required/>
                                                <input type="submit" class="btn btn-primary" value="Submit"/>
                                            </div>
                                        </div>

                                        <% if (request.getParameter("mesg") != null) {%>
                                        <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                            <tr>
                                                <th>Challan No</th>
                                                <td>
                                                    <input type="text" name="challan" readonly maxlength="16" size="16" value="<%=gb.getChallanno() != null ? gb.getChallanno() : ""%>"/>
                                                </td>

                                                <th>Department</th>
                                                <td>
                                                    <input type="text" name="department" readonly value="<%=gb.getDepartment() != null ? gb.getDepartment() : ""%>"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <th>Name</th>
                                                <td>
                                                    <input type="text" name="dlrname" readonly value="<%=gb.getDlrname() != null ? gb.getDlrname() : ""%>"/>
                                                </td>

                                                <th>Purpose</th>
                                                <td>
                                                    <input type="text" name="purpose" readonly value="<%=gb.getPurpose() != null ? gb.getPurpose() : ""%>"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <th>Mobile</th>
                                                <td>
                                                    <input type="text" name="mobile" readonly maxlength="10" size="10" value="<%=gb.getMobile() != null ? gb.getMobile() : ""%>"/>
                                                </td>
                                                <th>Payment Date</th>
                                                <td>
                                                    <input type="text" name="paymentdate" readonly value="<%=gb.getPaymentdate() != null ? sdf.format(gb.getPaymentdate()) : ""%>"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Email Id</th>
                                                <td>
                                                    <input type="text" name="email" readonly value="<%=gb.getEmail() != null ? gb.getEmail() : ""%>"/>
                                                </td>
                                                <th>Address</th>
                                                <td>
                                                    <input type="text" name="address" readonly value="<%=addr != null ? addr : ""%>"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <th>Period From</th>
                                                <td>
                                                    <input type="text" name="periodfrom" readonly value="<%=gb.getPeriodfrom() != null ? sdf.format(gb.getPeriodfrom()) : ""%>"/>
                                                </td>

                                                <th>Period To</th>
                                                <td>
                                                    <input type="text" name="periodto" readonly value="<%=gb.getPeriodto() != null ? sdf.format(gb.getPeriodto()) : ""%>"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Amount</th>
                                                <td>
                                                    <input type="text" name="amount" readonly value="<%=gb.getAmount() != 0.0 ? df.format(gb.getAmount()) : "0.0"%>"/>
                                                </td>
                                            </tr>
                                        </table>
                                        <%}%>
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

        <!-- start: JavaScript-->

        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script> 
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
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

        <!-- end: JavaScript-->
        <%}%>
    </body>
</html>
