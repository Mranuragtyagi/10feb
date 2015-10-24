<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="genericepayment.*, genericepayadmin.*, vicclass.*"  %>
<%@ page import="java.util.*"%>
<%
    User user = request.getSession().getAttribute("user")!=null? (User) request.getSession().getAttribute("user"):null;
    if (user == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {
        String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";
        String path = request.getAttribute("path") != null ? (String) request.getAttribute("path") : "";
        String filename = request.getAttribute("filename") != null ? (String) request.getAttribute("filename") : "";
        GenericDepartmentBean gdbean = request.getSession().getAttribute("gdbean")!=null ?(GenericDepartmentBean)request.getSession().getAttribute("gdbean"):null;
        ArrayList al = request.getSession().getAttribute("al") != null ? (ArrayList) request.getSession().getAttribute("al") : null;
        java.text.DecimalFormat df = new java.text.DecimalFormat("##############.00");
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
        String ust = "Used";
        String unst = "Unused";
        String ty = request.getAttribute("typ") != null ? (String) request.getAttribute("typ") : "";
        int slno = 1;
        int pg = request.getAttribute("pg") != null ? (Integer) request.getAttribute("pg") : 0;
        int recordsperpage = request.getAttribute("recordsperpage") != null ? (Integer) request.getAttribute("recordsperpage") : 0;
        slno = ((pg - 1) * recordsperpage + 1);
%>
<html>
    <head>
        <!-- start: Meta -->
        <title>Home  | Payonline Jharkhand</title>
        <%@ include file="../assets/metro/__inc/base_links.jsp"%>
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/dataTables.tableTools.css" >
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
                            <a href="<%=ccp%>/departmentReportByPeriod.jsp">Home</a>
                            <i class="icon-angle-right"></i> 
                        </li>
                        <li>
                            <i class="icon-edit"></i>
                            <a href="#">Department Report</a>
                        </li>
                    </ul>
                    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="fa fa-edit"></i><span class="break"></span>Department Report</h2>
                            </div>
                            <div class="box-content">
                                <form action="<%=ccp%>/GenericDepartment"  method="POST" name="frm">
                                      <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" id="step" value="verifychallan">
                                    <input type="hidden" name="dept" id="dept" value="<%=gdbean.getDepartment_id()%>">
                                    <input type="hidden" name="pat" id="pat" value="<%=path%>">
                                    <input type="hidden" name="filname" id="filname" value="<%=filename%>">
                                    <table class="table table-striped table-bordered bootstrap-datatable datatable">          
                                        <%vicclas.F_Download fd = new vicclas.F_Download();%>
                                        <%if(request.getParameter("msg")!=null){%>
                                        <tr>
                                            <td colspan="2">
                                                <div class="success">
                                                    <%= request.getParameter("msg")%>
                                                    <%if (request.getParameter("msg").contains("Excel Sheet Generated")){%>                                                    
                                                    <a href="<%=ccp%>/GenericDownload?pat=<%=path%>&filname=<%=filename%>"> Download </a>
                                                    <%}%>
                                                </div>
                                            </td>
                                        </tr>
                                        <%}%>
                                        <tr>
                                            <th>PeriodFrom</th>
                                            <td><input type="text" name="periodfrom" id="periodfrom" class="span6" required> </td>
                                            <th>PeriodTo</th>
                                            <td><input type="text" name="periodto" id="periodto" class="span6" required> </td>
                                            <th>Type</th>
                                            <td><select name="type" id="type" class="span9">
                                                    <option value="1" <%= ty.equals("1") ? "selected" : ""%>>Used</option>
                                                    <option value="0" <%= ty.equals("0") ? "selected" : ""%>>Unused</option>
                                                    <option value="all" <%= ty.equals("all") ? "selected" : ""%>>All</option>
                                                </select>
                                            </td>
                                            <td>
                                                <div align="center">
                                                    <input type="submit" name="" value="Submit"  class="btn btn-primary">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <%if(al!=null){%>
                                <form action="<%=ccp%>/GenericDepartment" method="POST" name="frmm">
                                      <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" id="step" value="verifychallan" />
                                    <input type="hidden" name="dept"  value="<%= gdbean.getDepartment_id()%>" />
                                    <input type="hidden" name="chid" id="chid" value="" />
                                    <input type="hidden" name="pg" value=""/>
                                    <input type="hidden" name="periodfrom" value="" />
                                    <input type="hidden" name="periodto" value="" />
                                    <input type="hidden" name="type" value="<%=ty%>" />
                                    <table id="printview" class="display">
                                        <%if(al!=null|| !al.isEmpty()){%>
                                        <thead>
                                            <tr>
                                                <th>Sr No</th>
                                                <th>Challan No</th>
                                                <th>Dealer Name</th>
                                                <th>Address</th>
                                                <th>Period From</th>
                                                <th>Period To</th>
                                                <th>Amount</th>
                                                <th>Payment Date</th>
                                                <th>Tax Type</th>
                                                <th>Status</th>
                                            <%if((ty.equalsIgnoreCase("all")) || (ty.equalsIgnoreCase("0"))){%>
                                                <th>Action</th>
                                            <%}%>
                                            </tr>
                                        </thead>
                                        <%
                                            Iterator it = al.iterator();
                                            double gtotal = 0.0;
                                            while (it.hasNext()){
                                                GenericDepartmentBean gdb = (GenericDepartmentBean) it.next();
                                                 gtotal += gdb.getAmount();
                                        %>
                                        <tr>
                                            <td><%=slno++%></td>
                                            <td><%=gdb.getChallan_no()!= null ? gdb.getChallan_no() : ""%></td>
                                            <td><%=gdb.getDlrname() != null ? gdb.getDlrname() : ""%></td>
                                            <td><%=gdb.getAddress()%>/<%=gdb.getCity()%>/<%=gdb.getState()%></td>
                                            <td><%=gdb.getPeriod_from() != null ? sdf.format(gdb.getPeriod_from()):""%></td>
                                            <td><%=gdb.getPeriod_to()!=null?sdf.format(gdb.getPeriod_to()) : ""%></td>
                                            <td><%=gdb.getAmount() != 0.0 ? df.format(gdb.getAmount()) : ""%></td>
                                            <td><%=gdb.getPayment_date()!= null ? sdf.format(gdb.getPayment_date()):""%></td>
                                            <td><%=gdb.getPurpose() != null ? gdb.getPurpose():""%></td>
                                            <%if(gdb.getChallan_status().equals("0")){%>
                                            <td><%=unst%></td>
                                            <td>
                                                <input type="button" name="ver" class="btn-warning btn-mini" 
                                                       value="Verify" onclick="chln('<%=gdb.getChallan_no()!=null?gdb.getChallan_no():""%>');">
                                            </td>                                            
                                            <%}else if(gdb.getChallan_status().equals("1")){%>
                                            <td><%=ust%></td>
                                            <%}%>
                                        </tr>
                                            <%}%>
                                        <tr>
                                            <td colspan="6"></td>
                                            <td colspan="1"><div><font color="Red"><%= gtotal != 0.0 ? df.format(gtotal) : ""%></font></div></td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <%}else{%>
                                        <tr>
                                            <td colspan="11">
                                                <div><font color="Red">Data Not Found</font></div>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </table>
                                </form>
                                <%}%>
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
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script>                            
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script> 
        <script type="text/javascript">
            $(function() {
                $("#periodfrom").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
                $("#periodto").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
            });
            function chln(t){
                document.frmm.chid.value = t;
                document.frmm.submit();
            }
        </script>
        <script type="text/javascript">
            function createExcelFile() {
                frm = document.frmm;
                frm.step.value = 21;
                frm.submit();
            }
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#printview').DataTable({
                    dom: 'T<"clear">lfrtip',
                    tableTools: {
                        "sSwfPath": "<%=ccp%>/assets/metro/swf/copy_csv_xls_pdf.swf",
                        "aButtons": [ "csv","xls",
                            {
                                "sExtends": "pdf",
                                "sPdfOrientation": "landscape",
                                "sPdfMessage": " "
                            }
                        ]
                    }
                });
            });
        </script>
        <%}%>
    </body>
</html>