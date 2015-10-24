<%@ page import="java.util.*,genericepayadmin.*"%>
<%
    String base_url = "http://" + request.getHeader("HOST") + request.getContextPath() + "";    
    ArrayList parentlist=request.getAttribute("parentlist")!=null?(ArrayList)request.getAttribute("parentlist"):null;
    List getbranch=request.getAttribute("getbranch")!=null?(List)request.getAttribute("getbranch"):null;
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../__resources/__inc/base_links.jsp"%>
    </head>
    <body class="skin-blue">
        <%@include file="../__resources/__inc/header.jsp" %><!-- header logo: style can be found in header.less -->
            <div class="wrapper row-offcanvas row-offcanvas-left"> 
            <!-- Left side column. contains the logo and sidebar -->
                <%@include file="../__resources/__inc/left_menu.jsp"%>
                <!-- Right side column. Contains the navbar and content of the page -->
                    <aside class="right-side">
                        <!-- Content Header (Page header) --> 
                        <section class="content-header">
                            <h1>Role Master<small>Department Structure</small></h1>
                            <ol class="breadcrumb">
                                <li><a href="<%=base_url%>/login"><i class="fa fa-dashboard"></i> Home</a></li>
                                <li class="active">Add Branch</li>
                            </ol>
                        </section>
                        <!-- Main content -->
                        <section class="content">
                            <div class="row">
                                <!-- left column -->
                                <div class="col-md-6">
                                <!-- general form elements -->
                                    <div class="box box-primary">
                                        <div class="box-header"><h3 class="box-title">Add Branch</h3></div><!-- /.box-header -->
                                            <!-- form start -->
                                            <form role="form" name='branchform' id="branchform" action="<%=base_url%>/branchmaster" method="post">
                                                <input type="hidden" id="step" name="step" value="1">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <label for="branch_name">Branch</label>
                                                        <input type="text" placeholder="Enter Branch Name" id="branch_name" name="branch_name" class="form-control" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="branch_abbrevation">Branch Abbrevation</label>
                                                        <input type="text" placeholder="Enter Branch Short Name" id="branch_abbrevation" name="branch_abbrevation" class="form-control" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="parent_id">Parent</label>
                                                        <% if (parentlist != null){
                                                            Iterator it = parentlist.iterator();
                                                        %>
                                                        <select id="parent_id" name="parent_id" class="form-control">
                                                            <option value="0">--select--</option>
                                                            <%
                                                                while (it.hasNext()) {
                                                                   BranchBean bean=(BranchBean)it.next();
                                                            %>
                                                                <option value="<%=bean.getParent_id() %>" ><%=bean.getParent_name() %> </option>
                                                            <%}%>
                                                        </select>
                                                        <%}%>
                                                    </div>
                                                </div><!-- /.box-body -->
                                                <div class="box-footer">
                                                    <button class="btn btn-primary" type="submit">Submit</button>
                                                </div>
                                            </form>
                                        </div><!-- /.box -->
                                    </div><!--/.col (left) -->
                                    <!-- right column -->
                                    <div class="col-md-6">
                                        <!-- general form elements disabled -->
                                        <div class="box box-warning">
                                        <div class="box-header">
                                            <h3 class="box-title">Branch List</h3>
                                        </div><!-- /.box-header -->
                                        <div id="table" class="box-body">
                                            <form action="null" method="post">
                                                <table id="tablecontent" class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Sl No.</th>
                                                            <th>Branch</th>
                                                            <th>Parent</th>
                                                            <th>State</th>
                                                            <th>Department</th>
                                                            <th>Created</th>                                                            
                                                        </tr>
                                                    </thead>
                                                    <%if (getbranch != null) {
                                                        int i = 1;
                                                        Iterator it1 = getbranch.iterator();
                                                    %>
                                                    <tbody>
                                                        <% while (it1.hasNext()){
                                                            BranchBean branchbean =(BranchBean)it1.next();
                                                        %>
                                                    <tr>                                                       
                                                        <td><%= i++ %></td>
                                                        <td><%= branchbean.getBranch_name()  != null ? branchbean.getBranch_name().trim() : ""%></td>
                                                        <td><%= branchbean.getParent_name() != null ? branchbean.getParent_name().trim() : ""%></td>
                                                        <td><%= branchbean.getState_name() != null ? branchbean.getState_name().trim():""%></td>
                                                        <td><%= branchbean.getDepartment_name() != null ? branchbean.getDepartment_name():""%></td>
                                                        <td><%= branchbean.getCreated_date() != null ? branchbean.getCreated_date() : ""%></td>
                                                    </tr>                                                   
                                                    <%}%>
                                                </tbody>
                                                <%}%>
                                            </table>
                                        </form>
                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div><!--/.col (right) -->
                        </div>
                    </section><!-- /.content --> 
                </aside><!-- /.right-side --> 
            </div>
        <!-- ./wrapper --> 
        <!-- jQuery 2.0.2 --> 
        <script src="<%=base_url%>/__resources/js/jquery.min.js"></script> 
        <!-- Bootstrap --> 
        <script src="<%=base_url%>/__resources/js/bootstrap.min.js" type="text/javascript"></script> 
        <!-- AdminLTE App -->
        <script src="<%=base_url%>/__resources/js/app.js" type="text/javascript"></script> 
        <script src="<%=base_url%>/__resources/js/jquery-1.4.2.js" type="text/javascript"></script>
        <!--<script src="<%=base_url%>/__resources/js/commodity.js" type="text/javascript"></script>-->
    </body>
</html>