<!DOCTYPE html>
<html>
    <%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
    <%@ page import="java.util.*,genericepayadmin.* " %>
    <%
        String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";
        String sql = "select INITCAP(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? ";
        java.sql.PreparedStatement stmt = null;
        java.sql.Connection con = null;
        vicclass.User u = new vicclass.User();
        u.createConnection();
        con = u.getConnection();
        ArrayList al = new ArrayList();
        java.sql.ResultSet rs = null;
        try{
            stmt = con.prepareStatement(sql);
            stmt.setString(1, "A");
            rs = stmt.executeQuery();
            while (rs.next()) {
                GenericAdminBean genericbean = new GenericAdminBean();
                genericbean.setDepartment(rs.getString("DEPT_NAME"));
                genericbean.setDeptid(rs.getString("DEPT_ID"));
                al.add(genericbean);
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }finally {
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
    <head>
        <!-- start: Meta -->
        <title>Department Login | Payonline Jharkhand</title>
      <%@ include file="../assets/metro/__inc/base_links.jsp"%>

    </head>
    <body>
        
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                        <span class="fa fa-bar"></span>
                        <span class="fa fa-bar"></span>
                        <span class="fa fa-bar"></span>
                    </a>
                    <a class="brand" href="#"><span>PayOnline</span></a>
                    <!-- start: Header Menu -->
                    <!-- end: Header Menu -->
                </div>
            </div>
        </div>
        <!-- start: Header -->
        <div class="container-fluid-full">
            <div class="row-fluid">
                <!-- start: Main Menu -->
                <%//@ include file="../assets/metro/__inc/main_menu.jsp"%>
                <!-- end: Main Menu -->
                <!-- start: Content -->
                <div id="content" class="span10">
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="<%=ccp%>/landing.jsp">Home</a>
                            <i class="icon-angle-right"></i> 
                        </li>
                        <li>
                            <i class="icon-edit"></i>
                            <a href="#">Department Login</a>
                        </li>
                    </ul>
                    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="fa fa-edit"></i><span class="break"></span>Department Login</h2>
                            </div>
                            <div class="box-content">
                                <form accept-charset="UTF-8"  id="departmentlogin" name="departmentloginjsp" action="<%=ccp%>/GenericDepartment" method="post" autocomplete="off">
                                    <input type="hidden" name="step" id="step" value="login">
                                    <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <div align="center"><font color="Red"><%=request.getParameter("mesg") != null ? request.getParameter("mesg") : ""%></font></div>
                                    <table class="table table-striped table-bordered bootstrap-datatable datatable">          
                                        <tr>
                                            <th>Department</th>
                                            <td><%if (al != null) {
                                                    Iterator it = al.iterator();
                                                %>
                                                <select name="department" id="department">
                                                    <option value="#">-select-</option>
                                                    <%
                                                    while (it.hasNext()) {
                                                        GenericAdminBean cfrb = (GenericAdminBean) it.next();%>                    
                                                    <option value="<%=cfrb.getDeptid()!=null ? cfrb.getDeptid() : null%>"><%=cfrb.getDepartment() != null ? cfrb.getDepartment() : ""%></option>
                                                    <%}%>
                                                </select>
                                                <%}%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>User Name </th> 
                                            <td><input class="" id="username" name="username"  placeholder="username" value="" type="text" autocomplete="off" required><br/></td>
                                        </tr> 
                                        <tr>
                                            <th>Password</th> 
                                            <td>
                                                <input class="" id="password1" name="password1" placeholder="Password" type="password" autocomplete="off" required><br/>
                                            </td>
                                        </tr> 
                                        <!--tr>
                                            <th>Security Code</th> 
                                            <td><div style="clear:both;font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;"><input type="text" name="captcha" maxlength="5"   placeholder="Security Code" style="width:100px;"/>
                                                    <img name="c" id="c" src="<%=ccp%>/CCaptcha" height="25" width="66">
                                                    <a href="#" onclick='document.getElementById("c").src = "<%=ccp%>/CCaptcha?x=" + Math.random();
                                                        adminlogin.captcha.focus();'>
                                                        <img src="<%=ccp%>/assets/metro/images/refresh1.jpg" 
                                                             alt="" width="20" height="25" onmouseover="this.src = '<%=ccp%>/assets/metro/images/refresh.gif'" 
                                                             onmouseout="this.src = '<%=ccp%>/assets/metro/images/refresh1.jpg'" 
                                                             style="border: 0px;" />
                                                    </a>
                                                </div>
                                            </td>
                                        </tr--> 
                                        <tr>
                                            <td colspan="2"> <div align="center"> <!--button class="btn btn-success" onclick="encryptDeptPassword();">Login</button-->
                                                    <button class="btn btn-primary" type="button" onclick="deprtmentValid();">Login</button>
                                                    <input type="reset" value="Reset" class="btn btn-primary"></div></td>
                                        </tr>
                                    </table>
                                </form>
                                <!--container div closed-->
                            </div>
                        </div><!--/span-->
                    </div>
                </div><!--/.fluid-container-->
                <!-- end: Content -->
            </div><!--/#content.span10-->
        </div><!--/fluid-row-->
        <div class="clearfix"></div>
        <%@ include file="../assets/metro/__inc/footer.jsp"%>
        <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <script src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script>
        <script src="<%=ccp%>/assets/metro/js/custom.js"></script>
        <script type="text/javascript" src="<%=ccp%>/jquery/jquery.validate.min.js"></script>
        <script type="text/javascript" src="<%=ccp%>/script/md5.js"></script>
        <script type="text/javascript">
            
            
            
            function deprtmentValid() {
                                  var deprtmnet = document.departmentloginjsp.department.value;
                                var usradmn = document.departmentloginjsp.username.value;
                               var pwdRegex=/^[0-9a-zA-Z]+$/;
                                var pwdadmn = document.departmentloginjsp.password1.value;
                                var userregx = /^[a-zA-Z]+$/;
                                 if (deprtmnet == '#') {
                                    alert("Please select the Department!");
                                    document.departmentloginjsp.department.focus();
                                    return false;
                                } else if (!usradmn.match(userregx)) {
                                    alert("Please enter the User Name!");
                                    document.departmentloginjsp.username.focus();
                                    return false;
                                } else if (!pwdadmn.match(pwdRegex)) {
                                    alert("Please enter the Password!");
                                    document.departmentloginjsp.password1.focus();
                                    return false;
                                } else {
                                    document.departmentloginjsp.submit();
                                    
                                }
                            }
        </script>
    </body>
</html>