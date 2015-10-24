<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@page import="genericepayadmin.*"%>
<%@page import="genericepayment.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="vicclass.User"%>
<!DOCTYPE html>

<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<%@ page import="org.apache.commons.lang.StringEscapeUtils,java.math.BigInteger,java.security.SecureRandom"%>

<%

    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {
       // String mesg = request.getParameter("msg")!=null ? request.getParameter("msg") : "";
        String randm = RandomStringUtils.random(12, 0, 6, true, true, "81G5RDEC3DC6142JASOKMNOP".toCharArray()).toUpperCase();
        String msg = StringEscapeUtils.escapeHtml(request.getParameter("msg"));
        String sql = "select INITCAP(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? ";
        java.sql.PreparedStatement stmt = null;
        vicclass.User u = (vicclass.User) request.getSession().getAttribute("user");
        java.sql.Connection con = null;
        
        
        con = u.getConnection();
             
        ArrayList al = new ArrayList();
        java.sql.ResultSet rs = null;
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, "A");
            rs = stmt.executeQuery();
            while (rs.next()) {
                GenericAdminBean genericbean = new GenericAdminBean();
                genericbean.setDepartment(rs.getString("DEPT_NAME"));
                genericbean.setDeptid(rs.getString("DEPT_ID"));
                al.add(genericbean);
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
<html>
    <head>
        <title>Add Department Xml | Payonline Jharkhand</title>
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
                        <li> <i class="icon-edit"></i> <a href="#">Webservices Integration</a> </li>
                    </ul>
                    
                    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="fa fa-edit"></i><span class="break"></span>Webservices Integration</h2>
                            </div>                            
                            <div class="box-content">
                                <%if (msg != null) {%>
                                    <div class="alert alert-block">
                                        <h4 class="alert-heading"><%=msg%></h4>
                                    </div>
                                    <%}%>
                                <form name="frm1" action="<%=ccp%>/AddIp" method="POST" class="form-inline">
                                        <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" id="step" value="setip">
                                    <table class="table table-bordered table-hover">
                                        <tr>
                                            <th>
                                                <%if (al != null) {
                                                        Iterator it = al.iterator();
                                                %>
                                                <select name="department" id="department">
                                                    <option value="#">-Select Department-</option>
                                                    <%
                                                        while (it.hasNext()) {
                                                            GenericAdminBean cfrb = (GenericAdminBean) it.next();%>                    
                                                    <option value="<%=cfrb.getDeptid() != null ? cfrb.getDeptid() : null%>"><%=cfrb.getDepartment() != null ? cfrb.getDepartment() : ""%></option>
                                                    <%}%>
                                                </select>
                                                <%}%>
                                            </th>
                                            <th>
                                                <input type="text" name="ip" id="ip" placeholder="Enter Ip Address" data-mask="999.999.999.999" required>
                                            </th>
                                            <th>
                                                <input type="text" name="checksum" id="checksum" readonly="readonly" value="<%=randm%>" required>
                                            </th>
                                            <td><input type="button"  class="btn btn-primary" value="Submit" onclick="fieldValidation();"/></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                               
                            <div id="table">
                                   
            </h3>
                            </div>       








                        </div>
                        <!--/span--> 

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
      
        
        
        
        
        <!--script src="<%=ccp%>/assets/metro/js/jquery_1.8.js"></script!--> 
        <script type="text/javascript">
                      function fieldValidation(){
                          RegE = /^\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}$/ 
                          var ipadrs=document.frm1.ip.value;
                            if((document.frm1.department.value == '#')||(document.frm1.department.value =="")){
                            alert("Please Select the Department");
                            document.frm1.department.focus();
                            return false;
                        }else if(!ipadrs.match(RegE))
                        {
                          alert("Please fill the exact Ip Address");
                          document.frm1.ip.focus();
                          return false;
                        } else{
                            frm1.submit();
                        }
                       }
        </script>
        <script type="text/javascript">

            var TABLE = {};

            TABLE.formwork = function(table) {
                var $tables = $(table);

                $tables.each(function() {
                    var _table = $(this);
                    _table.find('thead tr').append($('<th class="edit"> Action</th>'));
                    _table.find('tbody tr').append($('<td class="edit"><input type="button" value="Edit"/></td>'));
                });

                $tables.find('.edit :button').on('click', function(e) {
                    TABLE.editable(this);
                    e.preventDefault();
                });
            }

            TABLE.editable = function(button) {
                var $button = $(button);
                var $row = $button.parents('tbody tr');
                var $cells = $row.children('td').not('.edit');
                var tabledata = [];
                var celldata = 0;
                if ($row.data('flag')) { // in edit mode, move back to table
                    // cell methods
                    $cells.each(function() {
                        var _cell = $(this);
                        if (celldata === 1) {
                            var status = _cell.find("input").is(':checked');
                            if (status) {
                                tabledata[celldata] = 'Y';
                            } else {
                                tabledata[celldata] = 'N';
                            }
                            _cell.html(_cell.find('input'));

                        } else if (celldata === 0) {
                            //_cell.html(_cell.find('span').html().trim());
                            tabledata[celldata] = _cell.find('span').html().trim();
                        } else {
                            _cell.html(_cell.find('input').val());
                            tabledata[celldata] = _cell.html();
                        }
                        celldata++;
                    })
                    // alert(tabledata[0]);
//                    var data = "step=upd&chk=" + tabledata[1] + "&id=" + tabledata[0] + "&department_name=" + tabledata[2].trim() + "\
//                        &ipadres=" + tabledata[3].trim() + "&checksum=" + tabledata[4].trim();
var data = "csrfPreventionSalt=<%= request.getAttribute("csrfPreventionSalt")%>&step=upd&chk=" + tabledata[1] + "&id=" + tabledata[0] + "&department_name=" + tabledata[2].trim() + "&ipadres=" + tabledata[3].trim() + "&checksum=" + tabledata[4].trim();
    
                       // console.log(data);
                    $.ajax({
                        url: "<%=ccp%>/AddIp", //The url where the server req would we made.
                        async: false,
                        type: "POST", //The type which you want to use: GET/POST
                        data: data,
                        dataType: "html", //Return data type (what we expect).
                        //This is the function which will be called if ajax call is successful.
                        success: function(data) {
                            if (data === 'false') {
                                alert("Update Failed");
                            }
                            load_list();
                        }
                    });  
                    $row.data('flag', false);
                    $button.val('Edit');
                    load_list();
                }
                else { // in table mode, move to edit mode 
                    // cell methods
                    var cellno = 0;
                    $cells.each(function() {
                        var _cell = $(this);
                        _cell.data('text', _cell.html()).html('');

                        var $input = $('<input type="text" />').val(_cell.data('text')).width(_cell.width() - 16);
                        var $checkbox_active = $('<input type="checkbox" name="chk" id ="chk" checked="checked" />').val(_cell.data('text')).width(_cell.width() - 16);
                        var $checkbox_inactive = $('<input type="checkbox" name="chk" id ="chk" />').val(_cell.data('text')).width(_cell.width() - 16);
                        var $readonly = _cell.data('text').trim();

                        if (cellno === 1) {
                            var status = _cell.data('text');
                            if (status === 'Active') {
                                _cell.html($checkbox_active);
                            } else {
                                _cell.html($checkbox_inactive);
                            }
                        } else if (cellno === 0) {
                            _cell.append($readonly);
                        } else if (cellno === 2) {
                            _cell.append($readonly);
                        } else if (cellno === 4) {
                            _cell.append($readonly);
                        } else {
                            _cell.append($input);
                        }
                        cellno++;
                    })
                    $row.data('flag', true);
                    $button.val('Save');
                }
            }
            load_list();
            function load_list() {
                $.ajax({
                    url: "<%=ccp%>/adminpayment/loadwebservicevalidator.jsp", //The url where the server req would we made.
                    async: false,
                    type: "GET", //The type which you want to use: GET/POST
                    dataType: "html", //Return data type (what we expect).
                    //This is the function which will be called if ajax call is successful.
                    success: function(data) {
                        $("#table").html(data);
                        $('#table').hide();
                        $('#table').fadeIn(2000);
                        TABLE.formwork('#celebs');
                    }
                });
            }
        </script>
        
        <script type="text/javascript">

$(document).ready(function() {
      $('#celebs').DataTable( {
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
        <%}%>
    </body>
</html>



