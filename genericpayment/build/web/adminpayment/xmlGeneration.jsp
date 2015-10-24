<%-- 
    Document   : xmlGeneration
    Created on : Jun 2, 2015, 11:59:39 AM
    Author     : zephaniah
--%>
<%@ page import ="java.util.* " contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="vicclass.* ,java.util.*,java.sql.*,genericepayment.*"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {
        
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

<!DOCTYPE html>
<html>
    <head>
        <!-- start: Meta -->
        <title>XML</title>
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
                            <a href="#">Add User </a>
                        </li>
                    </ul>
                    <%= request.getParameter("msg") != null ? "<div class='alert alert-block'><h4 class='alert-heading'>" + request.getParameter("msg") + "</h4></div>" : ""%>
                    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="halflings-icon edit"></i><span class="break"></span>XML Generation </h2>
                            </div>
                            <div class="box-content">
                    <form class="form-horizontal" id="xmlform" name="xmlform" method="post" action="<%=ccp%>/GenericAdminServlet" >
                            <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                            <input type="hidden" name="step" value="26"/>
                            
                            <fieldset>
                                        <table align="center" class="tablebox table-bordered table-hover">                                        
                                          <tr>
                                              <th>Email id</th>
                                              <td>
                                                    <input type="text" name="xmlemail" id="xmlemail" class="span12" required placeholder="Email id"/>
                                                </td>
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
                                                <td><input type="submit" name="" value="Submit"  class="btn btn-primary"></td>
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
        <!-- start: JavaScript-->

         <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script> 
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script> 
            <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
            
            
       <script type="text/javascript">
   $(document).ready(function() {

            $("#periodfrom").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});
           
       

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
