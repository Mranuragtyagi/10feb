<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    } else {
        String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<%String msg = request.getParameter("msg");%>
<html lang="en">
    <head>

        <!-- start: Meta -->
        <title>Comtax Xml | Payonline Jharkhand</title>
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
                            <a href="#">Comtax Xml</a>
                        </li>
                    </ul>
                    <%if (msg != null) {%>

                    <div class="alert alert-block">
                        <h4 class="alert-heading">Success</h4>
                        <p><%=msg%></p>
                    </div>
                    <%}%>
                    <div class="row-fluid sortable">

                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="halflings-icon edit"></i><span class="break"></span>XML Generate</h2>

                            </div>
                            <div class="box-content">

                                <form name="" action="<%=ccp%>/GenericAdminServlet" method="post" class="form-horizontal">
                                    <fieldset>
                                        <input type="hidden" name="step" id="step" value="26">

                                        <div class="control-group">
                                            <label class="control-label" for="date01">Enter Date</label>
                                            <div class="controls">
                                                <input type="text" class="input-xlarge datepicker" name="entrydate" id="entrydate"><input type="submit" class="btn btn-primary" name="" value="Generate Xml">
                                            </div>
                                        </div>

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

        <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
        <script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
        <script type="text/javascript">
            $(function() {
                $("#entrydate").datepicker({changeMonth: true, changeYear: true, yearRange: '2012:2019', dateFormat: 'dd/mm/yy'});
                // $( "#periodto").datepicker({changeMonth: true,changeYear: true,yearRange: '2006:2019',dateFormat : 'dd/mm/yy'});
            });
        </script>
        <!-- end: JavaScript-->
        <%}%>
    </body>
</html>
