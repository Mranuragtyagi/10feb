<%-- 
    Document   : view_treasury
    Created on : Jan 6, 2015, 12:58:41 PM
    Author     : santosh
--%>

<%@page import="genericepayment.GenericBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="vicclass.User"%>
<%@page import="dept_integration.*"%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    }else{
        String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";
%>


    
    <script>
        function ststus(er,sts){
            document.getElementById("srstatus").value=er;
            document.getElementById("getslno").value=sts;
            frm.submit();
        }
        
    </script>
<html>
    <head>
        <title>Department Integration | Payonline Jharkhand</title>
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
                        <li> <i class="icon-home"></i> <a href=<%=ccp%>/adminpayment/adminContent.jsp>Home</a> <i class="icon-angle-right"></i> </li>
                        <li> <i class="icon-edit"></i> <a href="#">Department Integration List</a> </li>
                    </ul>
                    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="fa fa-edit"></i><span class="break"></span>Department Integration List</h2>
                            </div>
                            <div class="box-content">
                               
                                <form name="frm" method="post" action="<%=ccp%>/Dept_Intcode">
                                        <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <table id="printview" class="table table-condensed">
                                        <thead>
                                            <tr>
                                                <th>Department Name</th>
                                                <th>Department Code</th>
                                                <th>Ip Address</th>
                                                <th>Secret Code</th>
                                                <th>Response Url</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                vicclass.User u = (vicclass.User) request.getSession().getAttribute("user");
                                                java.sql.Connection conn = null;
                                                conn = u.getConnection();
                                                Dept_Integbean tbean = new Dept_Integbean();
                                               // int page1 = Dept_Integbean.getPages(conn);
                                              //  System.out.println("page1 name is.."+page1);
                                              //  String pageno= request.getParameter("getpagno")!=null?request.getParameter("getpagno"):"";   
                                              //  System.out.println("getting pageno is..."+pageno);
                                               // int limit=10;
                                                ArrayList ar=null;
                                                    ar = tbean.getTreasury(conn);
                                                Iterator it = ar.iterator();
                                                while (it.hasNext()){
                                                    Dept_Integbean ds1 = (Dept_Integbean) it.next();
                                            %>                                            
                                                    <tr>  <input type="hidden" name="step" value="step2">
                                        
                                               <td><%=ds1.getDept_name()%>
                                                   <input type="hidden" name="getslno" id="getslno" value="">
                                                   <input type="hidden" name="srstatus" id="srstatus" value=""></td>
                                                        <td><%=ds1.getDept_code()%></td>
                                                        <td><%=ds1.getIp_adrs()%></td>
                                                        <td><%=ds1.getSecret_code()%></td>
                                                        <td><%=ds1.getResponse_url()%></td>
                                                        <td><%=ds1.getStatus()%><input type="hidden" name="sts" value="<%=ds1.getStatus()%>"></td>
                                                        <td> <%if(ds1.getStatus().equalsIgnoreCase("A")){%>
                                                            <input type="button" name="actv" value="Active" onclick="ststus('<%=ds1.getSno()%>','<%=ds1.getStatus()%>');">
                                                         
                                                            <%}else{%>
                                                            <input type="button" name="actv" value="Inactive" onclick="ststus('<%=ds1.getSno()%>','<%=ds1.getStatus()%>');">
                                                             <%}%>
                                                        </td>
                                                    </tr>
                                               <%}%>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                                               
                           
            </h3>
                            </div><!--/span--> 
                        </div>
                    </div>
                    <!--/.fluid-container--> 

                <!-- end: Content --> 
            </div>
            <!--/#content.span10--> 
        </div>
        <!--/fluid-row-->

        <div class="clearfix"></div>
        <%@ include file="../assets/metro/__inc/footer.jsp"%>

        <!-- start: JavaScript--> 

        <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        
        <script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <script src="<%=ccp%>/assets/metro/js/custom.js"></script>
         <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script>  
        
        
        <script type="text/javascript">

$(document).ready(function() {
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
                    "sPdfMessage": " "
                }
            ]
        }
    } );
 
} );
    </script>
        
        
        
        
        <script language="javascript">
         $(function() {
             $("#selectall").click(function() {
                 $('.chk').attr('checked', this.checked);
             });
             $(".chk").click(function() {
                 if ($(".chk").length === $(".chk:checked").length) {
                     $("#selectall").attr("checked", "checked");
                 } else {
                     $("#selectall").removeAttr("checked");
                 }
             });
         });
                  </script> 
            <%}%>
    </body>
</html>
