<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%@ page import="java.util.*,genericepayadmin.* " %>

<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
    String sql = "select initcap(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? ";
    java.sql.PreparedStatement stmt = null;
    java.sql.Connection con = null;
    vicclass.User u =(vicclass.User)request.getSession().getAttribute("user");
    con = u.getConnection();
    ArrayList all = new ArrayList();
    java.sql.ResultSet rs = null;
    try {
        stmt = con.prepareStatement(sql);
        stmt.setString(1, "A");
        rs = stmt.executeQuery();
        while (rs.next()) {
            GenericAdminBean genericbean = new GenericAdminBean();
            genericbean.setDepartment(rs.getString("DEPT_NAME"));
            genericbean.setDeptid(rs.getString("DEPT_ID"));
            all.add(genericbean);
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
    } finally {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    String msg = request.getAttribute("msg") != null ? (String) request.getAttribute("msg") : "";
    ArrayList al = request.getAttribute("arr") != null ? (ArrayList) request.getAttribute("arr") : null;
    genericepayadmin.GenericAdminBean gdb = null;
    java.text.DecimalFormat df = new java.text.DecimalFormat("##############.00");
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
    int slno = 1;
%>
<html lang="en">
    <head>
        <title>Instand And Registered Details | Payonline Jharkhand</title>
        <%@ include file="../assets/metro/__inc/base_links.jsp"%>
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >        
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/dataTables.tableTools.css" >
    </head>
    <body>
        <%@ include file="../assets/metro/__inc/header.jsp"%><!-- start: Header -->
        <div class="container-fluid-full">
            <div class="row-fluid">
            <%@ include file="../assets/metro/__inc/main_menu.jsp"%><!-- start: Main Menu -->
                <div id="content" class="span10"><!-- start: Content -->
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="<%=ccp%>/adminpayment/adminContent.jsp">Home</a>
                            <i class="icon-angle-right"></i> 
                        </li>
                        <li>
                            <i class="icon-edit"></i>
                            <a href="#">Instant and Registered Details</a>
                        </li>
                    </ul>
                    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="icon-edit"></i><span class="break"></span>Instant and Registered Details</h2>
                            </div>
                            <div class="box-content">
                                <form name="frmm" action="<%=ccp%>/GenericAdminServlet" method="POST" class="form-horizontal" onsubmit="return fieldValidation();">
                                    <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" value="18"/>
                                    <table>
                                        <tr>
                                            <th>Department</th>
                                            <td>
                                                <%if (all != null) {
                                                Iterator it = all.iterator();
                                                %>
                                                <select name="dept" id="dept" class="span12">
                                                    <option value="#">----select----</option>
                                                    <%
                                                    while (it.hasNext()) {
                                                    GenericAdminBean cfrb = (GenericAdminBean) it.next();%>                    
                                                    <option value="<%=cfrb.getDeptid() != null ? cfrb.getDeptid() : null%>"><%=cfrb.getDepartment() != null ? cfrb.getDepartment() : ""%></option>
                                                    <%}%>
                                                </select>
                                                <%}%>
                                            </td>
                                            <th>PeriodFrom</th>
                                            <td><input type="text" name="periodfrom" id="periodfrom" class="span12"  required="required"> </td>
                                            <th>PeriodTo</th>
                                            <td><input type="text" name="periodto" id="periodto" class="span12" required> </td>
                                            <th>Type</th>
                                            <td>
                                                <select name="typ" id="typ" class="span12" >
                                                    <option value="#">Select Type</option>
                                                    <option value="R">Registered</option>
                                                    <option value="I">Instant</option>
                                                    <option value="A">All</option>
                                                </select>
                                            </td>
                                            <td><input type="submit" class="btn btn-primary" value="Submit"></td>
                                        </tr>
                                    </table>
                                </form>
                                <table id="printview" class="display" > 
                                   <% if (al != null) { %>
                                    <% if (al != null || al.size() != 0) { %>
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
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Iterator it = al.iterator();
                                        while (it.hasNext()) {
                                            gdb = (genericepayadmin.GenericAdminBean) it.next();
                                        %>
                                        <tr>
                                            <td><%=slno++%></td>
                                            <td><%=gdb.getChallanno() != null ? gdb.getChallanno() : ""%></td>
                                            <td><%=gdb.getDlrname() != null ? gdb.getDlrname() : ""%></td>
                                            <td><%=gdb.getAddress()%> <%=gdb.getCity()%> <%=gdb.getState()%></td>
                                            <td><%=gdb.getPeriodfrom() != null ? sdf.format(gdb.getPeriodfrom()) : ""%></td>
                                            <td><%=gdb.getPeriodto() != null ? sdf.format(gdb.getPeriodto()) : ""%></td>
                                            <td><%=gdb.getAmount() != null ? df.format(gdb.getAmount()) : ""%></td>
                                            <td><%=gdb.getPaymentdate() != null ? sdf.format(gdb.getPaymentdate()) : ""%></td>
                                            <td><%=gdb.getIsregistered() != null ? gdb.getIsregistered() : "UnRegistered"%></td>
                                        </tr>
                                        <%}
                                        }
                                    } else if (msg != "") {%>
                                        <div><font color="Red"><%=msg%></font></div>
                                    <% }%>
                                    </tbody>
                                </table>
                            </div> <!-- end : box-content -->
                        </div><!-- end : box span12 -->
                    </div><!-- end : row-fluid sortable   -->
                </div><!-- end : Content-span10 -->
            </div><!-- end : row-fluid-->
        </div><!--end : container-fluid-full-->
        <div class="clearfix"></div>
        <%@ include file="../assets/metro/__inc/footer.jsp"%>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script> 
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script> 
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
            $("#periodfrom").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
            $("#periodto").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
      $('#printview').DataTable( {
        dom: 'T<"clear">lfrtip',
        tableTools: {
            "sSwfPath": "<%=ccp%>/assets/metro/swf/copy_csv_xls_pdf.swf",
            "aButtons": [
                "csv",
                "xls",
                {
                    "sExtends": "pdf",
                    "sPdfOrientation": "landscape",
                }
            ]
        }
    } );

});
    </script> 
    <script>
        function fieldValidation(){
			
            if((document.frmm.dept.value == '#')||(document.frmm.dept.value =="")){
                alert("Enter the Department");
                document.getElementById('dept').focus();
                return false;
            }else if((document.frmm.typ.value == '#')||(document.frmm.typ.value =="")){
                alert("Enter the tax type");
                document.getElementById('typ').focus();
                return false;
            }
	}
        </script>
<%}%>
</body>
</html>
