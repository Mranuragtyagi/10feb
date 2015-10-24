<%String ccp_header = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                <span class="fa fa-bar"></span>
                <span class="fa fa-bar"></span>
                <span class="fa fa-bar"></span>
            </a>
            <%if(request.getSession().getAttribute("loggedin") != null){%>
            <a class="brand"href="<%=ccp_header%>/adminpayment/departmentReportByPeriod.jsp">Pay<span class="lb1">Online</span></a>
            <!-- start: Header Menu -->
            <div class="nav-no-collapse header-nav">
                <ul class="nav pull-right">
                    <!-- start: User Dropdown -->
                    <!-- end: User Dropdown -->
                    <!-- start: User Dropdown -->
                    <li class="dropdown">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="halflings-fa fa white user"></i> Dept
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-menu-title">
                                <span>User Settings</span>
                            </li>
                            <li><a href="<%=ccp_header%>/adminpayment/changeDepartmentPassword.jsp"><i class="icon-random"></i> Change Password</a></li>
                            <li><a href="<%=ccp_header%>/GenericLogin?step=logoutdept"><i class="halflings-fa fa off"></i> Logout</a></li>
                        </ul>
                    </li>
                    <!-- end: User Dropdown -->
                </ul>
            </div>
            <!-- end: Header Menu -->
            <%}else{%>
            <a class="brand" href="<%=ccp_header%>/GenericLogin">Pay<span class="lb1">Online</span></a>
            <%}%>
        </div>
    </div>
</div>