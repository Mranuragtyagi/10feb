<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {
        String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%@ page import="genericepayment.*"  %>

<html>
    <head>
        <!-- start: Meta -->
        <title>List Tax Purposes | Payonline Jharkhand</title>
        <%@ include file="../assets/metro/__inc/base_links.jsp"%>
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/dataTables.tableTools.css" >

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
                            <a href="#">Sub Taxes</a>
                        </li>


                    </ul>
                    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="fa fa-edit"></i><span class="break"></span>Sub Taxes</h2>

                            </div>
                            <div class="box-content">



                                <table id="printview" class="display">
                                    <thead>
                                        <tr>
                                            <th>SL No</th>
                                            <th>DEPT </th>
                                            <th> Major Tax/Fee</th>
                                            <th>Sub Tax/Fee</th>
                                            <th>Treasury Headcode/Id</th>
                                            <th>Description</th>
                                            <th>Fixed Amount</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%

                                            String sql = "select echallan_tax_purposes.STATUS, TREASURY_HEAD_CODE,initcap(MAJOR_TAX) as MAJOR_TAX,initcap(TAX_PURPOSE) as TAX_PURPOSE,DESCRIPTION,TAX_PURPOSE_ID,ISFIXED,FIXAMOUNT, initcap(generic_dept.dept_name)  as dname from echallan_tax_purposes join  generic_dept on generic_dept.dept_id=echallan_tax_purposes.dept_id order by generic_dept.dept_name ";
                                            java.sql.Statement stmt = null;
                                            vicclass.User u = (vicclass.User) request.getSession().getAttribute("user");
                                            java.sql.Connection con = null;
                                            con = u.getConnection();
                                            java.sql.ResultSet rs = null;
                                            int i = 1;
                                            try {
                                                stmt = con.createStatement();
                                                rs = stmt.executeQuery(sql);
                                                while (rs.next()) {
                                        %>

                                        <tr>
                                            <td><%=i++%></td>
                                            <td><%=rs.getString("dname")%></td>
                                            <td><%=rs.getString("MAJOR_TAX")%></td>
                                            <td><%=rs.getString("TAX_PURPOSE")%></td>
                                            <td><%=rs.getString("TREASURY_HEAD_CODE")%></td>
                                            <td><%=rs.getString("DESCRIPTION")%></td>
                                            <%if ((rs.getString("ISFIXED") != null ? rs.getString("ISFIXED") : "").equals("Y") || (rs.getString("ISFIXED") != null ? rs.getString("ISFIXED") : "") == "Y") {%>
                                            <td>YES</td>
                                            <%} else {%>
                                            <td>NO</td>
                                            <%}%>
                                            <td><%=rs.getString("STATUS").equals("A") ? "Active" : "Inactive"%></td>
                                        </tr> 
                                        <%
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
                                    </tbody>
                                </table>

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
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script>                            
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script> 
        <script type="text/javascript">

            $(document).ready(function() {
                $('#printview').DataTable({
                    dom: 'T<"clear">lfrtip',
                    tableTools: {
                        "sSwfPath": "<%=ccp%>/assets/metro/swf/copy_csv_xls_pdf.swf",
                        "aButtons": [
                            "csv",
                            "xls",
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