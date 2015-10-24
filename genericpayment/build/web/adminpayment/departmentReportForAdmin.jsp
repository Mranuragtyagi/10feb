<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
    String sql = "select initcap(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? ";
    java.sql.PreparedStatement stmt = null;
    java.sql.Connection con = null;
    vicclass.User u = ( vicclass.User)request.getSession().getAttribute("user");
    u.createConnection();
    con = u.getConnection();
    ArrayList all = new ArrayList();
    java.sql.ResultSet rs = null;
    try {
        stmt = con.prepareStatement(sql);
        stmt.setString(1, "A");
        rs = stmt.executeQuery();
        while (rs.next()){
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
%>

<%ArrayList al = request.getAttribute("departmentdetails") != null ? (ArrayList) request.getAttribute("departmentdetails") : null;
    genericepayadmin.GenericAdminBean gdb = null;
    java.text.DecimalFormat df = new java.text.DecimalFormat("##############.00");
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
    String ust = "Used";
    String unst = "Unused";
    String ddeptid = request.getSession().getAttribute("deptid") != null ? (String) request.getSession().getAttribute("deptid") : null;
    String ty = request.getAttribute("typ") != null ? (String) request.getAttribute("typ") : "";
    String pfrom = request.getAttribute("period_from") != null ? (String) request.getAttribute("period_from") : "";
    String pto = request.getAttribute("period_to") != null ? (String) request.getAttribute("period_to") : "";

    int slno = 1;
    int i = 1;
    int pg = request.getAttribute("pg") != null ? (Integer) request.getAttribute("pg") : 0;
    int tpg = request.getAttribute("tpg") != null ? (Integer) request.getAttribute("tpg") : 0;
    int recordsperpage = request.getAttribute("recordsperpage") != null ? (Integer) request.getAttribute("recordsperpage") : 0;
    slno = ((pg - 1) * recordsperpage + 1);
%>
<html>
    <head>
        <title>Department Report | PayOnline Jharkhand</title>
     
     <%@ include file="../assets/metro/__inc/base_links.jsp"%>
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >    
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery.dataTables.css">
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/dataTables.tableTools.css" >    
    </head>
    <body>
        <%@ include file="../assets/metro/__inc/header.jsp"%><!-- start: Header -->
        <div class="container-fluid-full">
            <div class="row-fluid">   
                <%@ include file="../assets/metro/__inc/main_menu.jsp"%> <!-- start: Main Menu -->
                    <div id="content" class="span10">  <!-- start: Content -->
                        <ul class="breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="<%=ccp%>/adminContent.jsp">Home</a>
                                <i class="icon-angle-right"></i> 
                            </li>
                            <li>
                                <i class="icon-edit"></i>
                                <a href="#">Date Wise Report</a>
                            </li>
                        </ul>
                        <div class="row-fluid sortable">
                            <div class="box span12">
                                <div class="box-header" data-original-title>
                                    <h2><i class="halflings-icon edit"></i><span class="break"></span>Date Wise Report</h2>
                                </div>
                                <div class="box-content">
                                    <form action="<%=ccp%>/GenericAdminServlet"  method="POST" name="frm" class="form-horizontal">
                                   <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                        <input type="hidden" name="step" id="step" value="16">
                                        <table class="tablebox table-hover">
                                            <tr>
                                                <th>Department</th>
                                                <td><%if (all != null) {
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
                                                <td>
                                                    <input type="text" name="periodfrom" id="periodfrom" class="span12" required placeholder="Period From"/>
                                                </td>
                                                <th>PeriodTo</th>
                                                <td>
                                                    <input type="text" name="periodto" id="periodto" class="span12" required placeholder="Period To"/>
                                                </td>
                                                <th>Type</th>
                                                <td>
                                                    <select name="type" id="type" class="span12">
                                                        <option value="1" <%= ty.equals("1") ? "selected" : ""%>>Used</option>
                                                        <option value="0" <%= ty.equals("0") ? "selected" : ""%>>Unused</option>
                                                        <option value="all" <%= ty.equals("all") ? "selected" : ""%>>All</option>
                                                    </select>
                                                </td>
                                                <td><input type="submit" name="" value="Submit"  class="btn btn-primary"></td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </div>
                            <%if (al != null) {%>
                                <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
                                    <input type="hidden" name="step" id="step" value="13">
                                    <input type="hidden" name="dept"  value="<%=ddeptid%>">
                                    <input type="hidden" name="chid" id="chid" value="">
                                    <input type="hidden" name="pg" value=""/ >
                                    <input type="hidden" name="periodfrom" value="<%=pfrom%>"/ >
                                    <input type="hidden" name="periodto" value="<%=pto%>"/ >
                                    <input type="hidden" name="type" value="<%=ty%>"/ >
                                    <table id="printview" class="display">
                                      
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
                                                    while(it.hasNext()) {
                                                    gdb = (genericepayadmin.GenericAdminBean) it.next();
                                                %>
                                                <tr>
                                                    <td><%=slno++%></td>
                                                    <td><%=gdb.getChallanno() != null ? gdb.getChallanno() : ""%></td>
                                                    <td><%=gdb.getDlrname() != null ? gdb.getDlrname() : ""%></td>
                                                    <td><%=gdb.getAddress()%>/<%=gdb.getCity()%>/<%=gdb.getState()%></td>
                                                    <td><%=gdb.getPeriodfrom() != null ? sdf.format(gdb.getPeriodfrom()) : ""%></td>
                                                    <td><%=gdb.getPeriodto() != null ? sdf.format(gdb.getPeriodto()) : ""%></td>
                                                    <td><%=gdb.getAmount() != null ? df.format(gdb.getAmount()) : ""%></td>
                                                    <td><%=gdb.getPaymentdate() != null ? sdf.format(gdb.getPaymentdate()) : ""%></td>
                                                    <%if (gdb.getChallanstatus().equals("0")) {%>
                                                    <td><%=unst%></td>
                                                    <%} else if (gdb.getChallanstatus().equals("1")) {%>
                                                    <td><%=ust%></td>
                                                    <%}%>
                                                </tr>
                                                    <%}%>
                                            </tbody>
                                    </table>
                                </form>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <%@ include file="../assets/metro/__inc/footer.jsp"%>
             <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script> 
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script> 
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
             <script type="text/javascript">
	  $(".container-fluid-full").css("height",$(window).height());
	  $(window).scroll(function() {
	  resizecontainer();
});
	 function resizecontainer(){
	 $(".container-fluid-full").css("height","auto");
	 }
               
                    function chln(t) {
                    document.frm.chid.value = t;
                    document.frm.submit();
                }
            function dopagination(pg) {
                    document.frm.method = 'POST';
                    document.frm.pg.value = pg;
                    document.frm.action = '<%=ccp%>/GenericAdminServlet';
                    document.frm.submit();
                }



      
</script>
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
            <%}%>
    </body>
</html>
