<!DOCTYPE html>
<%@ page import ="java.util.* " contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="vicclass.* ,java.util.*,java.sql.*,genericepayment.*"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {
%>
<html lang="en">
    <head>
        <!-- start: Meta -->
        <title>Add User | Payonline Jharkhand</title>
        <%@ include file="../assets/metro/__inc/base_links.jsp"%>
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >
    </head>
    <body onload="getMajor()">
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
                                <h2><i class="halflings-icon edit"></i><span class="break"></span>Add User </h2>
                            </div>
                            <div class="box-content">
                                <form class="form-horizontal" id="adduser" name="adduser" method="post" action="<%=ccp%>/GenericAdminServlet" onSubmit="return checkForm(this)">
                                   <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" value="adduser"/>
                                    <fieldset>
                                        <table align="center" class="tablebox table-bordered table-hover">
                                            <tr>
                                                <td align="right">User Name&nbsp;&nbsp;:&nbsp;</td>
                                                <td align="left"><input type="text" id="username" name="username"></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Full Name&nbsp;&nbsp;:&nbsp;</td>
                                                <td align="left"><input type="text" id="fullname" name="fullname"></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Department&nbsp;&nbsp;:&nbsp;</td>
                                                <td align="left">
                                                    <select id="dept" name="dept" onchange="getTaxType();">
                                                        <option value="">-select-</option> 
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">Branch Location</td>
                                                <td align="left">
                                                    <select id="locations" name="locations">
                                                        <option value="">-select-</option> 
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr id="div" >
                                                <td align="right">Role To Grant</td>                            	
                                                <td align="left">
                                                    <select id="role" name="role" >
                                                        <option value="">-select-</option> 
                                                        <!--<option value="admin">Administrator</option>-->
                                                        <option value="inc">Officer</option> 
                                                        <!--<option value="staff">Staff</option> 
                                                        <option value="opr">Operator</option> -->
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <input type="submit" value="Add User" name="add" class="btn btn-primary"></td>
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
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script> 
        <script type="text/javascript" language="JavaScript">
            /*$(function(){
                $("#dept").change(function(){
                    $.getJSON("<%=ccp%>/adminpayment/getAllBranch.jsp", {'dept': $("#dept").val(), ajax: 'true'}, function(res) {
                        var options = '<option value="">-select-</option>';
                        var items = res.list;
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"' + x + '>' + items[i].txt + '</option>';
                        }
                        $("#locations").html(options);
                    });
                });
                $.getJSON("%=ccp%>/adminpayment/getDepartmentList.jsp", function(res){ 
                    var items = res.list;
                    for (var i = 0; i < items.length; i++) {
                        $("#dept").append("<option value='"+items[i].val+"'>"+items[i].txt+"</option>");                        
                    }
                });
                
            });
            
            */
            
          function getMajor(){
                var departmentval = $("#dept").val();
                $.post("<%=ccp%>/JsonService?step=getDepartment", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-----SELECT-----</option>';
                                             
                        var x = '';
                         for (var i = 0; i < items.length; i++) {
                        $("#dept").append("<option value='"+items[i].val+"'>"+items[i].txt+"</option>");                        
                    }
                       
                },"json"); 
            };
            
            
              function getTaxType(){
                 var dept = $("#dept").val();
               // var majrtax = $("#majortaxtype").val();
                $.post("<%=ccp%>/JsonService?step=getAllBranch&dept="+dept, function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-----SELECT-----</option>';
                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#locations").html(options);
                },"json"); 
            };
            
            
            function checkForm(f) {
                   var namerex=/^[a-zA-Z ]+$/;
                var msg = "Following fields should not be left Blank: \n";//locations,role
                var correct = true;
                if (!f.username.value.match(namerex)) {
                    correct = false;
                    msg = msg + "User Name, ";
                }
                if (!f.fullname.value.match(namerex)) {
                    correct = false;
                    msg = msg + "Full Name,";
                }
                if (f.dept.value === '') {
                    correct = false;
                    msg = msg + "Department,";
                } 
                if ((f.locations.value === '') || (f.locations.value === '#')) {
                    correct = false;
                    msg = msg + "Branch Location,";
                }
                if (f.role.value === '') {
                    correct = false;
                    msg = msg + "Role To Grant,";
                }
                msg = msg.substr(0, msg.length - 2);
                if (correct === false) {
                    alert(msg);
                }
                return correct;
            }
        </script><!-- end: JavaScript-->
        <%}%>	
    </body>
</html>
